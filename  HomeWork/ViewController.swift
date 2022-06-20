//
//  ViewController.swift
//   HomeWork
//
//  Created by Артем Макаренко on 19.06.2022.
//
//Проект «Пивной бар». Вы должны создать:
// Класс Beer - у него будут свойства:
// 1) Имя
// 2) Цена
// 3) Cтрана
// 4) Oстаток объема.
//Реализовать продажу пива через менеджер-синглтон.
//Реализовать проверку выручки в конце дня.
//* Реализовать функционал:
//1) начало новой смены - обнуление выручки
//2) проверка остатков.
//
//Графический интерфейс - любой! Главное чтобы работало.
//
//* - дополонительное здание.


import UIKit


class BeerManager  {
    static let getInstance = BeerManager()
    
    private init() {}
    
    //MARK: - Functions
    
    func sellBeer (income: Decimal) -> Decimal {
        var price: Decimal = 0
        price += income
        return price
        
    }
   
}


//MARK: - class


class Beer {
    let name: String
    let price: Decimal
    let country: String
    let leftAmount: Int
    
    init(name:String, price: Decimal, country: String, leftAmount: Int) {
        self.name = name
        self.price = price
        self.country = country
        self.leftAmount = leftAmount
    
        }
    }

public final class ViewController: UIViewController {
    
    
    
    
    
    
    //MARK: - LIDSKOE labels
    
    
    @IBOutlet weak var lidskoe: UILabel!
    
    
    let beerBottle = Beer(name: "Lidskoe", price: 79.90, country: "Belarus", leftAmount: 20)
    
    @IBOutlet weak var priceForLidskoe: UILabel!
    

    
    @IBOutlet weak var totalPriceForAll: UILabel!
    
    private var lidskoePrice: Decimal = 0 {
        didSet {
            totalPriceForAll.text = "\(lidskoePrice) ₽"
        }
    }
    
    
//MARK: EFFES labels
    
    @IBOutlet weak var effes: UILabel!
    
    let beerBottleEffes = Beer(name: "Effes", price: 119.90, country: "Turkey", leftAmount: 15)

    
    @IBOutlet weak var priceForEffes: UILabel!
    
    
    @IBOutlet weak var totalPriceForEffes: UILabel!
    
    private var effesPrice: Decimal = 0 {
        didSet {
            totalPriceForEffes.text = "\(effesPrice) ₽"
        }
    }
    
    
    
    //MARK: TOTAL REVENUE Label
    
    @IBOutlet weak var totalRevenue: UILabel!
    
    private var totalValue: Decimal = 0 {
        didSet {
            totalRevenue.text = "\(totalValue) ₽"
        }
    }

    
    public override func viewDidLoad() {
        super.viewDidLoad()
    
        let backGroundImage = UIImageView(frame: UIScreen.main.bounds)
        backGroundImage.image = UIImage(named: "istockphoto")
        backGroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backGroundImage, at: 0)
         

        
        //MARK: - LIDSKOE description
        
        lidskoe.text = beerBottle.name + " from: " + beerBottle.country
        
        priceForLidskoe.text = "\(beerBottle.price) ₽"

        
        
        
        //MARK: - EFFES description
        
        effes.text = beerBottleEffes.name + " from: " + beerBottleEffes.country
        
        priceForEffes.text = "\(beerBottleEffes.price) ₽"

    }
    
    
    
    
    //MARK: - LIDSKOE Button
    @IBAction func sellLidskoeButton(_ sender: Any) {
        lidskoePrice += BeerManager.getInstance.sellBeer(income: beerBottle.price)
    }
    
    
    //MARK: - EFFES Button
    
    
    @IBAction func sellEffesButton(_ sender: Any) {
        effesPrice += BeerManager.getInstance.sellBeer(income: beerBottleEffes.price)
    }

    //MARK: TOTAL REV Button
    
    @IBAction func TotalRevenuePerDay(_ sender: Any) {
        totalValue = effesPrice + lidskoePrice
    
    }

    
    //MARK: Remove all!)
    
    @IBAction func removeAll(_ sender: Any) {
        totalValue = 0
        effesPrice = 0
        lidskoePrice = 0
    }
}




