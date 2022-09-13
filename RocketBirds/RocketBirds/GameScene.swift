//
//  GameScene.swift
//  RocketBirds
//
//  Created by Cüneyt Erçel on 15.08.2022.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene { // 1 didmovetonun ve diğer her şeyin içini sildim. Yeniden kendimiz yapıcaz hesabına misali.
    
    //2- Kodla kuş yapma- Örnek gamescene kullanmadan kodla gene bi kuş oluşturucaz ama bunuda yorum olarak tutucam gerek yok çünkü şimdi.
     // Spritenode 2.1 --- var bird2 = SKSpriteNode()
    
    
    // 3 Kuşa Fiziksel özellik ekleme
    var bird = SKSpriteNode() // node kısmı
    // 4.1 KUTU TANIMLAMA
    var box1 = SKSpriteNode()
    var box2 = SKSpriteNode()
    var box3 = SKSpriteNode()
    var box4 = SKSpriteNode()
    var box5 = SKSpriteNode()
    var box6 = SKSpriteNode()
    var box7 = SKSpriteNode()
    var box8 = SKSpriteNode()
    
    var hold = true
    var originalPosition : CGPoint?
  

    
    override func didMove(to view: SKView) {
        /* 2.2
        let texture = SKTexture(imageNamed: "bird") // bunla fotoyu verdik.
        bird2 = SKSpriteNode(texture: texture) // burda resimi atadık.
        bird2.position = CGPoint(x: -self.frame.width / 5, y: self.frame.height / 4 ) // olduğu konum
        
        bird2.size = CGSize(width: 100, height: 100)// boyutu
        bird2.zPosition = 1 // buda önde arkada olma durumu
        self.addChild(bird2)  */
        
        
        // zemin özellikleri 3.2
        
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame) // telefonun çerçevesini zemin ilan ettik böylece orada duruyor yani sonsuzluğa düşmüyo :D
        self.scene?.scaleMode = .aspectFit // bunu yaparak aspectfill değil fityaptık.
       
        
        
        //3.1 fiziksel özellik eklemece KUŞ İÇİN
       bird = childNode(withName: "bird") as! SKSpriteNode // kuşu koyduğumuzda ismini gidip bird verdik kutularıda normalde brick ama box olarak verdik. neyse bird verdiğim kuşu al birde childnode olarak skspritenode olarak cast et.
        
        let birdTexture = SKTexture(imageNamed: "bird") // alttaki ilk işlemi yapmak için açtık.
        
        bird.physicsBody = SKPhysicsBody(circleOfRadius: birdTexture.size().height / 7) // burda kuşun etki alanını verdik, circle seçtik yuvarlak bişi olduğu için kuş ve yukardaki birdtexturun gösterdiğimiz kısmı kadar büyüklükte çapı olsun istedik.
        bird.physicsBody?.affectedByGravity = false // yer çekiminden etkilensin
        bird.physicsBody?.isDynamic = true // fiziksel simülasyonlardan etkilensin mi ? evet
        bird.physicsBody?.mass = 0.10 // yarım kilo ettik kuşu
        originalPosition = bird.position // 7.1
       
        
        
        
        // 4 KUTU TANIMLAMA 4.1 TEPEDE
        
        let boxTexture = SKTexture(imageNamed: "brick")  // resimi cast ettik.
        let size = CGSize(width: boxTexture.size().width / 7, height: boxTexture.size().height / 7) // bi tane size oluşturdum etki alanında falan kullancam. bu buarada 4 e falan bölmemizin  sebebi resim olarak cast ediliyor ya onu 4 5 kat küçülttük diye o civaralra bölüyoruz.
        
        
        box1 = childNode(withName: "box1") as! SKSpriteNode
        box1.physicsBody = SKPhysicsBody(rectangleOf: size)
        box1.physicsBody?.mass = 0.15
        box1.physicsBody?.isDynamic = true
        box1.physicsBody?.affectedByGravity = true
        box1.physicsBody?.allowsRotation = true // kutu rotate edebilirmi dönebilir mi evet.
        
        
        box2 = childNode(withName: "box2") as! SKSpriteNode
        box2.physicsBody = SKPhysicsBody(rectangleOf: size)
        box2.physicsBody?.mass = 0.15
        box2.physicsBody?.isDynamic = true
        box2.physicsBody?.affectedByGravity = true
        box2.physicsBody?.allowsRotation = true
        
        
        box3 = childNode(withName: "box3") as! SKSpriteNode
        box3.physicsBody = SKPhysicsBody(rectangleOf: size)
        box3.physicsBody?.mass = 0.15
        box3.physicsBody?.isDynamic = true
        box3.physicsBody?.affectedByGravity = true
        box3.physicsBody?.allowsRotation = true
        
        box4 = childNode(withName: "box4") as! SKSpriteNode
        box4.physicsBody = SKPhysicsBody(rectangleOf: size)
        box4.physicsBody?.mass = 0.15
        box4.physicsBody?.isDynamic = true
        box4.physicsBody?.affectedByGravity = false
        box4.physicsBody?.allowsRotation = true
        
        box5 = childNode(withName: "box5") as! SKSpriteNode
        box5.physicsBody = SKPhysicsBody(rectangleOf: size)
        box5.physicsBody?.mass = 0.15
        box5.physicsBody?.isDynamic = true
        box5.physicsBody?.affectedByGravity = true
        box5.physicsBody?.allowsRotation = true
        
        
        box6 = childNode(withName: "box6") as! SKSpriteNode
        box6.physicsBody = SKPhysicsBody(rectangleOf: size)
        box6.physicsBody?.mass = 0.15
        box6.physicsBody?.isDynamic = true
        box6.physicsBody?.affectedByGravity = true
        box6.physicsBody?.allowsRotation = true
        
        
        box7 = childNode(withName: "box7") as! SKSpriteNode
        box7.physicsBody = SKPhysicsBody(rectangleOf: size)
        box7.physicsBody?.mass = 0.15
        box7.physicsBody?.isDynamic = true
        box7.physicsBody?.affectedByGravity = true
        box7.physicsBody?.allowsRotation = true
        
        
        box8 = childNode(withName: "box8") as! SKSpriteNode
        box8.physicsBody = SKPhysicsBody(rectangleOf: size)
        box8.physicsBody?.mass = 0.15
        box8.physicsBody?.isDynamic = true
        box8.physicsBody?.affectedByGravity = true
        box8.physicsBody?.allowsRotation = true
        
        
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
       
    }
    
    func touchMoved(toPoint pos : CGPoint) {
 
    }
    
    func touchUp(atPoint pos : CGPoint) {
     
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 5 Kuşu taşıma kodları en başa hold eşittir true dedik. eğer trueysa taşıycaz bırakınca false yapcaz.
        
        if hold == true { // eğer hold truysa
            
            if let touch = touches.first { // eğer touchu alabilirsem
                
                let touchLocation = touch.location(in: self) // dokunduğum yerin lokasyonu
            let touchNodes = nodes(at: touchLocation) // dokunulan noktadaki touchnode
                 
                if touchNodes.isEmpty == false { // eğer dokunduğum touchnode kısmı boş değilse, yani mesela kuşa dokunuyorsamm demek istiyorum ...
                    
                    for node in touchNodes {
                        
                        if let sprite = node as? SKSpriteNode { // eğer nodeyi skspritenode olarak cast edebiliyosak
                            if sprite == bird { // eğer sprite yukardaki kuşsa , yani eğer dokunduğum node kuş ise...
                                
                                bird.position = touchLocation // birdin posisyonu eşittir dokunulan yer.
                                
                                
                                
                            }
                            
                        }
                    }
                    
                    
                }
                
                
            }
            
            
        }
        
        
        
        
        
        }
        
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) { // 6 bu kopyala yapıştır yaptık 5 i
        
        if hold == true { // eğer hold truysa
            
            if let touch = touches.first { // eğer touchu alabilirsem
                
                let touchLocation = touch.location(in: self) // dokunduğum yerin lokasyonu
            let touchNodes = nodes(at: touchLocation) // dokunulan noktadaki touchnode
                 
                if touchNodes.isEmpty == false { // eğer dokunduğum touchnode kısmı boş değilse, yani mesela kuşa dokunuyorsamm demek istiyorum ...
                    
                    for node in touchNodes {
                        
                        if let sprite = node as? SKSpriteNode { // eğer nodeyi skspritenode olarak cast edebiliyosak
                            if sprite == bird { // eğer sprite yukardaki kuşsa , yani eğer dokunduğum node kuş ise...
                                
                                bird.position = touchLocation // birdin posisyonu eşittir dokunulan yer.
                                
                                
                            }
                            
                        }
                    }
                    
                    
                }
                
                
            }
            
            
        }
        
        
        
        
        
    }
    
    // 7 İmpulse oluşturucaz kuşu ççekip atabilmek için 5 ve 6  yı kopyala yapıştır yapddım azcık değişiklik yapıcam.
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        if hold == true { // eğer hold truysa
            
            if let touch = touches.first { // eğer touchu alabilirsem
                
                let touchLocation = touch.location(in: self) // dokunduğum yerin lokasyonu
            let touchNodes = nodes(at: touchLocation) // dokunulan noktadaki touchnode
                 
                if touchNodes.isEmpty == false { // eğer dokunduğum touchnode kısmı boş değilse, yani mesela kuşa dokunuyorsamm demek istiyorum ...
                    
                    for node in touchNodes {
                        
                        if let sprite = node as? SKSpriteNode { // eğer nodeyi skspritenode olarak cast edebiliyosak
                            if sprite == bird { // eğer sprite yukardaki kuşsa , yani eğer dokunduğum node kuş ise...
                                
                                bird.position = touchLocation // birdin posisyonu eşittir dokunulan yer.
                                
                                
                                // 7.1 şimdi önce kuşun durduğu ilk noktayı halledebilmek için en yukarı original position yapıcam ve kuşu oluşturduğum yere de original position dicem.
                                // Şimdi burada touchloation ile original position arasındaki farkı alıp, onu impulse olarak tanıyacaz.
                                
                                let dx = -(touchLocation.x - originalPosition!.x) // eksi yapma sebebimiz ters impulse yapalım diye.
                                let dy = -(touchLocation.y - originalPosition!.y)
                                
                                let impulse = CGVector(dx: dx, dy: dy)
                                
                                bird.physicsBody?.applyImpulse(impulse)
                                bird.physicsBody?.affectedByGravity = true
                                
                                hold = false
                                
                                
                            }
                            
                        }
                    }
                    
                    
                }
                
                
            }
            
            
        }
        
        
        
        
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
       
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        //  8 Resetleme
        
        
        if let birdPhysicsbody = bird.physicsBody{
            
            if (bird.physicsBody?.velocity.dx)! <= 0.08 && (bird.physicsBody?.velocity.dy)! <= 0.08 && hold == false {
                
                bird.position = originalPosition!
                bird.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                bird.physicsBody?.angularVelocity = 0
                hold = true
                bird.physicsBody!.affectedByGravity = false
                
                
            }
            
        }
            
       
        
        
        
    }
}
