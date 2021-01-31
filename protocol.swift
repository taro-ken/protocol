import Foundation

/*
 protocolをclassとstructとenumに準拠させる
 */

print("[protocolの準拠]")
protocol HogeProtocol {
  var id: Int { get }
  func test1()
  func test2()
}

class FugaClass: HogeProtocol {
  var id: Int = 0
  func test1() {
    print("\(String(describing: type(of: self))) \(#function)")
  }
  func test2() {
    print("\(String(describing: type(of: self))) \(#function)")
  }
  func test3(){
    print("\(String(describing: type(of: self))) \(#function)")
  }
}

struct FugaStruct: HogeProtocol {
  var id: Int
  func test1() {
    print("\(String(describing: type(of: self))) \(#function)")
  }
  func test2() {
    print("\(String(describing: type(of: self))) \(#function)")
  }
}

enum FugaEnum: Int, HogeProtocol {

  case testCase1 = 10
  case testCase2 = 20

  var id: Int {
    get {
      return self.rawValue
    }
  }
  func test1() {
    print("\(String(describing: type(of: self))) \(#function)")
  }
  func test2() {
    print("\(String(describing: type(of: self))) \(#function)")
  }
}

//HogeProtocolに準拠してるものなら代入できる
var hoge: HogeProtocol? = nil

//classを代入
hoge = FugaClass()
hoge?.test1()
hoge?.test2()
print("----------")

//structを代入
hoge = FugaStruct(id: 10)
hoge?.test1()
hoge?.test2()
print("----------")

//enumを代入
hoge = FugaEnum.testCase1
hoge?.test1()
hoge?.test2()
print("----------")



print("")
print("")


/*
 protocolを複数準拠させる
 */
print("[protocolの複数準拠]")

protocol HogeProtocol1 {
  func test1()
}

protocol HogeProtocol2 {
  func test2()
}

//ふたつのprotocolを準拠
class FugaClass1: HogeProtocol1, HogeProtocol2 {
  func test1() {
    print("\(String(describing: type(of: self))) \(#function)")
  }
  func test2() {
    print("\(String(describing: type(of: self))) \(#function)")
  }
}

//実際は準拠させたるときはextensionで分けた方が見通しがいい
class FugaClass2 {
  //クラス本来の記述がいっぱいある
}

extension FugaClass2: HogeProtocol1 {
  func test1() {
    print("\(String(describing: type(of: self))) \(#function)")
  }
}

extension FugaClass2: HogeProtocol2 {
  func test2() {
    print("\(String(describing: type(of: self))) \(#function)")
  }
}

let fuga2 = FugaClass2()
fuga2.test1()
fuga2.test2()

print("")

//protocolもprotocolを準拠できる
protocol HogeProtocol3: HogeProtocol1, HogeProtocol2 {
  func test3()
}

class FugaClass3: HogeProtocol3 {
  func test1() {
    print("\(String(describing: type(of: self))) \(#function)")
  }
  func test2() {
    print("\(String(describing: type(of: self))) \(#function)")
  }
  func test3() {
    print("\(String(describing: type(of: self))) \(#function)")
  }
}

let fuga3 = FugaClass3()
fuga3.test1()
fuga3.test2()
fuga3.test3()

print("")


/*protocol extension*/
print("[protocol extension]")
protocol HogeProtocol4 {
  var id: Int { get }
  func test1()
  func test2()
}
//extensionとして、本来は実態のないprotocolのfunctionなどにデフォルト実装を定義できる
extension HogeProtocol4 {
  func test1() {
    print("\(String(describing: type(of: self))) \(#function)")
  }
}

class FugaClass4 {
}

extension FugaClass4: HogeProtocol4 {
  var id: Int { 1 }

  //test1はデフォルトで定義されているので書かなくてもいい
  func test2() {
    print("\(String(describing: type(of: self))) \(#function)")
  }
}

let fuga4 = FugaClass4()
fuga4.test1()
fuga4.test2()
