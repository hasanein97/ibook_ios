//
//  ViewController.swift
//  pdfbook
//
//  Created by hasanein on 5/4/22.
//

import UIKit
import PDFKit

class BookViewController: UIViewController,PDFViewDelegate {
    private var pdfView:PDFView?
    private var pdfDocument:PDFDocument?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pdfView = PDFView(frame: self.view.bounds)
        self.view.addSubview(pdfView!)
        pdfView?.autoScales=(true)
        pdfView?.translatesAutoresizingMaskIntoConstraints = false
           pdfView?.setValue(true, forKey: "forcesTopAlignment")
        
        pdfView?.displayMode = .singlePage
        pdfView?.displayDirection = .horizontal
        pdfView?.usePageViewController(true)
        pdfView?.displaysRTL=(true)
        pdfView?.displaysAsBook=(true)
        pdfView?.delegate = self
        
        pdfView?.translatesAutoresizingMaskIntoConstraints = false


        pdfView!.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true;        pdfView!.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true;
        pdfView!.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true;        pdfView?.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        guard let path = Bundle.main.url(forResource: "book1",withExtension:"pdf") else {
            print("Unable to locate file")
            return
        }
        pdfDocument = PDFDocument(url: path)!
        pdfView!.document = pdfDocument
        pdfView?.autoScales = true
        pdfView?.maxScaleFactor = 4.0
      
    
    };
    }
    



