//
//  Login.swift
//  wingly
//
//  Created by Владимир Попов on 06.10.2024.
//

import SwiftUI

struct Login: View {
    
    @FocusState private var focusedField: Int?
    
    @State private var phoneNumber = ""
    
    @State private var countryFlagEmoji = ""
    
    @State private var nextTapped = false
    
    @State private var widthView = UIScreen.main.bounds.size.width
    @State private var heightView = UIScreen.main.bounds.size.height
    
    @StateObject private var oneTimeCodeFields: OneTimeCodeFields = OneTimeCodeFields()
    
    var body: some View {
        if oneTimeCodeFields.error {
            withAnimation(.spring()) {
                AlertView(msg: oneTimeCodeFields.errorMsg, show: $oneTimeCodeFields.error)
            }
        } else {
            if (nextTapped) {
                withAnimation(.default) {
                    Verification(oneTimeCodeFields: oneTimeCodeFields, phoneNumber: phoneNumber, completion: { nextTapped = false })
                }
            } else {
                VStack {
                    Image(uiImage: UIImage(named: "Logo_start")!)
                        .resizable()
                        .scaledToFit()
                        .padding(heightView * 0.054 / 5)
                        .frame(width: widthView, height: heightView * 0.054)
                    
                    Text("Введите номер\nтелефона")
                        .font(Font.custom("VelaSans-Bold", size: 32))
                        .bold()
                        .frame(width: widthView * 0.91, alignment: .leading)
                        .padding(.top)
                        .padding(.bottom, heightView * 0.1)
                    
                    HStack {
                        Text(countryFlagEmoji)
                        TextField(
                            "+7 (999) 999-99-99",
                            text: Binding(get: { phoneNumber }, set: { phoneNumber = formatNumber(data: $0) })
                        )
                        .keyboardType(.numberPad)
                        .font(Font.custom("VelaSans-Regular", size: 16))
                        .foregroundColor(.black)
                        .focused($focusedField, equals: 1)
                    }
                    .padding()
                    .border(color: focusedField == 1 ? Color(hex: "865DE6") : Color(hex: "F6F6F6"))
                    .frame(width: widthView * 0.91)
                    
                    Button {
                        if (phoneNumber.count > 5) {
                            nextTapped.toggle()
                            oneTimeCodeFields.verifyPhoneNumber(phoneNumber: phoneNumber)
                        }
                    } label: {
                        ZStack{
                            Rectangle()
                                .frame(width: widthView * 0.91, height: heightView * 0.066)
                                .cornerRadius(14)
                                .foregroundColor(.black)
                                .opacity(phoneNumber == "" ? 0.5 : 1)
                                
                            Text("Получить код")
                                .foregroundColor(.white)
                                .bold()
                                .font(Font.custom("VelaSans-Bold", size: 16))
                        }
                    }
                    .padding(.top, heightView * 0.05)
                    .padding(.bottom)
                    
                    Spacer()
                }
                .onAppear {
                    focusedField = 1
                    phoneNumber = "+\(countryRegionPhoneCode(Locale.current.language.region?.identifier ?? ""))"
                    countryFlagEmoji = countryFlag(String(phoneNumber.substring(fromIndex: 1).prefix(3)))
                }
            }
        }
    }
    
    func getCountryCode (_ country : String) -> String {
        if let key = countryToCodeDictionary.first(where: { $0.value == country })?.key {
            return key
        }
        return ""
    }
    
    let codeToCountryDictionary = [
        "1":"US",
        "7":"RU",
        "20":"EG",
        "27":"ZA",
        "30":"GR",
        "31":"NL",
        "32":"BE",
        "33":"FR",
        "34":"ES",
        "36":"HU",
        "39":"IT",
        "40":"RO",
        "41":"CH",
        "43":"AT",
        "44":"GB",
        "45":"DK",
        "46":"SE",
        "47":"NO",
        "48":"PL",
        "49":"DE",
        "51":"PE",
        "52":"MX",
        "53":"CU",
        "54":"AR",
        "55":"BR",
        "56":"CL",
        "57":"CO",
        "58":"VE",
        "60":"MY",
        "61":"AU",
        "62":"ID",
        "63":"PH",
        "64":"NZ",
        "65":"SG",
        "66":"TH",
        "77":"KZ",
        "81":"JP",
        "82":"KR",
        "84":"VN",
        "86":"CN",
        "90":"TR",
        "91":"IN",
        "92":"PK",
        "93":"AF",
        "94":"LK",
        "95":"MM",
        "98":"IR",
        "212":"MA",
        "213":"DZ",
        "216":"TN",
        "218":"LY",
        "220":"GM",
        "221":"SN",
        "222":"MR",
        "223":"ML",
        "224":"GN",
        "225":"CI",
        "226":"BF",
        "227":"NE",
        "228":"TG",
        "229":"BJ",
        "230":"MU",
        "231":"LR",
        "232":"SL",
        "233":"GH",
        "234":"NG",
        "235":"TD",
        "236":"CF",
        "237":"CM",
        "238":"CV",
        "239":"ST",
        "240":"GQ",
        "241":"GA",
        "242":"CG",
        "243":"CD",
        "244":"AO",
        "245":"GW",
        "246":"IO",
        "248":"SC",
        "249":"SD",
        "250":"RW",
        "251":"ET",
        "252":"SO",
        "253":"DJ",
        "254":"KE",
        "255":"TZ",
        "256":"UG",
        "257":"BI",
        "258":"MZ",
        "260":"ZM",
        "261":"MG",
        "262":"YT",
        "263":"ZW",
        "264":"NA",
        "265":"MW",
        "266":"LS",
        "267":"BW",
        "268":"SZ",
        "269":"KM",
        "284":"VG",
        "290":"SH",
        "291":"ER",
        "297":"AW",
        "298":"FO",
        "299":"GL",
        "340":"VI",
        "345":"KY",
        "350":"GI",
        "351":"PT",
        "352":"LU",
        "353":"IE",
        "354":"IS",
        "355":"AL",
        "356":"MT",
        "358":"FI",
        "359":"BG",
        "370":"LT",
        "371":"LV",
        "372":"EE",
        "373":"MD",
        "374":"AM",
        "375":"BY",
        "376":"AD",
        "377":"MC",
        "378":"SM",
        "379":"VA",
        "380":"UA",
        "381":"RS",
        "382":"ME",
        "385":"HR",
        "386":"SI",
        "387":"BA",
        "389":"MK",
        "420":"CZ",
        "421":"SK",
        "423":"LI",
        "500":"FK",
        "501":"BZ",
        "502":"GT",
        "503":"SV",
        "504":"HN",
        "505":"NI",
        "506":"CR",
        "507":"PA",
        "508":"PM",
        "509":"HT",
        "537":"CY",
        "590":"GP",
        "591":"BO",
        "592":"GY",
        "593":"EC",
        "594":"GF",
        "595":"PY",
        "596":"MQ",
        "597":"SR",
        "598":"UY",
        "599":"AN",
        "670":"TL",
        "672":"NF",
        "673":"BN",
        "674":"NR",
        "675":"PG",
        "676":"TO",
        "677":"SB",
        "678":"VU",
        "679":"FJ",
        "680":"PW",
        "681":"WF",
        "682":"CK",
        "683":"NU",
        "685":"WS",
        "686":"KI",
        "687":"NC",
        "688":"TV",
        "689":"PF",
        "690":"TK",
        "691":"FM",
        "692":"MH",
        "850":"KP",
        "852":"HK",
        "853":"MO",
        "855":"KH",
        "856":"LA",
        "872":"PN",
        "880":"BD",
        "886":"TW",
        "960":"MV",
        "961":"LB",
        "962":"JO",
        "963":"SY",
        "964":"IQ",
        "965":"KW",
        "966":"SA",
        "968":"OM",
        "967":"YE",
        "970":"PS",
        "971":"AE",
        "972":"IL",
        "973":"BH",
        "974":"QA",
        "975":"BT",
        "976":"MN",
        "977":"NP",
        "992":"TJ",
        "993":"TM",
        "994":"AZ",
        "995":"GE",
        "996":"KG",
        "998":"UZ",
    ]
    
    let countryToCodeDictionary = [
        "AS":"1",
        "AI":"1",
        "AG":"1",
        "BS":"1",
        "BB":"1",
        "BM":"1",
        "CA":"1",
        "DM":"1",
        "DO":"1",
        "GD":"1",
        "GU":"1",
        "JM":"1",
        "MS":"1",
        "MP":"1",
        "PR":"1",
        "TT":"1",
        "US":"1",
        "KN":"1",
        "LC":"1",
        "VC":"1",
        "TC":"1",
        "RU":"7",
        "EG":"20",
        "ZA":"27",
        "GR":"30",
        "NL":"31",
        "BE":"32",
        "FR":"33",
        "ES":"34",
        "HU":"36",
        "IT":"39",
        "RO":"40",
        "CH":"41",
        "AT":"43",
        "GB":"44",
        "GG":"44",
        "IM":"44",
        "JE":"44",
        "DK":"45",
        "SE":"46",
        "SJ":"47",
        "NO":"47",
        "PL":"48",
        "DE":"49",
        "PE":"51",
        "MX":"52",
        "CU":"53",
        "AR":"54",
        "BR":"55",
        "CL":"56",
        "CO":"57",
        "VE":"58",
        "MY":"60",
        "CC":"61",
        "AU":"61",
        "CX":"61",
        "ID":"62",
        "PH":"63",
        "NZ":"64",
        "SG":"65",
        "TH":"66",
        "KZ":"77",
        "JP":"81",
        "KR":"82",
        "VN":"84",
        "CN":"86",
        "TR":"90",
        "IN":"91",
        "PK":"92",
        "AF":"93",
        "LK":"94",
        "MM":"95",
        "IR":"98",
        "MA":"212",
        "DZ":"213",
        "TN":"216",
        "LY":"218",
        "GM":"220",
        "SN":"221",
        "MR":"222",
        "ML":"223",
        "GN":"224",
        "CI":"225",
        "BF":"226",
        "NE":"227",
        "TG":"228",
        "BJ":"229",
        "MU":"230",
        "LR":"231",
        "SL":"232",
        "GH":"233",
        "NG":"234",
        "TD":"235",
        "CF":"236",
        "CM":"237",
        "CV":"238",
        "ST":"239",
        "GQ":"240",
        "GA":"241",
        "CG":"242",
        "CD":"243",
        "AO":"244",
        "GW":"245",
        "IO":"246",
        "SC":"248",
        "SD":"249",
        "RW":"250",
        "ET":"251",
        "SO":"252",
        "DJ":"253",
        "KE":"254",
        "TZ":"255",
        "UG":"256",
        "BI":"257",
        "MZ":"258",
        "ZM":"260",
        "MG":"261",
        "YT":"262",
        "RE":"262",
        "ZW":"263",
        "NA":"264",
        "MW":"265",
        "LS":"266",
        "BW":"267",
        "SZ":"268",
        "KM":"269",
        "VG":"284",
        "SH":"290",
        "ER":"291",
        "AW":"297",
        "FO":"298",
        "GL":"299",
        "VI":"340",
        "KY":"345",
        "GI":"350",
        "PT":"351",
        "LU":"352",
        "IE":"353",
        "IS":"354",
        "AL":"355",
        "MT":"356",
        "FI":"358",
        "BG":"359",
        "LT":"370",
        "LV":"371",
        "EE":"372",
        "MD":"373",
        "AM":"374",
        "BY":"375",
        "AD":"376",
        "MC":"377",
        "SM":"378",
        "VA":"379",
        "UA":"380",
        "RS":"381",
        "ME":"382",
        "HR":"385",
        "SI":"386",
        "BA":"387",
        "MK":"389",
        "CZ":"420",
        "SK":"421",
        "LI":"423",
        "FK":"500",
        "GS":"500",
        "BZ":"501",
        "GT":"502",
        "SV":"503",
        "HN":"504",
        "NI":"505",
        "CR":"506",
        "PA":"507",
        "PM":"508",
        "HT":"509",
        "CY":"537",
        "BL":"590",
        "MF":"590",
        "GP":"590",
        "BO":"591",
        "GY":"592",
        "EC":"593",
        "GF":"594",
        "PY":"595",
        "MQ":"596",
        "SR":"597",
        "UY":"598",
        "AN":"599",
        "TL":"670",
        "NF":"672",
        "BN":"673",
        "NR":"674",
        "PG":"675",
        "TO":"676",
        "SB":"677",
        "VU":"678",
        "FJ":"679",
        "PW":"680",
        "WF":"681",
        "CK":"682",
        "NU":"683",
        "WS":"685",
        "KI":"686",
        "NC":"687",
        "TV":"688",
        "PF":"689",
        "TK":"690",
        "FM":"691",
        "MH":"692",
        "KP":"850",
        "HK":"852",
        "MO":"853",
        "KH":"855",
        "LA":"856",
        "PN":"872",
        "BD":"880",
        "TW":"886",
        "MV":"960",
        "LB":"961",
        "JO":"962",
        "SY":"963",
        "IQ":"964",
        "KW":"965",
        "SA":"966",
        "OM":"968",
        "YE":"967",
        "PS":"970",
        "AE":"971",
        "IL":"972",
        "BH":"973",
        "QA":"974",
        "BT":"975",
        "MN":"976",
        "NP":"977",
        "TJ":"992",
        "TM":"993",
        "AZ":"994",
        "GE":"995",
        "KG":"996",
        "UZ":"998",
    ]
    
    private func countryRegionPhoneCode(_ country: String) -> String {
        if countryToCodeDictionary[country] != nil {
            return countryToCodeDictionary[country]!
        } else {
            return ""
        }
    }
    
    private func countryFlag(_ code: String) -> String {
        if codeToCountryDictionary[code] != nil {
            let country = codeToCountryDictionary[code]!
            
            let base : UInt32 = 127397
            var s = ""
            for v in country.unicodeScalars {
                s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
            }
            return String(s)
        } else {
            return ""
        }
    }
    
    private func formatNumber(data: String) -> String {
        if (data.count <= 1) {
            return "+"
        } else {
            let temp = countryFlag(String(phoneNumber.substring(fromIndex: 1).prefix(3)))
            if temp != "" {
                countryFlagEmoji = temp
            }
            return data.prefix(16).trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }
}

struct Login_Previews_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Login(
//                databaseManager: DatabaseManager()
            )
                .environment(\.locale, Locale.init(identifier: "ru"))
        }
    }
}
