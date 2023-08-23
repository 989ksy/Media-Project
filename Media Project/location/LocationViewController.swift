//
//  LocationViewController.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/08/23.
//

import UIKit
import SnapKit
import MapKit
import CoreLocation

struct Theater {
    let type: String
    let location: String
    let latitude: Double
    let longitude: Double
}

struct TheaterList {
    var mapAnnotations: [Theater] = [
        Theater(type: "롯데시네마", location: "롯데시네마 서울대입구", latitude: 37.4824761978647, longitude: 126.9521680487202),
        Theater(type: "롯데시네마", location: "롯데시네마 가산디지털", latitude: 37.47947929602294, longitude: 126.88891083192269),
        Theater(type: "메가박스", location: "메가박스 이수", latitude: 37.48581351541419, longitude:  126.98092132899579),
        Theater(type: "메가박스", location: "메가박스 강남", latitude: 37.49948523972615, longitude: 127.02570417165666),
        Theater(type: "CGV", location: "CGV 영등포", latitude: 37.52666023337906, longitude: 126.9258351013706),
        Theater(type: "CGV", location: "CGV 용산 아이파크몰", latitude: 37.53149302830903, longitude: 126.9654030486416)
    ]
}


class LocationViewController: UIViewController {

    var theaterList : TheaterList = TheaterList()
    
    let locationManager = CLLocationManager()
    let mapView = MKMapView()
    
    let filterButton = {
        let button = UIButton()
        button.setTitle("Filter", for: .normal)
        button.addTarget(self, action: #selector(filterButtonClicked), for: .touchUpInside)

        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //어노테이션 기본
        
        setAnnotation(type: 0)
        
        //뷰 추가
        view.addSubview(filterButton)
        filterButton.backgroundColor = .black
        setButtonFilter()
        
        view.addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.top.equalTo(filterButton.snp_bottomMargin).offset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view)
        }
        
        //프로토콜 연결
        locationManager.delegate = self
        
        //함수호출
        
        checkDeviceLocationAuthorization()
        

    }//viewDidLoad
    
    //버튼
    
    @objc func filterButtonClicked () {
        print("필터!")
        
        let alert = UIAlertController(title: .none, message: .none, preferredStyle: .actionSheet)
        let lotte = UIAlertAction(title: "롯데시네마", style:.default){_ in
            self.setAnnotation(type: 1)
        }
        let cgv = UIAlertAction(title: "CGV", style: .default){_ in
            self.setAnnotation(type: 2)
        }
        let mega = UIAlertAction(title: "메가박스", style: .default){_ in
            self.setAnnotation(type: 3)
        }
        let all = UIAlertAction(title: "전체보기", style: .default){_ in
            self.setAnnotation(type: 0)
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(lotte)
        alert.addAction(cgv)
        alert.addAction(mega)
        alert.addAction(all)
        alert.addAction(cancel)
        
        present(alert, animated: true)
        
        
        
    }
    
    //필터 버튼 레이아웃
    func setButtonFilter() {
        
        filterButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view).inset(20)
            make.size.equalTo(50)
            
        }
        
        
    }
    
    //어노테이션 설정
    func setAnnotation(type: Int) {

        //롯시 서울대
        let annotation1 = MKPointAnnotation()
        annotation1.coordinate = CLLocationCoordinate2D(latitude: theaterList.mapAnnotations[0].latitude, longitude: theaterList.mapAnnotations[0].longitude)
        //롯시 가산
        let annotation2 = MKPointAnnotation()
        annotation2.coordinate = CLLocationCoordinate2D(latitude: theaterList.mapAnnotations[1].latitude, longitude: theaterList.mapAnnotations[1].longitude)
        //메박 이수
        let annotation3 = MKPointAnnotation()
        annotation3.coordinate = CLLocationCoordinate2D(latitude: theaterList.mapAnnotations[2].latitude, longitude: theaterList.mapAnnotations[2].longitude)
        //메박 강남
        let annotation4 = MKPointAnnotation()
        annotation4.coordinate = CLLocationCoordinate2D(latitude: theaterList.mapAnnotations[3].latitude, longitude: theaterList.mapAnnotations[3].longitude)
        //씨집 영등포
        let annotation5 = MKPointAnnotation()
        annotation5.coordinate = CLLocationCoordinate2D(latitude: theaterList.mapAnnotations[4].latitude, longitude: theaterList.mapAnnotations[4].longitude)
        //씨집 용산
        let annotation6 = MKPointAnnotation()
        annotation6.coordinate = CLLocationCoordinate2D(latitude: theaterList.mapAnnotations[5].latitude, longitude: theaterList.mapAnnotations[5].longitude)
        
        if type == 0 {
            mapView.addAnnotations([annotation1,annotation2,annotation3,annotation4,annotation5,annotation6])
            
        } else if type == 1 {
            
            mapView.removeAnnotations(mapView.annotations)
            mapView.addAnnotations([annotation1,annotation2])
            
        } else if type == 2 {
            
            mapView.removeAnnotations(mapView.annotations)
            mapView.addAnnotations([annotation5,annotation6])
            
        } else if type == 3 {
            
            mapView.removeAnnotations(mapView.annotations)
            mapView.addAnnotations([annotation3,annotation4])
            
        }
        
    }
    
    
    //지도 범위 + 어노테이션 기본설정
    func setRegionAndAnnotation(center: CLLocationCoordinate2D) {
        //화면에 보여줄 범위
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 500, longitudinalMeters: 500)
        mapView.setRegion(region, animated: true)
        
        //디폴트 위치
        let annotation = MKPointAnnotation() // 핀 꽂기 세팅
        annotation.title = "현재위치"
        annotation.coordinate = center
        mapView.addAnnotation(annotation) // 핀 꽂기
    }
    
    
    //얼럿 설정 (권한 거부-> 세팅)
    func showRequestLocationServiceAlert() {
        
        let requestLocationServiceAlert = UIAlertController(title: "위치정보 이용", message: "위치 서비스를 사용할 수 없습니다. 기기의 '설정>개인정보 보호'에서 위치 서비스를 켜주세요.", preferredStyle: .alert)
        
        let goSetting = UIAlertAction(title: "설정으로 이동", style: .destructive) { _ in
            
        }
        let cancel = UIAlertAction(title: "취소", style: .default)
        requestLocationServiceAlert.addAction(cancel)
        requestLocationServiceAlert.addAction(goSetting)
        
        present(requestLocationServiceAlert, animated: true, completion: nil)
        
    }
    
    //권한설정-1 (기기)
    func checkDeviceLocationAuthorization() {
        
        DispatchQueue.global().async {
            
            let authorization: CLAuthorizationStatus
            
            if CLLocationManager.locationServicesEnabled(){
                
                if #available(iOS 14.0, *) {
                    authorization = self.locationManager.authorizationStatus
                } else {
                    authorization = CLLocationManager.authorizationStatus()
                }
                
                DispatchQueue.main.async {
                    print(authorization,"기기_현재위치권한체크")
                    self.checkCurrentLocationAuthroization(status: authorization)
                }
            

            } else {
                print("위치 서비스가 비활성화 되어 있어 위치 권한 요청이 불가합니다.")
            }
            
        }
    }//1
    
    //권한설정-2 (현재위치)
    func checkCurrentLocationAuthroization(status: CLAuthorizationStatus) {
        
        switch status {
        case .notDetermined:
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            
        case .restricted:
            print("restricted")
            
        case .denied:
            print("denied")
            showRequestLocationServiceAlert()
            let defaultLocation = CLLocationCoordinate2D(latitude: 37.517829, longitude: 126.886270)
            setRegionAndAnnotation(center: defaultLocation)
            
        case .authorizedAlways:
            print("authorizedAlways")
            
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            
        case .authorized:
            print("authorized")
            
        @unknown default: print("권한 종류 변동에 대한 대비")
        }
        
    }//2


}//class

extension LocationViewController: CLLocationManagerDelegate{
    
    //사용자 위치 O
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("!!!!", locations)
    
        
        if let coordinate = locations.last?.coordinate{ // 현재위치를 보여주는 코드!
            print(coordinate)
            setRegionAndAnnotation(center: coordinate)
        }
        
        locationManager.stopUpdatingLocation()
    }
    
    //사용자 위치 X
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {


    }
    
    //사용자 권한 변경 (14이상)
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print(#function,"프로토콜_기기권한")
        checkDeviceLocationAuthorization()
    }
    
//    //사용자 권한 변경 (14이하)
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//
//    }
    
}

extension LocationViewController : MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        print(#function)
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print(#function)
    }
    
}
