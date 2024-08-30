// Make sure you don't get warnings about tabsize
#pragma tabsize 0



// ********************************************************************************************************************
// Set default gamemode name
// ********************************************************************************************************************

#define HostName                    "» Initial Gaming™ - Long Way Trucking «"
#define GameModeName				"Turkiye » LWT v1.0.0 «"
#define Website                     "."
#define MapName                     "Turkiye » TR «"

#define ROOT_PASS                   "#=S2K_1B0_XD=#"
#define FUCK_PASS                   "=<1n1t14l>=<s1kt1>="

// ********************************************************************************************************************
// Limit the amount of cops with a value greater than 0
// Setting this to "3" would mean:
// - having 3 normal players (non-cop players) before the first cop can join the server
// - having 6 normal players before 2 cops can be active
// - having 9 normal players before the third cop can join and so on
// Leaving this at 0 disables the police-limitation, so anyone can choose the police class anytime
// ********************************************************************************************************************

new PlayersBeforePolice	= 0;

// ********************************************************************************************************************
// ********************************************************************************************************************



// Include default files
#include <a_samp>
#include <zcmd>
#include <sscanf2>
#include <streamer>
#include <foreach>


// Spanel
#define DIALOG_SPANEL_LOGIN                 1500
#define DIALOG_SPANEL_HOME                  1501

// KGelistirme
#define DIALOG_KPANEL                       1600
#define DIALOG_KGELISTIRME                  1601

// Market
#define DIALOG_MARKET                       1700


// ************************************************************************************************************************************************************
// Only function from dutils.inc
// ************************************************************************************************************************************************************

stock StripNewLine(string[])
{
	new len = strlen(string);
	if (string[0]==0) return ;
	if ((string[len - 1] == '\n') || (string[len - 1] == '\r')) {
		string[len - 1] = 0;
		if (string[0]==0) return ;
		if ((string[len - 2] == '\n') || (string[len - 2] == '\r')) string[len - 2] = 0;
	}
}



// PPC-includes merged into one single file follow here

// ************************************************************************************************************************************************************
// PPC_DefTexts
// ************************************************************************************************************************************************************

// Debug messages
#define TXT_DebugInfo "Sunucu Bilgileri"
#define TXT_HousesFixed "Tamir edilen ev sayisi: %i"
#define TXT_LastVehicleID "Son arac ID: %i"
#define TXT_LastObjectID "Son obje ID: %i"
#define TXT_TotalHouses "%i ev yuklendi"
#define TXT_TotalBusiness "%i isyeri yuklendi"
#define TXT_TotalSpeedCameras "%i hiz kamerasi yuklendi"

// Define the message that's sent to all players when a player joins the server
#define TXT_PlayerJoinedServer "'{FFFF00}%s{0000FF}' (ID: {FFFF00}%i{0000FF}) sunucuya giriþ yaptý."
#define TXT_PlayerLeftServer "'{FFFF00}%s{0000FF}' (ID: {FFFF00}%i{0000FF}) sunucudan ayrýldý."

// Banned texts (also kick messages)
#define TXT_StillBanned "{FF0000}Ban cezanýz daha bitmemiþ!" // Define the text that the player sees when he's still banned when trying to login
#define TXT_BannedDuration "{FF0000}Kalan: %i gün, %i saat, %i dakika, %i saniye" // Define the remaining ban-time text
#define TXT_KickSpeedHack "{FF0000}Hýz hilesi veya air-breaking kullandýðýnýz için kick yediniz"
#define TXT_KickJetPackHack "{FF0000}Jetpack hilesi kullandýðýnýz için kick yediniz"
#define TXT_KickHealthHack "{FF0000}HP hilesi kullandýðýnýz için kick yediniz"

// Dialog buttons
#define TXT_DialogButtonCancel "Iptal" // Define the text on the "Cancel"-button for dialogs
#define TXT_DialogButtonBuy "Satýn Al" // Define the text on the "Buy"-button for dialogs
#define TXT_DialogButtonSpawn "Oluþtur"
#define TXT_DialogButtonSelect "Seç"
#define TXT_DialogButtonYes "Evet"
#define TXT_DialogButtonNo "Hayýr"

// Dialog entries
#define TXT_DialogEntryNext "Sonraki..."

// The register dialog
#define TXT_DialogRegisterTitle "Hoþ Geldiniz" // Define the title-message on top of the register-dialog
#define TXT_DialogRegisterMsg "Þifrenizi girerek kayýt olunuz:" // Define the actual message in the register-dialog
#define TXT_DialogRegisterButton1 "Kayýt" // Define the text on the "register" button for the register-dialog
#define TXT_AccountRegistered "{00FF00}Baþarýyla hesabýnýzý kayýt ettiniz"
#define TXT_RegisterEnterValidPassword "Kayýt olmak için geçerli bir þifre girin:"
#define TXT_PlayerMustRegister "{FF0000}Oyuna baþlamak için kayýt olmalýsýnýz, yoksa kickleneceksiniz!"

// The login dialog
#define TXT_DialogLoginTitle "Hoþ Geldiniz" // Define the title-message on top of the login-dialog
#define TXT_DialogLoginMsg "Lütfen þifrenizi girerek hesabýnýza giriþ yapýn:" // Define the actual message in the login-dialog
#define TXT_DialogLoginButton1 "Giriþ" // Define the text on the "login" button for the login-dialog
#define TXT_LoggedIn "{00FF00}Giriþ yaptýnýz, sunucumuza tekrardan hoþ geldiniz"
#define TXT_WrongPassword "{FF0000}Yanlýþ þifre girdiðiniz için kicklendiniz"
#define TXT_LoginEnterValidPassword "Lütfen þifrenizi girin:"
#define TXT_PlayerMustLogin "{FF0000}Oyuna girmek için giriþ yapmalýsýnýz, yoksa kickleneceksiniz!"
#define TXT_FailedLoginProperly "{FF0000}Düzgün giriþ yapamadýnýz, bu yüzden kicklendiniz!"

// The license dialog
#define TXT_DialogLicenseTitle "Ehliyet Seçin:" // Define the title-message on top of the licenses-dialog
#define TXT_DialogLicenseList "Kamyon Ehliyeti ($50.000, 100 skor)\r\nOtobüs Ehliyeti ($25.000, 50 skor)" // Define the licenses and their price
#define TXT_PickupText "Ehliyet Al" // Defines the text that's shown above the pickup for buying licenses
#define TXT_TruckerLicenseBought "{00FF00}Kamyon ehliyeti aldýnýz"
#define TXT_TruckerLicenseNotEnoughMoney "{FF0000}Kamyon ehliyeti alabilmek için $50.000 ve 100 skora ihtiyacýnýz var!"
#define TXT_TruckerLicenseOwned "{FF0000}Zaten kamyon ehliyetiniz var"
#define TXT_TruckerLicenseWrongClass "{FF0000}Kamyon ehliyeti almak için kamyoncu olmanýz gerekiyor"
#define TXT_BusLicenseBought "{00FF00}Otobüs ehliyeti aldýnýz"
#define TXT_BusLicenseNotEnoughMoney "{FF0000}Otobüs ehliyeti alabilmek için $25.000 ve 50 skora ihtiyacýnýz var!"
#define TXT_BusLicenseOwned "{FF0000}Zaten otobüs ehliyetiniz var"
#define TXT_BusLicenseWrongClass "{FF0000}Otobüs ehliyeti almak için otobüsçü olmanýz gerekiyor"



// Dialog related for /car, /plane, ...
#define TXT_DialogCarTitle "Bir Araç Seçin (sayfa %i):"
#define TXT_DialogPlaneTitle "Bir Hava Aracý Seçin (sayfa %i):"
#define TXT_DialogTrailerTitle "Bir Trailer Seçin (sayfa %i):"
#define TXT_PlayerSpawnedVehicle "{00FF00}%s %i ID'li araç indirdi (Model-ID = %i) Koordinatlar: x=%4.2f, y=%4.2f, z=%4.2f"
#define TXT_ChangedWeather "{00FF00}Hava durumunu deðiþtirdiniz"
#define TXT_DialogCommandTitle "Komut Listesi (sayfa %i):"

// Trucker related
#define TXT_PlayerCompletedTruckJob "{FFFFFF}Kamyoncu {FF00FF}%s{FFFFFF} baþarýyla {0000FF}%s{FFFFFF} taþýdý."
#define TXT_PlayerCompletedTruckJobInfo "{00FF00}%s{FFFFFF}'dan {00FF00}%s{FFFFFF}'a"
#define TXT_TruckerBonusOverloaded "{00FF00}Aþýrý Yükleme Bonusu: $%i"
#define TXT_TruckerBonusMafiaLoad "{00FF00}Mafya Yükü Bonusu: $%i"
#define TXT_TruckerBonusOwnVehicle "{00FF00}Kendi Aracýný Kullanma Bonusu: $%i"
#define TXT_TruckerMustEnterVehicle "{FF0000}Bir kamyona binmeniz veya kamyona kasa takmanýz gerekiyor!"
#define TXT_TruckerOverloaded "{FF0000}Aþýrý yükleme yaptýnýz! Polislerden kaçýnýn!"
#define TXT_TruckerMafiaInterested "~r~Mafya Sizin Yukunuzle Ilgileniyor~w~"
#define TXT_TruckerDialogSelectLoad "Yük Seçin:"
#define TXT_TruckerDialogSelectStartLoc "Yükleme Noktasý Seçin:"
#define TXT_TruckerDialogSelectEndLoc "Boþaltma Noktasý Seçin:"
#define TXT_NeedVehicleToProceed "{FF0000}Görevi gerçekleþtirebilmek için araçta olmalýsýnýz!"
#define TXT_NeedTrailerToProceed "{FF0000}Görevi gerçekleþtirebilmek için týrýnýzýn kasasý takýlý olmalý!"
#define TXT_NeedOnFootToProceed "{FF0000}Görevi gerçekleþtirebilmek için ayakta olmalýsýnýz!"

// Busdriver related
#define TXT_PlayerCompletedBusLine "{FFFFFF}Otobüsçü {FF00FF}%s{FFFFFF} baþarýyla {0000FF}%i{FFFFFF} nolu rotada sefer tamamladý."
#define TXT_BusDriverMissionPassed "Gorev Bitti" // Define the game-text that shows when the player passed a busdriver mission
#define TXT_BusDriverJobInfo "~w~Durak ~y~%i~w~ (~g~%s~w~): ~b~%i~w~ Otobuste"
#define TXT_BusDriverBusStopInfo "~w~Durak ~y~%i~w~ (~g~%s~w~): ~b~%i~w~ Otobuste, ~b~%i~w~ Durakta"
#define TXT_BusDriverReward "~g~Kazanciniz: $%i~w~"
#define TXT_BusDriverMustEnterBus "{FF0000}Otobüsünüze binmeniz gerekiyor"
#define TXT_SelectBusRoute "Rota Seçin:"
#define TXT_BusdriverAlreadyDoingJob "{FF0000}Þuan zaten görevdesin!"

// Mafia related
#define TXT_PlayerCompletedMafiaJob "{FFFFFF}Mafya {FF00FF}%s{FFFFFF} baþarýyla {0000FF}%s{FFFFFF} taþýdý."
#define TXT_PlayerCompletedMafiaJobInfo "{00FF00}%s{FFFFFF}'dan {00FF00}%s{FFFFFF}'a"
#define TXT_MafiaMustEnterVehicle "{FF0000}Araca binmelisiniz"
#define TXT_MafiaDeliverStolenLoad "~b~calinti yuku~w~ getirmeniz gereken yer ~r~mafya siginagi~w~"
#define TXT_MafiaDeliveredStolenLoad "{00FF00}Çalýntý yükü buraya getirdiniz. Kazancýnýz : $5000"

// Police related
#define TXT_PoliceWarnPlayer "~r~Polis! Saga Cek!~w~"
#define TXT_PoliceFinedPlayerReward "{00FF00}%s'dan $%i ceza kestiniz"
#define TXT_PlayerGotFinedByPolice "{FF0000}Polis %s tarafýndan yakalandýnýz ve $%i ceza ödediniz"
#define TXT_PoliceFinedPlayer "{00FF00}Polis %s, %s'a ceza kesti"
#define TXT_PoliceJailedPlayerReward "{00FF00}%s'ý hapse attýnýz ve $%i kazandýnýz"
#define TXT_PlayerGotJailedByPolice "{FF0000}Polis %s tarafýndan %i dakika hapse atýldýnýz"
#define TXT_PoliceJailedPlayer "{00FF00}Polis %s, %s'ý %i dakika hapse attý"

// Pilot related
#define TXT_PlayerCompletedPilotJob "{FFFFFF}Pilot {FF00FF}%s{FFFFFF} baþarýyla {0000FF}%s{FFFFFF} taþýdý"
#define TXT_PlayerCompletedPilotJobInfo "{00FF00}%s{FFFFFF}'dan {00FF00}%s{FFFFFF}'a"

// Courier related
#define TXT_CourierMustEnterVehicle "{FF0000}You must enter your vehicle"
#define TXT_PlayerCompletedCourierJob "{FFFFFF}Courier {FF00FF}%s{FFFFFF} succesfully delivered {0000FF}%i{FFFFFF} packages"
#define TXT_PackageDeliveredGameText "Package delivered"
#define TXT_PackageDeliveredMessage "{00FF00}Package delivered"

// Roadworker related
#define TXT_RepairSpeedcamera "~r~bozuk~w~ hiz kamerasini tamir et"
#define TXT_TowBrokenVehicle "~w~yakindaki ~r~bozuk arac~w~ ~b~%s~w~i hurdaliga cek"
#define TXT_DeliverBrokenVehicle "~w~Yakindaki bozuk arac ~b~%s~w~i ~r~hurdalig~w~a cek"
#define TXT_RoadworkerMustEnterVehicle "{FF0000}Araca binmelisiniz veya kasayý çýkarmalýsýnýz"
#define TXT_RoadworkerMissionPassed "Gorev Bitti" // Define the game-text that shows when the player passed a roadworker mission

// Job related, for all classes
#define TXT_RewardJob "{00FF00}Görevi bitirdiniz ve $%i kazandýnýz"
#define TXT_FailedMission "~w~Görevini ~r~yapamadýn. ~w~Bu yuzden ~y~$1000~w~ kaybettin." // Define game-text when player fails a mission

// Class related
#define TXT_ClassTrucker "Kamyon Sofuru" // Define the game-text that shows when the player is choosing classes (this one = trucker)
#define TXT_ClassBusDriver "Otobus Soforu" // Define the game-text that shows when the player is choosing classes (this one = bus-driver)
#define TXT_ClassPilot "Pilot" // Define the game-text that shows when the player is choosing classes (this one = pilot)
#define TXT_ClassPolice "Polis" // Define the game-text that shows when the player is choosing classes (this one = police)
#define TXT_ClassMafia "Mafya" // Define the game-text that shows when the player is choosing classes (this one = mafia)
#define TXT_ClassCourier "Kurye" // Define the game-text that shows when the player is choosing classes (this one = courier)
#define TXT_ClassAssistance "Tamirci" // Define the game-text that shows when the player is choosing classes (this one = assistance)
#define TXT_ClassRoadWorker "Yol Iscisi" // Define the game-text that shows when the player is choosing classes (this one = roadworker)

// No-job texts for all classes
#define Trucker_NoJobText "\"~y~/work~w~\" yazarak gorev baslatin"
#define BusDriver_NoJobText "\"~y~/work~w~\" yazarak gorev baslatin"
#define Pilot_NoJobText "\"~y~/work~w~\" yazarak gorev baslatin"
#define Police_NoJobText "~w~Ceza kesmek icin ~r~'Sag Tus' ~w~(ayakta), oyuncuyu uyarmak icin ~r~'Sol CTRL' ~w~(aracta)"
#define Mafia_NoJobText "~r~Haritada isaretli arac~w~'i calin veya gorev baslatmak icin \"~y~/work~w~\" yazin"
#define Courier_NoJobText "No job at the moment. Enter \"~y~/work~w~\" to start a job"
#define Assistance_NoJobText "~w~Tamir etmek/benzin doldurmak icin ~r~'Sag Tus'~w~ (ayakta), kendi aracinizi tamir etmek icin ~r~'Sol CTRL'~w~"
#define RoadWorker_NoJobText "\"~y~/work~w~\" yazarak gorev baslatin"

// Command related
#define TXT_PlayerRescued "{0000FF}Kurtarýldýnýz. $200 ücret ödediniz. ( VIP iseniz ödemezsiniz )"

// Fuel related
#define TXT_Refuelling "~g~Benzin Dolduruluyor..." // Define the game-text that shows when you're refuelling your vehicle
#define TXT_PickupRefuel "Benzin almak için\nkornaya basýn"
#define TXT_RefuelledVehicle "{00FF00}Aracýnýzýn deposunu $%i'a doldurdunuz"
#define TXT_CannotRefuelVehicle "{FF0000}Aracýnýza benzin almak için yeterli paranýz yok"

// Gametexts for loading/unloading
#define TXT_LoadingGoods "~r~Yukleniyor %s... ~w~Lutfen Bekleyin"
#define TXT_UnloadingGoods "~r~Bosaltiliyor %s... ~w~Lutfen Bekleyin"
#define TXT_TruckerLoadingGoods "~r~Kamyonunuz Yukleniyor... ~w~Lutfen Bekleyin"
#define TXT_TruckerUnloadingGoods "~r~Kamyonunuz Bosaltiliyor... ~w~Lutfen Bekleyin"
#define TXT_TransportingFromToPickup "~b~%s~w~'u ~r~%s~w~'dan %s'a tasiyorsunuz"
#define TXT_TransportingFromToDeliver "~b~%s~w~'u %s'dan ~r~%s~w~'a tasiyorsunuz"
#define TXT_HaulingCargoFromToPickup "~b~%s~w~'u ~r~%s~w~'dan %s'a tasiyorsunuz"
#define TXT_HaulingCargoFromToDeliver "~b~%s~w~'u %s'dan ~r~%s~w~'a tasiyorsunuz"
#define TXT_PickupCargoAt "{00FF00}%s'dan %s'a taþýyýn"
#define TXT_DeliverCargoTo "{00FF00}%s'dan %s'a taþýyýn"

// Cardealer related
#define TXT_PickupCarDealer "Araç kiralamak için\n\"/arabakirala\" yazýn"
#define TXT_BuyRentCarEmptyList "{FF0000}Bu liste boþ, yönetici bu mesleðiniz için bu araçlarý engellemiþ olabilir."
#define TXT_RentBike "Bisiklet Kirala:"
#define TXT_RentBoat "Tekne Kirala:"
#define TXT_RentConvertible "Üstü Açýk Araba Kirala:"
#define TXT_RentHelicopter "Helikopter Kirala:"
#define TXT_RentIndustrial "Endüstriyel Araç Kirala:"
#define TXT_RentLowRider "Lowrider Kirala:"
#define TXT_RentOffRoad "Off-Road Aracý Kirala:"
#define TXT_RentPlane "Ucak Kirala:"
#define TXT_RentPublicService "Halka Hizmet Aracý Kirala:"
#define TXT_RentRC "RC Araç Kirala:"
#define TXT_RentSaloon "Sedan Araba Kirala:"
#define TXT_RentSport "Spor Araba Kirala:"
#define TXT_RentStationWagon "Station Wagon Araba Kirala:"
#define TXT_RentTrailer "Kasa Kirala:"
#define TXT_RentUnique "Özel Araç Kirala:"
#define TXT_AlreadyRentedVehicle "{FF0000}Zaten daha önce bir araç kiralamýþsýn, fakat bu yeni kiraladýðýnýzla yer deðiþtirdi"
#define TXT_PlayerRentsVehicle "{00FF00}Bir {FFFF00}%s{00FF00} kiraladýnýz. Ücret: ${FFFF00}%i{00FF00} (VIP'lere Ücretsiz)"
#define TXT_RentingTooExpensive "{FF0000}Bu aracý kiralayacak paranýz yok"
#define TXT_BuyBike "Bisiklet Al:"
#define TXT_BuyBoat "Tekne Al:"
#define TXT_BuyConvertible "Üstü Açýk Araba Al:"
#define TXT_BuyHelicopter "Helikopter Al:"
#define TXT_BuyIndustrial "Endüstriyel Araç Al:"
#define TXT_BuyLowRider "Lowrider Al:"
#define TXT_BuyOffRoad "Off-Road Aracý Al:"
#define TXT_BuyPlane "Uçak Al:"
#define TXT_BuyPublicService "Halka Hizmet Aracý Al:"
#define TXT_BuyRC "RC Araç Al:"
#define TXT_BuySaloon "Sedan Al:"
#define TXT_BuySport "Spor Araba Al:"
#define TXT_BuyStationWagon "Station Wagon Araba Al:"
#define TXT_BuyTrailer "Kasa Al:"
#define TXT_BuyUnique "Özel Araç Al:"



// Jail related
#define TXT_JailTimer "~r~%i ~w~Saniye Kaldi"

// Speedometer related
#define TXT_SpeedometerSpeed "~w~Hiz: ~b~%i~w~ km/h"
#define TXT_SpeedometerFuel "~w~Yakit: %s"
#define TXT_SpeedometerCannotUseVehicle "{FF0000}Bu aracý kullanamazsýnýz, bu aracýn sahibi: \"{FFFF00}%s{FF0000}\""
#define TXT_SpeedometerClampedVehicle "{FF0000}Bu araç kelepçelenmiþ, bu aracý kullanamazsýnýz"
#define TXT_SpeedometerClampedVehicle2 "{FF0000}Aracý kelepçeden {FFFF00}/kelepcekaldir yazarak kurtarabilirsiniz"
#define TXT_PlayerCaughtSpeeding "{FF0000}Hýz kamerasýna yakalandýnýz, yavaþlayýn!"

// Toll-gate related
#define TXT_PlayerPaysToll "Giseye $%i odediniz"

// Convoy related
#define TXT_PlayerStartsConvoy "Oyuncu {00FF00}%s{FFFFFF} bir {00FF00}konvoy{FFFFFF} baþlatmak istiyor, \"/konvoy\" yazarak ona katýlýn"
#define TXT_PlayerJoinedConvoy "Oyuncu {00FF00}%s{FFFFFF} konvoya katýldý"
#define TXT_YouJoinedConvoy "{00FF00}Konvoya katýldýnýz"
#define TXT_WaitingLeaderJob "Konvoy liderinin gorevi baslatmasini bekleyin"
#define TXT_WaitingMembersToLoadCargo "Konvoy uyelerinin yukleme yapmasini bekleyin"
#define TXT_WaitingMembersToUnLoadCargo "Konvoy uyelerinin bosaltma yapmasini bekleyin"
#define TXT_ConvoyFull "{FF0000}Konvoy dolu"
#define TXT_ConvoyEnRoute "Konvoy þuan görevde, konvoya katýlamazsýnýz"
#define TXT_LeaderCancelledConvoy "{FF0000}Konvoy lideri görevi iptal etti"
#define TXT_MeetOtherConvoyMembers "{00FF00}Diðer konvoy üyeleriyle yükleme noktasýnda buluþun"
#define TXT_ConvoyDistanceForLeader "{00FF00}Herkes size en fazla 500m uzaklýkta olmalý"
#define TXT_ConvoyDistanceForMember "{00FF00}Konvoy liderinin en fazla 500m uzaðýnda olmalýsýnýz"
#define TXT_MemberNeedsCargoTrailer "Kargo kasasina ihtiyaciniz var"
#define TXT_MemberNeedsOreTrailer "Maden kasasina ihtiyaciniz var"
#define TXT_MemberNeedsFluidsTrailer "Sivi tankerine ihtiyaciniz var"
#define TXT_AllMembersSameTrailer "{00FF00}Bütün konvoy üyeleri ayný kasayý taktý, konvoy yola çýkmaya hazýr"
#define TXT_AllMembersNotSameTrailer "{FF0000}Bütün konvoy üyeleri ayný kasayý takmamýþ, konvoy yola çýkmak için hazýr deðil"
#define TXT_AllMembersLoadedCargo "{00FF00}Bütün konvoy üyeleri araçlarýný yükledi, konvoy boþaltma noktasýna gitmek için hazýr"
#define TXT_MemberKickedByDistance "{FF0000}Konvoy liderine yakýn durmadýðýnýz için konvoydan atýldýnýz"
#define TXT_MemberFellBehind "Oyuncu {00FF00}%s{FFFFFF} geride kaldý ve konvoydan atýldý"
#define TXT_FinishedConvoy "{00FF00}Konvoy görevini bitirdiniz ve $%i kazandýnýz"
#define TXT_LeaderInfoBar "Uye Sayisi: ~g~%i~w~, En Uzaktaki Uye: ~g~%s~w~, Mesafe: ~r~%3.1f~w~"
#define TXT_MemberInfoBar "Lider: ~r~%s~w~, Mesafe: ~r~%3.1f~w~, Uye Sayisi: ~r~%i~w~"
#define TXT_CannotJoinJobStarted "{FF0000}Þuan konvoy görevindesiniz, konvoy kuramazsýnýz veya bir konvoya katýlamazsýnýz"
#define TXT_ConvoyAllreadyJoined "{FF0000}Zaten bir konvoya katýlmýþsýnýz"
#define TXT_ConvoyNeedsTruckerClass "{FF0000}Konvoya katýlmak veya konvoy oluþturmak için kamyoncu olmalýsýnýz"

// Timed messages
#define TXT_TimedRefuel "{808080}Aracýnýza benzin almak mý istiyorsun? Benzinlik önünde korna çal"
#define TXT_TimedConvoy "{808080}Bir konvoy baþlatmak mý istiyorsun? \"/konvoy\" yazarak baþlatýn veya birine katýlýn"
#define TXT_TimedGohome "{808080}Evine ýþýnlanmak mý istiyorsun? \"/evegit\" yazarak evine ýþýnlan"
#define TXT_TimedRentCar "{808080}Araç kiralamak mý istiyorsun? San Fierro'da Doherty'de Wang Cars'e git"
#define TXT_TimedLicense "{808080}Rastgele kamyon/otobüs görevlerinden býktýn mý? Doherty'deki sürücü kursuna git ve ehliyet al"
#define TXT_TimedSpeedTraps "{808080}Hýz limitleri ( Þehir Ýçi: 60 km/h, Þehir Dýþý: 90 km/h, Otoban: 120 km/h )"
#define TXT_TimedGoBusiness "{808080}Ýþyerine ýþýnlanmak mý istiyorsun? \"/isyerinegit\" yazarak iþyerine ýþýnlan"

// House-related
#define TXT_DefaultHouseName "%s'nýn Evi"
#define TXT_PlayerBoughtHouse "{33FF33}Evi ${FFCC33}%i{33FF33}'a satýn aldýnýz."
#define TXT_PlayerOwnsMaxHouses "{FF0000}Oyuncu baþýna alýnabilecek en fazla eve sahipsiniz"
#define TXT_ExitHouseReloadEnv "Objelerin yuklenmesini bekleyin"
#define TXT_PickupHouseOwned "%s\nSahip: %s\nEv Seviyesi: %i\n/gir"
#define TXT_PickupHouseForSale "Ev Satýlýk, Ücreti:\n$%i\nMax Ev Seviyesi: %i\n/eval"
#define TXT_DialogOldHouseName "Evin Eski Ýsmi: %s"
#define TXT_DialogEnterNewHouseName "Evinize yeni bir isim verin"
#define TXT_DialogSelectHouseUpgrade "Geliþtirme seçin:"
#define TXT_HouseReachedMaxLevel "{FF0000}Eviniz son seviyeye ulaþtý, daha fazla geliþtiremezsiniz"
#define TXT_DialogBuyCarSelectClass "Araç Sýnýfý Seçin:"
#define TXT_HouseHasMaxVehicles "{FF0000}Bu eve alabileceðiniz en fazla aracý almýþsýnýz"
#define TXT_AlreadyBoughtRecentVehicle "{FF0000}Az önce bir araba almýþsýnýz, \"/getcar\" ve \"/park\" kullanarak yeni araç almadan önce aracýnýzý park edin"
#define TXT_EmptyCarSlot "%s{FFFFFF}Boþ Araç Slotu{FFFFFF}\n"
#define TXT_SelectVehicleToSell "Satmak için Araç Seçin:"
#define TXT_SelectVehicleToGet "Çekmek Ýstediðiniz Aracý Seçin:"
#define TXT_NoHouseVehicles "{FF0000}Bu evde araç bulunmamakta"
#define TXT_SureSellHouse "Evini $%i'a satmak istediðinizden emin misiniz?"
#define TXT_AreYouSure "Emin misiniz?"
#define TXT_CannotSellHouseWithCars "{FF0000}Arabasý bulunan evi satamazsýnýz, önce araçlarýnýzý satýn."
#define TXT_PlayerUpgradedHouse "{00FF00}Evinizi %i seviyesine getirdiniz. Ücret: $%i"
#define TXT_CannotAffordUpgrade "{FF0000}Bu geliþtirmeyi yapabilmek için paranýz yok"
#define TXT_NoHouseInSlot "{FF0000}Bu slotta eviniz yok"
#define TXT_ChangedHouseName "{00FF00}Evinizin ismini deðiþtirdiniz"
#define TXT_PlayerBoughtVehicle "{00FF00}Bir {FFFF00}%s{00FF00} satýn aldýnýz. Fiyat: ${FFFF00}%i{00FF00}"
#define TXT_PlayerMustUseGetcarAndPark "{00FF00}Dýþarý çýkýn ve \"{FFFF00}/getcar{00FF00}\" yazarak aracý yanýnýza çekin, ve sonra \"{FFFF00}/park{00FF00}\" yazarak aracýnýzý evinizin yanýna park edin."
#define TXT_PlayerMustUsePark "{00FF00}Aracýnýzý yanýnýza çektiniz, þimdi \"{FFFF00}/park{00FF00}\" yazarak aracýnýzý evinizin yanýna park edin"
#define TXT_CannotAffordVehicle "{FF0000}Bu aracý alacak paranýz yok"
#define TXT_PlayerSoldHouse "{00FF00}Evinizi sattýnýz"
#define TXT_PlayerSoldVehicle "{00FF00}Aracýnýz olan {FFFF00}%s{00FF00}'ý ${FFFF00}%i{00FF00}'a sattýnýz."
#define TXT_NoVehicleInSlot "{FF0000}Bu slotta aracýnýz bulunmamakta"
#define TXT_DialogTitleBuyInsurance "Sigorta satýn almak istiyor musunuz?"
#define TXT_DialogBuyInsurance "Evinizdeki araçlarý $%i'a sigortalattýrmak istediðinize emin misiniz?"
#define TXT_HouseAlreadyHasInsurance "{FF0000}Bu evde zaten araçlarýnýzý sigortalattýrmýþsýnýz"
#define TXT_PlayerBoughtInsurance "{00FF00}Evinizdeki bütün araçlarý $%i'a sigortalattýrdýnýz"
#define TXT_CannotAffordInsurance "{FF0000}Araç sigortasý için yeterli paranýz yok"

// Business related
#define TXT_PickupBusinessOwned "%s\nSahip: %s\nÝþyeri Seviyesi: %i\n/gir"
#define TXT_PickupBusinessForSale "%s\nSatýlýk Ýþyeri\n$%i\nGelir: $%i\n/isyerial\n/gir"
#define TXT_DefaultBusinessName "%s'nýn Yeri"
#define TXT_PlayerBoughtBusiness "{33FF33}Bu iþyerini ${FFCC33}%i{33FF33}'a satýn aldýnýz"
#define TXT_PlayerOwnsMaxBusinesses "{FF0000}Oyuncu baþýna alýnabilecek en fazla iþyerine sahipsiniz"
#define TXT_NoBusinessInSlot "{FF0000}Bu slotta iþyeriniz yok"
#define TXT_DialogOldBusinessName "Eski iþyeri isminiz: %s"
#define TXT_DialogEnterNewBusinessName "Ýþyerinize yeni bir isim verin"
#define TXT_ChangedBusinessName "{00FF00}Ýþyerinizin ismini deðiþtirdiniz"
#define TXT_BusinessReachedMaxLevel "{FF0000}Ýþyeriniz son seviyeye ulaþtý, daha fazla geliþtiremezsiniz"
#define TXT_SureSellBusiness "Ýþyerinizi $%i' satmak istediðinize emin misiniz?"
#define TXT_PlayerSoldBusiness "{00FF00}Ýþyerinizi sattýnýz"

// ************************************************************************************************************************************************************
// PPC_ServerSettings
// ************************************************************************************************************************************************************

// Default max number of players is set to 500, re-define it to 50
#undef MAX_PLAYERS
#define MAX_PLAYERS 100

// Bank system
new bool:IntrestEnabled = true; // The intrest has been enabled (or disabled when false)
new Float:BankIntrest = 0.001; // The intrest a player receives every hour is by default 0.1% (0.001 means 0.1%)
								// Setting this to 1.0 would mean 100%, that would double the player's bank account every hour)

// Oyuncu 3D Text
new Text3D:Oyuncu3D[MAX_PLAYERS];
new Oyuncu3DTimer[MAX_PLAYERS];


// Set timer-delay for exiting houses (this timer freezes a player when he exits a house, this allows the game to load the environment
// before the player starts to fall, also the player's vehicles assigned to the house he exits from, are respawned by this timer)
new ExitHouseTimer = 1000;
new ExitBusinessTimer = 1000;

// This allows you to toggle the red houses on the map (bought houses appear on the map as red house icons when this is set to "true")
new bool:ShowBoughtHouses = true;

// Define maximum fuel amount (default: 5000) and maximum price for a complete refuel (default: 1000)
// Changing MaxFuel changes how fast a vehicle will run without fuel
//      (setting it to 2500 for example, let's vehicles run out of fuel twice as fast)
// RefuelMaxPrice is the price you pay for a total refuel (when the vehicle has no more fuel), the price to pay is calculated
//      by the amount of fuel to refuel (pay 50% of RefuelMaxPrice when vehicle has half a fuel-tank left)
new MaxFuel = 1250;
new RefuelMaxPrice = 1000;

// Define housing parameters
#define MAX_HOUSES					2000 // Defines the maximum number of houses that can be created
#define MAX_HOUSESPERPLAYER			20 // Defines the maximum number of houses that any player can own
#define HouseUpgradePercent         100 // Defines the percentage for upgrading a house (house of 10m can be upgraded for 5m when set to 50)
#define ParkRange                   150.0 // Defines the range for parking the vehicle around the house (default = 150m)
// Define business parameters
#define MAX_BUSINESS                1000 // Defines the maximum number of businesses that can be created
#define MAX_BUSINESSPERPLAYER		20 // Defines the maximum number of businesses that any player can own
// Defines for the toll-system
#define MAX_TOLLGATES				20
// Defines for spikestrips
#define MAX_SPIKESTRIPS             10 // Defines a maximum of 10 spikestrips
// Defines for the speedcameras
#define MAX_CAMERAS     			120

// Defines for police
new bool:PoliceGetsWeapons = true;
// These are the weapons that a police player will get when "PoliceGetsWeapons = true"
// 5 = Baseball Bat
// 24 = Desert Eagle
// 25 = Shotgun
// 28 = Micro SMG
// 30 = AK-47
// 34 = Sniper Rifle
// 38 = Minigun - 35 = Rocket Launcher
// 39 = Satchel Charge
// 41 = Spraycan
// 10 = Purple Dildo
// 46 = Parachute
// 40 = Detonator
new APoliceWeapons[4] = {2, 25, 22, 28};
new PoliceWeaponsAmmo = 5000;
// Jailing system variables
new DefaultJailTime = 120; // Set default jailtime to 2 minutes
new DefaultFinePerStar = 1000; // Set the fine for each wanted level (star)
new DefaultWarnTimeBeforeJail = 60; // Allow the wanted player 60 seconds to pull over (always set this value to multiples of 5: 5, 10, 15, 20, ...)
// Courier variables
new Float:CourierJobRange = 1000.0;
new PaymentPerPackage = 500;
// Unclamp price per vehicle
new UnclampPricePerVehicle = 20000;

// ************************************************************************************************************************************************************
// PPC_Defines
// ************************************************************************************************************************************************************

// Define path to player's account-files
#define PlayerFile "ServerData/Players/_%s.ini"
#define HouseFile "ServerData/Houses/House%i.ini"
#define CameraFile "ServerData/Cameras/Camera%i.ini"
#define BusinessFile "ServerData/Business/Business%i.ini"
#define BankFile "ServerData/Bank/_%s.ini"

// Define vehicles
#define VehicleFlatbed			455 // Truck: Flatbed
#define VehicleDFT30			578 // Truck: DFT-30
#define VehicleCementTruck		524 // Truck: Cementtruck
#define VehicleLineRunner		403 // Truck: LineRunner
#define VehicleTanker			514 // Truck: Tanker
#define VehicleRoadTrain		515 // Truck: RoadTrain
#define VehicleTrailerCargo		435 // Trailer: cargo
#define VehicleTrailerCargo2	591 // Trailer: cargo
#define VehicleTrailerOre		450 // Trailer: Ore
#define VehicleTrailerFluids	584 // Trailer: Fluids
#define VehicleCoach			437 // Bus
#define VehicleShamal           519 // Plane: Shamal
#define VehicleNevada           553 // Plane: Nevada
#define VehicleStuntPlane       513 // Plane: Stuntplane
#define VehicleDodo       		593 // Plane: Dodo
#define VehicleMaverick         487 // Helicopter: Maverick
#define VehicleCargobob         548 // Helicopter: Cargobob
#define VehiclePoliceLSPD       596 // Police Car Los Santos Police Department
#define VehiclePoliceSFPD       597 // Police Car San Fierro Police Department
#define VehiclePoliceLVPD       598 // Police Car Las Venturas Police Department
#define VehicleHPV1000          523 // Police motorcycle
#define VehiclePoliceRanger     599 // Police Ranger
#define VehicleSandKing			495 // Mafia-van: Sandking
#define VehicleMoonbeam         418 // Mafia-van: Moonbeam
#define VehicleBike             509 // Bike: Bike
#define VehicleBMX              481 // Bike: BMX
#define VehicleMountainBike     510 // Bike: Mountain Bike
#define VehicleFaggio           462 // Bike: Faggio
#define VehiclePizzaBoy         448 // Bike: Pizzaboy
#define VehicleBF400            581 // Bike: BF-400
#define VehicleNRG500           522 // Bike: NRG-500
#define VehiclePCJ600           461 // Bike: PCJ-600
#define VehicleFCR900           521 // Bike: FCR-900
#define VehicleFreeway          463 // Bike: Freeway
#define VehicleWayfarer         586 // Bike: Wayfarer
#define VehicleSanchez          468 // Bike: Sanchez
#define VehicleQuad             471 // Bike: Quad
#define VehicleCoastguard		472 // Boat: Coastguard
#define VehicleDinghy			473 // Boat: Dinghy
#define VehicleJetmax			493 // Boat: Jetmax
#define VehicleLaunch			595 // Boat: Launch
#define VehicleMarquis			484 // Boat: Marquis
#define VehiclePredator			430 // Boat: Predator
#define VehicleReefer			453 // Boat: Reefer
#define VehicleSpeeder			452 // Boat: Speeder
#define VehicleSquallo			446 // Boat: Squallo
#define VehicleTropic			454 // Boat: Tropic
#define VehicleRhino            432 // Tank: Rhino
#define VehiclePatriot          470 // Jeep: Patriot
#define VehicleTowTruck         525 // Towtruck
#define VehicleBurrito          482 // Van: Burrito
#define VehicleFaggio           462 // Bike: Faggio
#define VehicleBenson           499 // Truck: Benson
#define VehicleDozer            486 // Dozer
#define VehicleUtilityVan       552 // Utility Van
#define VehicleUtilityTrailer   611 // Utility trailer

// Define player-class AND vehicle statements to use for missions (PCV = PlayerClass and Vehicle)
#define PCV_TruckerOreTrailer			1
#define PCV_TruckerFluidsTrailer     	2
#define PCV_TruckerCargoTrailer      	3
#define PCV_TruckerCementTruck       	4
#define PCV_TruckerNoTrailer         	5
#define PCV_PilotPlane               	6
#define PCV_PilotHelicopter          	7
#define PCV_MafiaVan                 	8

// Define classes
#define ClassTruckDriver 1
#define ClassBusDriver 2
#define ClassPilot 3
#define ClassPolice 4
#define ClassMafia 5
#define ClassCourier 6
#define ClassAssistance 7
#define ClassRoadWorker 8

// Defines for all classes
#define Job_TimeToFailMission   	60

// Define class-colors
#define ColorClassTruckDriver		0xFF8000FF // Orange
#define ColorClassBusDriver			0x80FFFFFF // Light blue
#define ColorClassPilot             0x008080FF // Dark blue
#define ColorClassPolice			0x0000FFFF // Blue
#define ColorClassMafia				0x8000FFFF // Purple
#define ColorClassCourier           0xFF0080FF // Pink
#define ColorClassAssistance        0x80FF00FF // Dark green
#define ColorClassRoadWorker        0xFFFF80FF // Light yellow

// Define Dialogs
#define DialogRegister      		1
#define DialogLogin         		2
#define DialogStats                 3
#define DialogStatsOtherPlayer      4
#define DialogRules                 5
#define DialogReports               6
#define DialogStatsHouse          	7
#define DialogStatsGoHouse          8
#define DialogStatsGoBusiness       9

#define DialogRescue                11
#define DialogBuyLicenses           12

#define DialogTruckerJobMethod      21
#define DialogTruckerSelectLoad     22
#define DialogTruckerStartLoc       23
#define DialogTruckerEndLoc         24

#define DialogBusJobMethod          31
#define DialogBusSelectRoute        32

#define DialogCourierSelectQuant    41

#define DialogBike                  101
#define DialogCar                   102
#define DialogPlane                 103
#define DialogTrailer               104
#define DialogRentCarClass       	105
#define DialogRentCar	        	106
#define DialogBoat                  107
#define DialogNeon                  108

#define DialogWeather               201
#define DialogCarOption             202

#define DialogSelectConvoy          401
#define DialogConvoyMembers         402

#define DialogPlayerCommands        501
#define DialogPrimaryCarColor       502
#define DialogSedundaryCarColor     503
#define DialogPlayerCommands2       504

#define DialogHouseMenu             601
#define DialogUpgradeHouse          602
#define DialogGoHome                603
#define DialogHouseNameChange       604
#define DialogSellHouse             605
#define DialogBuyCarClass           606
#define DialogBuyCar                607
#define DialogSellCar               608
#define DialogBuyInsurance          609
#define DialogGetCarSelectHouse     610
#define DialogGetCarSelectCar       611
#define DialogUnclampVehicles       612

#define DialogCreateBusSelType      701
#define DialogBusinessMenu          702
#define DialogGoBusiness            703
#define DialogBusinessNameChange    704
#define DialogSellBusiness          705

#define DialogBankPasswordRegister  801
#define DialogBankPasswordLogin     802
#define DialogBankOptions           803
#define DialogBankDeposit           804
#define DialogBankWithdraw          805
#define DialogBankTransferMoney     806
#define DialogBankTransferName     	807
#define DialogBankCancel            808

#define DialogHelpItemChosen        901
#define DialogHelpItem              902

#define DialogOldPassword           1001
#define DialogNewPassword           1002
#define DialogConfirmPassword     	1003

#define DialogNoResponse            25000

// Define the maximum amount of convoys at the same time
#define MAX_CONVOYS					5
#define CONVOY_MAX_MEMBERS          25
#define CONVOY_EMPTY                0
#define CONVOY_OPEN                 1
#define CONVOY_FULL         	    2
#define CONVOY_CLOSED               3
// Define messagecolors
#define ColorRed 0xFF0000FF
#define ColorGreen 0x00FF00FF
#define ColorBlue 0x0000FFFF
// Define Virtual Worlds
#define WORLD_JAIL 10254
// Define options for admins
#define AutoKickAfterWarn           1 // Define if the player gets kicked after a certain amount of warnings
#define AutoKickWarnings            3 // Define the amount of warnings before a player is kicked automatically
// Define spectate modes
#define ADMIN_SPEC_TYPE_NONE 0
#define ADMIN_SPEC_TYPE_PLAYER 1
#define ADMIN_SPEC_TYPE_VEHICLE 2

// Create some global variables that are used to display large dialogs
new DialogMsg5000[5000];

// These variables are only used during the GameModeInit, they are used for debugging purposes
// A variable to hold the ID of every vehicle (used to record the last ID of a vehicle, for debugging)
new LastVehicleID;
// A variable to hold the ID of every object (used to record the last ID of an object, for debugging)
new LastObjectID;
// A variable to hold the total amount of houses that are loaded
new TotalHouses;
// A variable that holds the last speedcam-id
new TotalCameras;
// A variable that holds the total amount of businesses loaded
new TotalBusiness;

// Will hold the remaining time (in minutes) for a server-restart
new RestartTime;

// This variable holds the number of the last TimedMessage that was sent to all players
new LastTimedMessage;
// This array holds all timed messages that will be sent every few minutes
new ATimedMessages[][128] =
{
	{TXT_TimedRefuel},
	{TXT_TimedConvoy},
	{TXT_TimedGohome},
	{TXT_TimedRentCar},
	{TXT_TimedLicense},
	{TXT_TimedSpeedTraps},
	{TXT_TimedGoBusiness}
//	{"{808080}Message"}
//	{"{808080}Message"}
//	{"{808080}Message"}
//	{"{808080}Message"}
//	{"{808080}Message"}
//	{"{808080}Message"}
};

// Holds the data about the random bonus mission
enum TRandomBonusMission
{
	RandomLoad, // Holds the random LoadID
	RandomStartLoc, // Holds the random StartLocation ID
	RandomEndLoc, // Holds the random EndLocation ID
	bool:MissionFinished // Holds true if the bonus mission has been completed by someone, a new random mission will be chosen next
}
// Create one random bonus mission
new RandomBonusMission[TRandomBonusMission];

// Holds the admin-levelnames
new AdminLevelName[11][24] =
{
	{"Oyuncu"},
	{"Deneme Oyun Gorevlisi"},
	{"Deneme Oyun Gorevlisi"}, 
	{"Oyun Gorevlisi"},
	{"Oyun Gorevlisi"},
	{"Oyun Gorevlisi"},
	{"Yetkili Yonetici"},
	{"Yetkili Yonetici"},
	{"Yetkili Yonetici"},
	{"Vekil"},
	{"Proje Sahibi"}
};


// Anti Flood Sistemi
new SonMesajTick[MAX_PLAYERS];

new SonKomutTick[MAX_PLAYERS],
	YazilanKomut[MAX_PLAYERS];

new SonDurumTick[MAX_PLAYERS],
	DegisenDurum[MAX_PLAYERS];

new SonOlumTick[MAX_PLAYERS],
	OlumSayisi[MAX_PLAYERS];

new SonDialogTick[MAX_PLAYERS],
	DialogSayisi[MAX_PLAYERS];

new SonSpawnTick[MAX_PLAYERS],
	SpawnSayisi[MAX_PLAYERS];

// Animasyon Sistemi
new ALP[MAX_PLAYERS];
	
// Holds the reference to the pickup that can reward you with a trucker/busdriver license
new Pickup_License;

// Setup a custom type that holds the data of pickups
enum TPickupData
{
	Float:pux,
	Float:puy,
	Float:puz,
	PickupID
}
// Holds the data for pickups for refuelling (maximum 50 refuel-pickups)
new ARefuelPickups[50][TPickupData];
// Holds the data for pickups for 3 cardealers
new ACarDealerPickups[3][TPickupData];

// Setup a custom type that holds all data about toll-boots
enum TTollGate
{
	GateID, // Holds the object-id of the gate
	TollPrice, // Holds the price for passing the gate
	GateStatus, // Holds the status of the gate (open = 1, closed = 0)
	Float:OpenX, // Holds the coordinates when the gate is opened
	Float:OpenY, // Holds the coordinates when the gate is opened
	Float:OpenZ, // Holds the coordinates when the gate is opened
	Float:CloseX, // Holds the coordinates when the gate is closed
	Float:CloseY, // Holds the coordinates when the gate is closed
	Float:CloseZ // Holds the coordinates when the gate is closed
}
new ATollGates[MAX_TOLLGATES][TTollGate];

// Setup a custom type that holds all data about spikestrips
enum TSpikeStrip
{
	SpikeTime, // This holds the time left when the spikestrip automatically disappears
	SpikeTimer, // This holds the reference to the timer for spikestrips
	SpikeObject, // This holds the ObjectID of the spikestrip object
	Float:SpikeX, // This holds the X coordinates of the spikestrip
	Float:SpikeY, // This holds the Y coordinates of the spikestrip
	Float:SpikeZ // This holds the Z coordinates of the spikestrip
}
new ASpikeStrips[MAX_SPIKESTRIPS][TSpikeStrip];

// Setup a custom type that holds all data about a speedcamera
enum TSpeedCamera
{
	Float:CamX, // Holds the X-coordinate of the camera
	Float:CamY, // Holds the Y-coordinate of the camera
	Float:CamZ, // Holds the Z-coordinate of the camera
	Float:CamAngle, // Holds the Angle of the camera
	CamSpeed, // Holds the maximum speed allowed to pass this camera without being caught
	CamObj1, // Holds the reference to the first camera object
	CamObj2 // Holds the reference to the second camera object
}
new ACameras[MAX_CAMERAS][TSpeedCamera];

// Setup a custom type to hold all data about a convoy
enum TConvoyData
{
	Members[CONVOY_MAX_MEMBERS], // This array holds the playerid's of all members (at index 0, the leader is stored), so a convoy can hold 1 leader and 9 members
	LoadID, // Holds the ID of the load
	Location1, // Holds the location-id of the start-location
	Location2, // Holds the location-id of the end-location
	Status, // Holds the status of the convoy (1 = open, 2 = full, 3 = closed, 0 = empty)
	ConvoyStep, // Holds the jobstep for the entire convoy
	TrailerModel, // Holds the trailer-model required by the convoy
	bool:LeaderInformedTrailers, // Is used to inform the leader ONCE if all members failed to have the same trailer
	Text:ConvoyTextLeader, // This is the textdraw for the leader of the convoy
	Text:ConvoyTextMember, // This is the textdraw for all members of the convoy
	ConvoyTimer // This convoy-timer checks everything for the whole convoy
}
// Setup an array which holds all data for every convoy
new AConvoys[MAX_CONVOYS][TConvoyData];

// Setup a custom type to hold all data about a vehicle
enum TVehicleData
{
	bool:MafiaLoad, // Holds True if the vehicle (or trailer) is carrying a mafia-wanted load
	Fuel, // Holds the amount of fuel for this vehicle
	BelongsToHouse, // Holds the HouseID to which this vehicle belongs
	bool:StaticVehicle, // Holds true if this is a static vehicle
	bool:Owned, // Holds true if the vehicle is owned by somebody
	Owner[24], // Holds the name of the owned of the vehicle
	Model, // Holds the vehicle-model of this vehicle
	PaintJob, // Holds the ID of the paintjob applied to the vehicle
	Components[14], // Holds all Component-ID's for all components on the vehicle
	Color1, // Holds the primary color for this vehicle
	Color2, // Holds the secundairy color for this vehicle
	NeonLeft, // Holds the neon-object on the left side
	NeonRight, // Holds the neon-object on the right side
	NeonObjectModel, // Holds the object-model of the neons applied to the vehicle
	Float:SpawnX, // Holds the X-coordinate of the parking spot for this vehicle
	Float:SpawnY, // Holds the Y-coordinate of the parking spot for this vehicle
	Float:SpawnZ, // Holds the Z-coordinate of the parking spot for this vehicle
	Float:SpawnRot, // Holds the rotation of the parking spot for this vehicle
	Text3D:VehicleText, // holds a reference to the 3D text label on an owned vehicle
	bool:Clamped // Holds "true" if the vehicle is clamped by an admin
}
// Setup an array which holds all data for every vehicleid, max 2000 vehicles (server limit)
new AVehicleData[2000][TVehicleData];

// Setup a custom type that holds all data for businesses
enum TBusinessData
{
	PickupID, // Holds the pickup-id that is linked to this business
	Text3D:DoorText, // Holds the reference to the 3DText above the business's pickup
	MapIconID, // Holds the ID of the mapicon for the business

	BusinessName[100], // Holds the name of the business (this will be displayed above the pickup near the business when it's owned)
	Float:BusinessX, // Holds the X-coordinate of the pickup for the Business
	Float:BusinessY, // Holds the Y-coordinate of the pickup for the Business
	Float:BusinessZ, // Holds the Z-coordinate of the pickup for the Business
	BusinessType, // Holds the type of business (well stacked pizza, burger shot, ...), this defines which icon and interior to use
	BusinessLevel, // Holds the level of upgrades the business has
	LastTransaction, // Holds the amount of minutes when the last transaction took place (buying the business or retrieving the money by the owner)
    AutoEvictDays, // Holds the amount of days where the player last logged in
	bool:Owned, // Holds true if the Business is owned by somebody
	Owner[24] // Holds the name of the owner of the Business
}
// Holds the data for all houses
new ABusinessData[MAX_BUSINESS][TBusinessData];
// This variable holds the business-time (this value is increased every hour and is used to calculate the amount of money a business
// has generated after the last transaction of the business)
new BusinessTransactionTime;

// Setup a custom type that holds all data for houses
enum THouseData
{
	PickupID, // Holds the pickup-id that is linked to this house
	Text3D:DoorText, // Holds the reference to the 3DText above the house's pickup
	MapIconID, // Holds the ID of the mapicon for the house

	HouseName[100], // Holds the name of the house (this will be displayed above the pickup near the house when it's owned)
	Insurance, // Holds "1" if the house has an insurance for the vehicles belonging to this house
	Float:HouseX, // Holds the X-coordinate of the pickup for the house
	Float:HouseY, // Holds the Y-coordinate of the pickup for the house
	Float:HouseZ, // Holds the Z-coordinate of the pickup for the house
	HouseLevel, // Holds the level of upgrades the house has (also defines how many vehicles can currently be added to the house)
	HouseMaxLevel, // Holds the maximum level this house can be upgraded to
	HousePrice, // Holds the price for buying the house, the same price applies when upgrading a house per level
    AutoEvictDays, // Holds the amount of days where the player last logged in
	bool:Owned, // Holds true if the house is owned by somebody
	Owner[24], // Holds the name of the owner of the house
	bool:HouseOpened, // Holds true if the house is open to the public (anyone can enter), false means: only the owner can enter it
	VehicleIDs[10] // Holds the vehicle-id's of the vehicles linked to this house
}
// Holds the data for all houses
new AHouseData[MAX_HOUSES][THouseData];

// Setup a custom type that holds all data about a house-interior (selected when entering a house, based on the house-level)
enum THouseInterior
{
	InteriorName[50], // Holds the name of the interior
	InteriorID, // Holds the interior-id
	Float:IntX, // Holds the X-coordinate of the spawn-location where you enter the house
	Float:IntY, // Holds the Y-coordinate of the spawn-location where you enter the house
	Float:IntZ // Holds the Z-coordinate of the spawn-location where you enter the house
}
// Holds the data for all interiors for houses
new AHouseInteriors[][THouseInterior] =
{
	{"Dummy", 				0, 		0.0, 		0.0, 		0.0}, // Dummy interior (Level 0), as the house-level starts at 1
	{"Kucuk otel odasi", 	10, 	2262.83, 	-1137.71, 	1050.63}, // Level 1
	{"Kucuk ev", 		2, 		2467.36, 	-1698.38, 	1013.51}, // Level 2
	{"Kucuk ev 2", 		1, 		223.00, 	1289.26, 	1082.20}, // Level 3
	{"Orta ev", 		10, 	2260.76, 	-1210.45, 	1049.02}, // Level 4
	{"Orta ev 2",		8, 		2365.42, 	-1131.85, 	1050.88}, // Level 5
	{"Dublex ev",		12, 	2324.33, 	-1144.79, 	1050.71}, // Level 6
	{"Buyuk ev", 			15, 	295.14, 	1474.47, 	1080.52}, // Level 7
	{"Buyuk dublex ev", 	3, 		235.50, 	1189.17, 	1080.34}, // Level 8
	{"Genis ev", 			7, 		225.63, 	1022.48, 	1084.07}, // Level 9
	{"Malikane", 			5, 		1299.14, 	-794.77, 	1084.00} // Level 10
};

// Setup a custom type that holds all data about a business
enum TBusinessType
{
	InteriorName[50], // Holds the name of the interior
	InteriorID, // Holds the interior-id
	Float:IntX, // Holds the X-coordinate of the spawn-location where you enter the business
	Float:IntY, // Holds the Y-coordinate of the spawn-location where you enter the business
	Float:IntZ, // Holds the Z-coordinate of the spawn-location where you enter the business
	BusPrice, // Holds the price for the business
	BusEarnings, // Holds the earnings for this type of business
	IconID // Holds the icon-id which represents the business
}
// Holds the data for all interiors for businesses
new ABusinessInteriors[][TBusinessType] =
{
	{"Dummy", 				0, 		0.0, 		0.0, 		0.0,		0,			0,		0}, // Dummy business (Type 0)
	{"24/7 (Kucuk)", 		6, 		-26.75, 	-55.75, 	1003.6,		500000,		50,		52}, // Type 1 (earnings per day: $1200)
	{"24/7 (Orta)", 		18, 	-31.0, 		-89.5, 		1003.6,		750000,		75,		52}, // Type 2 (earnings per day: $1800)
	{"Bar", 				11, 	502.25, 	-69.75, 	998.8,		350000,		35,		49}, // Type 3 (earnings per day: $840)
	{"Berber (Kucuk)", 		2, 		411.5, 		-21.25, 	1001.8,		300000,		30,		7}, // Type 4 (earnings per day: $720)
	{"Berber (Orta)",		3, 		418.75, 	-82.5, 		1001.8,		350000,		35,		7}, // Type 5 (earnings per day: $840)
	{"At Yarisi Dukkani", 		3, 		833.25, 	7.0, 		1004.2,		1500000,	150,	52}, // Type 6 (earnings per day: $3600)
	{"Burger Shot", 		10, 	363.5, 		-74.5, 		1001.5,		750000,		75,		10}, // Type 7 (earnings per day: $1800)
	{"Gazino (4 Dragons)", 	10, 	2017.25, 	1017.75, 	996.9,		2500000,	250,	44}, // Type 8 (earnings per day: $6000)
	{"Gazino (Caligula's)", 1, 		2234.0, 	1710.75, 	1011.3,		2500000,	250,	25}, // Type 9 (earnings per day: $6000)
	{"Gazino (Kucuk)", 		12, 	1133.0, 	-9.5,	 	1000.7,		2000000,	200,	43}, // Type 10 (earnings per day: $4800)
	{"Kiyafet Magazasi (Binco)", 	15, 	207.75, 	-109.0, 	1005.2,		850000,		85,		45}, // Type 11 (earnings per day: $2040)
	{"Kiyafet Magazasi (Pro)", 		3, 		207.0, 		-138.75, 	1003.5,		850000,		85,		45}, // Type 12 (earnings per day: $2040)
	{"Kiyafet Magazasi (Urban)", 	1, 		203.75, 	-48.5, 		1001.8,		850000,		85,		45}, // Type 13 (earnings per day: $2040)
	{"Kiyafet Magazasi (Victim)", 	5, 		226.25, 	-7.5, 		1002.3,		850000,		85,		45}, // Type 14 (earnings per day: $2040)
	{"Kiyafet Magazasi (ZIP)",		18, 	161.5, 		-92.25, 	1001.8,		850000,		85,		45}, // Type 15 (earnings per day: $2040)
	{"Cluckin' Bell",		9,		365.75, 	-10.75,  	1001.9,		750000,		75,		14}, // Type 16 (earnings per day: $1800)
	{"Disko (Kucuk)", 		17, 	492.75,		-22.0, 		1000.7,		1000000,	100,	48}, // Type 17 (earnings per day: $2400)
	{"Disko (Buyuk)", 		3, 		-2642.0, 	1406.5, 	906.5,		1200000,	120,	48}, // Type 18 (earnings per day: $2880)
	{"Gym (LS)", 			5, 		772.0, 		-3.0, 		1000.8,		500000,		50,		54}, // Type 19 (earnings per day: $1200)
	{"Gym (SF)", 			6, 		774.25, 	-49.0, 		1000.6,		500000,		50,		54}, // Type 20 (earnings per day: $1200)
	{"Gym (LV)", 			7, 		774.25, 	-74.0, 		1000.7,		500000,		50,		54}, // Type 21 (earnings per day: $1200)
	{"Motel", 				15, 	2216.25, 	-1150.5, 	1025.8,		1000000,	100,	37}, // Type 22 (earnings per day: $2400)
	{"RC Dukkani", 			6, 		-2238.75, 	131.0, 		1035.5,		600000,		60,		46}, // Type 23 (earnings per day: $1440)
	{"Sex-shop", 			3, 		-100.25, 	-22.75, 	1000.8,		800000,		80,		38}, // Type 24 (earnings per day: $1920)
	{"Mezbaha", 		1, 		933.75, 	2151.0, 	1011.1,		500000,		50,		50}, // Type 25 (earnings per day: $1200)
	{"Stadyum (Bloodbowl)", 15, 	-1394.25, 	987.5, 		1024.0,		1750000,	175,	33}, // Type 26 (earnings per day: $4200)
	{"Stadyum (Kickstart)", 14, 	-1410.75, 	1591.25, 	1052.6,		1750000,	175,	33}, // Type 27 (earnings per day: $4200)
	{"Stadyum (8-Track)", 	7, 		-1396.0, 	-208.25, 	1051.2,		1750000,	175,	33}, // Type 28 (earnings per day: $4200)
	{"Stadyum (Dirt Bike)", 4, 		-1425.0, 	-664.5, 	1059.9,		1750000,	175,	33}, // Type 29 (earnings per day: $4200)
	{"Striptiz Kulubu (Kucuk)", 	3, 		1212.75, 	-30.0, 		1001.0,		750000,		75,		48}, // Type 30 (earnings per day: $1800)
	{"Striptiz Kulubu (Buyuk)", 	2, 		1204.75, 	-12.5, 		1001.0,		900000,		90,		48}, // Type 31 (earnings per day: $2160)
	{"LS Dovmeci", 			16, 	-203.0, 	-24.25, 	1002.3,		500000,		50,		39}, // Type 32 (earnings per day: $1200)
	{"Well Stacked Pizza", 	5,	 	372.25, 	-131.50, 	1001.5,		650000,		65,		29} // Type 33 (earnings per day: $1560)
};

// This holds all data about a report
enum TReport
{
	bool:ReportUsed, // Holds true if this report-spot has been used
	ReportName[24], // Holds the name of the offender
	ReportReason[128] // Holds the reason why he's been reported
}
// This array holds all data about the recent 50 reports that have been reported
new AReports[50][TReport];
new ReportList[5000]; // Setup an array to holds the reports for the report-dialog

// Setup all the fields required for the player data (Speedometer TextDraw, current job, ...)
enum TPlayerData
{
	PlayerPassword[50], // Holds the password of the player's account
	PlayerNewPassword[50], // Holds the new password for the player
	PlayerLevel, // The admin-level of the player
	PlayerJailed, // Holds jail-time left for this player
	PlayerJailedTimer, // Holds the reference to the jail-timer
	PlayerFrozen, // Holds the time this player is frozen
	PlayerFrozenTimer, // Holds the reference to the frozen-timer
	Warnings, // Holds the number of warnings for this player
	Bans, // Holds the number of bans for this player
	BanTime, // Holds the time where the player is unbanned automatically (when the ban is over)
	bool:LoggedIn, // Holds true if the player has properly logged in
	bool:Muted, // Holds "true" if the player is muted
	bool:RulesRead, // Holds "true" if the player accepted the rules
	AutoReportTime, // Used to prevent the anti-hack system reporting the player every half a second when the player uses hacks

	TruckerLicense, // Holds "1" if the player has acquired his truckers-license
	BusLicense, // Holds "1" if the player has acquired his busdriver license
	PlayerMoney, // Holds the money of this player
	PlayerScore, // Holds the score of this player
	PlayerName[24], // Holds the name of the player

	Houses[MAX_HOUSESPERPLAYER], // Holds the HouseID's of the houses that the player owns (index of the AHouseData array)
    CurrentHouse, // Holds the HouseID to track in which house the player currently is (used when accessing the housemenu)
	Business[MAX_BUSINESSPERPLAYER], // Holds the BusinessID's of the business that the player owns
	CurrentBusiness, // Holds the BusinessID to track in which business the player currently is (used when accessing the businessmenu)

	PlayerClass, //Holds the Class that the player chose (1 = truckdriver, 2 = taxidriver, ... -> see DEFINES)

	SpectateID, // Holds the ID of the other player which this player is spectating
	SpectateVehicle, // If the target player is inside a vehicle, store it here
	SpectateType, // Holds the type of spectating (none, player or vehicle)

	Float:PreviousX, // Holds the previous X location of the player (used to detect airbreak hacks)
	Float:PreviousY, // Holds the previous Y location of the player (used to detect airbreak hacks)
	Float:PreviousZ, // Holds the previous Z location of the player (used to detect airbreak hacks)
	PreviousInt, // Holds the previous interior id (used to detect airbreak hacks)

	StatsTruckerJobs, // Holds the number of succesfully completed trucker-missions
	StatsConvoyJobs, // Holds the number of completed trucking-routes when in a convoy
	StatsBusDriverJobs, // Holds the number of completed busroutes
	StatsPilotJobs, // Holds the number of completed pilot-missions
	StatsMafiaJobs, // Holds the number of completed mafia-missions
	StatsMafiaStolen, // Holds the number of succesfully deliveries of stolen mafialoads
	StatsPoliceFined, // Holds the number of fined players for police
	StatsPoliceJailed, // Holds the number of jailed players for police
	StatsCourierJobs, // Holds the number of completed courier-jobs
	StatsAssistance, // Holds the number of player-vehicles that this player has repaired/refuelled
	StatsRoadworkerJobs, // Holds the number of completed roadworker jobs
	Float:StatsMetersDriven, // Holds the total kilometers that the player has driven already

	Text:SpeedometerText, // The TextDraw of the speedometer for this player
	Text:FuelGauge, // The textdraw of the fuel-gauge for this player
	SpeedometerTimer, // Holds the reference to the speedometer timer for this player
	SpeedometerBTimer,
	PlayerSpeed, // Holds the speed of the player
	PlayerCaughtSpeeding, // This holds a value to prevent being caught multiple times by the same speedcamera

	Timer_PoliceCanJailMe, // This holds a reference to the timer which is started when the player got warned by a police player
	Value_PoliceCanJailMe, // This holds the remaining time for the Timer_PoliceCanJailPlayer timer
	bool:PoliceCanJailMe, // This holds "true" when the player was warned by a police player but didn't stop before the timer ran out
	bool:PoliceWarnedMe, // This holds "true" is the player got caught by a police player and got at least one warning

	bool:AssistanceNeeded, // Holds "true" is the player called for assistance

	bool:JobStarted, // States that the player has started a job or not
	Text:MissionText, // Displays the mission info at the bottom of the screen
	JobID, // Mission ID of the job (in the appropriate array, based on the PlayerClass), not used by truckers
	JobStep, // Current step of the job (for trucker: 1 = going to load, 2 = delivering goods to destination)
	Passengers, // Holds the number of passengers (used for busdriver, taxi classes)
	PlayerCheckTimer, // A special timer used by certain classes (police, mafia) to check players every second if they're wanted/carrying mafialoads
	LoadingTimer, // The timer used for loading and unloading during jobs
	VehicleTimerTime, // Holds the remaining seconds for the global vehicletimer
	VehicleID, // Holds the ID of the vehicle that the player is driving during his job
	TrailerID, // Holds the ID of the trailer that the player has attached during his job (is 0 if no trailer attached)
	LoadID, // Holds the ID of the load
	JobLoc1, // Holds the LocationID where to pickup the load (used in trucking missions)
	JobLoc2, // Holds the LocationID where to deliver the load (used in trucking missions)
	bool:Overloaded, // Holds True if the player's vehicle is overloaded (wanted level increases by 2)
	bool:MafiaLoad, // Holds True is the player's load is wanted by the mafia
	bool:MafiaLoadHijacked, // Holds true if the mafia-player has hijacked a mafia-load
	bool:InConvoy, // Holds true if the player has joined a convoy already
	ConvoyID, // Holds the ID of the convoy where this player is a member
	CourierHouses[11], // This holds up to 10 HouseID's for use during Courier-missions
	CourierMaxStep, // This holds the max number of houses to deliver packages to

	DialogFirstItem, // Holds the first array-index where a split dialog must start
	DialogCarFirstCar, // Holds the first array-index where the carlist should start when the player asks to choose a car to spawn ("/car")
	DialogPlaneFirstPlane, // Holds the first array-index where the planelist should start when the player asks to choose a plane to spawn ("/plane")
	DialogTrailerFirstTrailer, // Holds the first array-index where the trailerlist should start when the player asks to choose a trailer to spawn ("/trailer")

	DialogRentVClass, // Holds the ID of the chosen vehicle class to process when renting a vehicle
	DialogRentCarIndex, // Holds the index in the ABuyableVehicles array which vehicle the player chose to rent
	DialogBuyVClass, // Holds the ID of the chose vehicle class to process when buying a vehicle
	DialogBuyCarIndex, // Holds the index in the ABuyableVehicles array which vehicle the player chose to buy

	DialogGetCarHouseID, // Holds the HouseID from which to get a vehicle when using /getcar

	DialogOtherPlayer, // Holds the id of the other player when viewing that other player's stats
	DialogOtherPlayerHouse, // Holds the HouseID of the other player when viewing the stats for that house

	BankPassword[24], // Bank-system: Used to hold the password to your bank-account
	bool:BankLoggedIn, // Bank-system: Used to determine if you have logged in to your bank account
	BankMoney, // Bank-system: Used to hold the money in your bank-account
	UseMoney, // Bank-system: Used to hold the money you're be transferring to another player's account
	LastIntrestTime, // Bank-system: Used to hold the last time where your bank account has received intrest

	RentedVehicleID, // Holds the vehicle-id of the rented vehicle (if any)
	
	Root, // ROOT Sistemi
	
	YakitTasarrufu,
	AsiriYuklemeBonusu,
	
	BoomBox,
	
	VIP
}

// Create an array to hold the playerdata for every player
new APlayerData[MAX_PLAYERS][TPlayerData];
// This variable holds the intrest-time (this value is increased every hour
// and is used to calculate the intrest you receive on your bank account
new CurrentIntrestTime;

// Setup all the fields for a spawnlocation
enum TSpawnLocation
{
	Float:SpawnX,
	Float:SpawnY,
	Float:SpawnZ,
	Float:SpawnAngle
}
// Setup spawnlocations for each class (when selecting "Spawn" at class-selection, a random spawnlocation is selected)
new ASpawnLocationsTrucker[][TSpawnLocation] =
{
	{-525.0, -502.0, 26.0, 0.0}, // Fallen Tree Depot
	{-74.7, -1137.5, 4.5, 0.0}, // Flint Trucking Depot
	{1457.0, 975.5, 11.0, 0.0}, // LVA Freight Depot
	{-2136.0, -247.5, 36.5, 270.0}, // Doherty Depot
	{1766.5, -2040.7, 14.0, 270.0}, // El Corona Depot
	{-546.0, 2594.0, 54.0, 270.0}, // Las Payasdas Depot
	{332.0, 900.0, 25.0, 205.0}, // Quarry Top
	{-1575.0, -2724.0, 49.0, 146.0} // Shady Creek Depot
};
new ASpawnLocationsBusDriver[][TSpawnLocation] =
{
	{1809.0, -1905.0, 13.6, 90.0}, // Los Santos busdepot
	{-1983.0, 110.0, 27.7, 180.0}, // San Fierro busdepot
	{1060.0, 1260.0, 11.0, 270.0} // Las Venturas busdepot
};
new ASpawnLocationsPilot[][TSpawnLocation] =
{
	{2010.0, -2345.0, 13.6, 90.0}, // Los Santos airport
	{-1211.0, -105.0, 14.2, 135.0}, // San Fierro airport
	{1630.0, 1615.0, 10.9, 90.0} // Las Venturas airport
};
new ASpawnLocationsPolice[][TSpawnLocation] =
{
	{1568.5, -1693.5, 6.0, 180.0}, // Los Santos police station
	{-1590.0, 716.25, -5.0, 270.0}, // San Fierro police station
	{2275.0, 2460.0, 10.9, 90.0} // Las Venturas police station
};
new ASpawnLocationsMafia[][TSpawnLocation] =
{
	{2822.5, 898.5, 10.8, 0.0} // Mafia hideout
};

new ASpawnLocationsAssistance[][TSpawnLocation] =
{
	{211.25, 24.75, 2.6, 270.0}
};
new ASpawnLocationsRoadWorker[][TSpawnLocation] =
{
	{-1866.25, -1715.25, 22.7, 125.0} // Junkyard
};

// Setup an array that holds all prices for vehicle-components
new AVehicleModPrices[] =
{
	400, // ID 1000, Spoiler Pro								Certain Transfender cars
	550, // ID 1001, Spoiler Win								Certain Transfender cars
	200, // ID 1002, Spoiler Drag								Certain Transfender cars
	250, // ID 1003, Spoiler Alpha								Certain Transfender cars
	100, // ID 1004, Hood Champ Scoop							Certain Transfender cars
	150, // ID 1005, Hood Fury Scoop							Certain Transfender cars
	80, // ID 1006, Roof Roof Scoop								Certain Transfender cars
	500, // ID 1007, Sideskirt Right Sideskirt					Certain Transfender cars
	500, // ID 1008, Nitro 5 times								Most cars, Most planes and Most Helicopters
	200, // ID 1009, Nitro 2 times								Most cars, Most planes and Most Helicopters
	1000, // ID 1010, Nitro 10 times                 			Most cars, Most planes and Most Helicopters
	220, // ID 1011, Hood Race Scoop                			Certain Transfender cars
	250, // ID 1012, Hood Worx Scoop                			Certain Transfender cars
	100, // ID 1013, Lamps Round Fog                			Certain Transfender cars
	400, // ID 1014, Spoiler Champ                  			Certain Transfender cars
	500, // ID 1015, Spoiler Race                   			Certain Transfender cars
	200, // ID 1016, Spoiler Worx                   			Certain Transfender cars
	500, // ID 1017, Sideskirt Left Sideskirt       			Certain Transfender cars
	350, // ID 1018, Exhaust Upswept                			Most cars
	300, // ID 1019, Exhaust Twin                   			Most cars
	250, // ID 1020, Exhaust Large                  			Most cars
	200, // ID 1021, Exhaust Medium								Most cars
	150, // ID 1022, Exhaust Small								Most cars
	350, // ID 1023, Spoiler Fury                   			Certain Transfender cars
	50, // ID 1024, Lamps Square Fog							Certain Transfender cars
	1000, // ID 1025, Wheels Offroad							Certain Transfender cars
	480, // ID 1026, Sideskirt Right Alien Sideskirt			Sultan
	480, // ID 1027, Sideskirt Left Alien Sideskirt				Sultan
	770, // ID 1028, Exhaust Alien                      		Sultan
	680, // ID 1029, Exhaust X-Flow								Sultan
	370, // ID 1030, Sideskirt Left X-Flow Sideskirt    		Sultan
	370, // ID 1031, Sideskirt Right X-Flow Sideskirt   		Sultan
	170, // ID 1032, Roof Alien Roof Vent						Sultan
	120, // ID 1033, Roof X-Flow Roof Vent              		Sultan
	790, // ID 1034, Exhaust Alien								Elegy
	150, // ID 1035, Roof X-Flow Roof Vent						Elegy
	500, // ID 1036, SideSkirt Right Alien Sideskirt    		Elegy
	690, // ID 1037, Exhaust X-Flow								Elegy
	190, // ID 1038, Roof Alien Roof Vent						Elegy
	390, // ID 1039, SideSkirt Right X-Flow Sideskirt   		Elegy
	500, // ID 1040, SideSkirt Left Alien Sideskirt				Elegy
	390, // ID 1041, SideSkirt Right X-Flow Sideskirt   		Elegy
	1000, // ID 1042, SideSkirt Right Chrome Sideskirt			Broadway
	500, // ID 1043, Exhaust Slamin                     		Broadway
	500, // ID 1044, Exhaust Chrome								Broadway
	510, // ID 1045, Exhaust X-Flow								Flash
	710, // ID 1046, Exhaust Alien								Flash
	670, // ID 1047, SideSkirt Right Alien Sideskirt    		Flash
	530, // ID 1048, SideSkirt Right X-Flow Sideskirt			Flash
	810, // ID 1049, Spoiler Alien								Flash
	620, // ID 1050, Spoiler X-Flow                     		Flash
	670, // ID 1051, SideSkirt Left Alien Sideskirt     		Flash
	530, // ID 1052, SideSkirt Left X-Flow Sideskirt			Flash
	130, // ID 1053, Roof X-Flow								Flash
	210, // ID 1054, Roof Alien									Flash
	230, // ID 1055, Roof Alien									Stratum
	520, // ID 1056, Sideskirt Right Alien Sideskirt			Stratum
	430, // ID 1057, Sideskirt Right X-Flow Sideskirt			Stratum
	620, // ID 1058, Spoiler Alien								Stratum
	720, // ID 1059, Exhaust X-Flow								Stratum
	530, // ID 1060, Spoiler X-Flow								Stratum
	180, // ID 1061, Roof X-Flow								Stratum
	520, // ID 1062, Sideskirt Left Alien Sideskirt				Stratum
	430, // ID 1063, Sideskirt Left X-Flow Sideskirt			Stratum
	830, // ID 1064, Exhaust Alien								Stratum
	850, // ID 1065, Exhaust Alien								Jester
	750, // ID 1066, Exhaust X-Flow								Jester
	250, // ID 1067, Roof Alien									Jester
	200, // ID 1068, Roof X-Flow								Jester
	550, // ID 1069, Sideskirt Right Alien Sideskirt			Jester
	450, // ID 1070, Sideskirt Right X-Flow Sideskirt			Jester
	550, // ID 1071, Sideskirt Left Alien Sideskirt				Jester
	450, // ID 1072, Sideskirt Left X-Flow Sideskirt			Jester
	1100, // ID 1073, Wheels Shadow								Most cars
	1030, // ID 1074, Wheels Mega								Most cars
	980, // ID 1075, Wheels Rimshine							Most cars
	1560, // ID 1076, Wheels Wires								Most cars
	1620, // ID 1077, Wheels Classic							Most cars
	1200, // ID 1078, Wheels Twist								Most cars
	1030, // ID 1079, Wheels Cutter								Most cars
	900, // ID 1080, Wheels Switch								Most cars
	1230, // ID 1081, Wheels Grove								Most cars
	820, // ID 1082, Wheels Import								Most cars
	1560, // ID 1083, Wheels Dollar								Most cars
	1350, // ID 1084, Wheels Trance								Most cars
	770, // ID 1085, Wheels Atomic								Most cars
	100, // ID 1086, Stereo Stereo								Most cars
	1500, // ID 1087, Hydraulics Hydraulics						Most cars
	150, // ID 1088, Roof Alien									Uranus
	650, // ID 1089, Exhaust X-Flow								Uranus
	450, // ID 1090, Sideskirt Right Alien Sideskirt			Uranus
	100, // ID 1091, Roof X-Flow								Uranus
	750, // ID 1092, Exhaust Alien								Uranus
	350, // ID 1093, Sideskirt Right X-Flow Sideskirt			Uranus
	450, // ID 1094, Sideskirt Left Alien Sideskirt				Uranus
	350, // ID 1095, Sideskirt Right X-Flow Sideskirt			Uranus
	1000, // ID 1096, Wheels Ahab								Most cars
	620, // ID 1097, Wheels Virtual								Most cars
	1140, // ID 1098, Wheels Access								Most cars
	1000, // ID 1099, Sideskirt Left Chrome Sideskirt			Broadway
	940, // ID 1100, Bullbar Chrome Grill						Remington
	780, // ID 1101, Sideskirt Left `Chrome Flames` Sideskirt	Remington
	830, // ID 1102, Sideskirt Left `Chrome Strip` Sideskirt	Savanna
	3250, // ID 1103, Roof Convertible							Blade
	1610, // ID 1104, Exhaust Chrome							Blade
	1540, // ID 1105, Exhaust Slamin							Blade
	780, // ID 1106, Sideskirt Right `Chrome Arches`			Remington
	780, // ID 1107, Sideskirt Left `Chrome Strip` Sideskirt	Blade
	780, // ID 1108, Sideskirt Right `Chrome Strip` Sideskirt	Blade
	1610, // ID 1109, Rear Bullbars Chrome						Slamvan
	1540, // ID 1110, Rear Bullbars Slamin						Slamvan
	55, // ID 1111, Front Sign? Little Sign?					Slamvan         ???
	55, // ID 1112, Front Sign? Little Sign?					Slamvan         ???
	3340, // ID 1113, Exhaust Chrome							Slamvan
	3250, // ID 1114, Exhaust Slamin							Slamvan
	2130, // ID 1115, Front Bullbars Chrome						Slamvan
	2050, // ID 1116, Front Bullbars Slamin						Slamvan
	2040, // ID 1117, Front Bumper Chrome						Slamvan
	780, // ID 1118, Sideskirt Right `Chrome Trim` Sideskirt	Slamvan
	940, // ID 1119, Sideskirt Right `Wheelcovers` Sideskirt	Slamvan
	780, // ID 1120, Sideskirt Left `Chrome Trim` Sideskirt		Slamvan
	940, // ID 1121, Sideskirt Left `Wheelcovers` Sideskirt		Slamvan
	780, // ID 1122, Sideskirt Right `Chrome Flames` Sideskirt	Remington
	860, // ID 1123, Bullbars Bullbar Chrome Bars				Remington
	780, // ID 1124, Sideskirt Left `Chrome Arches` Sideskirt	Remington
	1120, // ID 1125, Bullbars Bullbar Chrome Lights			Remington
	3340, // ID 1126, Exhaust Chrome Exhaust					Remington
	3250, // ID 1127, Exhaust Slamin Exhaust					Remington
	3340, // ID 1128, Roof Vinyl Hardtop						Blade
	1650, // ID 1129, Exhaust Chrome							Savanna
	3380, // ID 1130, Roof Hardtop								Savanna
	3290, // ID 1131, Roof Softtop								Savanna
	1590, // ID 1132, Exhaust Slamin							Savanna
	830, // ID 1133, Sideskirt Right `Chrome Strip` Sideskirt	Savanna
	800, // ID 1134, SideSkirt Right `Chrome Strip` Sideskirt	Tornado
	1500, // ID 1135, Exhaust Slamin							Tornado
	1000, // ID 1136, Exhaust Chrome							Tornado
	800, // ID 1137, Sideskirt Left `Chrome Strip` Sideskirt	Tornado
	580, // ID 1138, Spoiler Alien								Sultan
	470, // ID 1139, Spoiler X-Flow								Sultan
	870, // ID 1140, Rear Bumper X-Flow							Sultan
	980, // ID 1141, Rear Bumper Alien							Sultan
	150, // ID 1142, Vents Left Oval Vents						Certain Transfender Cars
	150, // ID 1143, Vents Right Oval Vents						Certain Transfender Cars
	100, // ID 1144, Vents Left Square Vents					Certain Transfender Cars
	100, // ID 1145, Vents Right Square Vents					Certain Transfender Cars
	490, // ID 1146, Spoiler X-Flow								Elegy
	600, // ID 1147, Spoiler Alien								Elegy
	890, // ID 1148, Rear Bumper X-Flow							Elegy
	1000, // ID 1149, Rear Bumper Alien							Elegy
	1090, // ID 1150, Rear Bumper Alien							Flash
	840, // ID 1151, Rear Bumper X-Flow							Flash
	910, // ID 1152, Front Bumper X-Flow						Flash
	1200, // ID 1153, Front Bumper Alien						Flash
	1030, // ID 1154, Rear Bumper Alien							Stratum
	1030, // ID 1155, Front Bumper Alien						Stratum
	920, // ID 1156, Rear Bumper X-Flow							Stratum
	930, // ID 1157, Front Bumper X-Flow						Stratum
	550, // ID 1158, Spoiler X-Flow								Jester
	1050, // ID 1159, Rear Bumper Alien							Jester
	1050, // ID 1160, Front Bumper Alien						Jester
	950, // ID 1161, Rear Bumper X-Flow							Jester
	650, // ID 1162, Spoiler Alien								Jester
	450, // ID 1163, Spoiler X-Flow								Uranus
	550, // ID 1164, Spoiler Alien								Uranus
	850, // ID 1165, Front Bumper X-Flow						Uranus
	950, // ID 1166, Front Bumper Alien							Uranus
	850, // ID 1167, Rear Bumper X-Flow							Uranus
	950, // ID 1168, Rear Bumper Alien							Uranus
	970, // ID 1169, Front Bumper Alien							Sultan
	880, // ID 1170, Front Bumper X-Flow						Sultan
	990, // ID 1171, Front Bumper Alien							Elegy
	900, // ID 1172, Front Bumper X-Flow						Elegy
	950, // ID 1173, Front Bumper X-Flow						Jester
	1000, // ID 1174, Front Bumper Chrome						Broadway
	900, // ID 1175, Front Bumper Slamin						Broadway
	1000, // ID 1176, Rear Bumper Chrome						Broadway
	900, // ID 1177, Rear Bumper Slamin							Broadway
	2050, // ID 1178, Rear Bumper Slamin						Remington
	2150, // ID 1179, Front Bumper Chrome						Remington
	2130, // ID 1180, Rear Bumper Chrome						Remington
	2050, // ID 1181, Front Bumper Slamin						Blade
	2130, // ID 1182, Front Bumper Chrome						Blade
	2040, // ID 1183, Rear Bumper Slamin						Blade
	2150, // ID 1184, Rear Bumper Chrome						Blade
	2040, // ID 1185, Front Bumper Slamin						Remington
	2095, // ID 1186, Rear Bumper Slamin						Savanna
	2175, // ID 1187, Rear Bumper Chrome						Savanna
	2080, // ID 1188, Front Bumper Slamin						Savanna
	2200, // ID 1189, Front Bumper Chrome						Savanna
	1200, // ID 1190, Front Bumper Slamin						Tornado
	1040, // ID 1191, Front Bumper Chrome						Tornado
	940, // ID 1192, Rear Bumper Chrome							Tornado
	1100, // ID 1193 Rear Bumper Slamin							Tornado
};


enum TCommands
{
	CommandLevel, // Holds the admin-level required to execute this command
	CommandStructure[128], // Holds the command-structure
	CommandDescription[128] // Holds the description of the command
}
new ACommands[][TCommands] =
{
	{0, "/admins",                                   					"Oyundaki bütün yöneticileri gösterir"},
	{0, "/tamir",                                   					"Aracýnýzý tamir ettirmek için tamirci çaðýrýr"},
	{0, "/banka",                                   					"Banka hesap iþlemleri"},
	{0, "/isyeri",                                   					"Ýþyeri kontrol menüsünü açar"},
	{0, "/isyerial",                                   					"Ýþyeri satýn alma komutu"},
	{0, "/eval",                                   						"Ev satýn alma komutu"},
	{0, "/sifredegistir",                                   			"Þifre deðiþtirme komutu"},
	{0, "/komutlar",                                   					"Bütün komutlarý gösterir"},
	{0, "/anims",                                                       "Bütün animasyonlarý gösterir"},
	{0, "/renk1",														"Aracýn 1. rengini deðiþtirir"},
	{0, "/renk2",														"Aracýn 2. rengini deðiþtirir"},
	{0, "/konvoy",                                   					"Konvoya katýlma komutu"},
	{0, "/konvoyiptal",                                   				"Konvoy görevini iptal etme"},
	{0, "/konvoykick <ID>",												"Konvoydan oyuncu atma komutu"},
	{0, "/konvoycik",                                   				"Konvoydan ayrýlma komutu"},
	{0, "/konvoyuye",                                   				"Bütün konvoy üyelerini gösterir"},
	{0, "/detach",                                   					"Kasayý çýkartýr"},
	{0, "/gir",                                   						"Ýþyerine veya eve girme komutu"},
	{0, "/cevir",                                   					"Aracý düzeltir"},
	{0, "/getcar",                                   					"Kendi aracýnýzý yanýnýza çekmeye yarar"},
	{0, "/paraver <ID> <Para>",                              			"Para verme komutu"},
	{0, "/isyerinegit",                                   				"Ýþyerine ýþýnlanma komutu"},
	{0, "/evegit",                                   					"Eve ýþýnlanma komutu"},
	{0, "/yardim",                                   					"Herhangi bir konu hakkýnda bilgi alma komutu"},
	{0, "/evmenu",                                   					"Ev kontrol menüsünü açar"},
	{0, "/kill",                                   						"Ýntahar komutu"},
	{0, "/me <emote>",													"Bu komut kaldýrýlmýþtýr"},
	{0, "/overload",                                   					"Kamyoncularýn týrlarýný aþýrý yüklemesini saðlar"},
	{0, "/paintjob <PaintjobID (0-2)>",                                 "Aracýnýza paintjob uygulama"},
	{0, "/park",                                   						"Aracýnýzý bulunduðu yere park etme komutu"},
	{0, "/pm <ID> <Mesaj>",                        						"Bir oyuncuya özel mesaj gönderme"},
	{0, "/reclass",                                   					"Meslek deðiþtirme komutu"},
	{0, "/arabakirala",                                   				"Araç galerisinden araç kiralama komutu"},
	{0, "/rapor <ID> <Raporunuz>",                  			        "Kurallara uymayan oyuncularý rapor etme"},
	{0, "/kurtul",                                   					"Mesleðinizin oyuna baþlama yerine ýþýnlar"},
	{0, "/kurallar",                                   					"Kurallarý görüntüler"},
	{0, "/say <Mesaj>",                                   				"Sizinle ayný meslekteki oyuncularla konuþma"},
	{0, "/kapan",                                   					"Yere kapan koyma (polisler için)"},
	{0, "/karakter",                                   					"Ýstatistikleri görüntüleme komutu"},
	{0, "/stopwork",                                   					"Þuanki iþi iptal eder"},
	{0, "/unclamp",                                   					"Aracýnýzý bir miktar ücret ödeyerek kelepçeden kurtarma"},
	{0, "/work",														"Görev baþlatýr"},
	{0, "/engine <MotorDurumu (0/1)>",                                  "Motoru açýp kapatma"},
	{0, "/akontrol",                                   					"Aracýnýzý yönetir"},
	{0, "/loc",                                   						"Bulunuduðunuz yeri gösterir"},
	{0, "/plaka <Plaka>",                                   			"Aracýnýzýn plakasýný deðiþtirir"},
	{0, "/anos",                                   						"VIP'ler için nos taktýrma komutu"},
	{0, "/afuel",                                   					"VIP'ler için benzin doldurma komutu"},
	{0, "/arepair",                                   					"VIP'ler için tamir komutu"},
	{0, "/neon",                                   						"VIP'ler için neon taktýrma komutu"},
	{0, "/veh",                                   						"VIP'ler için araç alma komutu"}
};

new ACommands2[][TCommands] =
{
	{1, "/raporlar",                                   					"Son 50 raporu gösterir"},
	{1, "/cc",                                   					    "Chati temizler"},
	{1, "/announce <Mesaj>",      	                             		"Anons komutu"},
	{1, "/mute <ID> <Sebep>",                                 			"Oyuncuyu susturma"},
	{1, "/unmute <ID>",                                   				"Oyuncunun susturma cezasýný açar"},
	{1, "/mutes",                                   					"Susturulan oyuncularý gösterir"},
	{1, "/spec <ID>",                                   				"Oyuncuyu izleme komutu"},
	{1, "/endspec",                                   					"Oyuncu izlemeyi bitirme"},
	{1, "/warn <ID> <Sebep>",                                			"Oyuncuyu uyarma komutu"},
	{2, "/jail <ID> <Süre> <Sebep>",                     				"Oyuncuyu hapse atma"},
	{2, "/kick <ID> <Sebep>",                                			"Oyuncuyu kickleme"},
	{2, "/slap <ID> <Sebep>",                                			"Oyuncuyu tokatlama"},
	{3, "/freeze <ID> <Süre> <Sebep>",     				                "Oyuncuyu dondurur"},
	{3, "/unfreeze <ID>",     				                			"Oyuncunun donma cezasýný kaldýrýr"},
	{3, "/eject <ID>",                                   				"Oyuncuyu aracýndan atma komutu"},
	{4, "/fuel",                                   						"Oyuncunun aracýna bedavaya benzin doldurma"},
	{4, "/repair",                                   					"Aracýnýzý bedavaya tamir eder"},
	{5, "/ban <ID> <Gün> <Saat> <Sebep>",                   			"Ban cezasý verme komutu"},
	{5, "/unban <ID>",                                   				"Oyuncunun banýný açar"},
	{5, "/ipban <ID> <Sebep>",                   						"Oyuncuya IP ban atar"},
	{6, "/goto <ID>",                                   				"Oyuncuya ýþýnlanma"},
	{6, "/get <ID>",                                   					"Oyuncuyu yanýnýza çekme"},
	{6, "/tele <ID> <Hedef ID>",                          				"Bir oyuncuyu baþka bir oyuncuya ýþýnlar"},
	{6, "/wanted <PlayerID> <Stars>",                                   "Oyuncunun aranma yýldýzýný deðiþtirir"},
	{6, "/jetpack",                                   					"Jetpack verir"},
	{6, "/weather",                                   					"Hava durumunu deðiþtirir"},
	{7, "/car <Model> <Renk1> <Renk2>",                                 "Ýstediðiniz aracý oluþturur"},
	{7, "/setskin <SkinID (0-299)>",                                    "Skininizi deðiþtirir"},
	{8, "/nos",                                   						"Aracýnýza nitro ekler"},
	{8, "/gotoloc <x> <y> <z>",                                   		"Sizi verdiðiniz koordinatlara ýþýnlar"},
	{8, "/gotovehicle <AracID>",                                   		"Sizi bir araca ýþýnlar"},
	{8, "/respawn <AracID>",                                   			"Aracý respawn eder"},
	{8, "/healall",                                   					"Bütün oyuncularý iyileþtirir"},
	{8, "/repairall",                                   				"Bütün araçlarý tamir eder"},
	{9, "/rangeban <ID> <Sebep>",                   					"Oyuncuya Range-Ban atar"},
	{9, "/setscore <ID> <Skor>",                              			"Oyuncunun skorunu deðiþtirir"},
	{9, "/cash <Miktar>",                                   			"Kendinize para verir"},
	{9, "/score <Miktar>",                                   			"Kendinize skor verir"},
	{9, "/resetplayer <ID> <Para (0/1)> <Skor (0/1)> <Ýstatistik (0/1)> <Sebep>",	"Oyuncunun bilgilerini sýfýrlar"},
	{9, "/dcar",                  	                 					"Binmiþ olduðunuz aracý siler"},
	{9, "/spawnallcars",                  	                 			"Tüm araçlarý respawn eder"},
	{10, "/cleanupcars",                                   				"Bütün arabalarý yok eder"},
	{10, "/clamp <AracID> <Sebep>",                     	            "Oyuncunun aracýný kelepçeler"},
	{10, "/createbusiness",                                   			"Ýþyeri oluþturur"},
	{10, "/createcamera <Hýz Sýnýrý>",                                  "Hýz kamerasý oluþturur"},
	{10, "/createhouse <Fiyat> <MaxLevel (1-10)>",               		"Ev oluþturur"},
	{10, "/delbusiness",                                   				"Ýþyeri siler"},
	{10, "/delcamera",                                   				"Hýz kamerasý siler"},
	{10, "/delhouse",                                   				"Ev siler"},
	{10, "/delobject <ObjeID>",                                   		"Obje siler"},
	{10, "/fixplayer <ID>",												"Oyuncunun mülklerini düzenler (evini ve iþyerini yeniden ekler)"},
	{10, "/object <Model> <x> <y> <z> <Açý>",                    		"Obje ekler"},
	{10, "/pickup <Model> <x> <y> <z> <Tip>",               			"Pickup ekler"},
	{10, "/restart",                                   					"Sunucuya 2 dakika içinde restart atar"},
	{10, "/saveloc <ID> <Yer Ýsmi>",                                 	"Koordinatýnýzý bir dosyaya kaydeder"},
	{10, "/setlevel <ID> <Level>",                         				"Oyuncunun yönetici levelini deðiþtirir"}
};


// Help text stuff
#define HelpIDTruckingClass     0 // Defines the ID for getting help about the trucking class
#define HelpIDBusDriverClass    1 // Defines the ID for getting help about the busdriver class
#define HelpIDMafiaClass    	2 // Defines the ID for getting help about the mafia class
#define HelpIDPoliceClass    	3 // Defines the ID for getting help about the police class
#define HelpIDPilotClass    	4 // Defines the ID for getting help about the pilot class
#define HelpIDAssistanceClass   5 // Defines the ID for getting help about the assistance class
#define HelpIDRoadworkerClass   6 // Defines the ID for getting help about the roadworker class
#define HelpIDConvoy            7 // Defines the ID for getting help about convoys
#define HelpIDBonusMissions     8 // Defines the ID for getting help about bonus missions
#define HelpIDHouses            9 // Defines the ID for getting help about the houses
#define HelpIDInsurance         10 // Defines the ID for getting help about insurance
#define HelpIDBuyingVehicles    11 // Defines the ID for getting help about buying vehicles
#define HelpIDRentingVehicles   12 // Defines the ID for getting help about renting vehicles
#define HelpIDBusinesses   		13 // Defines the ID for getting help about businesses

// Define the topics for the help menu
new AHelpTopics[][50] =
{
	{"Kamyoncu Hakkýnda"},
	{"Otobüsçü Hakkýnda"},
	{"Mafya Hakkýnda"},
	{"Polis Hakkýnda"},
	{"Pilot Hakkýnda"},
	{"Tamirci Hakkýnda"},
	{"Yol Ýþçisi Hakkýnda"},
	{"Konvoylar Hakkýnda"},
	{"Bonus Görevler Hakkýnda"},
	{"Evler Hakkýnda"},
	{"Sigorta Hakkýnda"},
	{"Araç Satýn Alma Hakkýnda"},
	{"Araç Kiralama Hakkýnda"},
	{"Ýþyerleri Hakkýnda"}
};
// Setup a custom type that holds all text-lines for all help-topics
enum THelpItem
{
	HelpID, // Holds the item for which to get help-info
	HelpText[128] // Contains one line for the help-info, every help-item can use multiple lines
}
// This array holds the texts for the /yardim command
new AHelpText[][THelpItem] =
{
	{HelpIDTruckingClass, "Kamyoncuyken göreviniz iki yer arasýnda nakliyat yapmaktýr."},
	{HelpIDTruckingClass, "Yapmak için, bir kamyona binin (Flatbed, DFT-30, LineRunner, Tanker veya Roadtrain) ve \"/work\" yazarak görev baþlatýn."},
	{HelpIDTruckingClass, "Linerunner, Tanker veya Roadtrain kullanýyorsanýz görev baþlatmak için kasa takýn."},
	{HelpIDTruckingClass, "Görev baþladýðýnda haritada kýrmýzý iþaret göreceksiniz. Burasý kamyonu yüklemek için gitmeniz gereken yer."},
	{HelpIDTruckingClass, "Gösterilen yere vardýðýnýzda, kamyonunuz yüklenecektir. Burada \"/overload\" yazarak aþýrý yükleme yapabilirsiniz."},
	{HelpIDTruckingClass, "Daha sonra size gösterilen ikinci yere gidip yükünüzü boþaltmanýz gerekmektedir."},
	{HelpIDTruckingClass, "Gösterilen yere vardýðýnýzda, yükünüz boþaltýlacak ve ödemenizi alacaksýnýz."},
	{HelpIDTruckingClass, "Aldýðýnýz para, yükleme ve boþaltým noktalarý arasýndaki mesafeyle doðru orantýlýdýr."},
	{HelpIDTruckingClass, " "},
	{HelpIDTruckingClass, "Bazý ürünler mafya tarafýndan aranmakta. Kamyonunuzu bu tarz bir yükle yüklediðinizde mafyalarýn haberi olacaktýr"},
	{HelpIDTruckingClass, "ve onlar sizi kovalayýp týrýnýzý veya kasanýzý çalabilirler, dikkatli olun."},
	{HelpIDTruckingClass, "Mafyanýn aradýðý yükleri teslim etmek size bonus para kazandýrýr."},
	{HelpIDTruckingClass, " "},
	{HelpIDTruckingClass, "Bir de kamyonunuzu aþýrý yükleme þansýnýz bulunmakta. Bunu yaptýðýnýzda polisler haberdar edilecektir."},
	{HelpIDTruckingClass, "Gideceðiniz yere vardýðýnýzda aþýrý yükleme yaptýysanýz extra para alacaksýnýz."},
	{HelpIDTruckingClass, " "},
	{HelpIDTruckingClass, "Kendi þahsýnýza ait týrý kullandýðýnýzda bonus para alacaksýnýz."},
	{HelpIDTruckingClass, " "},
	{HelpIDTruckingClass, "San Fierro, Doherty'deki sürücü kursunda kamyon ehliyeti alabilirsiniz."},
	{HelpIDTruckingClass, "Bu size görev yaparken yükünüzü, yükleme ve boþaltým noktalarýnýzý seçebilmenizi saðlar."},
	{HelpIDTruckingClass, " "},
	{HelpIDTruckingClass, "Kamyoncular konvoy oluþturup onlara katýlabilirler de."},
	{HelpIDTruckingClass, "\"Konvoylar Hakkýnda\" konusunu okuyarak konvoy sistemi hakkýnda detaylý bilgiler alabilirsiniz."},

	{HelpIDBusDriverClass, "Otobüs þoförü olarak göreviniz yolcu taþýmaktýr."},
	{HelpIDBusDriverClass, "Görev baþlatmak için bir otobüse binin ve \"/work\" yazýn."},
	{HelpIDBusDriverClass, "Ýlk otobüs duraðýný haritada kýrmýzý renkle iþaretlenmiþ olarak göreceksiniz."},
	{HelpIDBusDriverClass, "Buraya gidin ve ilk yolcularýnýzý alýn."},
	{HelpIDBusDriverClass, " "},
	{HelpIDBusDriverClass, "Otobüsünüz boþ olduðunda, inen yolcu olmadýðý için ödeme almayacaksýnýz."},
	{HelpIDBusDriverClass, "Ýkinci durakta rastgele bir miktarda yolcu otobüsten inecek."},
	{HelpIDBusDriverClass, "Otobüsten inen yolcu baþýna ücret alacaksýnýz."},
	{HelpIDBusDriverClass, " "},
	{HelpIDBusDriverClass, "Tüm duraklarý bitirdiðinizde otobüs terminali haritada iþaretlenecek."},
	{HelpIDBusDriverClass, "Ayný otobüs rotasýný seçip ilk duraktan tekrar baþlayabileceksiniz"},
	{HelpIDBusDriverClass, "veya otobüs terminaline giderek görevi bitirebileceksiniz."},

	{HelpIDMafiaClass, "Mafya olarak göreviniz yükleri bir yerden diðer yere taþýmak."},
	{HelpIDMafiaClass, "Göreve baþlamak için bir Sandking veya Moonbeam'a binin ve \"/work\" yazýn."},
	{HelpIDMafiaClass, "Bu kamyoncu mesleði ile ayný þekilde yapýlýr."},
	{HelpIDMafiaClass, "Mafyalar aþýrý yükleme yapamaz ve siz mafyanýn aradýðý yükleri yükleyemezsiniz."},
	{HelpIDMafiaClass, "Buna karþýn yaptýðýnýz bütün görevler polise haberdar edilir. Dört tane aranma yýldýzý kazanýrsýnýz."},
	{HelpIDMafiaClass, " "},
	{HelpIDMafiaClass, "Mafyalar için ikinci para kazanma imkaný mafyanýn aradýðý yükleri yükleyen kamyoncularýn kasalarýný çalmaktýr."},
	{HelpIDMafiaClass, "Bir kamyoncu sizin aradýðýnýz yükü taþýdýðýnda haberdar edileceksiniz. Kamyoncu haritada kýrmýzý noktayla iþaretlenecek"},
	{HelpIDMafiaClass, "Þimdi kamyoncuyu kovalayýp onun yükünü çalabileceksiniz."},
	{HelpIDMafiaClass, "Bir kamyoncu Flatbed veya DFT-30 kullanýyorsa, yükü kamyonun kendinde yüklü olacaktýr, bu yüzden direkt olarak"},
	{HelpIDMafiaClass, "kamyonu çalmak zorundasýnýz."},
	{HelpIDMafiaClass, "Eðer bir kamyoncu kasa takýlý araç sürüyorsa, kasayý çalmalýsýnýz, ve size gösterilen yere taþýmalýsýnýz."},
	{HelpIDMafiaClass, "Veya týrý kasasýyla birlikte de çalabilirsiniz."},
	{HelpIDMafiaClass, " "},
	{HelpIDMafiaClass, "Kamyoncunun aracýndan kasayý çýkarttýðýnýzda kasayý kendi týrýnýza takmak için 60 saniyeniz var."},
	{HelpIDMafiaClass, "Eðer bunu baþaramazsýnýz kamyoncunun görevi iptal olur ve yük kaybedilir."},
	{HelpIDMafiaClass, "Eðer bunu baþarýrsanýz, mafya sýðýnaðýna gidin ve yükü oraya býrakýn."},
	{HelpIDMafiaClass, "Çalýntý yükü mafya sýðýnaðýna býraktýðýnýzda ödeme alýrsýnýz."},

	{HelpIDPoliceClass, "Polis olarak göreviniz, aranan kiþilere ceza kesmek veya onlarý hapse atmaktýr."},
	{HelpIDPoliceClass, "Bir kamyoncu aþýrý yükleme yaptýðýnda 2 aranma yýldýzý kazanacaktýr."},
	{HelpIDPoliceClass, "Mafya bir görev yaptýðýnda 4 aranma yýldýzý kazanýr."},
	{HelpIDPoliceClass, "Radara yakalanan oyuncular ise 1 aranma yýldýzý kazanýr."},
	{HelpIDPoliceClass, " "},
	{HelpIDPoliceClass, "Aranan oyuncular haritada kýrmýzý olarak görünür."},
	{HelpIDPoliceClass, "Bu oyuncuyu durdurup ceza kesmeniz gerekmektedir."},
	{HelpIDPoliceClass, "Aranan oyuncunun yakýnýndayken, Sol CTRL'ye basarak onu uyarabilirsiniz."},
	{HelpIDPoliceClass, "Oyuncu polisler tarafýndan kovalandýðýndan haberdar olacaktýr ve aracýný saða çekecektir."},
	{HelpIDPoliceClass, " "},
	{HelpIDPoliceClass, "Oyuncu hemen durduðunda yanýnda Sað Fare Tuþu'na basarak ceza kesin."},
	{HelpIDPoliceClass, "Bunu yapmak için araçtan inmeniz gerekir."},
	{HelpIDPoliceClass, "Eðer aranan oyuncu 60 saniye içinde saða çekmezse, yakaladýðýnda hapse gönderilecektir."},
	{HelpIDPoliceClass, "Bu oyuncunun size cezasýnýn iki katýný ödemesine sebep olacaktýr."},

	{HelpIDPilotClass, "Pilot olduðunuzda göreviniz iki hava alaný arasýnda taþýma yapmaktýr."},
	{HelpIDPilotClass, "Görevi baþlatmak için bir Shamal veya Nevada model uçaða binin ve \"/work\" yazýn."},
	{HelpIDPilotClass, "Uçaklar kargo veya yolcu taþýrlar."},
	{HelpIDPilotClass, "Pilotlar helikopter de kullanabilirler. Bir Maverick veya Cargobob'a binerek görev baþlatabilirler."},
	{HelpIDPilotClass, "Helikopterler sadece yolcu taþýrlar."},

	{HelpIDAssistanceClass, "Tamirci olduðunuzda göreviniz oyuncularýn týrlarýna benzin doldurmak ve"},
	{HelpIDAssistanceClass, "onlarýn araçlarýný tamir etmektir."},
	{HelpIDAssistanceClass, "Oyuncular \"/tamir\" yazarak tamirci çaðýrabilirler."},
	{HelpIDAssistanceClass, "Tamir isteyen oyuncular haritada kýrmýzý olarak gözükeceklerdir."},
	{HelpIDAssistanceClass, " "},
	{HelpIDAssistanceClass, "Tamirciler yardým isteyen oyunculara gidip yardým etmelidirler."},
	{HelpIDAssistanceClass, "Onlara araçlarýnýn yan koltuðuna binip"},
	{HelpIDAssistanceClass, "Sað Fare Tuþu'na basarak tamir ve benzin imkaný saðlayabilirsiniz."},
	{HelpIDAssistanceClass, " "},
	{HelpIDAssistanceClass, "Onlara sormadan araçlarýný tamir edemezsiniz veya araçlarýna benzin dolduramazsýnýz."},

	{HelpIDRoadworkerClass, "Yol iþçisi 2 çeþit iþ yapabilir."},
	{HelpIDRoadworkerClass, " "},
	{HelpIDRoadworkerClass, "Birincisi haritada bulunan hýz kameralarýný tamir etmek."},
	{HelpIDRoadworkerClass, "Utility Trailer takýlý bir Utility Van alýp \"/work\" yazarak görevi baþlatabilirsiniz."},
	{HelpIDRoadworkerClass, "Haritada gösterilen yere gidin. Araçtan inip hýz kamerasýný tamir edin.."},
	{HelpIDRoadworkerClass, "Tamirden sonra tamir edeceðiniz yeni kamera haritada iþaretlenecektir."},
	{HelpIDRoadworkerClass, "Ýki seçeneðiniz var: hýz kameralarýný tamir etmeye devam edersiniz veya merkeze dönüp"},
	{HelpIDRoadworkerClass, "görevi bitirirsiniz."},
	{HelpIDRoadworkerClass, " "},
	{HelpIDRoadworkerClass, "Ýkinci iþ ise bozuk araçlarý hurdalýða çekmek."},
	{HelpIDRoadworkerClass, "Bir çekiciye binin ve \"/work\" yazarak görev baþlatýn."},
	{HelpIDRoadworkerClass, "Haritada iþaretlenen kýrmýzý noktaya gidin, orada bozuk araç var."},
	{HelpIDRoadworkerClass, "Kýrmýzý daireye girdiðinizde araç otomatik olarak çekicinizin arkasýna baðlanacaktýr."},
	{HelpIDRoadworkerClass, "Daha sonra aracý hurdalýða götürün."},
	{HelpIDRoadworkerClass, " "},
	{HelpIDRoadworkerClass, "Eðer hurdalýða dönerken arkanýzda takýlý olan araç düþerse, yanýna sürün"},
	{HelpIDRoadworkerClass, "ve Sol Fare Tuþu'na basarak aracý tekrar çekiciye takýn."},

	{HelpIDConvoy, "Konvoylarda birçok oyuncu ayný görevi birlikte yapabilirler."},
	{HelpIDConvoy, "Sadece kamyoncular konvoy yapabilir."},
	{HelpIDConvoy, "Her konvoyun bir lideri vardýr. Lider konvoyun yapacaðý göreve karar verebilir."},
	{HelpIDConvoy, "Ayný anda en fazla 5 konvoy yapýlabilir."},
	{HelpIDConvoy, "Büyük bir konvoy küçük bir konvoya göre daha fazla para kazandýrýr."},
	{HelpIDConvoy, "Konvoylar en fazla 25 üye alabilir."},
	{HelpIDConvoy, " "},
	{HelpIDConvoy, "Konvoydaki üye sayýsý baþýna alýnacak ücret 25% artmakta."},
	{HelpIDConvoy, "Konvoylar ekstra para almak için bonus görevler de yapabilirler."},
	{HelpIDConvoy, "Konvoya katýlmak veya yeni bir konvoy açmak için, \"/konvoy\" yazýn ve bir slot seçin."},
	{HelpIDConvoy, " "},
	{HelpIDConvoy, "Konvoy göreve baþladýðýnda, konvoya alým kapanýr, ve bu yüzden görev sýrasýnda konvoya kimse katýlamaz."},
	{HelpIDConvoy, "Bütün konvoy üyeleri görevi tamamladýðý anda,"},
	{HelpIDConvoy, "hepsi ücret alýr. Konvoya alým açýlýr."},

	{HelpIDBonusMissions, "Bonus görevler her görev bitiriþinizde otomatik olarak denetlenir."},
	{HelpIDBonusMissions, "Sadece kamyoncular bonus görev yapabilirler. Görevi bitirdiðinizde normal ödemenin iki katýný alýrsýnýz."},
	{HelpIDBonusMissions, "Çift ödemenin yanýnda, bütün bonuslarýn iki katýný alýrsýnýz: aþýrý yükleme, mafya yükü taþýma, ..."},
	{HelpIDBonusMissions, "Bonus görevler sadece bir kamyoncu veya konvoy olarak bitirilebilir."},
	{HelpIDBonusMissions, "Bonus görev bir oyuncu tarafýndan tamamlandýðýnda, diðer oyuncular bonus alamaz,"},
	{HelpIDBonusMissions, "eðer ayný iþi yapýyorlarsa."},
	{HelpIDBonusMissions, "Bonus görevler tamamlanana kadar ayný kalýrlar. Tamamlandýðýnda, yeni bonus görev oluþturulur."},

	{HelpIDHouses, "Evler, oyuncular tarafýndan satýn alýnabilen gayrimenkullerdir."},
	{HelpIDHouses, "Bir oyuncu en fazla 2 ev alabilir."},
	{HelpIDHouses, "Her ev bir satýn alma fiyatý ve maximum levele sahiptir."},
	{HelpIDHouses, "Maximum level, evin son seviyede alabileceði araç sayýsýný belirler."},
	{HelpIDHouses, "Bir ev aldýðýnýzda, 1 levelden baþkar. Ve size bir araç slotu verir."},
	{HelpIDHouses, "Evinize her bir level atlattýðýnýzda, ek araç slotu oluþturulur."},
	{HelpIDHouses, "Her ev seviyesi farklý iç dizayna sahiptir ve geliþtirdikçe daha büyük hale gelir."},
	{HelpIDHouses, "Herhangi bir ev için biçilebilecek en fazla maximum level 10'dur."},
	{HelpIDHouses, "Bu evler pahalýdýr, çünkü tamamen geliþtirildiklerinde 10 araç alýrlar."},
	{HelpIDHouses, " "},
	{HelpIDHouses, "Evi satýn aldýðýnýzda ev ikonunun yanýnda (dönen ev ikonu)"},
	{HelpIDHouses, "\"/gir\" yazarak eve girebilirsiniz."},
	{HelpIDHouses, "Eve girdiðinizde, \"/evmenu\" yazarak ev ayarlarýna ulaþabilirsiniz."},
	{HelpIDHouses, "Bu menüde, evin ismini deðiþtirebilir, evi geliþtirebilir, araba alýp satabilir,"},
	{HelpIDHouses, "araç sigortasý alabilir ve evden çýkabilirsiniz."},
	{HelpIDHouses, "Evdeki bütün araçlarý sattýktan sonra evinizi satabilirsiniz."},
	{HelpIDHouses, "Araç satarken aracýn fiyatýnýn 50% sini alýrsýnýz."},
	{HelpIDHouses, "Bu fiyata araca yaptýðýnýz modifiyelerin ücreti de dahildir."},
	{HelpIDHouses, " "},
	{HelpIDHouses, "Evinizin kilidini açabilirsiniz. Böylece diðer oyuncular evinize girebilir."},
	{HelpIDHouses, "Evi kilitlediðinizde ise eve sadece siz girebilirsiniz."},
	{HelpIDHouses, "Bu yolla arkadaþlarýnýzý eve davet edebilirsiniz. Eðer evden ayrýlmak isterlerse, onlar da"},
	{HelpIDHouses, "\"/evmenu\" komutunu kullanabilirler. Onlara ev sahibiyle ayný menü gösterilir, fakat sadece \"Evden Çýk\" seçeneði çalýþacaktýr"},
	{HelpIDHouses, " "},

	{HelpIDInsurance, "Ev araçlarýnýza sigorta almanýzda önem var. Araçlarýnýz patladýðýnda sigorta sayesinde kurtulurlar"},
	{HelpIDInsurance, "Ev araçlarýna sigorta evin fiyatýnýn 10% una yaptýrýlabilir."},
	{HelpIDInsurance, "Bir araç patladýðýnda veya suya uçtuðunda kullanýlamaz hale gelirler."},
	{HelpIDInsurance, "Sigortanýz yoksa, aracýnýz kaybolur, geri alamazsýnýz."},
	{HelpIDInsurance, "Sigortanýz varsa, tamir edilmiþ ve benzin deposu doldurulmuþ þekilde geri döner."},
	{HelpIDInsurance, " "},
	{HelpIDInsurance, "Bir araç aldýðýnýzda, aldýðýnýz araç evinize baðlanýr."},
	{HelpIDInsurance, "Ýkini eviniz varsa ve sadece birincisinde sigorta varsa, ikinci evdeki araçlara etki etmez."},

	{HelpIDBuyingVehicles, "Oyuncular evleri olduðunda kendilerine araç satýn alabilirler."},
	{HelpIDBuyingVehicles, "Araç alabilmek için eve girip \"/evmenu\" yazmalýsýnýz."},
	{HelpIDBuyingVehicles, "Aracý aldýðýnýzda araç eve baðlanýr."},
	{HelpIDBuyingVehicles, "Aracý aldýðýnýzda, evden çýkýn ve \"/getcar\" yazarak aracý yanýnýza çekin."},
	{HelpIDBuyingVehicles, "Daha sonra istediðiniz yere park edip \"/park\" yazarak park edin ( evin yakýnlarýnda )."},
	{HelpIDBuyingVehicles, " "},
	{HelpIDBuyingVehicles, "Satýn aldýðýnýz araçlar modifiye edilebilirler."},
	{HelpIDBuyingVehicles, "Modifiye garajlarýndan birine girip araçlarýnýzý modifiye ettirebilirsiniz."},
	{HelpIDBuyingVehicles, "Oyundan çýktýðýnýzda araçlarýnýzýn modifiyesi kaydolur, bu yüzden gidecek diye korkmayýn."},
	{HelpIDBuyingVehicles, " "},
	{HelpIDBuyingVehicles, "Oyundan çýktýðýnýzda araçlarýnýz gizlenir ve diðer oyuncular onlara zarar veremezler."},
	{HelpIDBuyingVehicles, "Oyuna girdiðinizde araçlarýnýz tekrar oluþturulur."},
	{HelpIDBuyingVehicles, " "},
	{HelpIDBuyingVehicles, "Araçlarýnýzý baþka oyuncular süremez, sürmeye kalkýþýrlarsa araçtan atýlýrlar."},
	{HelpIDBuyingVehicles, "Diðer oyuncular aracýnýzýn sadece yolcu koltuðunda olabilirler."},

	{HelpIDRentingVehicles, "Evi olmayan oyuncular sadece araç kiralayabilirler."},
	{HelpIDRentingVehicles, "San Fierro'da Doherty'deki Wang Cars'a gidip araç kiralayabilirsiniz."},
	{HelpIDRentingVehicles, " "},
	{HelpIDRentingVehicles, "Araç kiraladýðýnýzda sahipliði size gelir."},
	{HelpIDRentingVehicles, "Fakat bu aracý elinizde tutabileceðiniz anlamýna gelmiyor."},
	{HelpIDRentingVehicles, "Sadece bu aracý sizin sürebileceðiniz anlamýna geliyor."},
	{HelpIDRentingVehicles, " "},
	{HelpIDRentingVehicles, "Kiralýk araçlar satýn alýnan araçlarýn fiyatýnýn 10% una kiralanabilir."},
	{HelpIDRentingVehicles, " "},
	{HelpIDRentingVehicles, "Eðer ikinci bir aracý kiralarsanýz önceki aracýnýz kaybolur."},
	{HelpIDRentingVehicles, "Ayný anda 2 araç kiralayamazsýnýz."},
	{HelpIDRentingVehicles, "Ayný zamanda oyundan çýktýðýnýzda da kiraladýðýnýz araç kaybolur."},
	{HelpIDRentingVehicles, "Tekrar oyuna girmek onu geri döndürmez."},

	{HelpIDBusinesses, "Oyuncular en fazla 2 iþyeri satýn alabilirler."},
	{HelpIDBusinesses, "Ýþyerleri de evler gibi geliþtirilebilirler fakat en fazla iþyeri leveli 5'tir."},
	{HelpIDBusinesses, " "},
	{HelpIDBusinesses, "Bir iþyerine sahip olmak size saat baþý gelir getirir."},
	{HelpIDBusinesses, "Ýþyeriniz siz oyunda deðilken de gelir getirir."},
	{HelpIDBusinesses, "Ýþyerini geliþtirmek iþyerinin daha fazla gelir getirmesini saðlar."},
	{HelpIDBusinesses, "Her levelde iþyerinin getirdiði gelir artar."},
	{HelpIDBusinesses, "En fazla seviyeye ulaþýldýðýnda (level 5), bir iþyeri 1 level iþyerinin getirdiði paranýn 5 katýný getirir."},
	{HelpIDBusinesses, " "},
	{HelpIDBusinesses, "Çeþitli iþyerleri bulunmakta. Her biri saatte farklý miktarda gelir getirir."},
	{HelpIDBusinesses, "En çok geliri olan iþyeri gazinolardýr. Saatte $250, günde $6000 gelir getirir."},
	{HelpIDBusinesses, "5 levele getirilince, bu iþyeri saatte $1,250, veya günde $30,000 kazandýrýr."},
	{HelpIDBusinesses, "Gazinolarýn tek dezavantajý pahalý olmalarý."}

//	{HelpIDBusinesses, "xxxxxxxxxxxx"},
};

// This array holds the vehicle-colors
new AVehicleColors[][10] =
{
	{"{000000}"},	{"{f5f5f5}"},	{"{2a77a1}"},	{"{840510}"},	{"{253739}"}, // Colors 0, 1, 2, 3, 4
	{"{87446f}"},	{"{d68f11}"},	{"{4c75b7}"},	{"{bdbdc5}"},	{"{5e7072}"}, // Colors 5, 6, 7, 8, 9

	{"{46597a}"},	{"{66697a}"},	{"{5e7e8d}"},	{"{58595b}"},	{"{d6dbd5}"}, // Colors 10, 11, 12, 13, 14
	{"{9ca1a4}"},	{"{34603f}"},	{"{740e1b}"},	{"{7c0a2b}"},	{"{a09d94}"}, // Colors 15, 16, 17, 18, 19

	{"{3b4e79}"},	{"{732e40}"},	{"{691e3c}"},	{"{96918d}"},	{"{515459}"}, // Colors 20, 21, 22, 23, 24
	{"{3f3e46}"},	{"{a5a9a8}"},	{"{645c5a}"},	{"{3c4969}"},	{"{969591}"}, // Colors 25, 26, 27, 28, 29

	{"{431f21}"},	{"{5f272a}"},	{"{8494ab}"},	{"{757a7d}"},	{"{646464}"}, // Colors 30, 31, 32, 33, 34
	{"{5b5853}"},	{"{252527}"},	{"{2e3a36}"},	{"{93a398}"},	{"{6d7a8a}"}, // Colors 35, 36, 37, 38, 39

	{"{28201e}"},	{"{6f6860}"},	{"{7c1c28}"},	{"{600a15}"},	{"{193828}"}, // Colors 40, 41, 42, 43, 44
	{"{5c1b1f}"},	{"{9c9872}"},	{"{7a7561}"},	{"{989586}"},	{"{acb0b1}"}, // Colors 45, 46, 47, 48, 49

	{"{848a88}"},	{"{305045}"},	{"{4e6368}"},	{"{162248}"},	{"{282f4c}"}, // Colors 50, 51, 52, 53, 54
	{"{7e6257}"},	{"{9fa4aa}"},	{"{9c8d70}"},	{"{6e1821}"},	{"{4e6881}"}, // Colors 55, 56, 57, 58, 59

	{"{9c9d98}"},	{"{907347}"},	{"{661d26}"},	{"{949c9f}"},	{"{a3a8a4}"}, // Colors 60, 61, 62, 63, 64
	{"{8f8c47}"},	{"{331a1d}"},	{"{697a8a}"},	{"{aaad8e}"},	{"{ac988f}"}, // Colors 65, 66, 67, 68, 69

	{"{86202e}"},	{"{708298}"},	{"{585953}"},	{"{9aa68e}"},	{"{601a1a}"}, // Colors 70, 71, 72, 73, 74
	{"{21212d}"},	{"{a4a097}"},	{"{ab9d83}"},	{"{78222b}"},	{"{0e326e}"}, // Colors 75, 76, 77, 78, 79

	{"{722a40}"},	{"{7a715f}"},	{"{741c28}"},	{"{1d2f31}"},	{"{4e322f}"}, // Colors 80, 81, 82, 83, 84
	{"{7d1b44}"},	{"{2f5b20}"},	{"{395a83}"},	{"{6c2837}"},	{"{a7a28f}"}, // Colors 85, 86, 87, 88, 89

	{"{b0b2b1}"},	{"{364155}"},	{"{6d6d6f}"},	{"{0f6a89}"},	{"{204b6d}"}, // Colors 90, 91, 92, 93, 94
	{"{2c3d57}"},	{"{9a9e9d}"},	{"{6d8494}"},	{"{4d5c5f}"},	{"{ac9b7f}"}, // Colors 95, 96, 97, 98, 99

	{"{416c8f}"},	{"{20253b}"},	{"{ac9277}"},	{"{124574}"},	{"{96816c}"}, // Colors 100, 101, 102, 103, 104
	{"{64686b}"},	{"{115083}"},	{"{a19984}"},	{"{385694}"},	{"{525661}"}, // Colors 105, 106, 107, 108, 109

	{"{7e6956}"},	{"{8d919a}"},	{"{596d86}"},	{"{483433}"},	{"{456250}"}, // Colors 110, 111, 112, 113, 114
	{"{730a28}"},	{"{223556}"},	{"{630d1a}"},	{"{a3adc6}"},	{"{6a5854}"}, // Colors 115, 116, 117, 118, 119

	{"{9b8a80}"},	{"{620b1c}"},	{"{5c5d5f}"},	{"{634428}"},	{"{741827}"}, // Colors 120, 121, 122, 123, 124
	{"{1c376e}"},	{"{ed6aae}"}                                                  // Colors 125, 126
};

// ************************************************************************************************************************************************************
// PPC_DefLocations
// ************************************************************************************************************************************************************

// Setup a custom type that holds all data about a location on the map (used for missions)
enum TLocation
{
	LocationName[50], // The name of the location
	Float:LocX, // The X-position of the location
	Float:LocY, // The Y-position of the location
	Float:LocZ // The Z-position of the location
}

// Setup an array that holds all location-data (except taxi and busdriver classes, these have their own locations)
new ALocations[][TLocation] =
{
	// LocationName, LocationX, LocationY, LocationZ
	{"Dummy location", 0.0, 0.0, 0.0}, // Location 0 = dummy location (never used)

	{"LS Construction Site", 1859.0, -1314.0, 14.0}, // Location 1
	{"SF Construction Site", -2083.0, 209.0, 35.5}, // Location 2
	{"LV Construction Site", 2708.0, 878.0, 10.0}, // Location 3
	{"Avery Construction", 312.25, -233.75, 1.6}, // Location 4
	{"Clown's Pocket Constr.", 2467.0, 1923.0, 9.8}, // Location 5
	{"Solarin Industries", -1822.5, 41.25, 15.25}, // Location 6
	{"Blueberry Truck Terminal", 52.75, -278.0, 1.7}, // Location 7
	{"KACC Military Fuels", 2708.5, 2641.25, 11.0}, // Location 8
	{"SA Federal Mint", -2441.0, 521.5, 30.0}, // Location 9
	{"Angel Pine Sawmill", -1965.75, -2436.0, 30.7}, // Location 10
	{"Quarry", 587.25, 844.75, -42.5}, // Location 11
	{"Quarry Top", 370.0, 874.0, 20.5}, // Location 12
	{"Easter Bay Lumberyard", -763.5, -136.0, 65.7}, // Location 13
	{"LS Papermill", 2331.5, -2071.5, 13.6}, // Location 14
	{"Sprunk Factory", 1334.75, 287.0, 19.6}, // Location 15
	{"SF Medical Center", -2607.0, 684.0, 27.9}, // Location 16
	{"Angel Pine Junkyard", -1873.0, -1685.0, 21.8}, // Location 17
	{"LV Freight Depot", 599.5, 1224.75, 11.8}, // Location 18
	{"LS Garbage Compound", 2181.0, -1980.5, 13.6}, // Location 19
	{"LV Industrial Estate", 1635.75, 750.5, 11.0}, // Location 20
	{"EasterBoard Farm", -69.5, -35.75, 3.2}, // Location 21
	{"SF Hill Farm", -1423.5, -1469.0, 101.7}, // Location 22
	{"Pecker's Feed & Seed", -310.5, 2669.5, 62.7}, // Location 23
	{"San Fierro Port", -1691.0, 31.5, 3.6}, // Location 24
	{"LV Refinery", 262.5, 1453.75, 10.6}, // Location 25
	{"LS Refinery", 2484.0, -2085.0, 13.6}, // Location 26
	{"Countryside Gas Station", -86.0, -1192.75, 2.0}, // Location 27
	{"SF Xoomer Gas Station", -1659.0, 444.0, 7.2}, // Location 28
	{"SF Gas Station", -2421.5, 953.25, 45.3}, // Location 29
	{"LS Going Station", 1926.0, -1791.5, 13.5}, // Location 30
	{"Xoomer Gas Station", -1488.75, 1875.25, 32.7}, // Location 31
	{"Whetstone Gas Station", -1629.0, -2700.0, 48.6}, // Location 32
	{"Desert Gas Station", -1309.5, 2703.75, 50.1}, // Location 33
	{"Dilimore Gas Station", 664.5, -583.75, 16.4}, // Location 34
	{"Abandoned Airport Fuel", 387.9, 2590.25, 16.5}, // Location 35
	{"San Fierro International", -1152.25, -146.5, 14.2}, // Location 36
	{"Easter Bay Chemical", -1033.75, -625.25, 32.1}, // Location 37
	{"LS Ocean Docks", 2466.0, -2219.25, 13.6}, // Location 38
	{"Bioengineering Corp.", 1347.5, 349.5, 20.0}, // Location 39
	{"Greenglass College", 999.0, 1086.75, 11.0}, // Location 40
	{"Fleischberg Brewery", -149.75, -220.25, 1.5}, // Location 41
	{"Bayside Boatyard", -2430.75, 2310.5, 5.0}, // Location 42
	{"LV Butcher", 977.5, 2096.75, 11.0}, // Location 43
	{"SF Catering LTD", -1945.75, -1073.5, 31.0}, // Location 44
	{"LS Donut shop", 1025.75, -1355.0, 13.8}, // Location 45
	{"Porter's House", 2439.75, 114.5, 26.5}, // Location 46
	{"Chuckup LTD", 1470.5, 1017.5, 10.9}, // Location 47
	{"LS Warehouse", 2178.5, -2279.75, 13.6}, // Location 48
	{"SF Supa Save", -2463.5, 782.0, 35.2}, // Location 49
	{"Verona Mall", 1044.75, -1548.75, 13.6}, // Location 50
	{"Las Venturas Mall", 2867.25, 2586.0, 10.7}, // Location 51
	{"Vank Hoff Hotel", -2490.75, 337.5, 33.4}, // Location 52
	{"Emerald Mall", 2056.75, 2251.25, 10.7}, // Location 53
	{"LS Ocean Docks", 2574.25, -2223.75, 13.4}, // Location 54
	{"Bayside Warehouse", -2285.0, 2281.5, 5.0}, // Location 55
	{"Fleischberg Brewery", -18.5, -282.0, 5.5}, // Location 56
	{"Las Venturas Stadium", 1377.5, 2245.75, 10.9}, // Location 57
	{"P. Creek General Store", 2318.0, -92.5, 26.5}, // Location 58
	{"LV Dirtring Stadium", 1112.0, 1451.75, 5.9}, // Location 59
	{"The Pleasure Domes", -2697.0, 1402.5, 7.2}, // Location 60
	{"4 Dragons Casino", 1903.75, 960.5, 10.9}, // Location 61
	{"SF Financial Center", -2039.5, 467.5, 35.2}, // Location 62
	{"Area 69", 134.54, 1945.79, 19.00}, // Location 63
	{"Otobus Duragi", 1067.00, 1357.75, 10.7}, // Location 64
	{"Otobus Duragi", 1324.75, 1190.75, 10.7}, // Location 65
	{"Otobus Duragi", 1544.00, 1135.50, 10.7}, // Location 66
	{"Otobus Duragi", 1603.50, 1130.50, 10.7}, // Location 67
	{"Otobus Duragi", 1722.50, 1373.25, 10.5}, // Location 68
	{"Otobus Duragi", 1714.25, 1421.75, 10.5}, // Location 69
	{"Otobus Duragi", 1010.00, 1411.25, 10.7}, // Location 70
	{"Otobus Duragi", 1726.50, 1481.75, 10.7}, // Location 71
	{"Otobus Duragi", 1729.50, 1529.50, 10.7}, // Location 72
	{"Otobus Duragi", 1705.00, 1965.00, 10.7}, // Location 73
	{"Otobus Duragi", 1385.00, 1920.00, 10.7}, // Location 74
	{"Otobus Duragi", 1335.25, 2055.50, 10.7}, // Location 75
	{"Otobus Duragi", 1073.00, 2055.50, 10.7}, // Location 76
	{"Otobus Duragi", 1502.25, 2055.50, 10.7}, // Location 77
	{"Otobus Duragi", 1565.00, 2200.25, 10.7}, // Location 78
	{"Otobus Duragi", 1636.25, 2175.50, 10.7}, // Location 79
	{"Otobus Duragi", 1503.50, 2311.00, 10.7}, // Location 80
	{"Otobus Duragi", 1564.75, 2345.75, 10.7}, // Location 81
	{"Otobus Duragi", 1725.00, 2247.75, 10.7}, // Location 82
	{"Otobus Duragi", 1894.50, 2175.50, 10.7}, // Location 83
	{"Otobus Duragi", 1925.25, 2314.75, 10.7}, // Location 84
	{"Otobus Duragi", 1925.25, 2115.75, 10.8}, // Location 85
	{"Otobus Duragi", 2083.50, 2455.50, 10.7}, // Location 86
	{"Otobus Duragi", 2285.00, 2315.00, 10.7}, // Location 87
	{"Otobus Duragi", 2305.00, 2515.50, 10.7}, // Location 88
	{"Otobus Duragi", 2392.00, 2415.50, 10.7}, // Location 89
	{"Otobus Duragi", 2425.00, 2285.00, 10.7}, // Location 90
	{"Otobus Duragi", 2449.75, 2235.50, 10.7}, // Location 91
	{"Otobus Duragi", 2580.25, 2115.50, 10.7}, // Location 92
	{"Otobus Duragi", 2447.50, 2055.50, 10.7}, // Location 93
	{"Otobus Duragi", 2115.00, 755.50, 10.7}, // Location 94
	{"Otobus Duragi", 2019.75, 750.50, 10.7}, // Location 95
	{"Otobus Duragi", 1975.00, 775.50, 10.7}, // Location 96
	{"Otobus Duragi", 1885.00, 770.75, 10.7}, // Location 97
	{"Otobus Duragi", 1894.00, 635.75, 10.7}, // Location 98
	{"Otobus Duragi", 1974.25, 631.00, 10.7}, // Location 99
	{"Otobus Duragi", 2020.50, 670.50, 10.7}, // Location 100
	{"Otobus Duragi", 2114.75, 675.75, 10.7}, // Location 101
	{"Otobus Duragi", 1084.75, 1196.00, 10.7}, // Location 102
	{"Otobus Duragi 1 Bayside", -2565.75, 2315.25,    4.83}, // Location 103
	{"Otobus Duragi 2 Bayside", -2337.00, 2375.00,    5.59}, // Location 104
	{"Otobus Duragi 1 El Quebrados", -1467.00, 2674.00,   55.68}, // Location 105
	{"Otobus Duragi 2 El Quebrados", -1528.50, 2548.00,   55.68}, // Location 106
	{"Otobus Duragi 1 Las Barrancas", -805.64, 1562.30,   26.96}, // Location 107
	{"Otobus Duragi 2 Las Barrancas", -847.00, 1529.50,   21.66}, // Location 108
	{"Otobus Duragi Las Payasdas", -269.00, 2625.75,   62.64}, // Location 109
	{"Otobus Duragi 1 Fort Carson",  -45.37, 1200.68,   19.21}, // Location 110
	{"Otobus Duragi 2 Fort Carson", -100.50, 1195.75,   19.58}, // Location 111
	{"Otobus Duragi 3 Fort Carson", -249.50, 1016.00,   19.59}, // Location 112
	{"Otobus Duragi 1 Angel Pine", -2169.75, -2305.75,   30.46}, // Location 113
	{"Otobus Duragi 2 Angel Pine", -2098.25, -2499.50,   30.46}, // Location 114
	{"Otobus Duragi 1 Palomino Creek", 2263.75,  -30.75,   26.33}, // Location 115
	{"Otobus Duragi 2 Palomino Creek", 2461.75,    1.00,   26.33}, // Location 116
	{"Otobus Duragi 1 Montgomery", 1288.50,  329.00,   19.40}, // Location 117
	{"Otobus Duragi 2 Montgomery", 1286.75,  323.75,   19.40}, // Location 118
	{"Otobus Duragi 1 Dillimore",  736.00, -527.50,   16.18}, // Location 119
	{"Otobus Duragi 2 Dillimore",  736.00, -532.50,   16.18}, // Location 120
	{"SF Hava Alani Kapi 1", -1337.94, -222.79,   14.14}, // ID = 121
	{"SF Hava Alani Kapi 2", -1395.26, -104.20,   14.14}, // ID = 122
	{"SF Hava Alani Kargo Girisi 1", -1337.16, -542.29,   14.14}, // ID = 123
	{"SF Airport Cargo Bay 2", -1412.96, -579.85,   14.14}, // ID = 124
	{"LS Hava Alani Kapi 1", 1747.04, -2441.04,   13.55}, // ID = 125
	{"LS Hava Alani Kapi 2", 1902.16, -2350.11,   13.54}, // ID = 126
	{"LS Hava Alani Kargo Girisi 1", 1889.10, -2625.49,   13.54}, // ID = 127
	{"LS Hava Alani Kargo Girisi 2", 1754.74, -2622.69,   13.54}, // ID = 128
	{"LS Hava Alani Kargo Girisi 3", 1617.61, -2622.30,   13.54}, // ID = 129
	{"LV Hava Alani Kapi 1", 1564.77, 1536.77,   10.82}, // ID = 130
	{"LV Hava Alani Kapi 2", 1569.85, 1358.58,   10.86}, // ID = 131
	{"LV Hava Alani Kargo Girisi 1", 1307.41, 1324.01,   10.82}, // ID = 132
	{"LV Hava Alani Kargo Girisi 2", 1308.47, 1361.32,   10.82}, // ID = 133
	{"Verdant Meadows Kapi", 392.13, 2531.27, 16.54}, // ID = 134
	{"Verdant Meadows Kargo Girisi", 291.08, 2525.75, 16.79}, // ID = 135
	{"TestRock", 351.5, 1008.75, 28.4}, // ID = 136
	{"TestCP", 344.75, 1020.5, 28.3} // ID = 137
};

// ************************************************************************************************************************************************************
// PPC_DefLoads
// ************************************************************************************************************************************************************

// Setup a custom type that holds all data about a load
enum TLoad
{
	LoadName[50], // The name of the load
	bool:Mafia, // Holds "true" if this load is wanted by the mafia
	Float:PayPerUnit, // Holds the price for every meter to haul this type of load (this gets multiplied by the distance to calculate the payment)
	PCV_Required, // This holds the vehicle-type the player needs to use this load (and automatically the player's class)
	FromLocations[30], // This array holds all loading-points for this load
	ToLocations[30] // This array holds all unloading-points for this load
}

new ALoads[][TLoad] =
{
	// LoadName, MafiaLoad, PayPerUnit, VehicleNeeded, From-Locations, To-Locations

	// Dummy Load (never used)
	{"Dummy", false, 0.00, 0, {0}, {0}}, // LoadID 0

	// Loads for ore trailer
	{"Toprak", false, 1.00, PCV_TruckerOreTrailer, {11}, {1, 2, 3}}, // LoadID 1
	{"Kum", false, 1.00, PCV_TruckerOreTrailer, {12}, {1, 2, 3, 4, 5}}, // LoadID 2
	{"Tas", false, 1.00, PCV_TruckerOreTrailer, {11}, {1, 2, 3, 4, 5}}, // LoadID 3
	{"Komur", false, 1.00, PCV_TruckerOreTrailer, {12}, {6, 7, 8}}, // LoadID 4
	{"Maden", false, 1.00, PCV_TruckerOreTrailer, {12}, {6, 9}}, // LoadID 5
	{"Kutuk", false, 1.00, PCV_TruckerOreTrailer, {13}, {7, 10}}, // LoadID 6
	{"Talas", false, 1.00, PCV_TruckerOreTrailer, {10}, {14}}, // LoadID 7
	{"Kuru Atik", false, 1.00, PCV_TruckerOreTrailer, {6, 15, 16}, {17, 18, 19}}, // LoadID 8
	{"Enkaz", false, 1.00, PCV_TruckerOreTrailer, {17, 19}, {6, 18, 20}}, // LoadID 9
	{"Bugday", false, 1.00, PCV_TruckerOreTrailer, {21, 22}, {18, 23, 24}}, // LoadID 10

	// Loads for liquids trailer
	{"Kursunsuz Benzin", true, 1.00, PCV_TruckerFluidsTrailer, {8, 25, 26}, {27, 28, 29, 30, 31, 32, 33, 34}}, // LoadID 11
	{"Dizel Yakit", true, 1.00, PCV_TruckerFluidsTrailer, {8, 25, 26}, {27, 28, 29, 30, 31, 32, 33, 34}}, // LoadID 12
	{"Ucak Yakiti", true, 1.00, PCV_TruckerFluidsTrailer, {8, 25, 26}, {35, 36}}, // LoadID 13
	{"Ham Petrol", false, 1.00, PCV_TruckerFluidsTrailer, {8, 25, 26}, {6}}, // LoadID 14
	{"Sivi Nitrojen", false, 1.00, PCV_TruckerFluidsTrailer, {37, 38}, {39, 40}}, // LoadID 15
	{"Kimyasal", false, 1.00, PCV_TruckerFluidsTrailer, {37}, {6, 15, 39, 40}}, // LoadID 16
	{"Saf Su", false, 1.00, PCV_TruckerFluidsTrailer, {37}, {15, 40, 41}}, // LoadID 17
	{"Gres Yagi", false, 1.00, PCV_TruckerFluidsTrailer, {8, 25}, {6, 10, 14, 42}}, // LoadID 18
	{"Gubre", false, 1.00, PCV_TruckerFluidsTrailer, {37, 38}, {21, 22}}, // LoadID 19
	{"Sut", false, 1.00, PCV_TruckerFluidsTrailer, {21, 22}, {43, 44, 45}}, // LoadID 20
	{"Bira", true, 1.00, PCV_TruckerFluidsTrailer, {41}, {44, 46}}, // LoadID 21
	{"Etanol", false, 1.00, PCV_TruckerFluidsTrailer, {37, 41}, {26, 39, 40}}, // LoadID 22

	// Loads for cargo trailer
	{"Yiyecek", false, 1.00, PCV_TruckerCargoTrailer, {7, 44, 47, 48}, {49, 50, 51, 52, 53}}, // LoadID 23
	{"Icecek", false, 1.00, PCV_TruckerCargoTrailer, {15, 54, 55}, {49, 50, 51, 52, 53}}, // LoadID 24
	{"Sise Bira", true, 1.00, PCV_TruckerCargoTrailer, {56}, {57, 58, 59, 60, 61}}, // LoadID 25
	{"Luks Esya", false, 1.00, PCV_TruckerCargoTrailer, {24, 55}, {47, 48, 50}}, // LoadID 26
	{"Elektronik", true, 1.00, PCV_TruckerCargoTrailer, {7, 24, 48}, {50, 51, 62, 63}}, // LoadID 27
	{"Spor Ekipmani", false, 1.00, PCV_TruckerCargoTrailer, {47, 48}, {50, 53, 57}}, // LoadID 28
	{"Pano", false, 1.00, PCV_TruckerCargoTrailer, {10}, {4, 7, 18, 22}}, // LoadID 29
	{"Insaat Malzemesi", false, 1.00, PCV_TruckerCargoTrailer, {4}, {1, 2, 3, 5}}, // LoadID 30
	{"Kurbanlik", false, 1.00, PCV_TruckerCargoTrailer, {21, 22}, {23, 43, 47}}, // LoadID 31
	{"Et", false, 1.00, PCV_TruckerCargoTrailer, {43}, {44, 49, 50, 51, 52, 53}}, // LoadID 32
	{"Kagit", false, 1.00, PCV_TruckerCargoTrailer, {14}, {9, 62}}, // LoadID 33

	// Loads for cement truck
	{"Cimento", false, 1.00, PCV_TruckerCementTruck, {12}, {1, 2, 3, 4}}, // LoadID 34

	// Loads for truckers without trailer
	{"Yiyecek", false, 0.60, PCV_TruckerNoTrailer, {7, 44, 47, 48}, {49, 50, 51, 52, 53}}, // LoadID 35
	{"Icecek", false, 0.60, PCV_TruckerNoTrailer, {15, 54, 55}, {49, 50, 51, 52, 53}}, // LoadID 36
	{"Sise Bira", true, 0.60, PCV_TruckerNoTrailer, {56}, {57, 58, 59, 60, 61}}, // LoadID 37
	{"Luks Esya", false, 0.60, PCV_TruckerNoTrailer, {24, 55}, {47, 48, 50}}, // LoadID 38
	{"Elektronik", true, 0.60, PCV_TruckerNoTrailer, {7, 24, 48}, {50, 51, 62, 63}}, // LoadID 39
	{"Spor Ekipmani", false, 0.60, PCV_TruckerNoTrailer, {47, 48}, {50, 53, 57}}, // LoadID 40
	{"Pano", false, 0.60, PCV_TruckerNoTrailer, {10}, {4, 7, 18, 22}}, // LoadID 41
	{"Insaat Malzemesi", false, 0.60, PCV_TruckerNoTrailer, {4}, {1, 2, 3, 5}}, // LoadID 42
	{"Kurbanlik", false, 0.60, PCV_TruckerNoTrailer, {21, 22}, {23, 43, 47}}, // LoadID 43
	{"Et", false, 0.60, PCV_TruckerNoTrailer, {43}, {44, 49, 50, 51, 52, 53}}, // LoadID 44
	{"Kagit", false, 0.60, PCV_TruckerNoTrailer, {14}, {9, 62}}, // LoadID 45

	// Loads for pilots
	{"Yolcu", false, 1.00, PCV_PilotPlane, {121, 122, 125, 126, 130, 131, 134}, {121, 122, 125, 126, 130, 131, 134}}, // LoadID 46
	{"Kargo", false, 1.00, PCV_PilotPlane, {123, 124, 127, 128, 129, 132, 133, 135}, {123, 124, 127, 128, 129, 132, 133, 135}}, // LoadID 47
	{"Yolcu", false, 1.00, PCV_PilotHelicopter, {121, 122, 125, 126, 130, 131, 134}, {121, 122, 125, 126, 130, 131, 134}}, // LoadID 48

	// Loads for mafia
	{"Yiyecek", false, 1.50, PCV_MafiaVan, {7, 44, 47, 48}, {49, 50, 51, 52, 53}}, // LoadID 49
	{"Icecek", false, 1.50, PCV_MafiaVan, {15, 54, 55}, {49, 50, 51, 52, 53}}, // LoadID 50
	{"Sise Bira", true, 1.50, PCV_MafiaVan, {56}, {57, 58, 59, 60, 61}}, // LoadID 51
	{"Luks Esya", false, 1.50, PCV_MafiaVan, {24, 55}, {47, 48, 50}}, // LoadID 52
	{"Elektronik", true, 1.50, PCV_MafiaVan, {7, 24, 48}, {50, 51, 62, 63}}, // LoadID 53
	{"Spor Ekipmani", false, 1.50, PCV_MafiaVan, {47, 48}, {50, 53, 57}}, // LoadID 54
	{"Pano", false, 1.50, PCV_MafiaVan, {10}, {4, 7, 18, 22}}, // LoadID 55
	{"Insaat Malzemesi", false, 1.50, PCV_MafiaVan, {4}, {1, 2, 3, 5}}, // LoadID 56
	{"Kurbanlik", false, 1.50, PCV_MafiaVan, {21, 22}, {23, 43, 47}}, // LoadID 57
	{"Et", false, 1.50, PCV_MafiaVan, {43}, {44, 49, 50, 51, 52, 53}}, // LoadID 58
	{"Kagit", false, 1.50, PCV_MafiaVan, {14}, {9, 62}} // LoadID 59
};



// This function returns a string (array) that holds all ProductID's that are linked to a certain vehicletype (and player class)
stock Product_GetList(PCV_Needed, &NumProducts)
{
	// Setup local variables
	new ProductList[50];

	// Loop through all products
	for (new i; i < sizeof(ALoads); i++)
	{
		// Check if there aren't 50 products found (and added to the ProductList) yet
		if (NumProducts < 50)
		{
			// Check if the current product has the same PCV_Needed
			if (ALoads[i][PCV_Required] == PCV_Needed)
			{
				// Add the ProductID to the ProductList
				ProductList[NumProducts] = i;
				// Increase the counter NumProducts
				NumProducts++;
			}
		}
	}

	// Return the ProductList
	return ProductList;
}

// This function returns a random products for the given vehicletype (and player class)
stock Product_GetRandom(PCV_Needed)
{
	// Setup local variables
	new ProductList[50], NumProducts;

	// Get the entire product-list for this vehicle and class, and also the amount of products
	ProductList = Product_GetList(PCV_Needed, NumProducts);

	// Get a random product from this list and return it
	return ProductList[random(NumProducts)];
}

// This function returns a random startlocation from the given product (load)
stock Product_GetRandomStartLoc(ProductID)
{
	// Setup local variables
	new NumProducts;

	// First find out how many valid start-locations there are in this product
	for (new i; i < 30; i++)
	{
		// If the product has a valid location in this index
		if (ALoads[ProductID][FromLocations][i] != 0)
		    NumProducts++; // Count the number of valid start-locations
		else // A start-location with ID 0 has been found (dummy-location)
		    break; // Stop counting
	}

	// Return the LocationID that's stored at a random index
	return ALoads[ProductID][FromLocations][random(NumProducts)];
}

// This function returns a random endlocation from the given product (load)
stock Product_GetRandomEndLoc(ProductID)
{
	// Setup local variables
	new NumProducts;

	// First find out how many valid end-locations there are in this product
	for (new i; i < 30; i++)
	{
		// If the product has a valid location in this index
		if (ALoads[ProductID][ToLocations][i] != 0)
		    NumProducts++; // Count the number of valid end-locations
		else // An end-location with ID 0 has been found (dummy-location)
		    break; // Stop counting
	}

	// Return the LocationID that's stored at a random index
	return ALoads[ProductID][ToLocations][random(NumProducts)];
}

// BoomBox Sistemi
#define MAX_BOOMBOX                         50

enum BoomBoxInfos
{
	BBURL[100],
	BBSahip[50],
	Float:BBMesafe,
	Float:BBX,
	Float:BBY,
	Float:BBZ,
	BBInt,
	BBObj,
	Text3D:BB3D,
	BBExist
};

new BoomBoxlar[MAX_BOOMBOX][BoomBoxInfos];

new Iterator:BBs<MAX_BOOMBOX>;

new DinlenilenBoomBox[MAX_PLAYERS];

new EditingBBObject[MAX_PLAYERS];

new OyuncuBB[MAX_PLAYERS];

// -- RefreshPlayerBoomBox
RefreshPlayerBoomBox(playerid)
{
	new Sonuc = -1, Float:oX, Float:oY, Float:oZ, interior;
	GetPlayerPos(playerid, oX, oY, oZ);
	interior = GetPlayerInterior(playerid);

	foreach(new i : BBs)
	{
	    if(BoomBoxlar[i][BBExist] == 1)
	    {
 			new Float:Mesafe = floatsqroot( (oX - BoomBoxlar[i][BBX]) * (oX - BoomBoxlar[i][BBX]) + (oY - BoomBoxlar[i][BBY]) * (oY - BoomBoxlar[i][BBY]) );
			if(Mesafe <= (BoomBoxlar[i][BBMesafe]) && interior == BoomBoxlar[i][BBInt])
	        {
	            Sonuc = i;

				if(DinlenilenBoomBox[playerid] == i) break;

				if(!strcmp(BoomBoxlar[i][BBURL], "-", true))
				{

				}else{
					PlayAudioStreamForPlayer(playerid, BoomBoxlar[i][BBURL], BoomBoxlar[i][BBX], BoomBoxlar[i][BBY], BoomBoxlar[i][BBZ], BoomBoxlar[i][BBMesafe]);
				}

				break;
	        }
	    }
	}

	if(DinlenilenBoomBox[playerid] != -1 && Sonuc == -1) { StopAudioStreamForPlayer(playerid); }
	DinlenilenBoomBox[playerid] = Sonuc;
}

// -- PlayASongInBoomBox
PlayASongInBoomBox(BoomBoxID, URL[])
{
	format(BoomBoxlar[BoomBoxID][BBURL], 100, URL);

	foreach(new i : Player)
	{
	    if(DinlenilenBoomBox[i] == BoomBoxID)
	    {
            StopAudioStreamForPlayer(i);
            PlayAudioStreamForPlayer(i, BoomBoxlar[BoomBoxID][BBURL], BoomBoxlar[BoomBoxID][BBX], BoomBoxlar[BoomBoxID][BBY], BoomBoxlar[BoomBoxID][BBZ], BoomBoxlar[BoomBoxID][BBMesafe]);
	    }
	}
}

// -- StopSongInBoomBox
StopSongInBoomBox(BoomBoxID)
{
	format(BoomBoxlar[BoomBoxID][BBURL], 100, "-");

	foreach(new i : Player)
	{
	    if(DinlenilenBoomBox[i] == BoomBoxID)
	    {
            StopAudioStreamForPlayer(i);
	    }
	}
}

// -- CreateBoomBox
CreateBoomBox(owner[], Float:distance, Float:X, Float:Y, Float:Z, Float:rX, Float:rY, Float:rZ, Int)
{
	new CreatedID;

	CreatedID = Iter_Free(BBs);

	Iter_Add(BBs, CreatedID);
	BoomBoxlar[CreatedID][BBExist] = 1;

	format(BoomBoxlar[CreatedID][BBURL], 100, "-");
	format(BoomBoxlar[CreatedID][BBSahip], 50, owner);
	BoomBoxlar[CreatedID][BBMesafe] = distance;
	BoomBoxlar[CreatedID][BBX] = X;
	BoomBoxlar[CreatedID][BBY] = Y;
	BoomBoxlar[CreatedID][BBZ] = Z;
	BoomBoxlar[CreatedID][BBInt] = Int;

	BoomBoxlar[CreatedID][BBObj] = CreateDynamicObject(2226, BoomBoxlar[CreatedID][BBX], BoomBoxlar[CreatedID][BBY], BoomBoxlar[CreatedID][BBZ], rX, rY, rZ, 0, BoomBoxlar[CreatedID][BBInt]);

	new Yazi[256];
	format(Yazi, 256, "{ADFF2F}BoomBox\n \n{F8F8FF}Sahip : {ADFF2F}%s\n \n{ADFF2F}/boombox", owner);
	BoomBoxlar[CreatedID][BB3D] = Create3DTextLabel(Yazi, -1, BoomBoxlar[CreatedID][BBX], BoomBoxlar[CreatedID][BBY], BoomBoxlar[CreatedID][BBZ], 7.5, 0);

	return CreatedID;
}

// -- DestroyBoomBox
DestroyBoomBox(BoomBoxID)
{
	Iter_Remove(BBs, BoomBoxID);
	BoomBoxlar[BoomBoxID][BBExist] = 0;

	DestroyDynamicObject(BoomBoxlar[BoomBoxID][BBObj]);
	Delete3DTextLabel(BoomBoxlar[BoomBoxID][BB3D]);

	StopSongInBoomBox(BoomBoxID);
}

// -- IsObjectInBoomBoxArea
IsObjectInBoomBoxArea(objectid, Float:distance, interior)
{
	new Sonuc, Float:oX, Float:oY, Float:oZ, Float:Mesafe;
	GetObjectPos(objectid, oX, oY, oZ);

	foreach(new i : BBs)
	{
	    if(BoomBoxlar[i][BBExist] == 1)
	    {
			Mesafe = floatsqroot( (oX - BoomBoxlar[i][BBX]) * (oX - BoomBoxlar[i][BBX]) + (oY - BoomBoxlar[i][BBY]) * (oY - BoomBoxlar[i][BBY]) );
			if(Mesafe < (distance + BoomBoxlar[i][BBMesafe]) && interior == BoomBoxlar[i][BBInt])
			{
			    Sonuc = 1;
				break;
			}
	    }
	}

	return Sonuc;
}


// -- /boombox
CMD:boombox(playerid, params[])
{
	if(APlayerData[playerid][BoomBox] == 0) return SendClientMessage(playerid, -1, "{FF0000}Sizin Bir BoomBox'unuz Yok!");

	new tmp[256], idx;
	tmp = strtok(params, idx);

	if(!strlen(tmp)) return SendClientMessage(playerid, -1, "{FF0000}Kullaným: \"/boombox\" <YereKoy/YerdenAl/MuzikAc/MuzikDurdur>");
	if(!strcmp("YereKoy", tmp, true))
	{
	    if(OyuncuBB[playerid] != -1) return SendClientMessage(playerid, -1, "{FF0000}BoomBox'unuz Zaten Yerde!");
	    new Float:oX, Float:oY, Float:oZ;
	    GetPlayerPos(playerid, oX, oY, oZ);

		EditingBBObject[playerid] = CreateObject(2226, oX+0.5, oY+0.5, oZ, 0.0, 0.0, 0.0, 50.0);
		EditObject(playerid, EditingBBObject[playerid]);

		SendClientMessage(playerid, 0xFF00AA, "BoomBox'u Ýstediðiniz Bir Yere Yerleþtiriniz ve Disket Sembolüne Týklayýnýz.");
	}else if(!strcmp("YerdenAl", tmp, true))
	{
	    if(OyuncuBB[playerid] == -1) return SendClientMessage(playerid, -1, "{FF0000}BoomBox'unuzu Yerden Alabilmeniz için Onun Yerde Olmasý Gerekiyor!");
		if(!IsPlayerInRangeOfPoint(playerid, 5.0, BoomBoxlar[ OyuncuBB[playerid] ][BBX], BoomBoxlar[ OyuncuBB[playerid] ][BBY], BoomBoxlar[ OyuncuBB[playerid] ][BBZ])) return SendClientMessage(playerid, -1, "{FF0000}BoomBox'unuzu Yerden Alabilmek için Onun Yakýnýnda Olmalýsýnýz!");
		DestroyBoomBox(OyuncuBB[playerid]);
		OyuncuBB[playerid] = -1;
	}else if(!strcmp("MuzikAc", tmp, true))
	{
		if(OyuncuBB[playerid] == -1) return SendClientMessage(playerid, -1, "{FF0000}BoomBox'unuzda Müzik Açabilmek için Onu Yere Koymanýz Gerekiyor!");
		tmp = strrest(params, idx);

		if(!strlen(tmp)) return SendClientMessage(playerid, -1, "{FF0000}Kullaným: \"/boombox\" <MuzikAc><Müzik URL>");
		PlayASongInBoomBox(OyuncuBB[playerid], tmp);
		SendClientMessage(playerid, 0xFF00AA, "BoomBox'unuzda Yeni Müzik Açtýnýz.");
	}else if(!strcmp("MuzikDurdur", tmp, true))
	{
	    if(OyuncuBB[playerid] == -1) return SendClientMessage(playerid, -1, "{FF0000}BoomBox'unuzda Müziði Durdurabilmek için Onun Yerde Olmasý Gerekiyor!");
        StopSongInBoomBox(OyuncuBB[playerid]);
        SendClientMessage(playerid, 0xFF00AA, "BoomBox'unuzda Çalan Müziði Durdurdunuz.");
	}
	return 1;
}


// -- /market
CMD:market(playerid, params[])
{
	if( (GetPlayerInterior(playerid) == 6 && IsPlayerInRangeOfPoint(playerid, 5.0, -23.4403, -55.5372, 1003.5469)) || (GetPlayerInterior(playerid) == 18 && IsPlayerInRangeOfPoint(playerid, 5.0, -28.0039, -89.8711, 1003.5469)) )
	{
	    ShowPlayerDialog(playerid, DIALOG_MARKET, DIALOG_STYLE_LIST, "{ADFF2F}Market", "{F8F8FF}BoomBox\t\t{ADFF2F}2500$", "Satýn Al", "Ýptal");
	} else SendClientMessage(playerid, -1, "{FF0000}Bu komutu sadece 7/24 marketlerde kullanabilirsiniz!");
	return 1;
}


// Araç Modelleri
new VehNames[][] =
{
    "Landstalker", "Bravura", "Buffalo", "Linerunner", "Perrenial", "Sentinel",
	"Dumper", "Firetruck", "Trashmaster", "Stretch", "Manana", "Infernus",
	"Voodoo", "Pony", "Mule", "Cheetah", "Ambulance", "Leviathan", "Moonbeam",
    "Esperanto", "Taxi", "Washington", "Bobcat", "Whoopee", "BFInjection",
	"Hunter", "Premier", "Enforcer", "Securicar", "Banshee", "Predator", "Bus",
	"Rhino", "Barracks", "Hotknife", "Trailer", "Previon", "Coach", "Cabbie",
	"Stallion", "Rumpo", "RC Bandit", "Romero", "Packer", "Monster", "Admiral",
	"Squalo", "Seasparrow", "Pizzaboy", "Tram", "Trailer", "Turismo", "Speeder",
	"Reefer", "Tropic", "Flatbed", "Yankee", "Caddy", "Solair", "BerkleysRCVan",
	"Skimmer", "PCJ-600", "Faggio", "Freeway", "RCBaron", "RCRaider", "Glendale",
	"Oceanic","Sanchez", "Sparrow", "Patriot", "Quad", "Coastguard", "Dinghy",
	"Hermes", "Sabre", "Rustler", "ZR-350", "Walton", "Regina", "Comet", "BMX",
	"Burrito", "Camper", "Marquis", "Baggage", "Dozer", "Maverick", "NewsChopper",
	"Rancher", "FBI Rancher", "Virgo", "Greenwood", "Jetmax", "Hotring", "Sandking",
	"BlistaCompact", "PoliceMaverick", "Boxvillde", "Benson", "Mesa", "RCGoblin",
	"HotringRacerA", "HotringRacerB", "BloodringBanger", "Rancher", "SuperGT",
	"Elegant", "Journey", "Bike", "MountainBike", "Beagle", "Cropduster", "Stunt",
 	"Tanker", "Roadtrain", "Nebula", "Majestic", "Buccaneer", "Shamal", "Hydra",
 	"FCR-900", "NRG-500", "HPV1000", "CementTruck", "TowTruck", "Fortune",
 	"Cadrona", "FBITruck", "Willard", "Forklift", "Tractor", "Combine", "Feltzer",
 	"Remington", "Slamvan", "Blade", "Freight", "Streak", "Vortex", "Vincent",
    "Bullet", "Clover", "Sadler", "Firetruck", "Hustler", "Intruder", "Primo",
	"Cargobob", "Tampa", "Sunrise", "Merit", "Utility", "Nevada", "Yosemite",
	"Windsor", "Monster", "Monster", "Uranus", "Jester", "Sultan", "Stratium",
	"Elegy", "Raindance", "RCTiger", "Flash", "Tahoma", "Savanna", "Bandito",
    "FreightFlat", "StreakCarriage", "Kart", "Mower", "Dune", "Sweeper",
	"Broadway", "Tornado", "AT-400", "DFT-30", "Huntley", "Stafford", "BF-400",
	"News Van", "Tug", "Trailer", "Emperor", "Wayfarer", "Euros", "Hotdog", "Club",
	"FreightBox", "Trailer", "Andromada", "Dodo", "RCCam", "Launch", "LSPD",
 	"SFPD", "LVPD", "PoliceRanger", "Picador", "S.W.A.T", "Alpha",
 	"Phoenix", "Glendale", "Sadler", "Luggage", "Luggage", "Stairs", "Boxville",
 	"Tiller", "UtilityTrailer"
};

GetVehicleModelIDFromName(vehname[])
{
	new Result = -1;

	for(new BModel; BModel < 211; BModel++)
	{
	    if(!strfind(VehNames[BModel],vehname,true))
	    {
	        Result = BModel+400;
	        break;
		}
	}

	return Result;
}


// ************************************************************************************************************************************************************
// PPC_DefCars
// ************************************************************************************************************************************************************

enum TCar
{
	CarName[50], // Holds the name of the car
	CarModel // Holds the model-ID of the car
}

new ACars[][TCar] =
{
	{"Admiral", 445},			{"Alpha", 602},             {"Ambulance", 416},			{"Baggage", 485},           // ID 0, 1, 2, 3
	{"Bandito", 568},			{"Banshee", 429},			{"Barracks", 433},			{"Benson", 499},            // ID 4, 5, 6, 7
	{"Berkley's RC Van", 459},	{"BF Injection", 424},  	{"Blade", 536},				{"Blista Compact", 496},    // ID 8, 9, 10, 11
	{"Bloodring Banger", 504},	{"Bobcat", 422},			{"Boxville 1", 498},		{"Boxville 2", 609},        // ID 12, 13, 14, 15
	{"Bravura", 401},			{"Broadway", 575},			{"Buccaneer", 518},			{"Buffalo", 402},           // ID 16, 17, 18, 19
	{"Bullet", 541},            {"Burrito", 482},			{"Bus", 431},				{"Cabbie", 438},            // ID 20, 21, 22, 23
	{"Caddy", 457},				{"Cadrona", 527},   		{"Camper", 483},			{"Cement Truck", 524},      // ID 24, 25, 26, 27
	{"Cheetah", 415},			{"Clover", 542},			{"Club", 589},				{"Coach", 437},             // ID 28, 29, 30, 31
	{"Combine Harvester", 532},	{"Comet", 480},				{"DFT-30", 578},			{"Dozer", 486},             // ID 32, 33, 34, 35
	{"Dumper", 406},            {"Dune", 573},				{"Elegant", 507},			{"Elegy", 562},             // ID 36, 37, 38, 39
	{"Emperor", 585},			{"Enforcer", 427},			{"Esperanto", 419},			{"Euros", 587},             // ID 40, 41, 42, 43
	{"FBI Rancher", 490},		{"FBI Truck", 528},			{"Feltzer", 533},			{"Firetruck", 407},         // ID 44, 45, 46, 47
	{"Firetruck LA", 544},		{"Flash", 565},				{"Flatbed", 455},			{"Forklift", 530},          // ID 48, 49, 50, 51
	{"Fortune", 526},			{"Glendale", 466},			{"Greenwood", 492},			{"Hermes", 474},            // ID 52, 53, 54, 55
	{"Hotdog", 588},			{"Hotknife", 434},			{"Hotring Racer 1", 494},	{"Hotring Racer 2", 502},   // ID 56, 57, 58, 59
	{"Hotring Racer 3", 503},	{"Huntley", 579},			{"Hustler", 545},			{"Infernus", 411},          // ID 60, 61, 62, 63
	{"Intruder", 546},			{"Jester", 559},            {"Journey", 508},			{"Kart", 571},              // ID 64, 65, 66, 67
	{"Landstalker", 400},       {"Linerunner", 403},		{"Majestic", 517},			{"Manana", 410},            // ID 68, 69, 70, 71
	{"Merit", 551},				{"Mesa", 500},				{"Monster", 444},			{"Monster A", 556},         // ID 72, 73, 74, 75
	{"Monster B", 557},         {"Moonbeam", 418},			{"Mower", 572},				{"Mr Whoopee", 423},        // ID 76, 77, 78, 79
	{"Mule", 414},  			{"Nebula", 516},            {"Newsvan", 582},			{"Oceanic", 467},           // ID 80, 81, 82, 83
	{"Packer", 443},			{"Patriot", 470},			{"Perenniel", 404},			{"Phoenix", 603},           // ID 84, 85, 86, 87
	{"Picador", 600},			{"Police Car (LSPD)", 596},	{"Police Car (LVPD)", 598},	{"Police Car (SFPD)", 597}, // ID 88, 89, 90, 91
	{"Police Ranger", 599},		{"Pony", 413},				{"Premier", 426},			{"Previon", 436},           // ID 92, 93, 94, 95
	{"Primo", 547},				{"Rancher 1", 489},			{"Rancher 2", 505},			{"Regina", 479},            // ID 96, 97, 98, 99
	{"Remington", 534},			{"Rhino", 432},             {"Roadtrain", 515},			{"Romero", 442},            // ID 100, 101, 102, 103
	{"Rumpo", 440},				{"Sabre", 475},				{"Sadler", 543},			{"Sandking", 495},          // ID 104, 105, 106, 107
	{"Savanna", 567},			{"Securicar", 428},			{"Sentinel", 405},			{"Slamvan", 535},           // ID 108, 109, 110, 111
	{"Solair", 458},			{"Stafford", 580},			{"Stallion", 439},			{"Stratum", 561},           // ID 112, 113, 114, 115
	{"Stretch", 409},			{"Sultan", 560},			{"Sunrise", 550},			{"Super GT", 506},          // ID 116, 117, 118, 119
	{"S.W.A.T.", 601},			{"Sweeper", 574},			{"Tahoma", 566},			{"Tampa", 549},             // ID 120, 121, 122, 123
	{"Tanker", 514},			{"Taxi", 420},				{"Tornado", 576},			{"Towtruck", 525},          // ID 124, 125, 126, 127
	{"Tractor", 531},			{"Trashmaster", 408},		{"Tug", 583},				{"Turismo", 451},           // ID 128, 129, 130, 131
	{"Uranus", 558},            {"Utility Van", 552},		{"Vincent", 540},			{"Virgo", 491},             // ID 132, 133, 134, 135
	{"Voodoo", 412},			{"Walton", 478},			{"Washington", 421},		{"Willard", 529},           // ID 136, 137, 138, 139
	{"Windsor", 555},		    {"Yankee", 456},            {"Yosemite", 554},			{"ZR-350", 477}             // ID 140, 141, 142, 143
};

// This function creates a list of cars, starting from the FirstCar and automatically shows the dialog
CarList_Create(playerid)
{
	// Setup local variables
	new Counter, CarList[500], DialogTitle[128];

	// Only add 10 cars to the list, starting from the FirstCar
	for (new i = APlayerData[playerid][DialogCarFirstCar]; i < sizeof(ACars); i++)
	{
		// Increase a counter (which holds the number of cars that have been added to the list
		Counter++;

		// Check if the maximum hasn't been reached yet
		if (Counter <= 10)
		{
		    // Add the carname to the list
		    if (strlen(CarList) == 0) // If this is the start of the list (no cars have been added yet)
				format(CarList, 500, "%s", ACars[i][CarName]); // Add the name of the car at the start of the carlist
		    else
				format(CarList, 500, "%s%s%s", CarList, "\n", ACars[i][CarName]); // Add the name of the next car to the list on the next line
		}
		else // 10 cars have been added to the list (now Counter = 11)
		{
		    // Add an empty line and "Next..." to the list to let the player know there are more cars to choose from
			format(CarList, 500, "%s%s%s", CarList, "\n \n", TXT_DialogEntryNext);
			// Also stop the For-loop
			break;
		}
	}

	// Construct the title for the dialog (to include a page number)
	format(DialogTitle, 128, TXT_DialogCarTitle, (APlayerData[playerid][DialogCarFirstCar] / 10) + 1);
	// Ask which car the player wants to have by showing the dialog
	ShowPlayerDialog(playerid, DialogCar, DIALOG_STYLE_LIST, DialogTitle, CarList, TXT_DialogButtonSpawn, TXT_DialogButtonCancel);

	return 1;
}

// ************************************************************************************************************************************************************
// PPC_DefPlanes
// ************************************************************************************************************************************************************

enum TPlane
{
	PlaneName[50], // Holds the name of the Plane
	PlaneModel // Holds the model-ID of the Plane
}

new APlanes[][TPlane] =
{
	{"Andromada", 592},		{"AT400", 577}, 	{"Beagle", 511},				{"Cargobob", 548},          // ID 0, 1, 2, 3
	{"Cropduster", 512},	{"Dodo", 593},		{"Hunter", 425},				{"Hydra", 520},             // ID 4, 5, 6, 7
	{"Leviathan", 417},		{"Maverick", 487},	{"Nevada", 553},				{"Police Maverick", 497},   // ID 8, 9, 10, 11
	{"Raindance", 563},		{"Rustler", 476},	{"SAN News Maverick", 488},		{"Seasparrow", 447},        // ID 12, 13, 14, 15
	{"Shamal", 519},		{"Skimmer", 460},	{"Sparrow", 469},				{"Stuntplane", 513}         // ID 16, 17, 18, 19
};

// This function creates a list of Planes, starting from the FirstPlane and automatically shows the dialog
PlaneList_Create(playerid)
{
	// Setup local variables
	new Counter, PlaneList[500], DialogTitle[128];

	// Only add 10 Planes to the list, starting from the FirstPlane
	for (new i = APlayerData[playerid][DialogPlaneFirstPlane]; i < sizeof(APlanes); i++)
	{
		// Increase a counter (which holds the number of Planes that have been added to the list
		Counter++;

		// Check if the maximum hasn't been reached yet
		if (Counter <= 10)
		{
		    // Add the Planename to the list
		    if (strlen(PlaneList) == 0) // If this is the start of the list (no Planes have been added yet)
				format(PlaneList, 500, "%s", APlanes[i][PlaneName]); // Add the name of the Plane at the start of the Planelist
		    else
				format(PlaneList, 500, "%s%s%s", PlaneList, "\n", APlanes[i][PlaneName]); // Add the name of the next Plane to the list on the next line
		}
		else // 10 Planes have been added to the list (now Counter = 11)
		{
		    // Add an empty line and "Next..." to the list to let the player know there are more Planes to choose from
			format(PlaneList, 500, "%s%s%s", PlaneList, "\n \n", TXT_DialogEntryNext);
			// Also stop the For-loop
			break;
		}
	}

	// Construct the title for the dialog (to include a page number)
	format(DialogTitle, 128, TXT_DialogPlaneTitle, (APlayerData[playerid][DialogPlaneFirstPlane] / 10) + 1);
	// Ask which Plane the player wants to have by showing the dialog
	ShowPlayerDialog(playerid, DialogPlane, DIALOG_STYLE_LIST, DialogTitle, PlaneList, TXT_DialogButtonSpawn, TXT_DialogButtonCancel);

	return 1;
}

// ************************************************************************************************************************************************************
// PPC_DefTrailers
// ************************************************************************************************************************************************************

enum TTrailer
{
	TrailerName[50], // Holds the name of the Trailer
	TrailerModel // Holds the model-ID of the Trailer
}

new ATrailers[][TTrailer] =
{
	{"Article Trailer", 435},	{"Article Trailer 2", 450}, 	{"Article Trailer 3", 591},		{"Baggage Trailer A", 606},	// ID 0, 1, 2, 3
	{"Baggage Trailer B", 607},	{"Farm Trailer", 610},			{"Petrol Trailer", 584},		{"Stairs Trailer", 608},    // ID 4, 5, 6, 7
	{"Utility Trailer", 611}                                                                                                // ID 8
};

// This function creates a list of Trailers, starting from the FirstTrailer and automatically shows the dialog
TrailerList_Create(playerid)
{
	// Setup local variables
	new Counter, TrailerList[500], DialogTitle[128];

	// Only add 10 Trailers to the list, starting from the FirstTrailer
	for (new i = APlayerData[playerid][DialogTrailerFirstTrailer]; i < sizeof(ATrailers); i++)
	{
		// Increase a counter (which holds the number of Trailers that have been added to the list
		Counter++;

		// Check if the maximum hasn't been reached yet
		if (Counter <= 10)
		{
		    // Add the Trailername to the list
		    if (strlen(TrailerList) == 0) // If this is the start of the list (no Trailers have been added yet)
				format(TrailerList, 500, "%s", ATrailers[i][TrailerName]); // Add the name of the Trailer at the start of the Trailerlist
		    else
				format(TrailerList, 500, "%s%s%s", TrailerList, "\n", ATrailers[i][TrailerName]); // Add the name of the next Trailer to the list on the next line
		}
		else // 10 Trailers have been added to the list (now Counter = 11)
		{
		    // Add an empty line and "Next..." to the list to let the player know there are more Trailers to choose from
			format(TrailerList, 500, "%s%s%s", TrailerList, "\n \n", TXT_DialogEntryNext);
			// Also stop the For-loop
			break;
		}
	}

	// Construct the title for the dialog (to include a page number)
	format(DialogTitle, 128, TXT_DialogTrailerTitle, (APlayerData[playerid][DialogTrailerFirstTrailer] / 10) + 1);
	// Ask which Trailer the player wants to have by showing the dialog
	ShowPlayerDialog(playerid, DialogTrailer, DIALOG_STYLE_LIST, DialogTitle, TrailerList, TXT_DialogButtonSpawn, TXT_DialogButtonCancel);

	return 1;
}

// ************************************************************************************************************************************************************
// PPC_DefBuyableVehicles
// ************************************************************************************************************************************************************

#define VClassBike          1
#define VClassBoat          2
#define VClassConvertible   3
#define VClassHelicopter    4
#define VClassIndustrial    5
#define VClassLowRider      6
#define VClassOffRoad       7
#define VClassPlane         8
#define VClassPublic        9
#define VClassRCVehicle     10
#define VClassSaloons       11
#define VClassSportCar      12
#define VClassStationCar    13
#define VClassTrailer       14
#define VClassUnique        15

enum TBuyableVehicle
{
	CarName[50], // Holds the name of the vehicle
	VehicleClass, // Holds the ID of the vehicleclass
	CarModel, // Holds the model-ID of the vehicle
	Price // Holds the price for the vehicle (renting it will be 10% of this price)
}

new ABuyableVehicles[][TBuyableVehicle] =
{
	{"Admiral", VClassSaloons, 445, 50000},
	{"Alpha", VClassSportCar, 602, 50000},
	{"Ambulance", VClassPublic, 416, 50000},
	{"Andromada", VClassPlane, 592, 50000},
	{"Article Trailer", VClassTrailer, 591, 50000},
//	{"AT400", VClassPlane, 577, 50000},
	{"Baggage", VClassUnique, 485, 50000},
	{"Baggage Trailer A", VClassTrailer, 606, 50000},
	{"Baggage Trailer B", VClassTrailer, 607, 50000},
	{"Bandito", VClassOffRoad, 568, 50000},
	{"Banshee", VClassSportCar, 429, 50000},
	{"Barracks", VClassPublic, 433, 50000},
	{"Beagle", VClassPlane, 511, 50000},
	{"Benson", VClassIndustrial, 499, 50000},
	{"Berkley's RC Van", VClassIndustrial, 459, 50000},
	{"BF Injection", VClassOffRoad, 424, 50000},
	{"BF-400", VClassBike, 581, 50000},
	{"Bike", VClassBike, 509, 50000},
	{"Blade", VClassLowRider, 536, 50000},
	{"Blista Compact", VClassSportCar, 496, 50000},
	{"Bloodring Banger", VClassSaloons, 504, 50000},
	{"BMX", VClassBike, 481, 50000},
	{"Bobcat", VClassIndustrial, 422, 50000},
	{"Boxville 1", VClassIndustrial, 498, 50000},
	{"Boxville 2", VClassIndustrial, 609, 50000},
	{"Bravura", VClassSaloons, 401, 50000},
	{"Broadway", VClassLowRider, 575, 50000},
//	{"Brownstreak (train)", VClassUnique, 538, 50000},
	{"Buccaneer", VClassSaloons, 518, 50000},
	{"Buffalo", VClassSportCar, 402, 50000},
	{"Bullet", VClassSportCar, 541, 50000},
	{"Burrito", VClassIndustrial, 482, 50000},
	{"Bus", VClassPublic, 431, 50000},
	{"Cabbie", VClassPublic, 438, 50000},
	{"Caddy", VClassUnique, 457, 50000},
	{"Cadrona", VClassSaloons, 527, 50000},
	{"Camper", VClassUnique, 483, 50000},
	{"Cargo Trailer", VClassTrailer, 435, 50000},
	{"Cargobob", VClassHelicopter, 548, 50000},
	{"Cement Truck", VClassIndustrial, 524, 50000},
	{"Cheetah", VClassSportCar, 415, 50000},
	{"Clover", VClassSaloons, 542, 50000},
	{"Club", VClassSportCar, 589, 50000},
	{"Coach", VClassPublic, 437, 50000},
	{"Coastguard", VClassBoat, 472, 50000},
	{"Combine Harvester", VClassUnique, 532, 50000},
	{"Comet", VClassConvertible, 480, 50000},
	{"Cropduster", VClassPlane, 512, 50000},
	{"DFT-30", VClassIndustrial, 578, 50000},
	{"Dinghy", VClassBoat, 473, 50000},
	{"Dodo", VClassPlane, 593, 50000},
	{"Dozer", VClassUnique, 486, 50000},
	{"Dumper", VClassUnique, 406, 50000},
	{"Dune", VClassOffRoad, 573, 50000},
	{"Elegant", VClassSaloons, 507, 50000},
	{"Elegy", VClassSaloons, 562, 50000},
	{"Emperor", VClassSaloons, 585, 50000},
	{"Enforcer", VClassPublic, 427, 50000},
	{"Esperanto", VClassSaloons, 419, 50000},
	{"Euros", VClassSportCar, 587, 50000},
	{"Faggio", VClassBike, 462, 50000},
	{"Farm Trailer", VClassTrailer, 610, 50000},
	{"FBI Rancher", VClassPublic, 490, 50000},
	{"FBI Truck", VClassPublic, 528, 50000},
	{"FCR-900", VClassBike, 521, 50000},
	{"Feltzer", VClassConvertible, 533, 50000},
	{"Firetruck", VClassPublic, 407, 50000},
	{"Firetruck LA", VClassPublic, 544, 50000},
	{"Flash", VClassSportCar, 565, 50000},
	{"Flatbed", VClassIndustrial, 455, 50000},
	{"Fluids Trailer", VClassTrailer, 584, 50000},
	{"Forklift", VClassUnique, 530, 50000},
	{"Fortune", VClassSaloons, 526, 50000},
	{"Freeway", VClassBike, 463, 50000},
//	{"Freight (train)", VClassUnique, 537, 50000},
//	{"Freight Box Trailer (train)", VClassTrailer, 590, 50000},
//	{"Freight Flat Trailer (train)", VClassTrailer, 569, 50000},
	{"Glendale", VClassSaloons, 466, 50000},
	{"Glendale Shit", VClassSaloons, 604, 50000},
	{"Greenwood", VClassSaloons, 492, 50000},
	{"Hermes", VClassSaloons, 474, 50000},
	{"Hotdog", VClassUnique, 588, 50000},
	{"Hotknife", VClassUnique, 434, 50000},
	{"Hotring Racer 1", VClassSportCar, 494, 50000},
	{"Hotring Racer 2", VClassSportCar, 502, 50000},
	{"Hotring Racer 3", VClassSportCar, 503, 50000},
	{"HPV1000", VClassPublic, 523, 50000},
//	{"Hunter", VClassHelicopter, 425, 50000},
	{"Huntley", VClassOffRoad, 579, 50000},
	{"Hustler", VClassUnique, 545, 50000},
//	{"Hydra", VClassPlane, 520, 50000},
	{"Infernus", VClassSportCar, 411, 50000},
	{"Intruder", VClassSaloons, 546, 50000},
	{"Jester", VClassSportCar, 559, 50000},
	{"Jetmax", VClassBoat, 493, 50000},
	{"Journey", VClassUnique, 508, 50000},
	{"Kart", VClassUnique, 571, 50000},
	{"Landstalker", VClassOffRoad, 400, 50000},
	{"Launch", VClassBoat, 595, 50000},
	{"Leviathan", VClassHelicopter, 417, 50000},
	{"Linerunner", VClassIndustrial, 403, 50000},
	{"Majestic", VClassSaloons, 517, 50000},
	{"Manana", VClassSaloons, 410, 50000},
	{"Marquis", VClassBoat, 484, 50000},
	{"Maverick", VClassHelicopter, 487, 50000},
	{"Merit", VClassSaloons, 551, 50000},
	{"Mesa", VClassOffRoad, 500, 50000},
	{"Monster", VClassOffRoad, 444, 50000},
	{"Monster A", VClassOffRoad, 556, 50000},
	{"Monster B", VClassOffRoad, 557, 50000},
	{"Moonbeam", VClassStationCar, 418, 50000},
	{"Mountain Bike", VClassBike, 510, 50000},
	{"Mower", VClassUnique, 572, 50000},
	{"Mr Whoopee", VClassUnique, 423, 50000},
	{"Mule", VClassIndustrial, 414, 50000},
	{"Nebula", VClassSaloons, 516, 50000},
	{"Nevada", VClassPlane, 553, 50000},
	{"Newsvan", VClassIndustrial, 582, 50000},
	{"NRG-500", VClassBike, 522, 50000},
	{"Oceanic", VClassSaloons, 467, 50000},
	{"Ore Trailer", VClassTrailer, 450, 50000},
	{"Packer", VClassIndustrial, 443, 50000},
	{"Patriot", VClassOffRoad, 470, 50000},
	{"PCJ-600", VClassBike, 461, 50000},
	{"Perenniel", VClassStationCar, 404, 50000},
	{"Phoenix", VClassSportCar, 603, 50000},
	{"Picador", VClassIndustrial, 600, 50000},
	{"Pizzaboy", VClassBike, 448, 50000},
	{"Police Car (LSPD)", VClassPublic, 596, 50000},
	{"Police Car (LVPD)", VClassPublic, 598, 50000},
	{"Police Car (SFPD)", VClassPublic, 597, 50000},
	{"Police Maverick", VClassHelicopter, 497, 50000},
	{"Police Ranger", VClassPublic, 599, 50000},
	{"Pony", VClassIndustrial, 413, 50000},
	{"Predator", VClassBoat, 430, 50000},
	{"Premier", VClassSaloons, 426, 50000},
	{"Previon", VClassSaloons, 436, 50000},
	{"Primo", VClassSaloons, 547, 50000},
	{"Quad", VClassBike, 471, 50000},
	{"Raindance", VClassHelicopter, 563, 50000},
	{"Rancher 1", VClassOffRoad, 489, 50000},
	{"Rancher 2", VClassOffRoad, 505, 50000},
//	{"RC Bandit", VClassRCVehicle, 441, 50000},
//	{"RC Baron", VClassRCVehicle, 464, 50000},
//	{"RC Cam", VClassRCVehicle, 594, 50000},
//	{"RC Goblin", VClassRCVehicle, 501, 50000},
//	{"RC Raider", VClassRCVehicle, 465, 50000},
//	{"RC Tiger", VClassRCVehicle, 564, 50000},
	{"Reefer", VClassBoat, 453, 50000},
	{"Regina", VClassStationCar, 479, 50000},
	{"Remington", VClassLowRider, 534, 50000},
//	{"Rhino", VClassPublic, 432, 50000},
	{"Roadtrain", VClassIndustrial, 515, 50000},
	{"Romero", VClassUnique, 442, 50000},
	{"Rumpo", VClassIndustrial, 440, 50000},
//	{"Rustler", VClassPlane, 476, 50000},
	{"Sabre", VClassSportCar, 475, 50000},
	{"Sadler", VClassIndustrial, 543, 50000},
	{"Sadler Shit", VClassIndustrial, 605, 50000},
	{"SAN News Maverick", VClassHelicopter, 488, 50000},
	{"Sanchez", VClassBike, 468, 50000},
	{"Sandking", VClassOffRoad, 495, 50000},
	{"Savanna", VClassLowRider, 567, 50000},
//	{"Seasparrow", VClassHelicopter, 447, 50000},
	{"Securicar", VClassUnique, 428, 50000},
	{"Sentinel", VClassSaloons, 405, 50000},
	{"Shamal", VClassPlane, 519, 50000},
	{"Skimmer", VClassPlane, 460, 50000},
	{"Slamvan", VClassLowRider, 535, 50000},
	{"Solair", VClassStationCar, 458, 50000},
	{"Sparrow", VClassHelicopter, 469, 50000},
	{"Speeder", VClassBoat, 452, 50000},
	{"Squallo", VClassBoat, 446, 50000},
	{"Stafford", VClassSaloons, 580, 50000},
	{"Stallion", VClassConvertible, 439, 50000},
	{"Stratum", VClassStationCar, 561, 50000},
//	{"Streak Trailer (train)", VClassTrailer, 570, 50000},
	{"Stretch", VClassUnique, 409, 50000},
	{"Stuntplane", VClassPlane, 513, 50000},
	{"Sultan", VClassSaloons, 560, 50000},
	{"Sunrise", VClassSaloons, 550, 50000},
	{"Super GT", VClassSportCar, 506, 50000},
	{"S.W.A.T.", VClassPublic, 601, 50000},
	{"Sweeper", VClassUnique, 574, 50000},
	{"Tahoma", VClassLowRider, 566, 50000},
	{"Tampa", VClassSaloons, 549, 50000},
	{"Tanker", VClassIndustrial, 514, 50000},
	{"Taxi", VClassPublic, 420, 50000},
	{"Tornado", VClassLowRider, 576, 50000},
	{"Towtruck", VClassUnique, 525, 50000},
	{"Tractor", VClassIndustrial, 531, 50000},
//	{"Tram", VClassUnique, 449, 50000},
	{"Trashmaster", VClassIndustrial, 408, 50000},
	{"Tropic", VClassBoat, 454, 50000},
	{"Tug", VClassUnique, 583, 50000},
	{"Tug Stairs Trailer", VClassTrailer, 608, 50000},
	{"Turismo", VClassSportCar, 451, 50000},
	{"Uranus", VClassSportCar, 558, 50000},
	{"Utility Trailer", VClassTrailer, 611, 50000},
	{"Utility Van", VClassIndustrial, 552, 50000},
	{"Vincent", VClassSaloons, 540, 50000},
	{"Virgo", VClassSaloons, 491, 50000},
	{"Voodoo", VClassLowRider, 412, 50000},
	{"Vortex", VClassUnique, 539, 50000},
	{"Walton", VClassIndustrial, 478, 50000},
	{"Washington", VClassSaloons, 421, 50000},
	{"Wayfarer", VClassBike, 586, 50000},
	{"Willard", VClassSaloons, 529, 50000},
	{"Windsor", VClassConvertible, 555, 50000},
    {"Yankee", VClassIndustrial, 456, 50000},
	{"Yosemite", VClassIndustrial, 554, 50000},
	{"ZR-350", VClassSportCar, 477, 50000}
};

// This function searches the ABuyableVehicles array to search for the model and returns the index in the array
VehicleBuyable_GetIndex(vModel)
{
	// Loop through all vehicles in the ABuyableVehicles array
	for (new i; i < sizeof(ABuyableVehicles); i++)
	{
	    // Check if the model of the current vehicle is the same as the given model
		if (ABuyableVehicles[i][CarModel] == vModel)
		    return i; // Return the index of the array where the carmodel was found
	}

	return -1;
}

// ************************************************************************************************************************************************************
// PPC_AutoEvict
// ************************************************************************************************************************************************************

// Define the time in days where the auto-evict system should auto-evict player's properties
#define AutoEvictTime   2

// Setup a custom type that holds all data about the auto-evict system
enum TAutoEvict
{
	AEMinutes, // Holds the amount of minutes the server is online
	AEHours, // Holds the amount of hours the server is online
	AEDays // Holds the amount of days the server is online
}
// Setup a variable to hold all data about the auto-evict system
new AutoEvict[TAutoEvict];

// This global auto-evict timer runs every minute and increases the server-online time
forward AutoEvictTimer();
public AutoEvictTimer()
{
	// Increase the amount of minutes the server is online
	AutoEvict[AEMinutes]++;

	// Increase the amount of hours if the minutes reaches 60
	if (AutoEvict[AEMinutes] == 60)
	{
		AutoEvict[AEHours]++;
		AutoEvict[AEMinutes] = 0;
	}

	// Increase the days the server is online if the hours reaches 24
	if (AutoEvict[AEHours] == 24)
	{
	    AutoEvict[AEDays]++;
	    AutoEvict[AEHours] = 0;

		// Auto-evict all properties if the owner didn't login within the AutoEvictTime
		AutoEvictProperties();
	}

	// Save the auto-evict-time
//	AutoEvict_Save();

	return 1;
}

// This function scans all houses and businesses and auto-evicts them if needed
AutoEvictProperties()
{
	// Setup local variables
	new File:LogFile, Msg[128];

	// Open the auto-evict-logfile for adding data
	LogFile = fopen("ServerData/AutoEvictLog.ini", io_append);
	// Log the eviction to the logfile
	format(Msg, 128, "Auto-eviction started for day: %i\r\n", AutoEvict[AEDays]);
	fwrite(LogFile, Msg); // And save it to the file
    // Close the logfile
	fclose(LogFile);

	// Loop through all player-owned houses
	for (new HouseID = 1; HouseID < MAX_HOUSES; HouseID++)
	{
		// Check if the house exists (it must have a valid pickup)
		if (IsValidDynamicPickup(AHouseData[HouseID][PickupID]))
		{
		    // Check if this house is owned
		    if (AHouseData[HouseID][Owned] == true)
		    {
				// Check if the AutoEvict-days are equal or higher than the value stored in this house
				if (AHouseData[HouseID][AutoEvictDays] < (AutoEvict[AEDays] - AutoEvictTime))
				{
					// Auto-Evict the house, inform the owner if he's online and remove the house from the owner's account
					House_Evict(HouseID);
					// Also log the auto-eviction to the logfile and inform all admins
					LogAutoEvict(1, AHouseData[HouseID][HouseName], AHouseData[HouseID][Owner]);
				}
			}
		}
	}
	// Loop through all businesses
	for (new BusID = 1; BusID < MAX_BUSINESS; BusID++)
	{
		// Check if the business exists (it must have a valid pickup)
		if (IsValidDynamicPickup(ABusinessData[BusID][PickupID]))
		{
		    // Check if this business is owned
		    if (ABusinessData[BusID][Owned] == true)
			{
				// Check if the AutoEvict-days are equal or higher than the value stored in this business
				if (ABusinessData[BusID][AutoEvictDays] < (AutoEvict[AEDays] - AutoEvictTime))
				{
					// Auto-Evict the business, inform the owner if he's online and remove the business from the owner's account
					Business_Evict(BusID);
					// Also log the auto-eviction to the logfile and inform all admins
					LogAutoEvict(2, ABusinessData[BusID][BusinessName], ABusinessData[BusID][Owner]);
				}
			}
		}
	}

	// Open the auto-evict-logfile for adding data
	LogFile = fopen("ServerData/AutoEvictLog.ini", io_append);
	// Log the eviction to the logfile
	format(Msg, 128, "Auto-eviction ended for day: %i\r\n\r\n", AutoEvict[AEDays]);
	fwrite(LogFile, Msg); // And save it to the file
    // Close the logfile
	fclose(LogFile);
}

// This function informs all admins about the property that has been auto-evicted and also logs the auto-evict into a file
LogAutoEvict(PropertyType, PropertyName[], PropertyOwner[])
{
	// Setup local variables
	new Msg[128], File:LogFile;

	// Determine the type of the property
	if (PropertyType == 1)
		// Setup the text to send to all admins
		format(Msg, 128, "{AAAAAA}House auto-evicted: %s, owner: %s", PropertyName, PropertyOwner);
	else
		// Setup the text to send to all admins
		format(Msg, 128, "{AAAAAA}Business auto-evicted: %s, owner: %s", PropertyName, PropertyOwner);

	// Loop through all players
	for (new i; i < MAX_PLAYERS; i++)
	{
		// Check if the player is an admin
		if (APlayerData[i][PlayerLevel] > 0)
		{
			// Send the given text to the admin
			SendClientMessage(i, 0xFFFFFFFF, Msg);
		}
	}

	// Open the auto-evict-logfile for adding data
	LogFile = fopen("ServerData/AutoEvictLog.ini", io_append);

	// Determine the type of the property
	if (PropertyType == 1)
		// Setup the text to log to the logfile
		format(Msg, 128, "House auto-evicted: %s, owner: %s\r\n", PropertyName, PropertyOwner);
	else
		// Setup the text to log to the logfile
		format(Msg, 128, "Business auto-evicted: %s, owner: %s\r\n", PropertyName, PropertyOwner);

	// Log the eviction to the logfile
	fwrite(LogFile, Msg); // And save it to the file

    // Close the logfile
	fclose(LogFile);
}

// This function loads the file that holds the current auto-evict-time
/*
AutoEvict_Load()
{
	// Setup local variables
	new File:AEFile, LineFromFile[100], ParameterName[50], ParameterValue[50];

	// Try to load the auto-evict file
	if (fexist("ServerData/AutoEvict.ini"))
	{
		// Open the auto-evict-file for reading
		AEFile = fopen("ServerData/AutoEvict.ini", io_read);

        // Read the first line of the file
		fread(AEFile, LineFromFile);

		// Keep reading until the end of the file is found (no more data)
		while (strlen(LineFromFile) > 0)
		{
			StripNewLine(LineFromFile); // Strip any newline characters from the LineFromFile
			sscanf(LineFromFile, "s[50]s[50]", ParameterName, ParameterValue); // Extract parametername and parametervalue

			// Store the proper value in the proper place
			if (strcmp(ParameterName, "Minutes", false) == 0) // If the parametername is correct ("Minutes")
				AutoEvict[AEMinutes] = strval(ParameterValue); // Store the Minutes
			if (strcmp(ParameterName, "Hours", false) == 0) // If the parametername is correct ("Hours")
				AutoEvict[AEHours] = strval(ParameterValue); // Store the Hours
			if (strcmp(ParameterName, "Days", false) == 0) // If the parametername is correct ("Days")
				AutoEvict[AEDays] = strval(ParameterValue); // Store the Days

            // Read the next line of the file
			fread(AEFile, LineFromFile);
		}

        // Close the file
		fclose(AEFile);

        // Return if the file was read correctly
		return 1;
	}
	else
	    return 0; // Return 0 if the file couldn't be read (doesn't exist)
}
*/
// This function saves the file that holds the current auto-evict-time
/*
AutoEvict_Save()
{
	new File:AEFile, LineForFile[100];

	AEFile = fopen("ServerData/AutoEvict.ini", io_write); // Open the auto-evict-file for writing

	format(LineForFile, 100, "Minutes %i\r\n", AutoEvict[AEMinutes]); // Construct the line: "Minutes <Minutes>"
	fwrite(AEFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "Hours %i\r\n", AutoEvict[AEHours]); // Construct the line: "Hours <Hours>"
	fwrite(AEFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "Days %i\r\n", AutoEvict[AEDays]); // Construct the line: "Days <Days>"
	fwrite(AEFile, LineForFile); // And save it to the file

	fclose(AEFile); // Close the file

	return 1;
}
*/
// ************************************************************************************************************************************************************
// PPC_GlobalTimer
// ************************************************************************************************************************************************************

// This global timer runs every second and checks if a player is about to fail his mission (by getting out of his vehicle during a job)
forward GlobalTimer();
public GlobalTimer()
{
	// Setup local variables
	new OldVehicleID, NewVehicleID, OldTrailerID, NewTrailerID;

	// Loop through all players
	for (new playerid; playerid < MAX_PLAYERS; playerid++)
	{
		// Check if this player is logged in
		if (APlayerData[playerid][LoggedIn] == true)
		{
			// Get the vehicle-id's from this player
			OldVehicleID = APlayerData[playerid][VehicleID];
			NewVehicleID = GetPlayerVehicleID(playerid);
			OldTrailerID = APlayerData[playerid][TrailerID];
			NewTrailerID = GetVehicleTrailer(GetPlayerVehicleID(playerid));

			// Check the class of the player
			switch (APlayerData[playerid][PlayerClass])
			{
				case ClassTruckDriver:
				{
				    // Check if the trucker has a job
				    if (APlayerData[playerid][JobStarted] == true)
				    {
						// Check if the vehicletimer didn't run out yet
						if (APlayerData[playerid][VehicleTimerTime] != 0)
						{
							// If VehicleID and TrailerID are still the same as when the player accepted the job
							if ((OldVehicleID == NewVehicleID) && (OldTrailerID == NewTrailerID))
								APlayerData[playerid][VehicleTimerTime] = Job_TimeToFailMission; // Reset the time before the mission fails
							else // One (or both) aren't still the same (player lost his trailer or vehicle)
								PlayerLeftVehicle(playerid); // Inform the player that he left his vehicle and that he must re-enter it
						}
						else // Time left has reached 0
							FailJob(playerid);
				    }
				}
				case ClassBusDriver:
				{
				    // Check if the busdriver has a job
				    if (APlayerData[playerid][JobStarted] == true)
				    {
						if (APlayerData[playerid][VehicleTimerTime] != 0)
						{
							// If VehicleID is still the same as when the player accepted the job
							if (OldVehicleID == NewVehicleID)
								APlayerData[playerid][VehicleTimerTime] = Job_TimeToFailMission; // Reset the time before the mission fails
							else // Player got out of his bus
								PlayerLeftVehicle(playerid); // Inform the player that he left his vehicle and that he must re-enter it
						}
						else // Time left has reached 0
							FailJob(playerid);
					}
				}
				case ClassMafia:
				{
				    // Check if the mafia has a job
				    if (APlayerData[playerid][JobStarted] == true)
				    {
						if (APlayerData[playerid][VehicleTimerTime] != 0)
						{
							// If VehicleID is still the same as when the player accepted the job
							if (OldVehicleID == NewVehicleID)
								APlayerData[playerid][VehicleTimerTime] = Job_TimeToFailMission; // Reset the time before the mission fails
							else // Player left his vehicle
								PlayerLeftVehicle(playerid); // Inform the player that he left his vehicle and that he must re-enter it
						}
						else // Time left has reached 0
							FailJob(playerid);
					}
				}
				case ClassCourier:
				{
				    // Check if the courier has a job
				    if (APlayerData[playerid][JobStarted] == true)
				    {
						if (APlayerData[playerid][VehicleTimerTime] != 0)
						{
							// If VehicleID and TrailerID are still the same as when the player accepted the job
							if (OldVehicleID == NewVehicleID)
								APlayerData[playerid][VehicleTimerTime] = Job_TimeToFailMission; // Reset the time before the mission fails
							else // Player stepped out of his vehicle
								PlayerLeftVehicle(playerid); // Inform the player that he left his vehicle and that he must re-enter it
						}
						else // Time left has reached 0
							FailJob(playerid);
					}
				}
				case ClassRoadWorker:
				{
				    // Check if the roadworker has a job
				    if (APlayerData[playerid][JobStarted] == true)
				    {
						// Check if the vehicletimer didn't run out yet
						if (APlayerData[playerid][VehicleTimerTime] != 0)
						{
							// If VehicleID and TrailerID are still the same as when the player accepted the job
							// In case of the "tow broken vehicle" jobtype, the mission starts without a trailer (so it's 0),
							// but gets updated when the player enters the checkpoint to set the broken vehicle as trailer
							if ((OldVehicleID == NewVehicleID) && (OldTrailerID == NewTrailerID))
								APlayerData[playerid][VehicleTimerTime] = Job_TimeToFailMission; // Reset the time before the mission fails
							else // VehicleID isn't still the same (player lost his vehicle or trailer)
								PlayerLeftVehicle(playerid); // Inform the player that he left his vehicle and that he must re-enter it
						}
						else // Time left has reached 0
							FailJob(playerid);
					}
				}
			}
		}
	}

	return 1;
}

// This function is called by the global vehicletimer to fail a job
FailJob(playerid)
{
	// Check the class of the player
	switch (APlayerData[playerid][PlayerClass])
	{
		case ClassTruckDriver:
		{
		    // End the player's job
			Trucker_EndJob(playerid);
			// If the player is part of a convoy, kick him from it (as he failed his mission, the rest of the convoy would be stuck)
			Convoy_Leave(playerid);
		}
		case ClassBusDriver:
		{
		    // End the player's job
			BusDriver_EndJob(playerid);
		}
		case ClassMafia:
		{
		    // End the player's job
			Mafia_EndJob(playerid);
		}
		case ClassCourier:
		{
		    // End the player's job
			Courier_EndJob(playerid);
		}
		case ClassRoadWorker:
		{
		    // End the player's job
			Roadworker_EndJob(playerid);
		}
	}

	// Inform the player that he failed the mission
	GameTextForPlayer(playerid, TXT_FailedMission, 5000, 4);
	// Reduce the player's cash by 1000
	RewardPlayer(playerid, -1000, 0);
}

// This function is used by the global vehicletimer and informs the player that he left his vehicle and must re-enter it
PlayerLeftVehicle(playerid)
{
	// Setup local variables
	new TimeLeft[5];

	// Reduce the time left by 1
	APlayerData[playerid][VehicleTimerTime] = APlayerData[playerid][VehicleTimerTime] - 1;
	// Convert the time left to a string for displaying
	valstr(TimeLeft, APlayerData[playerid][VehicleTimerTime]);
	// Display the time left
	GameTextForPlayer(playerid, TimeLeft, 1000, 4);
	// Send only one message to inform the player what he must do
	if (APlayerData[playerid][VehicleTimerTime] == (Job_TimeToFailMission - 1))
	{
		// Check the class of the player and inform them what to do
		switch (APlayerData[playerid][PlayerClass])
		{
			case ClassTruckDriver:
				SendClientMessage(playerid, 0xFFFFFFFF, TXT_TruckerMustEnterVehicle);
			case ClassBusDriver:
				SendClientMessage(playerid, 0xFFFFFFFF, TXT_BusDriverMustEnterBus);
			case ClassMafia:
			    SendClientMessage(playerid, 0xFFFFFFFF, TXT_MafiaMustEnterVehicle);
			case ClassCourier:
			    SendClientMessage(playerid, 0xFFFFFFFF, TXT_CourierMustEnterVehicle);
			case ClassRoadWorker:
			    SendClientMessage(playerid, 0xFFFFFFFF, TXT_RoadworkerMustEnterVehicle);
		}
	}
}

// ************************************************************************************************************************************************************
// PPC_Common
// ************************************************************************************************************************************************************

// This functions gives the player the given amount of money and scorepoints
RewardPlayer(playerid, Money, Points)
{
	// Add the given amount of money to the player's account
	APlayerData[playerid][PlayerMoney] = APlayerData[playerid][PlayerMoney] + Money;
	// Add the given amount of scorepoints to the player's account
	APlayerData[playerid][PlayerScore] = APlayerData[playerid][PlayerScore] + Points;
}

// This function creates the vehicle and saves the vehicle-lodel in the AVehicleData-array (can only be used during GameModeInit)
// It also sets the fuel to maximum
Vehicle_AddStatic(vModel, Float:vX, Float:vY, Float:vZ, Float:vRotation, vC1, vC2, vSpawnDelay)
{
	// Create a new static vehicle during GameModeInit
	new vid = AddStaticVehicleEx(vModel, vX, vY, vZ, vRotation, vC1, vC2, vSpawnDelay);
	// Save the vehicle-model
    AVehicleData[vid][Model] = vModel;
	// Set the fuel to maximum so the vehicle can be used
    AVehicleData[vid][Fuel] = MaxFuel;
	// Save the colors
    AVehicleData[vid][Color1] = vC1;
    AVehicleData[vid][Color2] = vC2;
	// Set this vehicle as a static vehicle
	AVehicleData[vid][StaticVehicle] = true;

	return vid;
}

// This function is the same as Vehicle_AddStatic, but uses CreateVehicle instead of AddStaticVehicleEx, so can be used everywhere
Vehicle_Create(vModel, Float:vX, Float:vY, Float:vZ, Float:vRotation, vC1, vC2, vSpawnDelay)
{
	// Create a new static vehicle during GameModeInit
	new vid = CreateVehicle(vModel, vX, vY, vZ, vRotation, vC1, vC2, vSpawnDelay);
	// Save the vehicle-model
    AVehicleData[vid][Model] = vModel;
	// Set the fuel to maximum so the vehicle can be used
    AVehicleData[vid][Fuel] = MaxFuel;
	// Save the colors
    AVehicleData[vid][Color1] = vC1;
    AVehicleData[vid][Color2] = vC2;

	return vid;
}

// This function deletes the vehicle and clears all the data (is only used for player-owned vehicles)
Vehicle_Delete(vid)
{
	// Setup local variables
	new HouseID, CarSlot;

	// Get the HouseID and CarSlot where the vehicle is linked to
	HouseID = AVehicleData[vid][BelongsToHouse];

	// Check if this was a valid HouseID
	if (HouseID != 0)
	{
		// Loop through all carslots of this house to find the vehicle-id
		for (new i; i < 10; i++)
		{
			// Check if this carslot holds the same vehicle-id
		    if (AHouseData[HouseID][VehicleIDs][i] == vid)
		    {
		        CarSlot = i; // The carslot has been found where the vehicle is stored, remember it
				break; // Stop the for-loop
			}
		}

		// Remove the vehicle from the house
		AHouseData[HouseID][VehicleIDs][CarSlot] = 0;
	}

	// Delete the vehicle
	DestroyVehicle(vid);
	// Clear the data
	AVehicleData[vid][Owned] = false;
	AVehicleData[vid][Owner] = 0;
	AVehicleData[vid][Model] = 0;
	AVehicleData[vid][PaintJob] = 0;
	for (new i; i < 14; i++)
	    AVehicleData[vid][Components][i] = 0;
	AVehicleData[vid][Color1] = 0;
	AVehicleData[vid][Color2] = 0;
	AVehicleData[vid][SpawnX] = 0.0;
	AVehicleData[vid][SpawnY] = 0.0;
	AVehicleData[vid][SpawnZ] = 0.0;
	AVehicleData[vid][SpawnRot] = 0.0;
	AVehicleData[vid][BelongsToHouse] = 0;
	DestroyDynamic3DTextLabel(AVehicleData[vid][VehicleText]);
}

// This function returns "1" if both locations are not closeby and returns "0" if both locations are close to eachother
Locations_CheckDistance(LocationA, LocationB, Float:Range)
{
	// Setup local variables
	new Float:Xa, Float:Ya, Float:Xb, Float:Yb, Float:X, Float:Y;

	// Get the coordinates of LocationA
	Xa = ALocations[LocationA][LocX];
	Ya = ALocations[LocationA][LocY];
	// Get the coordinates of LocationB
	Xb = ALocations[LocationB][LocX];
	Yb = ALocations[LocationB][LocY];

	// Calculate the distances between both locations
	Y = Yb - Ya;
	X = Xb - Xa;

	// Check if both locations are further apart then the range indicates
	if (((X * X) + (Y * Y)) > (Range * Range))
		return 1; // Location B is further away from Location A than Range indicates
	else
	    return 0; // both locations are closer to eachother than Range indicates
}

// This function ports all non-admin players out of the given area to the location specified
Player_PortOutAdminZone(playerid, Float:x1, Float:y1, Float:z1, Float:x2, Float:y2, Float:z2, Float:x3, Float:y3, Float:z3)
{
	// Setup local variables
	new Float:x, Float:y, Float:z;

	// Get the player's coordinates
	GetPlayerPos(playerid, x, y, z);

	// Check if the player is not an admin
	if (APlayerData[playerid][PlayerLevel] == 0)
		if ((x1 < x) && (x < x2))
		    if ((y1 < y) && (y < y2))
		        if ((z1 < z) && (z < z2))
				{
					SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Yönetici bölgesine giremezsiniz!");
					SetPlayerPos(playerid, x3, y3, z3); // Port the player out of the area
				}
}

// This function sends the given text to all admins
SendAdminText(playerid, command[], text[])
{
	// Setup local variables
	new Name[24], Msg[128];

	// Loop through all players
	for (new i; i < MAX_PLAYERS; i++)
	{
		// Check if the player is an admin
		if (APlayerData[i][PlayerLevel] > APlayerData[playerid][PlayerLevel] && APlayerData[i][PlayerLevel] > 0)
		{
			// Get the player's name
			GetPlayerName(playerid, Name, sizeof(Name));
			// Send the given text to the admin
			format(Msg, 128, "{00FFCC}[CMD] %s: %s %s", Name, command, text);
			SendClientMessage(i, 0xFFFFFFFF, Msg);
		}
	}

	// Also log all used commands in the server.log file
	format(Msg, 128, "[CMD] %s: %s %s", Name, command, text);
	print(Msg);
}

// This timer informs the player how long he will be frozen
forward Player_FreezeTimer(playerid);
public Player_FreezeTimer(playerid)
{
	// Setup local variables
	new Msg[128];

	// Decrease the remaining time this player will be frozen
    APlayerData[playerid][PlayerFrozen]--;

	// Check if the player is allowed to move again
	if (APlayerData[playerid][PlayerFrozen] > 0)
	{
		// Construct the message to inform the player how long he stays frozen
		if (APlayerData[playerid][PlayerFrozen] >= 60)
			format(Msg, 128, "%i Dakika Donduruldunuz", APlayerData[playerid][PlayerFrozen] / 60);
		else
			format(Msg, 128, "%i Saniye Donduruldunuz", APlayerData[playerid][PlayerFrozen]);

		// Display the message to inform the player how long he stays frozen
		GameTextForPlayer(playerid, Msg, 1000, 4);
		TogglePlayerControllable(playerid, 0);
	}
	else // The timer has run out, so allow his to move again
	{
	    TogglePlayerControllable(playerid, 1);
		KillTimer(APlayerData[playerid][PlayerFrozenTimer]);
	}
}

// This function creates a list of commands, starting from the FirstCommand and automatically shows the dialog
CommandList_Create(playerid)
{
	// Setup local variables
	new Counter, CommandList[1000], DialogTitle[128];

	// Only add 4 commands to the list, starting from the FirstItem
	for (new i = APlayerData[playerid][DialogFirstItem]; i < sizeof(ACommands); i++)
	{
		// Increase a counter (which holds the number of commands that have been added to the list
		Counter++;

		// Check if the maximum hasn't been reached yet
		if (Counter <= 5)
		{
		    // Check if this command is valid for this player
			if (APlayerData[playerid][PlayerLevel] >= ACommands[i][CommandLevel])
			{
				// Check if the command is used for admins or not
				if (ACommands[i][CommandLevel] == 0)
				{
				    // Add the commandname and description to the list
					format(CommandList, 500, "%s%s{00FF00}%s", CommandList, "\n", ACommands[i][CommandStructure]); // Add the name of the next command to the list on the next line
					format(CommandList, 500, "%s%s\t\t{FFFF00}%s", CommandList, "\n", ACommands[i][CommandDescription]); // Add the description of the next command to the list on the next line
				}
				else
				{
				    // Add the commandname and description to the list
					format(CommandList, 500, "%s%sLvL %i: {00FF00}%s", CommandList, "\n", ACommands[i][CommandLevel], ACommands[i][CommandStructure]); // Add the name of the next command to the list on the next line
					format(CommandList, 500, "%s%s\t\t{FFFF00}%s", CommandList, "\n", ACommands[i][CommandDescription]); // Add the description of the next command to the list on the next line
				}
			}
			else
				break;
		}
		else // 5 commands have been added to the list (now Counter = 6)
		{
		    // Add an empty line and "Next..." to the list to let the player know there are more commands
			format(CommandList, 500, "%s%s%s", CommandList, "\n \n", TXT_DialogEntryNext);
			// Also stop the For-loop
			break;
		}
	}

	// Construct the title for the dialog (to include a page number)
	format(DialogTitle, 128, TXT_DialogCommandTitle, (APlayerData[playerid][DialogFirstItem] / 5) + 1);
	// Show the commands in a dialog
	ShowPlayerDialog(playerid, DialogPlayerCommands, DIALOG_STYLE_LIST, DialogTitle, CommandList, TXT_DialogButtonSelect, TXT_DialogButtonCancel);

	return 1;
}

CommandList_Create2(playerid)
{
	// Setup local variables
	new Counter, CommandList[1000], DialogTitle[128];

	// Only add 4 commands to the list, starting from the FirstItem
	for (new i = APlayerData[playerid][DialogFirstItem]; i < sizeof(ACommands); i++)
	{
		// Increase a counter (which holds the number of commands that have been added to the list
		Counter++;

		// Check if the maximum hasn't been reached yet
		if (Counter <= 5)
		{
			format(CommandList, 500, "%s%sLvL %i: {00FF00}%s", CommandList, "\n", ACommands2[i][CommandLevel], ACommands2[i][CommandStructure]); // Add the name of the next command to the list on the next line
			format(CommandList, 500, "%s%s\t\t{FFFF00}%s", CommandList, "\n", ACommands2[i][CommandDescription]); // Add the description of the next command to the list on the next line
		}
		else // 5 commands have been added to the list (now Counter = 6)
		{
		    // Add an empty line and "Next..." to the list to let the player know there are more commands
			format(CommandList, 500, "%s%s%s", CommandList, "\n \n", TXT_DialogEntryNext);
			// Also stop the For-loop
			break;
		}
	}

	// Construct the title for the dialog (to include a page number)
	format(DialogTitle, 128, TXT_DialogCommandTitle, (APlayerData[playerid][DialogFirstItem] / 5) + 1);
	// Show the commands in a dialog
	ShowPlayerDialog(playerid, DialogPlayerCommands2, DIALOG_STYLE_LIST, DialogTitle, CommandList, TXT_DialogButtonSelect, TXT_DialogButtonCancel);

	return 1;
}

// This function returns "1" if the given vehicle-id is a plane or helicopter
IsVehicleAirVehicle(vid)
{
	switch (GetVehicleModel(vid))
	{
		case 592, 577, 511, 512, 593, 520, 553, 476, 519, 460, 513, 548, 425, 417, 487, 488, 497, 563, 447, 469: return 1;
		default: return 0;
	}

	return 0;
}

// This function creates a speedcamera (store data and create the objects)
SetupSpeedCamera(CamID, Float:x, Float:y, Float:z, Float:rot, MaxSpeed)
{
	// Store all the given values
    ACameras[CamID][CamX] = x;
    ACameras[CamID][CamY] = y;
    ACameras[CamID][CamZ] = z;
    ACameras[CamID][CamAngle] = rot;
    ACameras[CamID][CamSpeed] = MaxSpeed;
	// Create both camera objects and store their reference
    ACameras[CamID][CamObj1] = CreateObject(18880, x, y, z, 0.0, 0.0, rot);
    ACameras[CamID][CamObj2] = CreateObject(18880, x, y, z, 0.0, 0.0, rot + 180.0);
}

// This function sends the report to all admins
SendReportToAdmins(OffenderID, Reason[], bool:AutoReport = false)
{
	// Setup local variables
	new Name[24], Msg[128], TxtMsg[128], TotalReason[128];

	// Get the name of the offender
	GetPlayerName(OffenderID, Name, sizeof(Name));

	// Construct the report message for all admins
	if (AutoReport == false)
	{
	    // Construct the report messages for a normal report
		format(Msg, 128, "{00FFFF}*** Rapor: %s (%i): %s", Name, OffenderID, Reason);
		format(TxtMsg, 128, "Rapor:~n~~g~%s (%i)~n~~r~%s", Name, OffenderID, Reason);
		format(TotalReason, 128, Reason);
	}
	else
	{
	    // Construct the report messages for an automated report (sent by the AntiHack function)
		format(Msg, 128, "{00FFFF}*** Oto-Rapor: %s (%i): %s", Name, OffenderID, Reason);
		format(TxtMsg, 128, "Oto-Rapor:~n~~g~%s (%i)~n~~r~%s", Name, OffenderID, Reason);
		format(TotalReason, 128, "%s (AntiHile)", Reason);
		// For automated reports, preset the time to 60 seconds to stop the Anti-Hack system reporting the player every half a second
		APlayerData[OffenderID][AutoReportTime] = 120; // The time must be doubled, as the speedometer runs twice every second
	}

	// Loop through all the players to find all online admins
	for (new playerid; playerid < MAX_PLAYERS; playerid++)
	{
	    // Check if this player is an admin
	    if (APlayerData[playerid][PlayerLevel] > 0)
	    {
			// Send a message to the admin to inform him about the report
			SendClientMessage(playerid, 0xFFFFFFFF, Msg);
			// Also send the admin a GameText-message so he can see it more clearly
			GameTextForPlayer(playerid, TxtMsg, 10000, 4);
	    }
	}

	// Add the report to the AReports-array so admins can review it in a dialog (maximum 50 reports can be stored)
	AddReport(OffenderID, TotalReason);
}

// This function adds the report to the AReports array automatically
AddReport(OffenderID, Reason[])
{
	// Setup local variables
	new ReportID = -1, Name[24];

	// Check if there is a free spot in the AReports array
	for (new i; i < 50; i++)
	{
		// Check if this report-spot is empty
		if (AReports[i][ReportUsed] == false)
		{
		    ReportID = i;
		    break; // If this spot hasn't been used yet, stop the for-loop
		}
	}

	// If no spot is free (ReportID is still -1)
	if (ReportID == -1)
	{
		// Drop the report on ID 0, and move them all downwards
		for (new i = 1; i < 50; i++)
		{
			AReports[i - 1][ReportUsed] = AReports[i][ReportUsed];
			format(AReports[i - 1][ReportName], 24, "%s", AReports[i][ReportName]);
			format(AReports[i - 1][ReportReason], 128, "%s", AReports[i][ReportReason]);
		}

		// ReportID 49 is available now, so use this to add the new report
		ReportID = 49;
	}

	// Get the name of the offender
	GetPlayerName(OffenderID, Name, sizeof(Name));

	// Store the data into the array
	AReports[ReportID][ReportUsed] = true;
	format(AReports[ReportID][ReportName], 24, "%s", Name);
	format(AReports[ReportID][ReportReason], 128, "%s", Reason);
}

// This function converts an ip-address into 4 separate integer parts and returns a string that only holds the first three parts
GetFirstThreeDigitsFromIP(PlayerIP[])
{
	// Setup local variables
	new Part1, Part2, Part3, DotLoc, RetIP[16];

	// Get the first part of the IP-address
	Part1 = strval(PlayerIP[0]);

	// Find the first dot
	DotLoc = strfind(PlayerIP, ".", false, 0);
	// Get the second part of the IP-address (the part that follows the first dot)
	Part2 = strval(PlayerIP[DotLoc+1]);

	// Find the second dot
	DotLoc = strfind(PlayerIP, ".", false, DotLoc+1);
	// Get the third part of the IP-address (the part that follows the second dot)
	Part3 = strval(PlayerIP[DotLoc+1]);

	// Combine them all into an IP that only holds the first three digits, followed by a dot
	format(RetIP, 16, "%i.%i.%i.", Part1, Part2, Part3);
	// Return it to the calling function
	return RetIP;
}

// This timer is executed every 2 minutes and sends all timedmessages one at a time
forward Timer_TimedMessages();
public Timer_TimedMessages()
{
	// Send the message
	SendClientMessageToAll(0xFFFFFFFF, ATimedMessages[LastTimedMessage]);

	// Select the next message
    LastTimedMessage++;

	// Check if the next chosen message exists (the messagenumber is the same as the size of the array of messages)
	if (LastTimedMessage == sizeof(ATimedMessages))
	    LastTimedMessage = 0; // Select the first message again

	return 1;
}

// This timer is executed every 5 minutes and sends the data about a random bonus mission to every trucker
forward ShowRandomBonusMission();
public ShowRandomBonusMission()
{
	printf("Bonus Gorev");
	
	// Setup local variables
	new bool:MissionSet = false, Msg1[128], Msg2[128], Msg3[128], lName[50], sName[50], eName[50], tName[100];

	// Check if there is no mission defined yet (only happens when server is restarted), or when the mission has been completed by a player
	if ((RandomBonusMission[RandomLoad] == 0) || (RandomBonusMission[MissionFinished] == true))
	{
		// Keep checking until a valid mission has been set
		while (MissionSet == false)
		{
			// Choose a random LoadID
	        RandomBonusMission[RandomLoad] = random(sizeof(ALoads));

			switch (RandomBonusMission[RandomLoad])
			{
				case 0: MissionSet = false; // If the dummy load has been chosen, allow the while loop to run again to search for another valid load
				default: // If another load has been chosen, check if it is a trucker load
				{
					switch(ALoads[RandomBonusMission[RandomLoad]][PCV_Required]) // Check the class & vehicle variable
					{
					    case PCV_TruckerOreTrailer, PCV_TruckerFluidsTrailer, PCV_TruckerCargoTrailer, PCV_TruckerCementTruck, PCV_TruckerNoTrailer:
					    {
					        // Now only the loads for truckers are checked
							MissionSet = true; // The load has been determined now as it's a valid load for truckers only
					    }
					    default: MissionSet = false; // If another class & vehicle has been chosen (mafia or pilot load), search again
					}
				}
			}
		}

		// Find a random startlocation and endlocation from the chosen load
	    RandomBonusMission[RandomStartLoc] = Product_GetRandomStartLoc(RandomBonusMission[RandomLoad]);
	    RandomBonusMission[RandomEndLoc] = Product_GetRandomEndLoc(RandomBonusMission[RandomLoad]);
		// Set the new random mission as not-completed yet
		RandomBonusMission[MissionFinished] = false;
	}

	// Get the names of the load, start-location and end-location
	format(lName, 50, ALoads[RandomBonusMission[RandomLoad]][LoadName]);
	format(sName, 50, ALocations[RandomBonusMission[RandomStartLoc]][LocationName]);
	format(eName, 50, ALocations[RandomBonusMission[RandomEndLoc]][LocationName]);
	// Setup the name of the vehicle you'll need for this mission
	switch(ALoads[RandomBonusMission[RandomLoad]][PCV_Required])
	{
		case PCV_TruckerOreTrailer: format(tName, 128, "maden kasalý týr");
		case PCV_TruckerFluidsTrailer: format(tName, 128, "sývý kasalý týr");
		case PCV_TruckerCargoTrailer: format(tName, 128, "kargo kasalý týr");
		case PCV_TruckerCementTruck: format(tName, 128, "çimento kamyonu");
		case PCV_TruckerNoTrailer: format(tName, 128, "Flatbed veya DFT-30");
	}

	// Construct the messages that describe the mission
	format(Msg1, 128, "{00BBFF}Bonus Görev: {FFBB00}%s {00BBFF}taþý", lName);
	format(Msg2, 128, "{FFBB00}%s{00BBFF}'dan {FFBB00}%s{00BBFF}'a", sName, eName);
	format(Msg3, 128, "{00BBFF}Bu görevi yapmak için bir {FFBB00}%s{00BBFF}'a ihtiyacýnýz var", tName);

	// Now send the data about the random mission to all truckers
	for (new playerid; playerid < MAX_PLAYERS; playerid++)
	{
		// Check if this player is online
		if (APlayerData[playerid][LoggedIn] == true)
		{
			// Check if this player is a trucker
			if (APlayerData[playerid][PlayerClass] == ClassTruckDriver)
			{
				SendClientMessage(playerid, 0xFFFFFFFF, Msg1);
				SendClientMessage(playerid, 0xFFFFFFFF, Msg2);
				SendClientMessage(playerid, 0xFFFFFFFF, Msg3);
			}
		}
	}

	return 1;
}

// This function displays the main bank menu dialog
ShowBankMenu(playerid)
{
	// Setup local variables
	new BankOptions[256], BankTitle[128];

    // Construct the title of the bank dialog
	format(BankTitle, sizeof(BankTitle), "{FFFFFF}Bankanýzdaki Para: {00FF00}$%i", APlayerData[playerid][BankMoney]);

    // Construct the options of the bank dialog
	format(BankOptions, sizeof(BankOptions), "{00FF00}Para Yatýr\n");
	format(BankOptions, sizeof(BankOptions), "%s{00FF00}Para Çek\n", BankOptions);
	format(BankOptions, sizeof(BankOptions), "%s{00FF00}Para Havale Et\n", BankOptions);
	format(BankOptions, sizeof(BankOptions), "%s{00FF00}Banka Hesabýný Ýptal Et\n", BankOptions);

	// Show the bank dialog
	ShowPlayerDialog(playerid, DialogBankOptions, DIALOG_STYLE_LIST, BankTitle, BankOptions, TXT_DialogButtonSelect, TXT_DialogButtonCancel);
}

// This timer increases the variable "CurrentIntrestTime" every hour
forward Bank_IntrestTimer();
public Bank_IntrestTimer()
{
	// Setup local variables
	new IntrestAmount, Msg[128];

	// Increase the variable by one
    CurrentIntrestTime++;

	// And save it to the file
	IntrestTime_Save();

	// Process intrest for all online player with a bank account if intrest is enabled
	if (IntrestEnabled == true)
	{
		// Loop through all players
		for (new playerid; playerid < MAX_PLAYERS; playerid++)
		{
			// Check if this player is logged in
			if (APlayerData[playerid][LoggedIn] == true)
			{
				// Check if this player has a bank account (just check if there is money in the bank, it's useless to process the intrest for
				// a bank account which doesn't have any money in it, and having BankMoney also means the player has a bank account)
				if (APlayerData[playerid][BankMoney] > 0)
				{
					// Calculate the intrest
					IntrestAmount = floatround(floatmul(APlayerData[playerid][BankMoney], BankIntrest), floatround_floor);
					// Add intrest to this player's bank account
					APlayerData[playerid][BankMoney] = APlayerData[playerid][BankMoney] + IntrestAmount;
					// Save the CurrentIntrestTime for this bank account
					APlayerData[playerid][LastIntrestTime] = CurrentIntrestTime;
					// Save the player's bank account
					BankFile_Save(playerid);

					// Inform the player that he received intrest on his bank account and how much
					format(Msg, 128, "{00BBFF}Banka hesabýnýzdan {FFBB00}$%i{00BBFF} faiz aldýnýz", IntrestAmount);
					SendClientMessage(playerid, 0xFFFFFFFF, Msg);
				}
			}
		}
	}
}

// This function creates a list of help-items, for which the player can get information about it
HelpList_Create(playerid)
{
	// Setup local variables
	new HelpList[1000], DialogTitle[128];

	// Construct the title for the dialog (to include a page number)
	format(DialogTitle, 128, "Yardým Alabileceðiniz Konular:");

    // Add all help-topics to the list
	for (new i; i < sizeof(AHelpTopics); i++)
	{
		format(HelpList, 1000, "%s%s\n", HelpList, AHelpTopics[i]);
	}

	// Show the commands in a dialog
	ShowPlayerDialog(playerid, DialogHelpItemChosen, DIALOG_STYLE_LIST, DialogTitle, HelpList, TXT_DialogButtonSelect, TXT_DialogButtonCancel);

	return 1;
}

// ************************************************************************************************************************************************************
// PPC_Housing
// ************************************************************************************************************************************************************

// This function returns the first free house-slot for the given player
Player_GetFreeHouseSlot(playerid)
{
	// Check if the player has room for another house (he hasn't bought the maximum amount of houses per player yet)
	// and get the slot-id
	for (new HouseIndex; HouseIndex < MAX_HOUSESPERPLAYER; HouseIndex++) // Loop through all house-slots of the player
		if (APlayerData[playerid][Houses][HouseIndex] == 0) // Check if this house slot is free
		    return HouseIndex; // Return the free HouseIndex for this player

	// If there were no free house-slots, return "-1"
	return -1;
}

// This function returns the maximum number of car-slots, based on the house-level
House_GetMaxCarSlots(HouseID)
{
	// Return the maximum number of carslots, based on the house-level (every level has one carslot, so return the houselevel)
	return AHouseData[HouseID][HouseLevel];
}

// This function returns the first free carslot in the given house (or -1 if no free slot is found)
House_GetFreeCarSlot(HouseID)
{
	// Get the maximum number of carslots for this house (based on the house-level)
	new MaxCarSlots = House_GetMaxCarSlots(HouseID);

	// Get the maximum number of carslots for this house and make a loop through all carslots for this house
	for (new CarSlot; CarSlot < MaxCarSlots; CarSlot++)
	{
		// Check if the carslot is empty
		if (AHouseData[HouseID][VehicleIDs][CarSlot] == 0)
		    return CarSlot; // Return the carslot-id
	}

	// If no carslots are free, return -1
	return -1;
}



// This function sets ownership to the given player
House_SetOwner(playerid, HouseID)
{
	// Setup local variables
	new HouseSlotFree, Name[24], Msg[128];

	// Get the first free house-slot from this player
	HouseSlotFree = Player_GetFreeHouseSlot(playerid);

	// Check if the player has a free house-slot
	if (HouseSlotFree != -1)
	{
		// Get the player's name
		GetPlayerName(playerid, Name, sizeof(Name));

		// Store the house-id for the player
		APlayerData[playerid][Houses][HouseSlotFree] = HouseID;
		// Let the player pay for the house
		RewardPlayer(playerid, -AHouseData[HouseID][HousePrice], 0);

		// Set the house as owned
		AHouseData[HouseID][Owned] = true;
		// Store the owner-name for the house
		format(AHouseData[HouseID][Owner], 24, Name);
		// Set the level to 1
		AHouseData[HouseID][HouseLevel] = 1;
		// Set the default house-name ("<playername>'s house")
		format(AHouseData[HouseID][HouseName], 100, TXT_DefaultHouseName, Name);

		// Also, update the pickup and map-icon for this house
		House_UpdateEntrance(HouseID);

		// Save the player-file (and also his houses/businesses)
		PlayerFile_Save(playerid);

		// Let the player know he bought the house
		format(Msg, 128, TXT_PlayerBoughtHouse, AHouseData[HouseID][HousePrice]);
		SendClientMessage(playerid, 0xFFFFFFFF, Msg);
	}
	else
	    SendClientMessage(playerid, 0xFFFFFFFF, TXT_PlayerOwnsMaxHouses);

	return 1;
}



// This function is used to spawn back at the entrance of your house
House_Exit(playerid, HouseID)
{
	// Set the player in the normal world again
	SetPlayerVirtualWorld(playerid, 0);
	SetPlayerInterior(playerid, 0);
	// Set the position of the player at the entrance of his house
	SetPlayerPos(playerid, AHouseData[HouseID][HouseX], AHouseData[HouseID][HouseY], AHouseData[HouseID][HouseZ]);
	// Also clear the tracking-variable to track in which house the player is
	APlayerData[playerid][CurrentHouse] = 0;

	// Check if there is a timer-value set for exiting the house (this timer freezes the player while the environment is being loaded)
	if (ExitHouseTimer > 0)
	{
		// Don't allow the player to fall
	    TogglePlayerControllable(playerid, 0);
		// Let the player know he's frozen for 5 seconds
		GameTextForPlayer(playerid, TXT_ExitHouseReloadEnv, ExitHouseTimer, 4);
		// Start a timer that will allow the player to fall again when the environment has loaded
		SetTimerEx("House_ExitTimer", ExitHouseTimer, false, "ii", playerid, HouseID);
	}

	return 1;
}

forward House_ExitTimer(playerid, HouseID);
public House_ExitTimer(playerid, HouseID)
{
	// Allow the player to move again (environment should have been loaded now)
    TogglePlayerControllable(playerid, 1);

	// Respawn the player's vehicles near the house (only the vehicles that belong to this house)
	for (new CarSlot; CarSlot < 10; CarSlot++)
		if (AHouseData[HouseID][VehicleIDs][CarSlot] != 0)
		    SetVehicleToRespawn(AHouseData[HouseID][VehicleIDs][CarSlot]);

	return 1;
}



// This function adds a pickup for the given house
House_CreateEntrance(HouseID)
{
	// Setup local variables
	new Msg[128], Float:x, Float:y, Float:z;

	// Get the coordinates of the house's pickup (usually near the door)
	x = AHouseData[HouseID][HouseX];
	y = AHouseData[HouseID][HouseY];
	z = AHouseData[HouseID][HouseZ];

	// Add a new pickup at the house's location (usually near the door), green = free, blue = owned
	if (AHouseData[HouseID][Owned] == true)
	{
		// Create a blue house-pickup (house is owned)
 		AHouseData[HouseID][PickupID] = CreateDynamicPickup(1272, 1, x, y, z, 0);
		// Create the 3DText that appears above the house-pickup (displays the housename and the name of the owner)
		format(Msg, 128, TXT_PickupHouseOwned, AHouseData[HouseID][HouseName], AHouseData[HouseID][Owner], AHouseData[HouseID][HouseLevel]);
		AHouseData[HouseID][DoorText] = CreateDynamic3DTextLabel(Msg, 0x008080FF, x, y, z + 1.0, 50.0);
		// Add a streamed icon to the map (red house), type = 32, color = 0, world = 0, interior = 0, playerid = -1, drawdist = 150.0
		if (ShowBoughtHouses == true)
			AHouseData[HouseID][MapIconID] = CreateDynamicMapIcon(x, y, z, 32, 0, 0, 0, -1, 150.0);
	}
	else
	{
        // Create a green house-pickup (house is free)
		AHouseData[HouseID][PickupID] = CreateDynamicPickup(1273, 1, x, y, z, 0);
		// Create the 3DText that appears above the house-pickup (displays the price of the house)
		format(Msg, 128, TXT_PickupHouseForSale, AHouseData[HouseID][HousePrice], AHouseData[HouseID][HouseMaxLevel]);
		AHouseData[HouseID][DoorText] = CreateDynamic3DTextLabel(Msg, 0x008080FF, x, y, z + 1.0, 50.0);
		// Add a streamed icon to the map (green house), type = 31, color = 0, world = 0, interior = 0, playerid = -1, drawdist = 150.0
		AHouseData[HouseID][MapIconID] = CreateDynamicMapIcon(x, y, z, 31, 0, 0, 0, -1, 150.0);
	}
}

// This function changes the pickup (and map-icon) for the given house (used when buying or selling a house)
House_UpdateEntrance(HouseID)
{
	// Setup local variables
	new Msg[128], Float:x, Float:y, Float:z;

	// Get the coordinates of the house's pickup (usually near the door)
	x = AHouseData[HouseID][HouseX];
	y = AHouseData[HouseID][HouseY];
	z = AHouseData[HouseID][HouseZ];

	// Destroy the pickup and map-icon near the house's entrance
	DestroyDynamicPickup(AHouseData[HouseID][PickupID]);
	DestroyDynamicMapIcon(AHouseData[HouseID][MapIconID]);

	// Add a new pickup at the house's location (usually near the door), green = free, blue = owned
	if (AHouseData[HouseID][Owned] == true)
	{
		// Create a blue house-pickup (house is owned)
 		AHouseData[HouseID][PickupID] = CreateDynamicPickup(1272, 1, x, y, z, 0);
		// Update the 3DText that appears above the house-pickup (displays the housename and the name of the owner)
		format(Msg, 128, TXT_PickupHouseOwned, AHouseData[HouseID][HouseName], AHouseData[HouseID][Owner], AHouseData[HouseID][HouseLevel]);
		UpdateDynamic3DTextLabelText(AHouseData[HouseID][DoorText], 0x008080FF, Msg);
		// Add a streamed icon to the map (red house), type = 32, color = 0, world = 0, interior = 0, playerid = -1, drawdist = 150.0
		if (ShowBoughtHouses == true)
			AHouseData[HouseID][MapIconID] = CreateDynamicMapIcon(x, y, z, 32, 0, 0, 0, -1, 150.0);
	}
	else
	{
        // Create a green house-pickup (house is free)
		AHouseData[HouseID][PickupID] = CreateDynamicPickup(1273, 1, x, y, z, 0);
		// Update the 3DText that appears above the house-pickup (displays the price of the house)
		format(Msg, 128, TXT_PickupHouseForSale, AHouseData[HouseID][HousePrice], AHouseData[HouseID][HouseMaxLevel]);
		UpdateDynamic3DTextLabelText(AHouseData[HouseID][DoorText], 0x008080FF, Msg);
		// Add a streamed icon to the map (green house), type = 31, color = 0, world = 0, interior = 0, playerid = -1, drawdist = 150.0
		AHouseData[HouseID][MapIconID] = CreateDynamicMapIcon(x, y, z, 31, 0, 0, 0, -1, 150.0);
	}
}

// This function adds a vehicle to the house (if possible)
House_AddVehicle(HouseID, cModel, cPaint, cComponents[], Float:cx, Float:cy, Float:cz, Float:crot, Col1, Col2)
{
	// Setup local variables
	new vid, CarSlot, vText[128];

	// Get a free carslot from the house
	CarSlot = House_GetFreeCarSlot(HouseID);

	// Check if there is a free carslot
	if (CarSlot != -1)
	{
		// Create a new vehicle and get the vehicle-id
		vid = CreateVehicle(cModel, cx, cy, cz, crot, Col1, Col2, 600);
		// Store the vehicle-id in the house's free carslot
		AHouseData[HouseID][VehicleIDs][CarSlot] = vid;

		// Save the model of the vehicle
		AVehicleData[vid][Model] = cModel;
		// Save the paintjob of the vehicle and apply it
		AVehicleData[vid][PaintJob] = cPaint;
		if (cPaint != 0)
			ChangeVehiclePaintjob(vid, cPaint - 1);

		// Also update the car-color
		ChangeVehicleColor(vid, Col1, Col2);
		// Save the colors of the vehicle
		AVehicleData[vid][Color1] = Col1;
		AVehicleData[vid][Color2] = Col2;

		// Save the components of the vehicle and apply them
		for (new i; i < 14; i++)
		{
			AVehicleData[vid][Components][i] = cComponents[i];
		    // Check if the componentslot has a valid component-id
			if (AVehicleData[vid][Components][i] != 0)
		        AddVehicleComponent(vid, AVehicleData[vid][Components][i]); // Add the component to the vehicle
		}

		// Save the spawn-data of the vehicle
        AVehicleData[vid][SpawnX] = cx;
        AVehicleData[vid][SpawnY] = cy;
        AVehicleData[vid][SpawnZ] = cz;
        AVehicleData[vid][SpawnRot] = crot;
		// Also set the fuel to maximum
		AVehicleData[vid][Fuel] = MaxFuel;
		// Also set the owner
		AVehicleData[vid][Owned] = true;
		format(AVehicleData[vid][Owner], 24, AHouseData[HouseID][Owner]);
		// Save the HouseID for the vehicle
		AVehicleData[vid][BelongsToHouse] = HouseID;
		// Add a 3DText label to the vehicle, displaying the name of the owner
        format(vText, sizeof(vText), "Aracýn sahibi: \n%s", AVehicleData[vid][Owner]);
        AVehicleData[vid][VehicleText] = CreateDynamic3DTextLabel(vText, 0xFFFFFF, 0.0, 0.0, 0.0, 80.0, INVALID_PLAYER_ID, vid);
	}
	else // No free carslot was found, return 0
		return 0;

	// Exit the function and return the vehicle-id
	return vid;
}

// This function is used only when you respawn your vehicles by exiting your house
House_ReplaceVehicle(HouseID, CarSlot)
{
	// Setup local variables
	new vid, cModel, cPaint, cComponents[14], Float:cx, Float:cy, Float:cz, Float:crot, Col1, Col2, Float:Health, cFuel, Neons;
	new panels, doors, lights, tires;

	// Get the data from the already existing vehicle that was parked before
	vid = AHouseData[HouseID][VehicleIDs][CarSlot];
	cModel = AVehicleData[vid][Model];
	cPaint = AVehicleData[vid][PaintJob];
	cFuel = AVehicleData[vid][Fuel];
	for (new i; i < 14; i++)
	    cComponents[i] = AVehicleData[vid][Components][i];
	Col1 = AVehicleData[vid][Color1];
	Col2 = AVehicleData[vid][Color2];
	cx = AVehicleData[vid][SpawnX];
	cy = AVehicleData[vid][SpawnY];
	cz = AVehicleData[vid][SpawnZ];
	crot = AVehicleData[vid][SpawnRot];
	Neons = AVehicleData[vid][NeonObjectModel];
	GetVehicleHealth(vid, Health);
	GetVehicleDamageStatus(vid, panels, doors, lights, tires);

	// Remove neons
	if (AVehicleData[vid][NeonObjectModel] != 0)
	{
        DestroyObject(AVehicleData[vid][NeonLeft]);
        DestroyObject(AVehicleData[vid][NeonRight]);
        AVehicleData[vid][NeonLeft] = 0;
        AVehicleData[vid][NeonRight] = 0;
		AVehicleData[vid][NeonObjectModel] = 0;
	}

	// Delete the vehicle and clear the data
	Vehicle_Delete(vid);

	// Create a new vehicle in the same carslot
	vid = House_AddVehicle(HouseID, cModel, cPaint, cComponents, Float:cx, Float:cy, Float:cz, Float:crot, Col1, Col2);
	// Update the fuel of the vehicle to the previous setting
	AVehicleData[vid][Fuel] = cFuel;
	// Update the health to what it was before and update the bodywork
	SetVehicleHealth(vid, Health);
	UpdateVehicleDamageStatus(vid, panels, doors, lights, tires);
	// Re-apply the neons if they were there
	if (Neons != 0)
	{
		AVehicleData[vid][NeonObjectModel] = Neons;
	    AVehicleData[vid][NeonLeft] = CreateObject(AVehicleData[vid][NeonObjectModel],0,0,0,0,0,0);
	    AVehicleData[vid][NeonRight] = CreateObject(AVehicleData[vid][NeonObjectModel],0,0,0,0,0,0);
		AttachObjectToVehicle(AVehicleData[vid][NeonLeft], vid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
		AttachObjectToVehicle(AVehicleData[vid][NeonRight], vid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
	}

	return vid;
}

// This function is used only when a player logs out (the vehicles are unloaded)
House_RemoveVehicles(HouseID)
{
	// Setup local variables
	new vid;

	// Loop through all carslots of this house
	for (new CarSlot; CarSlot < 10; CarSlot++)
	{
		// Get the vehicle-id
		vid = AHouseData[HouseID][VehicleIDs][CarSlot];

		// Check if there was a vehicle in this carslot
		if (vid != 0)
		{
			// Delete the vehicle and clear the data
			DestroyVehicle(vid);
			AHouseData[HouseID][VehicleIDs][CarSlot] = 0;
			AVehicleData[vid][Owned] = false;
			AVehicleData[vid][Owner] = 0;
			AVehicleData[vid][Model] = 0;
			AVehicleData[vid][PaintJob] = 0;
			for (new i; i < 14; i++)
			    AVehicleData[vid][Components][i] = 0;
			AVehicleData[vid][SpawnX] = 0.0;
			AVehicleData[vid][SpawnY] = 0.0;
			AVehicleData[vid][SpawnZ] = 0.0;
			AVehicleData[vid][SpawnRot] = 0.0;
			AVehicleData[vid][BelongsToHouse] = 0;
			DestroyDynamic3DTextLabel(AVehicleData[vid][VehicleText]);

			// Remove neons
			if (AVehicleData[vid][NeonObjectModel] != 0)
			{
		        DestroyObject(AVehicleData[vid][NeonLeft]);
		        DestroyObject(AVehicleData[vid][NeonRight]);
		        AVehicleData[vid][NeonLeft] = 0;
		        AVehicleData[vid][NeonRight] = 0;
				AVehicleData[vid][NeonObjectModel] = 0;
			}
		}
	}
}

// This function calculates the sell-price for the given house
House_CalcSellPrice(HouseID)
{
	// Setup local variables
	new SellPrice, NumUpgrades, UpgradePrice;

	// Calculate 50% of the original buying price (base-price for selling)
	SellPrice = AHouseData[HouseID][HousePrice] / 2;
	// Calculate the number of upgrades applied to the house
	NumUpgrades = AHouseData[HouseID][HouseLevel] - 1;
	// Also calculate 50% for each upgrade, based on the percentage for upgrading the house
	UpgradePrice = ((AHouseData[HouseID][HousePrice] / 100) * HouseUpgradePercent) * NumUpgrades;

	// Add 50% of the upgrade-price to the sell-price
	SellPrice = SellPrice + UpgradePrice;

	// Return the total sell-price to the calling function
	return SellPrice;
}

// his function returns "1" if the given player is the owner of the given house
House_PlayerIsOwner(playerid, HouseID)
{
	// Loop through all houses owner by this player
	for (new i; i < MAX_HOUSESPERPLAYER; i++)
	{
		// Check if the player owns the house in any of his house-slots
		if (APlayerData[playerid][Houses][i] == HouseID)
		    return 1;
	}

	// If the player doesn't own the house, return 0
	return 0;
}

// ************************************************************************************************************************************************************
// PPC_Business
// ************************************************************************************************************************************************************

// This timer increases the variable "BusinessTransactionTime" every hour
forward Business_TransactionTimer();
public Business_TransactionTimer()
{
	// Increase the variable by one
    BusinessTransactionTime++;

	// And save it to the file
	BusinessTime_Save();
}



// This function returns the first free business-slot for the given player
Player_GetFreeBusinessSlot(playerid)
{
	// Check if the player has room for another business (he hasn't bought the maximum amount of businesses per player yet)
	// and get the slot-id
	for (new BusIndex; BusIndex < MAX_BUSINESSPERPLAYER; BusIndex++) // Loop through all business-slots of the player
		if (APlayerData[playerid][Business][BusIndex] == 0) // Check if this business slot is free
		    return BusIndex; // Return the free BusIndex for this player

	// If there were no free business-slots, return "-1"
	return -1;
}



// This function sets ownership to the given player
Business_SetOwner(playerid, BusID)
{
	// Setup local variables
	new BusSlotFree, Name[24], Msg[128], BusType;

	// Get the first free business-slot from this player
	BusSlotFree = Player_GetFreeBusinessSlot(playerid);

	// Check if the player has a free business-slot
	if (BusSlotFree != -1)
	{
		// Get the player's name
		GetPlayerName(playerid, Name, sizeof(Name));

		// Store the business-id for the player
		APlayerData[playerid][Business][BusSlotFree] = BusID;
		// Get the business-type
		BusType = ABusinessData[BusID][BusinessType];

		// Let the player pay for the business
		RewardPlayer(playerid, -ABusinessInteriors[BusType][BusPrice], 0);

		// Set the business as owned
		ABusinessData[BusID][Owned] = true;
		// Store the owner-name for the business
		format(ABusinessData[BusID][Owner], 24, Name);
		// Set the level to 1
		ABusinessData[BusID][BusinessLevel] = 1;
		// Set the default business-name
		format(ABusinessData[BusID][BusinessName], 100, ABusinessInteriors[BusType][InteriorName]);
		// Store the current transaction-time (this is used so the player can only retrieve cash from the business from the moment he bought it)
		ABusinessData[BusID][LastTransaction] = BusinessTransactionTime;

		// Also, update 3DText of this business
		Business_UpdateEntrance(BusID);

		// Save the player-file (and also his houses/businesses)
		PlayerFile_Save(playerid);

		// Let the player know he bought the business
		format(Msg, 128, TXT_PlayerBoughtBusiness, ABusinessInteriors[BusType][BusPrice]);
		SendClientMessage(playerid, 0xFFFFFFFF, Msg);
	}
	else
	    SendClientMessage(playerid, 0xFFFFFFFF, TXT_PlayerOwnsMaxBusinesses);

	return 1;
}



// This function is used to spawn back at the entrance of your business
Business_Exit(playerid, BusID)
{
	// Set the player in the normal world again
	SetPlayerVirtualWorld(playerid, 0);
	SetPlayerInterior(playerid, 0);
	// Set the position of the player at the entrance of his business
	SetPlayerPos(playerid, ABusinessData[BusID][BusinessX], ABusinessData[BusID][BusinessY], ABusinessData[BusID][BusinessZ]);
	// Also clear the tracking-variable to track in which business the player is
	APlayerData[playerid][CurrentBusiness] = 0;

	// Check if there is a timer-value set for exiting the business (this timer freezes the player while the environment is being loaded)
	if (ExitBusinessTimer > 0)
	{
		// Don't allow the player to fall
	    TogglePlayerControllable(playerid, 0);
		// Let the player know he's frozen for 5 seconds
		GameTextForPlayer(playerid, TXT_ExitHouseReloadEnv, ExitBusinessTimer, 4);
		// Start a timer that will allow the player to fall again when the environment has loaded
		SetTimerEx("Business_ExitTimer", ExitBusinessTimer, false, "ii", playerid, BusID);
	}

	return 1;
}

forward Business_ExitTimer(playerid, BusID);
public Business_ExitTimer(playerid, BusID)
{
	// Allow the player to move again (environment should have been loaded now)
    TogglePlayerControllable(playerid, 1);

	return 1;
}



// This function adds a pickup for the given business
Business_CreateEntrance(BusID)
{
	// Setup local variables
	new Msg[128], Float:x, Float:y, Float:z, BusType, Icon;

	// Get the coordinates of the house's pickup (usually near the door)
	x = ABusinessData[BusID][BusinessX];
	y = ABusinessData[BusID][BusinessY];
	z = ABusinessData[BusID][BusinessZ];
	// Get the business-type and icon
	BusType = ABusinessData[BusID][BusinessType];
	Icon = ABusinessInteriors[BusType][IconID];

	// Add a dollar-sign to indicate this business
	ABusinessData[BusID][PickupID] = CreateDynamicPickup(1274, 1, x, y, z, 0);
	// Add a map-icon depending on which type the business is
	ABusinessData[BusID][MapIconID] = CreateDynamicMapIcon(x, y, z, Icon, 0, 0, 0, -1, 150.0);

	// Add a new 3DText at the business's location (usually near the door)
	if (ABusinessData[BusID][Owned] == true)
	{
		// Create the 3DText that appears above the business-pickup (displays the businessname, the name of the owner and the current level)
		format(Msg, 128, TXT_PickupBusinessOwned, ABusinessData[BusID][BusinessName], ABusinessData[BusID][Owner], ABusinessData[BusID][BusinessLevel]);
		ABusinessData[BusID][DoorText] = CreateDynamic3DTextLabel(Msg, 0x008080FF, x, y, z + 1.0, 50.0);
	}
	else
	{
		// Create the 3DText that appears above the business-pickup (displays the price of the business and the earnings)
		format(Msg, 128, TXT_PickupBusinessForSale, ABusinessInteriors[BusType][InteriorName], ABusinessInteriors[BusType][BusPrice], ABusinessInteriors[BusType][BusEarnings]);
		ABusinessData[BusID][DoorText] = CreateDynamic3DTextLabel(Msg, 0x008080FF, x, y, z + 1.0, 50.0);
	}
}

// This function changes the 3DText for the given business (used when buying or selling a business)
Business_UpdateEntrance(BusID)
{
	// Setup local variables
	new Msg[128], BusType;

	// Get the business-type
	BusType = ABusinessData[BusID][BusinessType];

	// Update the 3DText at the business's location (usually near the door)
	if (ABusinessData[BusID][Owned] == true)
	{
		// Create the 3DText that appears above the business-pickup (displays the businessname, the name of the owner and the current level)
		format(Msg, 128, TXT_PickupBusinessOwned, ABusinessData[BusID][BusinessName], ABusinessData[BusID][Owner], ABusinessData[BusID][BusinessLevel]);
		UpdateDynamic3DTextLabelText(ABusinessData[BusID][DoorText], 0x008080FF, Msg);
	}
	else
	{
		// Create the 3DText that appears above the business-pickup (displays the price of the business and the earnings)
		format(Msg, 128, TXT_PickupBusinessForSale, ABusinessInteriors[BusType][InteriorName], ABusinessInteriors[BusType][BusPrice], ABusinessInteriors[BusType][BusEarnings]);
		UpdateDynamic3DTextLabelText(ABusinessData[BusID][DoorText], 0x008080FF, Msg);
	}
}

// This function pays the current earnings of the given business to the player
Business_PayEarnings(playerid, BusID)
{
	// Setup local variables
	new Msg[128];

	// Get the business-type
	new BusType = ABusinessData[BusID][BusinessType];

	// Calculate the earnings of the business since the last transaction
	// This is calculated by the number of minutes between the current business-time and last business-time, multiplied by the earnings-per-minute and business-level
	new Earnings = (BusinessTransactionTime - ABusinessData[BusID][LastTransaction]) * ABusinessInteriors[BusType][BusEarnings] * ABusinessData[BusID][BusinessLevel];
	// Reset the last transaction time to the current time
	ABusinessData[BusID][LastTransaction] = BusinessTransactionTime;
	// Reward the player with his earnings
	RewardPlayer(playerid, Earnings, 0);
	// Inform the player that he has earned money from his business
	format(Msg, 128, "{00FF00}Ýþyeriniz son çekiminizden beri {FFFF00}$%i{00FF00} kazandý", Earnings);
	SendClientMessage(playerid, 0xFFFFFFFF, Msg);
}

// ************************************************************************************************************************************************************
// PPC_GameModeInit
// ************************************************************************************************************************************************************

// This function is required only once to fix houses that were bought and sold again
// If you would sell a house, then restart the server, that house cannot be bought again (= bugged)
// The player doesn't own the house anymore, but the house still has the player as owner
// This function loops through all houses and checks if the owner (if any) still owns the house
// If the owner doesn't own the house, the house's ownership is cleared and the house-file will be re-saved
// After the fixing, you should remove the call to this function in OnGameModeInit, compile and restart the server
// as this function is only required once
stock FixHouses()
{
	// Setup local variables
	new file[100], File:PFile, Name[24], LineFromFile[100], ParameterName[50], ParameterValue[50];
	new bool:PlayerOwnedTheHouse = true, HousesFixed;

	// Loop through all houses
	for (new HouseID = 1; HouseID < MAX_HOUSES; HouseID++)
	{
		// Check if the house is owned
		if (AHouseData[HouseID][Owned] == true)
		{
			// Get the name of the owner
			format(Name, 24, AHouseData[HouseID][Owner]);
			// Construct the complete filename for this player's account
			format(file, sizeof(file), PlayerFile, Name);

			// Check if the player's datafile exists
			if (fexist(file))
			{
				PFile = fopen(file, io_read); // Open the playerfile for reading

				fread(PFile, LineFromFile); // Read the first line of the file

				// Keep reading until the end of the file is found (no more data)
				while (strlen(LineFromFile) > 0)
				{
					StripNewLine(LineFromFile); // Strip any newline characters from the LineFromFile
					sscanf(LineFromFile, "s[50]s[50]", ParameterName, ParameterValue); // Extract parametername and parametervalue

                    // If the parametername is correct ("House")
					if (strcmp(ParameterName, "House", false) == 0)
					{
					    // Check if the player owns this house
					    if (strval(ParameterValue) == HouseID)
                            PlayerOwnedTheHouse = true; // The player really owns the house
					}

                    // Read the next line of the file
					fread(PFile, LineFromFile);
				}

                // Close the player-file
				fclose(PFile);

				// Check if the player doesn't own the house
				if (PlayerOwnedTheHouse == false)
				{
					// Clear the ownership from the house
					AHouseData[HouseID][Owned] = false;
					AHouseData[HouseID][Owner] = 0;
					AHouseData[HouseID][HouseName] = 0;
					AHouseData[HouseID][HouseLevel] = 1;
					// Update the house-entrance
					House_UpdateEntrance(HouseID);
					// Save the house, hereby fixing the ownership-bug
					HouseFile_Save(HouseID);
					// Increase the number of houses that have been fixed
					HousesFixed++;
				}

				// Reset the variable that holds if the player owned the house, so the next house/owner can be processed
                PlayerOwnedTheHouse = false;
			}
		}
	}

	// All houses have been processed, now print a line to the server's console
	printf(TXT_HousesFixed, HousesFixed);
}



// Add all static vehicles and pickups when the server starts that are required
GameModeInit_VehiclesPickups()
{
	// Setup local variables
	new LastVehicleMsg[100], LastObjectMsg[100], LastHouseMsg[100], LastBusinessMsg[100], LastCameraMsg[100];

	// Add some trucks to all trucking depots
	GameModeInit_TruckDepots();
	// Add busses to all bus-depots
	GameModeInit_Busses();
	// Add busstops to the map
	GameModeInit_Busstops();
	// Add police vehicles to the Police Impounds
	GameModeInit_Police();
	// Add mafia vehicles to the mafia hideoue
	GameModeInit_Mafia();
	// Add planes and helicopters to the airports
	GameModeInit_Airports();
	// Add towtrucks for assistance class
	GameModeInit_Assistance();
	// Add burrito's and Faggio's for courier class
	GameModeInit_Courier();
	// Add dozers for roadworker class
	GameModeInit_RoadWorker();

	// Add some special pickups
	GameModeInit_PickupsIcons();

	// Add all objects required for toll-gates
	GameModeInit_Toll();

	// Load all houses and create pickups and 3dTexts for them
	Housing_LoadAll();
	// Load all speedcameras
	Camera_LoadAll();
	// Load all businesses and start the business timer (runs every hour)
    Business_LoadAll();
	SetTimer("Business_TransactionTimer", 1000 * 60 * 60, true);
	// Load the current intrest time and start the intrest timer (runs every hour)
	IntrestTime_Load();
	SetTimer("Bank_IntrestTimer", 1000 * 60 * 60, true);

	// Print the LastVehicleID to the server's console
	format(LastVehicleMsg, 100, TXT_LastVehicleID, LastVehicleID);
	format(LastObjectMsg, 100, TXT_LastObjectID, LastObjectID);
	format(LastHouseMsg, 100, TXT_TotalHouses, TotalHouses);
	format(LastBusinessMsg, 100, TXT_TotalBusiness, TotalBusiness);
	format(LastCameraMsg, 100, TXT_TotalSpeedCameras, TotalCameras);
	print(TXT_DebugInfo);
	print("-------------------------------------");
	print(LastVehicleMsg);
	print(LastObjectMsg);
	print(LastHouseMsg);
	print(LastBusinessMsg);
	print(LastCameraMsg);
	print("-------------------------------------");
}



// Add trucks and trailers to the truck-stops
GameModeInit_TruckDepots()
{
	// Add trailers, trucks , Flatbeds and "DFT-30" to Fallen Tree Depot (Class 0)
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerCargo, -475.0, -523.0, 26.0, 90.0, random(126), random(126), 600); // Cargo trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerOre, -475.0, -518.0, 26.0, 90.0, random(126), random(126), 600); // Ore trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerFluids, -475.0, -513.0, 26.0, 90.0, random(126), random(126), 600); // Liquids trailer
	LastVehicleID = Vehicle_AddStatic(VehicleLineRunner, -475.0, -508.0, 26.0, 90.0, random(126), random(126), 600); // LineRunner
	LastVehicleID = Vehicle_AddStatic(VehicleTanker, -475.0, -503.0, 26.0, 90.0, random(126), random(126), 600); // Tanker
	LastVehicleID = Vehicle_AddStatic(VehicleRoadTrain, -475.0, -498.0, 26.0, 90.0, random(126), random(126), 600); // Roadtrain
	LastVehicleID = Vehicle_AddStatic(VehicleDFT30, -475.0, -493.0, 26.0, 90.0, random(126), random(126), 600); // DFT-30
	LastVehicleID = Vehicle_AddStatic(VehicleFlatbed, -475.0, -488.0, 26.0, 90.0, random(126), random(126), 600); // Flatbed
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerCargo, -475.0, -475.0, 26.0, 180.0, random(126), random(126), 600); // Cargo trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerOre, -480.0, -475.0, 26.0, 180.0, random(126), random(126), 600); // Ore trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerFluids, -485.0, -475.0, 26.0, 180.0, random(126), random(126), 600); // Liquids trailer
	LastVehicleID = Vehicle_AddStatic(VehicleLineRunner, -490.0, -475.0, 26.0, 180.0, random(126), random(126), 600); // LineRunner
	LastVehicleID = Vehicle_AddStatic(VehicleTanker, -495.0, -475.0, 26.0, 180.0, random(126), random(126), 600); // Tanker
	LastVehicleID = Vehicle_AddStatic(VehicleRoadTrain, -500.0, -475.0, 26.0, 180.0, random(126), random(126), 600); // Roadtrain
	LastVehicleID = Vehicle_AddStatic(VehicleDFT30, -505.0, -475.0, 26.0, 180.0, random(126), random(126), 600); // DFT-30
	LastVehicleID = Vehicle_AddStatic(VehicleFlatbed, -510.0, -475.0, 26.0, 180.0, random(126), random(126), 600); // Flatbed
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerCargo, -515.0, -475.0, 26.0, 180.0, random(126), random(126), 600); // Cargo trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerOre, -520.0, -475.0, 26.0, 180.0, random(126), random(126), 600); // Ore trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerFluids, -525.0, -475.0, 26.0, 180.0, random(126), random(126), 600); // Liquids trailer
	LastVehicleID = Vehicle_AddStatic(VehicleLineRunner, -530.0, -475.0, 26.0, 180.0, random(126), random(126), 600); // LineRunner
	LastVehicleID = Vehicle_AddStatic(VehicleTanker, -535.0, -475.0, 26.0, 180.0, random(126), random(126), 600); // Tanker
	LastVehicleID = Vehicle_AddStatic(VehicleRoadTrain, -540.0, -475.0, 26.0, 180.0, random(126), random(126), 600); // Roadtrain
	LastVehicleID = Vehicle_AddStatic(VehicleDFT30, -545.0, -475.0, 26.0, 180.0, random(126), random(126), 600); // DFT-30
	LastVehicleID = Vehicle_AddStatic(VehicleFlatbed, -550.0, -475.0, 26.0, 180.0, random(126), random(126), 600); // Flatbed

	// Add "Flatbed" and "DFT-30" trucks to Flint Trucking Depot (Class 1)
	LastVehicleID = Vehicle_AddStatic(VehicleDFT30, -77.0, -1109.0, 1.25, 160.0, random(126), random(126), 600); // DFT-30
	LastVehicleID = Vehicle_AddStatic(VehicleDFT30, -72.0, -1112.0, 1.25, 160.0, random(126), random(126), 600); // DFT-30
	LastVehicleID = Vehicle_AddStatic(VehicleDFT30, -67.0, -1114.0, 1.25, 160.0, random(126), random(126), 600); // DFT-30
	LastVehicleID = Vehicle_AddStatic(VehicleFlatbed, -30.0, -1128.0, 1.25, 160.0, random(126), random(126), 600); // Flatbed
	LastVehicleID = Vehicle_AddStatic(VehicleFlatbed, -41.0, -1152.0, 1.25, 335.0, random(126), random(126), 600); // Flatbed
	LastVehicleID = Vehicle_AddStatic(VehicleFlatbed, -46.0, -1150.0, 1.25, 335.0, random(126), random(126), 600); // Flatbed
	LastVehicleID = Vehicle_AddStatic(VehicleFlatbed, -51.0, -1148.0, 1.25, 335.0, random(126), random(126), 600); // Flatbed
	LastVehicleID = Vehicle_AddStatic(VehicleFlatbed, -56.0, -1146.0, 1.25, 335.0, random(126), random(126), 600); // Flatbed
	LastVehicleID = Vehicle_AddStatic(VehicleFlatbed, -61.0, -1144.0, 1.25, 335.0, random(126), random(126), 600); // Flatbed

	// Add trailers, trucks , Flatbeds and "DFT-30" to LVA Freight Depot (Class 2)
	LastVehicleID = Vehicle_AddStatic(VehicleDFT30, 1467.0, 975.0, 11.0, 0.0, random(126), random(126), 600); // DFT-30
	LastVehicleID = Vehicle_AddStatic(VehicleFlatbed, 1472.0, 975.0, 11.0, 0.0, random(126), random(126), 600); // Flatbed
	LastVehicleID = Vehicle_AddStatic(VehicleDFT30, 1445.0, 975.0, 11.0, 0.0, random(126), random(126), 600); // DFT-30
	LastVehicleID = Vehicle_AddStatic(VehicleFlatbed, 1440.0, 975.0, 11.0, 0.0, random(126), random(126), 600); // Flatbed
	LastVehicleID = Vehicle_AddStatic(VehicleDFT30, 1435.0, 975.0, 11.0, 0.0, random(126), random(126), 600); // DFT-30
	LastVehicleID = Vehicle_AddStatic(VehicleFlatbed, 1430.0, 975.0, 11.0, 0.0, random(126), random(126), 600); // Flatbed
	LastVehicleID = Vehicle_AddStatic(VehicleDFT30, 1420.0, 975.0, 11.0, 0.0, random(126), random(126), 600); // DFT-30
	LastVehicleID = Vehicle_AddStatic(VehicleFlatbed, 1415.0, 975.0, 11.0, 0.0, random(126), random(126), 600); // Flatbed
	LastVehicleID = Vehicle_AddStatic(VehicleDFT30, 1410.0, 975.0, 11.0, 0.0, random(126), random(126), 600); // DFT-30
	LastVehicleID = Vehicle_AddStatic(VehicleFlatbed, 1405.0, 975.0, 11.0, 0.0, random(126), random(126), 600); // Flatbed
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerCargo, 1490.0, 1015.0, 11.0, 90.0, random(126), random(126), 600); // Cargo trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerOre, 1490.0, 1020.0, 11.0, 90.0, random(126), random(126), 600); // Ore trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerFluids, 1490.0, 1025.0, 11.0, 90.0, random(126), random(126), 600); // Liquids trailer
	LastVehicleID = Vehicle_AddStatic(VehicleLineRunner, 1490.0, 1030.0, 11.0, 90.0, random(126), random(126), 600); // LineRunner
	LastVehicleID = Vehicle_AddStatic(VehicleTanker, 1490.0, 1035.0, 11.0, 90.0, random(126), random(126), 600); // Tanker
	LastVehicleID = Vehicle_AddStatic(VehicleRoadTrain, 1490.0, 1040.0, 11.0, 90.0, random(126), random(126), 600); // Roadtrain
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerCargo, 1490.0, 1045.0, 11.0, 90.0, random(126), random(126), 600); // Cargo trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerOre, 1490.0, 1050.0, 11.0, 90.0, random(126), random(126), 600); // Ore trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerFluids, 1490.0, 1055.0, 11.0, 90.0, random(126), random(126), 600); // Liquids trailer
	LastVehicleID = Vehicle_AddStatic(VehicleLineRunner, 1490.0, 1060.0, 11.0, 90.0, random(126), random(126), 600); // LineRunner
	LastVehicleID = Vehicle_AddStatic(VehicleTanker, 1490.0, 1065.0, 11.0, 90.0, random(126), random(126), 600); // Tanker
	LastVehicleID = Vehicle_AddStatic(VehicleRoadTrain, 1490.0, 1070.0, 11.0, 90.0, random(126), random(126), 600); // Roadtrain

	// Add trailers, trucks , Flatbeds and "DFT-30" to Doherty Depot (Class 3)
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerCargo, -2105.0, -200.0, 35.5, 90.0, random(126), random(126), 600); // Cargo trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerOre, -2105.0, -205.0, 35.5, 90.0, random(126), random(126), 600); // Ore trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerFluids, -2105.0, -210.0, 35.5, 90.0, random(126), random(126), 600); // Liquids trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerCargo, -2105.0, -215.0, 35.5, 90.0, random(126), random(126), 600); // Cargo trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerOre, -2105.0, -220.0, 35.5, 90.0, random(126), random(126), 600); // Ore trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerFluids, -2105.0, -225.0, 35.5, 90.0, random(126), random(126), 600); // Liquids trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerCargo, -2105.0, -230.0, 35.5, 90.0, random(126), random(126), 600); // Cargo trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerOre, -2105.0, -235.0, 35.5, 90.0, random(126), random(126), 600); // Ore trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerFluids, -2105.0, -240.0, 35.5, 90.0, random(126), random(126), 600); // Liquids trailer
	LastVehicleID = Vehicle_AddStatic(VehicleDFT30, -2105.0, -245.0, 35.5, 90.0, random(126), random(126), 600); // DFT-30
	LastVehicleID = Vehicle_AddStatic(VehicleFlatbed, -2105.0, -250.0, 35.5, 90.0, random(126), random(126), 600); // Flatbed
	LastVehicleID = Vehicle_AddStatic(VehicleDFT30, -2105.0, -255.0, 35.5, 90.0, random(126), random(126), 600); // DFT-30
	LastVehicleID = Vehicle_AddStatic(VehicleFlatbed, -2105.0, -260.0, 35.5, 90.0, random(126), random(126), 600); // Flatbed
	LastVehicleID = Vehicle_AddStatic(VehicleDFT30, -2105.0, -265.0, 35.5, 90.0, random(126), random(126), 600); // DFT-30
	LastVehicleID = Vehicle_AddStatic(VehicleFlatbed, -2105.0, -270.0, 35.5, 90.0, random(126), random(126), 600); // Flatbed
	LastVehicleID = Vehicle_AddStatic(VehicleLineRunner, -2144.0, -186.0, 35.5, 270.0, random(126), random(126), 600); // LineRunner
	LastVehicleID = Vehicle_AddStatic(VehicleTanker, -2144.0, -191.0, 35.5, 270.0, random(126), random(126), 600); // Tanker
	LastVehicleID = Vehicle_AddStatic(VehicleRoadTrain, -2144.0, -196.0, 35.5, 270.0, random(126), random(126), 600); // Roadtrain
	LastVehicleID = Vehicle_AddStatic(VehicleLineRunner, -2144.0, -201.0, 35.5, 270.0, random(126), random(126), 600); // LineRunner
	LastVehicleID = Vehicle_AddStatic(VehicleTanker, -2144.0, -206.0, 35.5, 270.0, random(126), random(126), 600); // Tanker
	LastVehicleID = Vehicle_AddStatic(VehicleRoadTrain, -2144.0, -211.0, 35.5, 270.0, random(126), random(126), 600); // Roadtrain

	// Add trailers, trucks , Flatbeds and "DFT-30" to El Corona Depot (Class 4)
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerCargo, 1805.0, -2025.0, 14.0, 90.0, random(126), random(126), 600); // Cargo trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerOre, 1805.0, -2030.0, 14.0, 90.0, random(126), random(126), 600); // Ore trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerFluids, 1805.0, -2035.0, 14.0, 90.0, random(126), random(126), 600); // Liquids trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerCargo, 1805.0, -2040.0, 14.0, 90.0, random(126), random(126), 600); // Cargo trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerOre, 1805.0, -2045.0, 14.0, 90.0, random(126), random(126), 600); // Ore trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerFluids, 1805.0, -2050.0, 14.0, 90.0, random(126), random(126), 600); // Liquids trailer
	LastVehicleID = Vehicle_AddStatic(VehicleDFT30, 1745.0, -2070.0, 14.0, 0.0, random(126), random(126), 600); // DFT-30
	LastVehicleID = Vehicle_AddStatic(VehicleFlatbed, 1750.0, -2070.0, 14.0, 0.0, random(126), random(126), 600); // Flatbed
	LastVehicleID = Vehicle_AddStatic(VehicleDFT30, 1755.0, -2070.0, 14.0, 0.0, random(126), random(126), 600); // DFT-30
	LastVehicleID = Vehicle_AddStatic(VehicleFlatbed, 1760.0, -2070.0, 14.0, 0.0, random(126), random(126), 600); // Flatbed
	LastVehicleID = Vehicle_AddStatic(VehicleLineRunner, 1765.0, -2070.0, 14.0, 0.0, random(126), random(126), 600); // LineRunner
	LastVehicleID = Vehicle_AddStatic(VehicleTanker, 1770.0, -2070.0, 14.0, 0.0, random(126), random(126), 600); // Tanker
	LastVehicleID = Vehicle_AddStatic(VehicleRoadTrain, 1775.0, -2070.0, 14.0, 0.0, random(126), random(126), 600); // Roadtrain

	// Add trailers, trucks , Flatbeds and "DFT-30" to Las Payasdas Depot (Class 5)
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerCargo, -535.0, 2635.0, 54.0, 270.0, random(126), random(126), 600); // Cargo trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerOre, -535.0, 2630.0, 54.0, 270.0, random(126), random(126), 600); // Ore trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerFluids, -535.0, 2625.0, 54.0, 270.0, random(126), random(126), 600); // Liquids trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerCargo, -535.0, 2620.0, 54.0, 270.0, random(126), random(126), 600); // Cargo trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerOre, -535.0, 2615.0, 54.0, 270.0, random(126), random(126), 600); // Ore trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerFluids, -535.0, 2610.0, 54.0, 270.0, random(126), random(126), 600); // Liquids trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerCargo, -535.0, 2605.0, 54.0, 270.0, random(126), random(126), 600); // Cargo trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerOre, -535.0, 2600.0, 54.0, 270.0, random(126), random(126), 600); // Ore trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerFluids, -535.0, 2595.0, 54.0, 270.0, random(126), random(126), 600); // Liquids trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerCargo, -535.0, 2590.0, 54.0, 270.0, random(126), random(126), 600); // Cargo trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerOre, -535.0, 2585.0, 54.0, 270.0, random(126), random(126), 600); // Ore trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerFluids, -535.0, 2580.0, 54.0, 270.0, random(126), random(126), 600); // Liquids trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerCargo, -535.0, 2575.0, 54.0, 270.0, random(126), random(126), 600); // Cargo trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerOre, -535.0, 2570.0, 54.0, 270.0, random(126), random(126), 600); // Ore trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerFluids, -535.0, 2565.0, 54.0, 270.0, random(126), random(126), 600); // Liquids trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerCargo, -535.0, 2560.0, 54.0, 270.0, random(126), random(126), 600); // Cargo trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerOre, -535.0, 2555.0, 54.0, 270.0, random(126), random(126), 600); // Ore trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerFluids, -535.0, 2550.0, 54.0, 270.0, random(126), random(126), 600); // Liquids trailer

	LastVehicleID = Vehicle_AddStatic(VehicleLineRunner, -512.0, 2635.0, 54.0, 90.0, random(126), random(126), 600); // LineRunner
	LastVehicleID = Vehicle_AddStatic(VehicleTanker, -512.0, 2630.0, 54.0, 90.0, random(126), random(126), 600); // Tanker
	LastVehicleID = Vehicle_AddStatic(VehicleRoadTrain, -512.0, 2625.0, 54.0, 90.0, random(126), random(126), 600); // Roadtrain
	LastVehicleID = Vehicle_AddStatic(VehicleLineRunner, -512.0, 2620.0, 54.0, 90.0, random(126), random(126), 600); // LineRunner
	LastVehicleID = Vehicle_AddStatic(VehicleTanker, -512.0, 2615.0, 54.0, 90.0, random(126), random(126), 600); // Tanker
	LastVehicleID = Vehicle_AddStatic(VehicleRoadTrain, -512.0, 2610.0, 54.0, 90.0, random(126), random(126), 600); // Roadtrain
	LastVehicleID = Vehicle_AddStatic(VehicleDFT30, -512.0, 2605.0, 54.0, 90.0, random(126), random(126), 600); // DFT-30
	LastVehicleID = Vehicle_AddStatic(VehicleFlatbed, -512.0, 2600.0, 54.0, 90.0, random(126), random(126), 600); // Flatbed
	LastVehicleID = Vehicle_AddStatic(VehicleDFT30, -512.0, 2585.0, 54.0, 90.0, random(126), random(126), 600); // DFT-30
	LastVehicleID = Vehicle_AddStatic(VehicleFlatbed, -512.0, 2580.0, 54.0, 90.0, random(126), random(126), 600); // Flatbed
	LastVehicleID = Vehicle_AddStatic(VehicleLineRunner, -512.0, 2575.0, 54.0, 90.0, random(126), random(126), 600); // LineRunner
	LastVehicleID = Vehicle_AddStatic(VehicleTanker, -512.0, 2570.0, 54.0, 90.0, random(126), random(126), 600); // Tanker
	LastVehicleID = Vehicle_AddStatic(VehicleRoadTrain, -512.0, 2565.0, 54.0, 90.0, random(126), random(126), 600); // Roadtrain
	LastVehicleID = Vehicle_AddStatic(VehicleLineRunner, -512.0, 2560.0, 54.0, 90.0, random(126), random(126), 600); // LineRunner
	LastVehicleID = Vehicle_AddStatic(VehicleTanker, -512.0, 2555.0, 54.0, 90.0, random(126), random(126), 600); // Tanker
	LastVehicleID = Vehicle_AddStatic(VehicleRoadTrain, -512.0, 2550.0, 54.0, 90.0, random(126), random(126), 600); // Roadtrain

	// Add cement-trucks at Quarry Top (Class 6)
	LastVehicleID = Vehicle_AddStatic(VehicleCementTruck, 340.0, 850.0, 21.0, 0, random(126), random(126), 600); // Cement truck
	LastVehicleID = Vehicle_AddStatic(VehicleCementTruck, 335.0, 860.0, 21.0, 0, random(126), random(126), 600); // Cement truck
	LastVehicleID = Vehicle_AddStatic(VehicleCementTruck, 330.0, 870.0, 21.0, 0, random(126), random(126), 600); // Cement truck
	LastVehicleID = Vehicle_AddStatic(VehicleCementTruck, 325.0, 880.0, 21.0, 0, random(126), random(126), 600); // Cement truck
	LastVehicleID = Vehicle_AddStatic(VehicleCementTruck, 320.0, 890.0, 21.0, 0, random(126), random(126), 600); // Cement truck

	// Add trailers and trucks to Shady Creek Depot (Class 7)
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerCargo, -1545.0, -2737.00, 49.0, 145.0, random(126), random(126), 600); // Cargo trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerOre, -1540.9, -2739.87, 49.0, 145.0, random(126), random(126), 600); // Ore trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerFluids, -1536.8, -2742.74, 49.0, 145.0, random(126), random(126), 600); // Liquids trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerCargo, -1532.7, -2745.61, 49.0, 145.0, random(126), random(126), 600); // Cargo trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerOre, -1528.6, -2748.48, 49.0, 145.0, random(126), random(126), 600); // Ore trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTrailerFluids, -1524.5, -2751.35, 49.0, 145.0, random(126), random(126), 600); // Liquids trailer
	LastVehicleID = Vehicle_AddStatic(VehicleLineRunner, -1557.75, -2744.80, 49.0, 145.0, random(126), random(126), 600); // LineRunner
	LastVehicleID = Vehicle_AddStatic(VehicleTanker, -1561.85, -2741.93, 49.0, 145.0, random(126), random(126), 600); // Tanker
	LastVehicleID = Vehicle_AddStatic(VehicleRoadTrain, -1565.95, -2739.06, 49.0, 145.0, random(126), random(126), 600); // Roadtrain
	LastVehicleID = Vehicle_AddStatic(VehicleLineRunner, -1570.05, -2736.19, 49.0, 145.0, random(126), random(126), 600); // LineRunner
	LastVehicleID = Vehicle_AddStatic(VehicleTanker, -1574.15, -2733.32, 49.0, 145.0, random(126), random(126), 600); // Tanker
	LastVehicleID = Vehicle_AddStatic(VehicleRoadTrain, -1578.25, -2730.45, 49.0, 145.0, random(126), random(126), 600); // Roadtrain
}

// Add busses to the bus-depots
GameModeInit_Busses()
{
	// Add all required busses to the busdepot in Los Santos
	LastVehicleID = Vehicle_AddStatic(VehicleCoach, 1782.0, -1888.0, 13.6, 270.0, random(126), random(126), 600); // Coach
	LastVehicleID = Vehicle_AddStatic(VehicleCoach, 1782.0, -1893.0, 13.6, 270.0, random(126), random(126), 600); // Coach
	LastVehicleID = Vehicle_AddStatic(VehicleCoach, 1782.0, -1898.0, 13.6, 270.0, random(126), random(126), 600); // Coach
	LastVehicleID = Vehicle_AddStatic(VehicleCoach, 1782.0, -1903.0, 13.6, 270.0, random(126), random(126), 600); // Coach
	LastVehicleID = Vehicle_AddStatic(VehicleCoach, 1782.0, -1908.0, 13.6, 270.0, random(126), random(126), 600); // Coach
	LastVehicleID = Vehicle_AddStatic(VehicleCoach, 1782.0, -1913.0, 13.6, 270.0, random(126), random(126), 600); // Coach
	LastVehicleID = Vehicle_AddStatic(VehicleCoach, 1782.0, -1918.0, 13.6, 270.0, random(126), random(126), 600); // Coach

	// Add all required busses to the busdepot in San Fierro
	LastVehicleID = Vehicle_AddStatic(VehicleCoach, -1974.0, 105.0, 27.9, 90.0, random(126), random(126), 600); // Coach
	LastVehicleID = Vehicle_AddStatic(VehicleCoach, -1974.0, 100.0, 27.9, 90.0, random(126), random(126), 600); // Coach
	LastVehicleID = Vehicle_AddStatic(VehicleCoach, -1974.0, 95.0, 27.9, 90.0, random(126), random(126), 600); // Coach
	LastVehicleID = Vehicle_AddStatic(VehicleCoach, -1974.0, 90.0, 27.9, 90.0, random(126), random(126), 600); // Coach
	LastVehicleID = Vehicle_AddStatic(VehicleCoach, -1974.0, 85.0, 27.9, 90.0, random(126), random(126), 600); // Coach
	LastVehicleID = Vehicle_AddStatic(VehicleCoach, -1974.0, 80.0, 27.9, 90.0, random(126), random(126), 600); // Coach

	// Add all required busses to the busdepot in Las Venturas
	LastVehicleID = Vehicle_AddStatic(VehicleCoach, 1085.0, 1230.0, 11.0, 90.0, random(126), random(126), 600); // Coach
	LastVehicleID = Vehicle_AddStatic(VehicleCoach, 1085.0, 1235.0, 11.0, 90.0, random(126), random(126), 600); // Coach
	LastVehicleID = Vehicle_AddStatic(VehicleCoach, 1085.0, 1240.0, 11.0, 90.0, random(126), random(126), 600); // Coach
	LastVehicleID = Vehicle_AddStatic(VehicleCoach, 1085.0, 1245.0, 11.0, 90.0, random(126), random(126), 600); // Coach
	LastVehicleID = Vehicle_AddStatic(VehicleCoach, 1085.0, 1250.0, 11.0, 90.0, random(126), random(126), 600); // Coach
	LastVehicleID = Vehicle_AddStatic(VehicleCoach, 1085.0, 1255.0, 11.0, 90.0, random(126), random(126), 600); // Coach
	LastVehicleID = Vehicle_AddStatic(VehicleCoach, 1085.0, 1260.0, 11.0, 90.0, random(126), random(126), 600); // Coach
	LastVehicleID = Vehicle_AddStatic(VehicleCoach, 1085.0, 1265.0, 11.0, 90.0, random(126), random(126), 600); // Coach
	LastVehicleID = Vehicle_AddStatic(VehicleCoach, 1085.0, 1270.0, 11.0, 90.0, random(126), random(126), 600); // Coach
	LastVehicleID = Vehicle_AddStatic(VehicleCoach, 1085.0, 1275.0, 11.0, 90.0, random(126), random(126), 600); // Coach
	LastVehicleID = Vehicle_AddStatic(VehicleCoach, 1085.0, 1280.0, 11.0, 90.0, random(126), random(126), 600); // Coach
}

// Add busstops to the map
GameModeInit_Busstops()
{
	LastObjectID = CreateDynamicObject(1257, -2571.25, 2316.0, 5.2, 0.0, 0.0, 180.0);
	LastObjectID = CreateDynamicObject(1257, -2333.25, 2371.5, 6.0, 0.0, 0.0, 320.0);
	LastObjectID = CreateDynamicObject(1257, -1467.0, 2679.0, 56.0, 0.0, 0.0, 90.0);
	LastObjectID = CreateDynamicObject(1257, -1528.5, 2543.0, 56.0, 0.0, 0.0, 270.0);
	LastObjectID = CreateDynamicObject(1257, -800.5, 1562.0, 27.4, 0.0, 0.0, 0.0);
	LastObjectID = CreateDynamicObject(1257, -853.5, 1529.5, 22.4, 0.0, 0.0, 180.0);
	LastObjectID = CreateDynamicObject(1257, -269.0, 2620.5, 63.2, 0.0, 0.0, 270.0);
	LastObjectID = CreateDynamicObject(1257, -45.5, 1206.5, 19.6, 0.0, 0.0, 90.0);
	LastObjectID = CreateDynamicObject(1257, -100.5, 1190.75, 20.0, 0.0, 0.0, 270.0);
	LastObjectID = CreateDynamicObject(1257, -249.5, 1010.75, 20.0, 0.0, 0.0, 270.0);
	LastObjectID = CreateDynamicObject(1257, -2172.5, -2309.5, 30.9, 0.0, 0.0, 230.0);
	LastObjectID = CreateDynamicObject(1257, -2094.25, -2503.0, 30.9, 0.0, 0.0, 322.0);
	LastObjectID = CreateDynamicObject(1257, 2263.75, -35.75, 26.7, 0.0, 0.0, 270.0);
	LastObjectID = CreateDynamicObject(1257, 2456.25, 1.0, 26.5, 0.0, 0.0, 180.0);
	LastObjectID = CreateDynamicObject(1257, 1290.25, 333.5, 19.8, 0.0, 0.0, 65.0);
	LastObjectID = CreateDynamicObject(1257, 1284.75, 319.5, 19.8, 0.0, 0.0, 245.0);
	LastObjectID = CreateDynamicObject(1257, 736.0, -522.5, 16.6, 0.0, 0.0, 90.0);
	LastObjectID = CreateDynamicObject(1257, 736.0, -537.75, 16.6, 0.0, 0.0, 270.0);
//	LastObjectID = CreateObject(1257, 0000, 0000, 000, 0.0, 0.0, 000.0);
}



// Add police vehicles to the Police Impounds
GameModeInit_Police()
{
	// Add vehicles to the Los Santos Police Impound
	LastVehicleID = Vehicle_AddStatic(VehiclePoliceLSPD, 1555.0, -1710.75, 6.0, 0, random(126), random(126), 600); // Police Car LSPD
	LastVehicleID = Vehicle_AddStatic(VehicleHPV1000, 1560.0, -1710.75, 6.0, 0, random(126), random(126), 600); // Police MotorCycle
	LastVehicleID = Vehicle_AddStatic(VehiclePoliceRanger, 1565.0, -1710.75, 6.0, 0, random(126), random(126), 600); // Police Ranger
	LastVehicleID = Vehicle_AddStatic(VehiclePoliceLSPD, 1570.0, -1710.75, 6.0, 0, random(126), random(126), 600); // Police Car LSPD
	LastVehicleID = Vehicle_AddStatic(VehicleHPV1000, 1575.0, -1710.75, 6.0, 0, random(126), random(126), 600); // Police MotorCycle
	LastVehicleID = Vehicle_AddStatic(VehiclePoliceRanger, 1580.0, -1710.75, 6.0, 0, random(126), random(126), 600); // Police Ranger
	LastVehicleID = Vehicle_AddStatic(VehiclePoliceLSPD, 1585.0, -1710.75, 6.0, 0, random(126), random(126), 600); // Police Car LSPD
	LastVehicleID = Vehicle_AddStatic(VehicleHPV1000, 1590.0, -1710.75, 6.0, 0, random(126), random(126), 600); // Police MotorCycle
	LastVehicleID = Vehicle_AddStatic(VehiclePoliceRanger, 1595.0, -1710.75, 6.0, 0, random(126), random(126), 600); // Police Ranger

	// Add vehicles to the San Fierro Police Impound
	LastVehicleID = Vehicle_AddStatic(VehiclePoliceSFPD, -1573.0, 701.0, -5.0, 90, random(126), random(126), 600); // Police Car SFPD
	LastVehicleID = Vehicle_AddStatic(VehicleHPV1000, -1573.0, 706.0, -5.0, 90, random(126), random(126), 600); // Police MotorCycle
	LastVehicleID = Vehicle_AddStatic(VehiclePoliceRanger, -1573.0, 711.0, -5.0, 90, random(126), random(126), 600); // Police Ranger
	LastVehicleID = Vehicle_AddStatic(VehiclePoliceSFPD, -1573.0, 716.0, -5.0, 90, random(126), random(126), 600); // Police Car SFPD
	LastVehicleID = Vehicle_AddStatic(VehicleHPV1000, -1573.0, 721.0, -5.0, 90, random(126), random(126), 600); // Police MotorCycle
	LastVehicleID = Vehicle_AddStatic(VehiclePoliceRanger, -1573.0, 726.0, -5.0, 90, random(126), random(126), 600); // Police Ranger
	LastVehicleID = Vehicle_AddStatic(VehiclePoliceSFPD, -1573.0, 731.0, -5.0, 90, random(126), random(126), 600); // Police Car SFPD
	LastVehicleID = Vehicle_AddStatic(VehicleHPV1000, -1573.0, 736.0, -5.0, 90, random(126), random(126), 600); // Police MotorCycle
	LastVehicleID = Vehicle_AddStatic(VehiclePoliceRanger, -1573.0, 741.0, -5.0, 90, random(126), random(126), 600); // Police Ranger

	// Add vehicles to the Las Venturas Police Impound
	LastVehicleID = Vehicle_AddStatic(VehiclePoliceLVPD, 2282.0, 2477.0, 11.0, 180, random(126), random(126), 600); // Police Car LVPD
	LastVehicleID = Vehicle_AddStatic(VehicleHPV1000, 2277.0, 2477.0, 11.0, 180, random(126), random(126), 600); // Police MotorCycle
	LastVehicleID = Vehicle_AddStatic(VehiclePoliceRanger, 2272.0, 2477.0, 11.0, 180, random(126), random(126), 600); // Police Ranger
	LastVehicleID = Vehicle_AddStatic(VehiclePoliceLVPD, 2262.0, 2477.0, 11.0, 180, random(126), random(126), 600); // Police Car LVPD
	LastVehicleID = Vehicle_AddStatic(VehicleHPV1000, 2257.0, 2477.0, 11.0, 180, random(126), random(126), 600); // Police MotorCycle
	LastVehicleID = Vehicle_AddStatic(VehiclePoliceRanger, 2252.0, 2477.0, 11.0, 180, random(126), random(126), 600); // Police Ranger

	LastVehicleID = Vehicle_AddStatic(VehiclePoliceLVPD, 2282.0, 2443.0, 11.0, 0, random(126), random(126), 600); // Police Car LVPD
	LastVehicleID = Vehicle_AddStatic(VehicleHPV1000, 2277.0, 2443.0, 11.0, 0, random(126), random(126), 600); // Police MotorCycle
	LastVehicleID = Vehicle_AddStatic(VehiclePoliceRanger, 2272.0, 2443.0, 11.0, 0, random(126), random(126), 600); // Police Ranger
	LastVehicleID = Vehicle_AddStatic(VehiclePoliceLVPD, 2262.0, 2443.0, 11.0, 0, random(126), random(126), 600); // Police Car LVPD
	LastVehicleID = Vehicle_AddStatic(VehicleHPV1000, 2257.0, 2443.0, 11.0, 0, random(126), random(126), 600); // Police MotorCycle
	LastVehicleID = Vehicle_AddStatic(VehiclePoliceRanger, 2252.0, 2443.0, 11.0, 0, random(126), random(126), 600); // Police Ranger
}

// Add mafia-vehicles to the mafia-hideout
GameModeInit_Mafia()
{
	LastVehicleID = Vehicle_AddStatic(VehicleSandKing, 2811.0, 900.0, 10.8, 0.0, 0, 0, 600); // Mafia Sandking
	LastVehicleID = Vehicle_AddStatic(VehicleSandKing, 2806.0, 900.0, 10.8, 0.0, 0, 0, 600); // Mafia Sandking
	LastVehicleID = Vehicle_AddStatic(VehicleSandKing, 2801.0, 900.0, 10.8, 0.0, 0, 0, 600); // Mafia Sandking
	LastVehicleID = Vehicle_AddStatic(VehicleSandKing, 2796.0, 900.0, 10.8, 0.0, 0, 0, 600); // Mafia Sandking

	LastVehicleID = Vehicle_AddStatic(VehicleMoonbeam, 2833.0, 900.0, 10.8, 0.0, 0, 0, 600); // Mafia Moonbeam
	LastVehicleID = Vehicle_AddStatic(VehicleMoonbeam, 2838.0, 900.0, 10.8, 0.0, 0, 0, 600); // Mafia Moonbeam
	LastVehicleID = Vehicle_AddStatic(VehicleMoonbeam, 2843.0, 900.0, 10.8, 0.0, 0, 0, 600); // Mafia Moonbeam
	LastVehicleID = Vehicle_AddStatic(VehicleMoonbeam, 2848.0, 900.0, 10.8, 0.0, 0, 0, 600); // Mafia Moonbeam

	LastVehicleID = Vehicle_AddStatic(VehicleRoadTrain, 2802, 966.0, 10.8, 180.0, 0, 0, 600); // Mafia RoadTrain
	LastVehicleID = Vehicle_AddStatic(VehicleRoadTrain, 2807, 966.0, 10.8, 180.0, 0, 0, 600); // Mafia RoadTrain
	LastVehicleID = Vehicle_AddStatic(VehicleRoadTrain, 2812, 966.0, 10.8, 180.0, 0, 0, 600); // Mafia RoadTrain
	LastVehicleID = Vehicle_AddStatic(VehicleRoadTrain, 2817, 966.0, 10.8, 180.0, 0, 0, 600); // Mafia RoadTrain
	LastVehicleID = Vehicle_AddStatic(VehicleRoadTrain, 2822, 966.0, 10.8, 180.0, 0, 0, 600); // Mafia RoadTrain
	LastVehicleID = Vehicle_AddStatic(VehicleRoadTrain, 2827, 966.0, 10.8, 180.0, 0, 0, 600); // Mafia RoadTrain
}

// Add planes and helicopters to the airports
GameModeInit_Airports()
{
	// Add planes and helicopters to Los Santos airport
	LastVehicleID = Vehicle_AddStatic(VehicleShamal, 1990.0, -2295.0, 14.5, 90.0, random(126), random(126), 300); // Plane: Shamal
	LastVehicleID = Vehicle_AddStatic(VehicleShamal, 1990.0, -2320.0, 14.5, 90.0, random(126), random(126), 300); // Plane: Shamal
	LastVehicleID = Vehicle_AddStatic(VehicleShamal, 1990.0, -2345.0, 14.5, 90.0, random(126), random(126), 300); // Plane: Shamal
	LastVehicleID = Vehicle_AddStatic(VehicleShamal, 1990.0, -2370.0, 14.5, 90.0, random(126), random(126), 300); // Plane: Shamal
	LastVehicleID = Vehicle_AddStatic(VehicleNevada, 1920.0, -2265.0, 14.5, 180.0, random(126), random(126), 300); // Plane: Nevada
	LastVehicleID = Vehicle_AddStatic(VehicleNevada, 1890.0, -2295.0, 14.5, 270.0, random(126), random(126), 300); // Plane: Nevada
	LastVehicleID = Vehicle_AddStatic(VehicleMaverick, 1940.0, -2265.0, 13.6, 180.0, random(126), random(126), 300); // Helicopter: Maverick
	LastVehicleID = Vehicle_AddStatic(VehicleMaverick, 1955.0, -2265.0, 13.6, 180.0, random(126), random(126), 300); // Helicopter: Maverick
	LastVehicleID = Vehicle_AddStatic(VehicleMaverick, 1970.0, -2265.0, 13.6, 180.0, random(126), random(126), 300); // Helicopter: Maverick
	LastVehicleID = Vehicle_AddStatic(VehicleMaverick, 1985.0, -2265.0, 13.6, 180.0, random(126), random(126), 300); // Helicopter: Maverick

	// Add planes and helicopters to San Fierro airport
	LastVehicleID = Vehicle_AddStatic(VehicleShamal, -1197.0, -153.0, 15.1, 135.0, random(126), random(126), 300); // Plane: Shamal
	LastVehicleID = Vehicle_AddStatic(VehicleShamal, -1214.0, -137.5, 15.1, 135.0, random(126), random(126), 300); // Plane: Shamal
	LastVehicleID = Vehicle_AddStatic(VehicleShamal, -1230.0, -120.0, 15.1, 135.0, random(126), random(126), 300); // Plane: Shamal
	LastVehicleID = Vehicle_AddStatic(VehicleShamal, -1246.0, -103.5, 15.1, 135.0, random(126), random(126), 300); // Plane: Shamal
	LastVehicleID = Vehicle_AddStatic(VehicleNevada, -1287.0, -52.0, 15.1, 135.0, random(126), random(126), 300); // Plane: Nevada
	LastVehicleID = Vehicle_AddStatic(VehicleNevada, -1312.0, -27.0, 15.1, 135.0, random(126), random(126), 300); // Plane: Nevada
	LastVehicleID = Vehicle_AddStatic(VehicleMaverick, -1262.0, -88.5, 14.2, 135.0, random(126), random(126), 300); // Helicopter: Maverick
	LastVehicleID = Vehicle_AddStatic(VehicleMaverick, -1277.0, -74.5, 14.2, 90.0, random(126), random(126), 300); // Helicopter: Maverick
	LastVehicleID = Vehicle_AddStatic(VehicleMaverick, -1264.0, -61.5, 14.2, 45.0, random(126), random(126), 300); // Helicopter: Maverick

	// Add planes and helicopters to Las Venturas airport
	LastVehicleID = Vehicle_AddStatic(VehicleShamal, 1615.0, 1630.0, 11.8, 180.0, random(126), random(126), 300); // Plane: Shamal
	LastVehicleID = Vehicle_AddStatic(VehicleShamal, 1590.0, 1630.0, 11.8, 180.0, random(126), random(126), 300); // Plane: Shamal
	LastVehicleID = Vehicle_AddStatic(VehicleShamal, 1565.0, 1630.0, 11.8, 180.0, random(126), random(126), 300); // Plane: Shamal
	LastVehicleID = Vehicle_AddStatic(VehicleNevada, 1545.0, 1640.0, 11.8, 90.0, random(126), random(126), 300); // Plane: Nevada
	LastVehicleID = Vehicle_AddStatic(VehicleNevada, 1545.0, 1675.0, 11.8, 90.0, random(126), random(126), 300); // Plane: Nevada
	LastVehicleID = Vehicle_AddStatic(VehicleNevada, 1545.0, 1710.0, 11.8, 90.0, random(126), random(126), 300); // Plane: Nevada
	LastVehicleID = Vehicle_AddStatic(VehicleMaverick, 1650.0, 1557, 10.9, 90.0, random(126), random(126), 300); // Helicopter: Maverick
	LastVehicleID = Vehicle_AddStatic(VehicleMaverick, 1650.0, 1542, 10.9, 90.0, random(126), random(126), 300); // Helicopter: Maverick
	LastVehicleID = Vehicle_AddStatic(VehicleMaverick, 1635.0, 1534, 10.9, 0.0, random(126), random(126), 300); // Helicopter: Maverick
}

// This function adds towtrucks used for the assistance class
GameModeInit_Assistance()
{
	LastVehicleID = Vehicle_AddStatic(VehicleTowTruck, 220.0, 34.0, 2.6, 270.0, random(126), random(126), 300); // Towtruck
	LastVehicleID = Vehicle_AddStatic(VehicleTowTruck, 220.0, 29.0, 2.6, 270.0, random(126), random(126), 300); // Towtruck
	LastVehicleID = Vehicle_AddStatic(VehicleTowTruck, 220.0, 24.0, 2.6, 270.0, random(126), random(126), 300); // Towtruck
	LastVehicleID = Vehicle_AddStatic(VehicleTowTruck, 220.0, 19.0, 2.6, 270.0, random(126), random(126), 300); // Towtruck
	LastVehicleID = Vehicle_AddStatic(VehicleTowTruck, 220.0, 14.0, 2.6, 270.0, random(126), random(126), 300); // Towtruck
	LastVehicleID = Vehicle_AddStatic(VehicleTowTruck, 220.0, 9.0, 2.6, 270.0, random(126), random(126), 300); // Towtruck
	LastVehicleID = Vehicle_AddStatic(VehicleTowTruck, 220.0, 4.0, 2.6, 270.0, random(126), random(126), 300); // Towtruck
	LastVehicleID = Vehicle_AddStatic(VehicleTowTruck, 220.0, -1.0, 2.6, 270.0, random(126), random(126), 300); // Towtruck
}

// This function adds all vehicles needed for courier class
GameModeInit_Courier()
{
	// Los Santos
	LastVehicleID = Vehicle_AddStatic(VehicleBurrito, 784.0, -610.0, 16.4, 0.0, random(126), random(126), 300); // Burrito
	LastVehicleID = Vehicle_AddStatic(VehicleBurrito, 794.0, -610.0, 16.4, 0.0, random(126), random(126), 300); // Burrito
	LastVehicleID = Vehicle_AddStatic(VehicleBurrito, 804.0, -610.0, 16.4, 0.0, random(126), random(126), 300); // Burrito
	LastVehicleID = Vehicle_AddStatic(VehicleBurrito, 814.0, -610.0, 16.4, 0.0, random(126), random(126), 300); // Burrito
	LastVehicleID = Vehicle_AddStatic(VehicleBurrito, 824.0, -610.0, 16.4, 0.0, random(126), random(126), 300); // Burrito
	LastVehicleID = Vehicle_AddStatic(VehicleFaggio, 789.0, -610.0, 16.4, 0.0, random(126), random(126), 300); // Faggio
	LastVehicleID = Vehicle_AddStatic(VehicleFaggio, 799.0, -610.0, 16.4, 0.0, random(126), random(126), 300); // Faggio
	LastVehicleID = Vehicle_AddStatic(VehicleFaggio, 809.0, -610.0, 16.4, 0.0, random(126), random(126), 300); // Faggio
	LastVehicleID = Vehicle_AddStatic(VehicleFaggio, 819.0, -610.0, 16.4, 0.0, random(126), random(126), 300); // Faggio
	LastVehicleID = Vehicle_AddStatic(VehicleFaggio, 829.0, -610.0, 16.4, 0.0, random(126), random(126), 300); // Faggio
	// San Fierro
	LastVehicleID = Vehicle_AddStatic(VehicleBurrito, -1851.0, -142.5, 12.0, 0.0, random(126), random(126), 300); // Burrito
	LastVehicleID = Vehicle_AddStatic(VehicleBurrito, -1856.0, -142.5, 12.0, 0.0, random(126), random(126), 300); // Burrito
	LastVehicleID = Vehicle_AddStatic(VehicleBurrito, -1861.0, -142.5, 12.0, 0.0, random(126), random(126), 300); // Burrito
	LastVehicleID = Vehicle_AddStatic(VehicleBurrito, -1866.0, -142.5, 12.0, 0.0, random(126), random(126), 300); // Burrito
	LastVehicleID = Vehicle_AddStatic(VehicleBurrito, -1871.0, -142.5, 12.0, 0.0, random(126), random(126), 300); // Burrito
	LastVehicleID = Vehicle_AddStatic(VehicleFaggio, -1851.0, -129.5, 12.0, 180.0, random(126), random(126), 300); // Faggio
	LastVehicleID = Vehicle_AddStatic(VehicleFaggio, -1856.0, -129.5, 12.0, 180.0, random(126), random(126), 300); // Faggio
	LastVehicleID = Vehicle_AddStatic(VehicleFaggio, -1861.0, -129.5, 12.0, 180.0, random(126), random(126), 300); // Faggio
	LastVehicleID = Vehicle_AddStatic(VehicleFaggio, -1866.0, -129.5, 12.0, 180.0, random(126), random(126), 300); // Faggio
	// Las Venturas
	LastVehicleID = Vehicle_AddStatic(VehicleBurrito, 1052.5, 1915.25, 10.9, 0.0, random(126), random(126), 300); // Burrito
	LastVehicleID = Vehicle_AddStatic(VehicleBurrito, 1062.5, 1915.25, 10.9, 0.0, random(126), random(126), 300); // Burrito
	LastVehicleID = Vehicle_AddStatic(VehicleBurrito, 1072.5, 1915.25, 10.9, 0.0, random(126), random(126), 300); // Burrito
	LastVehicleID = Vehicle_AddStatic(VehicleBurrito, 1082.5, 1915.25, 10.9, 0.0, random(126), random(126), 300); // Burrito
	LastVehicleID = Vehicle_AddStatic(VehicleBurrito, 1092.5, 1915.25, 10.9, 0.0, random(126), random(126), 300); // Burrito
	LastVehicleID = Vehicle_AddStatic(VehicleFaggio, 1057.5, 1915.25, 10.9, 0.0, random(126), random(126), 300); // Faggio
	LastVehicleID = Vehicle_AddStatic(VehicleFaggio, 1067.5, 1915.25, 10.9, 0.0, random(126), random(126), 300); // Faggio
	LastVehicleID = Vehicle_AddStatic(VehicleFaggio, 1077.5, 1915.25, 10.9, 0.0, random(126), random(126), 300); // Faggio
	LastVehicleID = Vehicle_AddStatic(VehicleFaggio, 1087.5, 1915.25, 10.9, 0.0, random(126), random(126), 300); // Faggio
}

// This function adds all vehicles needed for roadworker class
GameModeInit_RoadWorker()
{
	// Quarry top
	LastVehicleID = Vehicle_AddStatic(VehicleUtilityVan, -1895.0, -1705.0, 21.5, 180.0, random(126), random(126), 300); // Utility Van
	LastVehicleID = Vehicle_AddStatic(VehicleUtilityVan, -1900.0, -1705.0, 21.5, 180.0, random(126), random(126), 300); // Utility Van
	LastVehicleID = Vehicle_AddStatic(VehicleUtilityVan, -1905.0, -1705.0, 21.5, 180.0, random(126), random(126), 300); // Utility Van
	LastVehicleID = Vehicle_AddStatic(VehicleUtilityVan, -1910.0, -1705.0, 21.5, 180.0, random(126), random(126), 300); // Utility Van
	LastVehicleID = Vehicle_AddStatic(VehicleUtilityVan, -1915.0, -1705.0, 21.5, 180.0, random(126), random(126), 300); // Utility Van
	LastVehicleID = Vehicle_AddStatic(VehicleUtilityVan, -1920.0, -1705.0, 21.5, 180.0, random(126), random(126), 300); // Utility Van
	LastVehicleID = Vehicle_AddStatic(VehicleUtilityTrailer, -1895.0, -1700.0, 21.5, 180.0, random(126), random(126), 300); // Utility Trailer
	LastVehicleID = Vehicle_AddStatic(VehicleUtilityTrailer, -1900.0, -1700.0, 21.5, 180.0, random(126), random(126), 300); // Utility Trailer
	LastVehicleID = Vehicle_AddStatic(VehicleUtilityTrailer, -1905.0, -1700.0, 21.5, 180.0, random(126), random(126), 300); // Utility Trailer
	LastVehicleID = Vehicle_AddStatic(VehicleUtilityTrailer, -1910.0, -1700.0, 21.5, 180.0, random(126), random(126), 300); // Utility Trailer
	LastVehicleID = Vehicle_AddStatic(VehicleUtilityTrailer, -1915.0, -1700.0, 21.5, 180.0, random(126), random(126), 300); // Utility Trailer
	LastVehicleID = Vehicle_AddStatic(VehicleUtilityTrailer, -1920.0, -1700.0, 21.5, 180.0, random(126), random(126), 300); // Utility Trailer
	LastVehicleID = Vehicle_AddStatic(VehicleTowTruck, -1866.5, -1731.75, 21.7, 30.0, random(126), random(126), 300); // Towtruck
	LastVehicleID = Vehicle_AddStatic(VehicleTowTruck, -1870.5, -1734.25, 21.7, 30.0, random(126), random(126), 300); // Towtruck
	LastVehicleID = Vehicle_AddStatic(VehicleTowTruck, -1874.5, -1736.75, 21.7, 30.0, random(126), random(126), 300); // Towtruck
	LastVehicleID = Vehicle_AddStatic(VehicleTowTruck, -1878.5, -1739.25, 21.7, 30.0, random(126), random(126), 300); // Towtruck
	LastVehicleID = Vehicle_AddStatic(VehicleTowTruck, -1882.5, -1741.75, 21.7, 30.0, random(126), random(126), 300); // Towtruck
	LastVehicleID = Vehicle_AddStatic(VehicleTowTruck, -1886.5, -1744.25, 21.7, 30.0, random(126), random(126), 300); // Towtruck
}



// Add some special pickups to the map
GameModeInit_PickupsIcons()
{
	// Add a pickup so the player can get a trucker/busdriver license and position a 3DTextLabel above it
	Pickup_License = CreatePickup(1274, 2, -2033.0, -100.0, 35.2, 0);
	Create3DTextLabel(TXT_PickupText, 0x008080FF, -2033.0, -100.0, 36.0, 30.0, 0);

	// Add all refuel-pickups to the world (including their icon)
	AddRefuelPickup(-1471.5, 1863.75, 32.7);
	AddRefuelPickup(-1326.5, 2677.5, 50.1);
	AddRefuelPickup(611.5, 1694.5, 7.0);
	AddRefuelPickup(-2249.25, -2559.0, 32.0);
	AddRefuelPickup(-1606.5, -2714.0, 48.6);
	AddRefuelPickup(-93.5, -1175.0, 2.3);
	AddRefuelPickup(1377.5, 457.0, 19.9);
	AddRefuelPickup(651.5, -565.5, 16.4);
	AddRefuelPickup(-1675.75, 412.75, 7.2);
	AddRefuelPickup(-2405.50, 976.25, 45.3);
	AddRefuelPickup(-2023.25, 156.75, 28.9);
	AddRefuelPickup(-1131.75, -204.25, 14.2);
	AddRefuelPickup(66.50, 1220.50, 18.9);
	AddRefuelPickup(350.50, 2537.50, 16.8);
	AddRefuelPickup(2147.00, 2747.75, 10.9);
	AddRefuelPickup(2639.75, 1106.00, 10.9);
	AddRefuelPickup(2115.00, 920.00, 10.9);
	AddRefuelPickup(2202.00, 2475.00, 10.9);
	AddRefuelPickup(1596.50, 2199.75, 10.9);
	AddRefuelPickup(1584.25, 1448.25, 10.9);
	AddRefuelPickup(1004.25, -940.50, 42.2);
	AddRefuelPickup(1935.00, -1772.75, 13.4);

	// Add all pickups for the cardealers (including their icon)
	AddCarDealerPickup(-1972.5, 288.5, 35.2); // Wang cars in Doherty (San Fierro)

	// Add some icons to the map (modding garages), they will only appear when the player discovers them
	CreateDynamicMapIcon(1039, -1032, 32, 27, 0, 0, 0, -1, 150.0); // Transfender, Los Santos
	CreateDynamicMapIcon(-1936, 235, 34, 27, 0, 0, 0, -1, 150.0); // Transfender, San Fierro
	CreateDynamicMapIcon(2385, 1034, 11, 27, 0, 0, 0, -1, 150.0); // Transfender, Las Venturas
	CreateDynamicMapIcon(2646, -2025, 14, 27, 0, 0, 0, -1, 150.0); // Loco Low Co, Los Santos
	CreateDynamicMapIcon(-2712, 218, 4, 27, 0, 0, 0, -1, 150.0); // Wheel Arch Angels, San Fierro
}



// This function creates all objects required for the toll-gates
GameModeInit_Toll()
{
	// Add toll-houses to the world
	CreateObject(9623, 1787.00, 695.50, 17.40, -3.5, 0.0, 350.25); //object(toll_sfw) (1)

	// Add a toll-gate to the world
	AddTollGate(3578, 1801.00, 692.66, 10.00, 1801.00, 692.66, 15.00, 0.0, 0.0, 350.25, 30);
	AddTollGate(3578, 1791.33, 694.44, 10.00, 1791.33, 694.44, 15.00, 0.0, 0.0, 350.25, 30);
	AddTollGate(3578, 1781.66, 696.22, 10.00, 1781.66, 696.22, 15.00, 0.0, 0.0, 350.25, 30);
	AddTollGate(3578, 1772.00, 698.00, 10.00, 1772.00, 698.00, 15.00, 0.0, 0.0, 350.25, 30);

	AddTollGate(3578, -2668.25, 1274.50, 50.0, -2668.25, 1274.50, 55.0, 0.0, 0.0, 0.0, 30);
	AddTollGate(3578, -2677.75, 1274.50, 50.0, -2677.75, 1274.50, 55.0, 0.0, 0.0, 0.0, 30);
	AddTollGate(3578, -2686.25, 1274.50, 50.0, -2686.25, 1274.50, 55.0, 0.0, 0.0, 0.0, 30);
	AddTollGate(3578, -2694.75, 1274.50, 50.0, -2694.75, 1274.50, 55.0, 0.0, 0.0, 0.0, 30);
}

// Add character models to the class-selection and set their default spawn coordinates (without weapons)
GameModeInit_Classes()
{
	AddPlayerClass(133, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0); // Class 0 = Truck driver
	AddPlayerClass(201, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0); // Class 1 = Truck driver
	AddPlayerClass(202, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0); // Class 2 = Truck driver
	AddPlayerClass(234, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0); // Class 3 = Truck driver
	AddPlayerClass(258, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0); // Class 4 = Truck driver
	AddPlayerClass(261, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0); // Class 5 = Truck driver
	AddPlayerClass(206, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0); // Class 6 = Truck driver
	AddPlayerClass(34, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0); // Class 7 = Truck driver

	AddPlayerClass(255, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0); // Class 8 = Bus driver
	AddPlayerClass(253, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0); // Class 9 = Bus driver

	AddPlayerClass(61, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0); // Class 10 = Pilot

	AddPlayerClass(280, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0); // Class 11 = Police
	AddPlayerClass(282, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0); // Class 12 = Police
	AddPlayerClass(283, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0); // Class 13 = Police

	AddPlayerClass(111, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0); // Class 14 = Mafia
	AddPlayerClass(112, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0); // Class 15 = Mafia
	AddPlayerClass(113, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0); // Class 16 = Mafia

	AddPlayerClass(50, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0); // Class 17 = Assistance

	AddPlayerClass(16, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0); // Class 18 = Roadworker
	AddPlayerClass(27, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0); // Class 19 = Roadworker
	AddPlayerClass(260, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0); // Class 20 = Roadworker
}



// This function is used to add refuelling pickups to the map
AddRefuelPickup(Float:x, Float:y, Float:z)
{
	// Add the pickup-id to the ARefuelPickups array
	for (new i; i < sizeof(ARefuelPickups); i++)
	{
		// If an empty array-index is found
		if (ARefuelPickups[i][PickupID] == 0)
		{
		    // Store the pickup-id in this empty slot
			ARefuelPickups[i][PickupID] = CreatePickup(1244, 1, x, y, z, 0); // Type 1, cannot be pickup up, exists all the time
			ARefuelPickups[i][pux] = x;
			ARefuelPickups[i][puy] = y;
			ARefuelPickups[i][puz] = z;

			// Add a 3DText message above the refuel-pickup
			Create3DTextLabel(TXT_PickupRefuel, 0x008080FF, x, y, z + 0.8, 30.0, 0);

			// Add an icon to the map for this refuel-spot
			CreateDynamicMapIcon(x, y, z, 55, 0, 0, 0, -1, 300.0);

			// Stop browsing through the array
			break;
		}
	}
}

// This function is used to add cardealer-pickups to the map
AddCarDealerPickup(Float:x, Float:y, Float:z)
{
	// Add the pickup-id to the ACarDealerPickups array
	for (new i; i < sizeof(ACarDealerPickups); i++)
	{
		// If an empty array-index is found
		if (ACarDealerPickups[i][PickupID] == 0)
		{
		    // Store the pickup-id in this empty slot
			ACarDealerPickups[i][PickupID] = CreatePickup(1274, 1, x, y, z, 0); // Type 1, cannot be pickup up, exists all the time
			ACarDealerPickups[i][pux] = x;
			ACarDealerPickups[i][puy] = y;
			ACarDealerPickups[i][puz] = z;

			// Add a 3DText message above the cardealer pickup
			Create3DTextLabel(TXT_PickupCarDealer, 0x008080FF, x, y, z + 0.8, 30.0, 0);

			// Add an icon to the map for this cardealer-spot
			CreateDynamicMapIcon(x, y, z, 55, 0, 0, 0, -1, 300.0);

			// Stop browsing through the array
			break;
		}
	}
}

// This function is used to add toll-gates to the map
AddTollGate(GateModel, Float:OX, Float:OY, Float:OZ, Float:CX, Float:CY, Float:CZ, Float:RX, Float:RY, Float:RZ, TollMoney)
{
	// Loop through all tollgates
	for (new TollGate; TollGate < MAX_TOLLGATES; TollGate++)
	{
		// Check if this is an empty entry
		if (ATollGates[TollGate][GateID] == 0)
		{
			// Create a new object for the toll-gate in it's closed status
			ATollGates[TollGate][GateID] = CreateObject(GateModel, CX, CY, CZ, RX, RY, RZ);
			// Set data
			ATollGates[TollGate][TollPrice] = TollMoney; // Set the price to pay for passing the toll-gate
			ATollGates[TollGate][GateStatus] = 0; // Set the status to CLOSED
			ATollGates[TollGate][OpenX] = OX; // Save the OpenX coordinates
			ATollGates[TollGate][OpenY] = OY; // Save the OpenY coordinates
			ATollGates[TollGate][OpenZ] = OZ; // Save the OpenZ coordinates
			ATollGates[TollGate][CloseX] = CX; // Save the CloseX coordinates
			ATollGates[TollGate][CloseY] = CY; // Save the CloseY coordinates
			ATollGates[TollGate][CloseZ] = CZ; // Save the CloseZ coordinates
			break; // Stop the for-loop
		}
	}
}

// ************************************************************************************************************************************************************
// PPC_FileOperations
// ************************************************************************************************************************************************************

// This function will create the player-datafile for the given player (only used when a new player joins the server)
PlayerFile_Create(playerid)
{
	new file[100], File:PFile, Name[24], LineForFile[100];
	format(Name, sizeof(Name), APlayerData[playerid][PlayerName]); // Get the playername
	format(file, sizeof(file), PlayerFile, Name); // Construct the complete filename for this player's account


	PFile = fopen(file, io_write); // Open the playerfile for writing

	format(LineForFile, 100, "Password %s\r\n", APlayerData[playerid][PlayerPassword]); // Construct the line: "Password <playerpassword>"
	fwrite(PFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "Level %i\r\n", 0); // Construct the line: "Level <playerlevel>"
	fwrite(PFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "Jailed %i\r\n", 0); // Construct the line: "Jailed <playerjailed>"
	fwrite(PFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "Wanted %i\r\n", 0); // Construct the line: "Wanted <wantedlevel>"
	fwrite(PFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "Bans %i\r\n", 0); // Construct the line: "Bans <NumberOfBans>"
	fwrite(PFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "BanTime %i\r\n", 0); // Construct the line: "BanTime <TimeToUnban>"
	fwrite(PFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "TruckerLicense %i\r\n", 0); // Construct the line: "TruckerLicense <playertruckerlicense>"
	fwrite(PFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "BusLicense %i\r\n", 0); // Construct the line: "BusLicense <playerbuslicense>"
	fwrite(PFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "StatsMetersDriven %f\r\n", 0.0); // Construct the line: "StatsMetersDriven <StatsMetersDriven>"
	fwrite(PFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "StatsTruckerJobs %i\r\n", 0); // Construct the line: "StatsTruckerJobs <StatsTruckerJobs>"
	fwrite(PFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "StatsConvoyJobs %i\r\n", 0); // Construct the line: "StatsConvoyJobs <StatsConvoyJobs>"
	fwrite(PFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "StatsBusDriverJobs %i\r\n", 0); // Construct the line: "StatsBusDriverJobs <StatsBusDriverJobs>"
	fwrite(PFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "StatsPilotJobs %i\r\n", 0); // Construct the line: "StatsPilotJobs <StatsPilotJobs>"
	fwrite(PFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "StatsMafiaJobs %i\r\n", 0); // Construct the line: "StatsMafiaJobs <StatsMafiaJobs>"
	fwrite(PFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "StatsMafiaStolen %i\r\n", 0); // Construct the line: "StatsMafiaStolen <StatsMafiaStolen>"
	fwrite(PFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "StatsPoliceFined %i\r\n", 0); // Construct the line: "StatsPoliceFined <StatsPoliceFined>"
	fwrite(PFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "StatsPoliceJailed %i\r\n", 0); // Construct the line: "StatsPoliceJailed <StatsPoliceJailed>"
	fwrite(PFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "Money %i\r\n", 0); // Construct the line: "Money <playermoney>"
	fwrite(PFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "Score %i\r\n", 0); // Construct the line: "Score <playerscore>"
	fwrite(PFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "YakitTasarrufu %i\r\n", 1);
	fwrite(PFile, LineForFile);
	format(LineForFile, 100, "AsiriYuklemeBonusu %i\r\n", 1);
	fwrite(PFile, LineForFile);
	format(LineForFile, 100, "BoomBox %i\r\n", 0);
	fwrite(PFile, LineForFile);
	format(LineForFile, 100, "VIP %i\r\n", 0);
	fwrite(PFile, LineForFile);
	
	fclose(PFile); // Close the file

	return 1;
}

// This function will load the player's datafile (used when a player connects to the server)
PlayerFile_Load(playerid)
{
	// Setup local variables
	new file[100], File:PFile, Name[24], LineFromFile[100], ParameterName[50], ParameterValue[50], HouseIndex, BusIndex;

	format(Name, sizeof(Name), APlayerData[playerid][PlayerName]); // Get the playername
	format(file, sizeof(file), PlayerFile, Name); // Construct the complete filename for this player's account

	// Check if the player's datafile exists
	if (fexist(file))
	{
		PFile = fopen(file, io_read); // Open the playerfile for reading

		fread(PFile, LineFromFile); // Read the first line of the file

		// Keep reading until the end of the file is found (no more data)
		while (strlen(LineFromFile) > 0)
		{
			StripNewLine(LineFromFile); // Strip any newline characters from the LineFromFile
			sscanf(LineFromFile, "s[50]s[50]", ParameterName, ParameterValue); // Extract parametername and parametervalue

			// Store the proper value in the proper place
			if (strcmp(ParameterName, "Password", false) == 0) // If the parametername is correct ("Password")
			    format(APlayerData[playerid][PlayerPassword], 50, ParameterValue); // Store the password
			if (strcmp(ParameterName, "Level", false) == 0) // If the parametername is correct ("Level")
			    APlayerData[playerid][PlayerLevel] = strval(ParameterValue); // Store the playerlevel
			if (strcmp(ParameterName, "Jailed", false) == 0) // If the parametername is correct ("Jailed")
			    APlayerData[playerid][PlayerJailed] = strval(ParameterValue); // Store the jailed-status
			if (strcmp(ParameterName, "Wanted", false) == 0) // If the parametername is correct ("Wanted")
			    SetPlayerWantedLevel(playerid, strval(ParameterValue)); // Set the wanted-status
			if (strcmp(ParameterName, "Bans", false) == 0) // If the parametername is correct ("Bans")
			    APlayerData[playerid][Bans] = strval(ParameterValue); // Store the bans
			if (strcmp(ParameterName, "BanTime", false) == 0) // If the parametername is correct ("BanTime")
			    APlayerData[playerid][BanTime] = strval(ParameterValue); // Store the bantime
			if (strcmp(ParameterName, "TruckerLicense", false) == 0) // If the parametername is correct ("TruckerLicense")
			    APlayerData[playerid][TruckerLicense] = strval(ParameterValue); // Store the TruckerLicense
			if (strcmp(ParameterName, "BusLicense", false) == 0) // If the parametername is correct ("BusLicense")
			    APlayerData[playerid][BusLicense] = strval(ParameterValue); // Store the BusLicense

			if (strcmp(ParameterName, "Muted", false) == 0) // If the parametername is correct ("Muted")
			{
			    if (strcmp(ParameterValue, "Yes", false) == 0) // If the value "Yes" was read
					APlayerData[playerid][Muted] = true; // Player is muted
				else
					APlayerData[playerid][Muted] = false; // Player is not muted
			}
			if (strcmp(ParameterName, "RulesRead", false) == 0) // If the parametername is correct ("RulesRead")
			{
			    if (strcmp(ParameterValue, "Yes", false) == 0) // If the value "Yes" was read
					APlayerData[playerid][RulesRead] = true; // Player has accepted the rules
				else
					APlayerData[playerid][RulesRead] = false; // Player hasn't accepted the rules yet
			}

			if (strcmp(ParameterName, "StatsMetersDriven", false) == 0) // If the parametername is correct ("StatsMetersDriven")
			    APlayerData[playerid][StatsMetersDriven] = floatstr(ParameterValue); // Store the StatsMetersDriven
			if (strcmp(ParameterName, "StatsTruckerJobs", false) == 0) // If the parametername is correct ("StatsTruckerJobs")
			    APlayerData[playerid][StatsTruckerJobs] = strval(ParameterValue); // Store the StatsTruckerJobs
			if (strcmp(ParameterName, "StatsConvoyJobs", false) == 0) // If the parametername is correct ("StatsConvoyJobs")
			    APlayerData[playerid][StatsConvoyJobs] = strval(ParameterValue); // Store the StatsConvoyJobs
			if (strcmp(ParameterName, "StatsBusDriverJobs", false) == 0) // If the parametername is correct ("StatsBusDriverJobs")
			    APlayerData[playerid][StatsBusDriverJobs] = strval(ParameterValue); // Store the StatsBusDriverJobs
			if (strcmp(ParameterName, "StatsPilotJobs", false) == 0) // If the parametername is correct ("StatsPilotJobs")
			    APlayerData[playerid][StatsPilotJobs] = strval(ParameterValue); // Store the StatsPilotJobs
			if (strcmp(ParameterName, "StatsMafiaJobs", false) == 0) // If the parametername is correct ("StatsMafiaJobs")
			    APlayerData[playerid][StatsMafiaJobs] = strval(ParameterValue); // Store the StatsMafiaJobs
			if (strcmp(ParameterName, "StatsMafiaStolen", false) == 0) // If the parametername is correct ("StatsMafiaStolen")
			    APlayerData[playerid][StatsMafiaStolen] = strval(ParameterValue); // Store the StatsMafiaStolen
			if (strcmp(ParameterName, "StatsPoliceFined", false) == 0) // If the parametername is correct ("StatsPoliceFined")
			    APlayerData[playerid][StatsPoliceFined] = strval(ParameterValue); // Store the StatsPoliceFined
			if (strcmp(ParameterName, "StatsPoliceJailed", false) == 0) // If the parametername is correct ("StatsPoliceJailed")
			    APlayerData[playerid][StatsPoliceJailed] = strval(ParameterValue); // Store the StatsPoliceJailed
			if (strcmp(ParameterName, "StatsAssistance", false) == 0) // If the parametername is correct ("StatsAssistance")
			    APlayerData[playerid][StatsAssistance] = strval(ParameterValue); // Store the StatsAssistance
			if (strcmp(ParameterName, "StatsRoadworkerJobs", false) == 0) // If the parametername is correct ("StatsRoadworkerJobs")
			    APlayerData[playerid][StatsRoadworkerJobs] = strval(ParameterValue); // Store the StatsRoadworkerJobs


			if (strcmp(ParameterName, "House", false) == 0) // If the parametername is correct ("House")
			{
			    APlayerData[playerid][Houses][HouseIndex] = strval(ParameterValue); // Store the HouseID at the selected slot
			    HouseIndex++; // Select the next house-slot in case another house-id is found
			}
			if (strcmp(ParameterName, "Business", false) == 0) // If the parametername is correct ("Business")
			{
				if (strcmp(ABusinessData[strval(ParameterValue)][Owner], Name, false) == 0) // Check if the player is the true owner of the business
				{
				    APlayerData[playerid][Business][BusIndex] = strval(ParameterValue); // Store the BusinessID at the selected slot
				    BusIndex++; // Select the next business-slot in case another business-id is found
				}
			}

			if (strcmp(ParameterName, "Money", false) == 0) // If the parametername is correct ("Money")
				RewardPlayer(playerid, strval(ParameterValue), 0); // Store the money
			if (strcmp(ParameterName, "Score", false) == 0) // If the parametername is correct ("Score")
				RewardPlayer(playerid, 0, strval(ParameterValue)); // Store the score
			if (strcmp(ParameterName, "YakitTasarrufu", false) == 0)
				APlayerData[playerid][YakitTasarrufu] = strval(ParameterValue);
			if (strcmp(ParameterName, "AsiriYuklemeBonusu", false) == 0)
				APlayerData[playerid][AsiriYuklemeBonusu] = strval(ParameterValue);
			if (strcmp(ParameterName, "BoomBox", false) == 0)
				APlayerData[playerid][BoomBox] = strval(ParameterValue);
			if (strcmp(ParameterName, "VIP", false) == 0)
				APlayerData[playerid][VIP] = strval(ParameterValue);
				
			fread(PFile, LineFromFile); // Read the next line of the file
		}

		fclose(PFile); // Close the file

		return 1; // Return if the file was read correctly
	}
	else
	    return 0; // Return 0 if the file couldn't be read (doesn't exist)
}

// This function will save all player-data (used when the player disconnects from the server)
PlayerFile_Save(playerid)
{
	new file[100], File:PFile, Name[24], LineForFile[100];
	format(Name, sizeof(Name), APlayerData[playerid][PlayerName]); // Get the playername
	format(file, sizeof(file), PlayerFile, Name); // Construct the complete filename for this player's account

	PFile = fopen(file, io_write); // Open the playerfile for writing

	format(LineForFile, 100, "Password %s\r\n", APlayerData[playerid][PlayerPassword]); // Construct the line: "Password <playerpassword>"
	fwrite(PFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "Level %i\r\n", APlayerData[playerid][PlayerLevel]); // Construct the line: "Level <playerlevel>"
	fwrite(PFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "Jailed %i\r\n", APlayerData[playerid][PlayerJailed]); // Construct the line: "Jailed <playerjailed>"
	fwrite(PFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "Wanted %i\r\n", GetPlayerWantedLevel(playerid)); // Construct the line: "Wanted <wantedlevel>"
	fwrite(PFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "Bans %i\r\n", APlayerData[playerid][Bans]); // Construct the line: "Bans <NumberOfBans>"
	fwrite(PFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "BanTime %i\r\n", APlayerData[playerid][BanTime]); // Construct the line: "BanTime <TimeToUnban>"
	fwrite(PFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "TruckerLicense %i\r\n", APlayerData[playerid][TruckerLicense]); // Construct the line: "TruckerLicense <playertruckerlicense>"
	fwrite(PFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "BusLicense %i\r\n", APlayerData[playerid][BusLicense]); // Construct the line: "BusLicense <playerbuslicense>"
	fwrite(PFile, LineForFile); // And save it to the file

	if (APlayerData[playerid][Muted] == true) // Check if the player is muted
		format(LineForFile, 100, "Muted Yes\r\n"); // Construct the line: "Muted <Yes>"
	else
		format(LineForFile, 100, "Muted No\r\n"); // Construct the line: "Muted <No>"
	fwrite(PFile, LineForFile); // And save it to the file

	if (APlayerData[playerid][RulesRead] == true) // Check if the player has accepted the rules
		format(LineForFile, 100, "RulesRead Yes\r\n"); // Construct the line: "RulesRead <Yes>"
	else
		format(LineForFile, 100, "RulesRead No\r\n"); // Construct the line: "RulesRead <No>"
	fwrite(PFile, LineForFile); // And save it to the file

	format(LineForFile, 100, "StatsMetersDriven %f\r\n", APlayerData[playerid][StatsMetersDriven]); // Construct the line: "StatsMetersDriven <StatsMetersDriven>"
	fwrite(PFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "StatsTruckerJobs %i\r\n", APlayerData[playerid][StatsTruckerJobs]); // Construct the line: "StatsTruckerJobs <StatsTruckerJobs>"
	fwrite(PFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "StatsConvoyJobs %i\r\n", APlayerData[playerid][StatsConvoyJobs]); // Construct the line: "StatsConvoyJobs <StatsConvoyJobs>"
	fwrite(PFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "StatsBusDriverJobs %i\r\n", APlayerData[playerid][StatsBusDriverJobs]); // Construct the line: "StatsBusDriverJobs <StatsBusDriverJobs>"
	fwrite(PFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "StatsPilotJobs %i\r\n", APlayerData[playerid][StatsPilotJobs]); // Construct the line: "StatsPilotJobs <StatsPilotJobs>"
	fwrite(PFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "StatsMafiaJobs %i\r\n", APlayerData[playerid][StatsMafiaJobs]); // Construct the line: "StatsMafiaJobs <StatsMafiaJobs>"
	fwrite(PFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "StatsMafiaStolen %i\r\n", APlayerData[playerid][StatsMafiaStolen]); // Construct the line: "StatsMafiaStolen <StatsMafiaStolen>"
	fwrite(PFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "StatsPoliceFined %i\r\n", APlayerData[playerid][StatsPoliceFined]); // Construct the line: "StatsPoliceFined <StatsPoliceFined>"
	fwrite(PFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "StatsPoliceJailed %i\r\n", APlayerData[playerid][StatsPoliceJailed]); // Construct the line: "StatsPoliceJailed <StatsPoliceJailed>"
	fwrite(PFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "StatsAssistance %i\r\n", APlayerData[playerid][StatsAssistance]); // Construct the line: "StatsAssistance <StatsAssistance>"
	fwrite(PFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "StatsRoadworkerJobs %i\r\n", APlayerData[playerid][StatsRoadworkerJobs]); // Construct the line: "StatsRoadworkerJobs <StatsRoadworkerJobs>"
	fwrite(PFile, LineForFile); // And save it to the file

	// Save all the valid house-id's
	for (new i; i < MAX_HOUSESPERPLAYER; i++)
	{
		// Check if there is a valid house-id in this slot
		if (APlayerData[playerid][Houses][i] != 0)
		{
			format(LineForFile, 100, "House %i\r\n", APlayerData[playerid][Houses][i]); // Construct the line: "House <HouseID>"
			fwrite(PFile, LineForFile); // And save it to the file
		}
	}
	// Save all the valid business-id's
	for (new i; i < MAX_BUSINESSPERPLAYER; i++)
	{
		// Check if there is a valid business-id in this slot
		if (APlayerData[playerid][Business][i] != 0)
		{
			format(LineForFile, 100, "Business %i\r\n", APlayerData[playerid][Business][i]); // Construct the line: "Business <BusinessID>"
			fwrite(PFile, LineForFile); // And save it to the file
		}
	}

	format(LineForFile, 100, "Money %i\r\n", APlayerData[playerid][PlayerMoney]); // Construct the line: "Money <playermoney>"
	fwrite(PFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "Score %i\r\n", APlayerData[playerid][PlayerScore]); // Construct the line: "Score <playerscore>"
	fwrite(PFile, LineForFile); // And save it to the file

	format(LineForFile, 100, "YakitTasarrufu %i\r\n", APlayerData[playerid][YakitTasarrufu]);
	fwrite(PFile, LineForFile); 
	format(LineForFile, 100, "AsiriYuklemeBonusu %i\r\n", APlayerData[playerid][AsiriYuklemeBonusu]);
	fwrite(PFile, LineForFile);
	format(LineForFile, 100, "BoomBox %i\r\n", APlayerData[playerid][BoomBox]);
	fwrite(PFile, LineForFile);
	format(LineForFile, 100, "VIP %i\r\n", APlayerData[playerid][VIP]);
	fwrite(PFile, LineForFile);
	
	fclose(PFile); // Close the file

	// Also save the houses that this player owns
	for (new i; i < MAX_HOUSESPERPLAYER; i++)
	{
		// Check if there is a valid house-id in this slot
		if (APlayerData[playerid][Houses][i] != 0)
		{
		    // Save the house (and linked vehicles)
		    HouseFile_Save(APlayerData[playerid][Houses][i]);
		}
	}
	// Save all the valid business-id's
	for (new i; i < MAX_BUSINESSPERPLAYER; i++)
	{
		// Check if there is a valid business-id in this slot
		if (APlayerData[playerid][Business][i] != 0)
		{
		    // Save the business
		    BusinessFile_Save(APlayerData[playerid][Business][i]);
		}
	}

	return 1;
}








// This function loads all houses
Housing_LoadAll()
{
	// Loop through all houses and try to load them
	for (new HouseID = 1; HouseID < MAX_HOUSES; HouseID++)
	{
	    // Try to load the file and check if it was succesfully loaded (file exists)
		if (HouseFile_Load(HouseID) == 1)
		{
			// Add a pickup and 3DText for this house
			House_CreateEntrance(HouseID);
			// Count the amount of houses that are loaded
		    TotalHouses++;
		}
	}

	return 1;
}

// This function will load the house's datafile (used when the server is started to load all houses)
HouseFile_Load(HouseID, bool:OnlyLoadVehicles = false)
{
	new file[100], File:HFile, LineFromFile[100], ParameterName[50], ParameterValue[50];
	// Setup local variables
	new cModel, cPaint, components[14], Float:cx, Float:cy, Float:cz, Float:crot, Col1, Col2, vid, bool:VehicleClamped, cFuel = -1, Neons;

	format(file, sizeof(file), HouseFile, HouseID); // Construct the complete filename for this house-file

	if (fexist(file))
	{
		HFile = fopen(file, io_read); // Open the housefile for reading

		fread(HFile, LineFromFile); // Read the first line of the file

		// Set the house so it cannot be entered by anyone, except the owner (close the house)
		AHouseData[HouseID][HouseOpened] = false;

		// Keep reading until the end of the file is found (no more data)
		while (strlen(LineFromFile) > 0)
		{
			StripNewLine(LineFromFile); // Strip any newline characters from the LineFromFile
			sscanf(LineFromFile, "s[50]s[50]", ParameterName, ParameterValue); // Extract parametername and parametervalue

			// If OnlyLoadVehicles is "false", only load the house-data
			// If OnlyLoadVehicles is "true", only load the vehicle-data
			if (OnlyLoadVehicles == false)
			{
				// Store the proper value in the proper place
				if (strcmp(ParameterName, "HouseName", false) == 0) // If the parametername is correct ("HouseName")
				    format(AHouseData[HouseID][HouseName], 24, ParameterValue); // Store the HouseName
				if (strcmp(ParameterName, "HouseX", false) == 0) // If the parametername is correct ("HouseX")
					AHouseData[HouseID][HouseX] = floatstr(ParameterValue); // Store the HouseX
				if (strcmp(ParameterName, "HouseY", false) == 0) // If the parametername is correct ("HouseY")
					AHouseData[HouseID][HouseY] = floatstr(ParameterValue); // Store the HouseY
				if (strcmp(ParameterName, "HouseZ", false) == 0) // If the parametername is correct ("HouseZ")
					AHouseData[HouseID][HouseZ] = floatstr(ParameterValue); // Store the HouseZ
				if (strcmp(ParameterName, "HouseLevel", false) == 0) // If the parametername is correct ("HouseLevel")
					AHouseData[HouseID][HouseLevel] = strval(ParameterValue); // Store the HouseLevel
				if (strcmp(ParameterName, "HouseMaxLevel", false) == 0) // If the parametername is correct ("HouseMaxLevel")
					AHouseData[HouseID][HouseMaxLevel] = strval(ParameterValue); // Store the HouseMaxLevel
				if (strcmp(ParameterName, "HousePrice", false) == 0) // If the parametername is correct ("HousePrice")
					AHouseData[HouseID][HousePrice] = strval(ParameterValue); // Store the HousePrice
				if (strcmp(ParameterName, "Owned", false) == 0) // If the parametername is correct ("Owned")
				{
				    if (strcmp(ParameterValue, "Yes", false) == 0) // If the value "Yes" was read
						AHouseData[HouseID][Owned] = true; // House is owned
					else
						AHouseData[HouseID][Owned] = false; // House is not owned
				}
				if (strcmp(ParameterName, "Owner", false) == 0) // If the parametername is correct ("Owner")
					// Store the Owner (Owner will hold "1" if there is no owner (empty string), done by "sscanf" I guess)
					// But this doesn't matter, as the owner will never be displayed when the house is not owned by someone
				    format(AHouseData[HouseID][Owner], 24, ParameterValue);
				if (strcmp(ParameterName, "Insurance", false) == 0) // If the parametername is correct ("Insurance")
					AHouseData[HouseID][Insurance] = strval(ParameterValue); // Store the Insurance

				if (strcmp(ParameterName, "AutoEvictDays", false) == 0) // If the parametername is correct ("AutoEvictDays")
					AHouseData[HouseID][AutoEvictDays] = strval(ParameterValue); // Store the AutoEvictDays
			}
			else // OnlyLoadVehicles is "true", so only read the vehicle-data
			{
				if (strcmp(ParameterName, "[Vehicle]", false) == 0) // If the parametername is correct ("[Vehicle]")
				{
				    // Clear all data to start a new vehicle
				    cModel = 0;
				    cPaint = 0;
				    cFuel = -1;
				    Neons = 0;
				    for (new i; i < 14; i++)
				        components[i] = 0;
				}
				if (strcmp(ParameterName, "VehicleModel", false) == 0) // If the parametername is correct ("VehicleModel")
					cModel = strval(ParameterValue); // Store the VehicleModel
				if (strcmp(ParameterName, "Fuel", false) == 0) // If the parametername is correct ("Fuel")
					cFuel = strval(ParameterValue); // Store the Fuel
				if (strcmp(ParameterName, "VehiclePaintJob", false) == 0) // If the parametername is correct ("VehiclePaintJob")
					cPaint = strval(ParameterValue); // Store the VehiclePaintJob
				if (strcmp(ParameterName, "VehicleSpoiler", false) == 0) // If the parametername is correct ("VehicleSpoiler")
					components[0] = strval(ParameterValue); // Store the VehicleSpoiler
				if (strcmp(ParameterName, "VehicleHood", false) == 0) // If the parametername is correct ("VehicleHood")
					components[1] = strval(ParameterValue); // Store the VehicleHood
				if (strcmp(ParameterName, "VehicleRoof", false) == 0) // If the parametername is correct ("VehicleRoof")
					components[2] = strval(ParameterValue); // Store the VehicleRoof
				if (strcmp(ParameterName, "VehicleSideSkirt", false) == 0) // If the parametername is correct ("VehicleSideSkirt")
					components[3] = strval(ParameterValue); // Store the VehicleSideSkirt
				if (strcmp(ParameterName, "VehicleLamps", false) == 0) // If the parametername is correct ("VehicleLamps")
					components[4] = strval(ParameterValue); // Store the VehicleLamps
				if (strcmp(ParameterName, "VehicleNitro", false) == 0) // If the parametername is correct ("VehicleNitro")
					components[5] = strval(ParameterValue); // Store the VehicleNitro
				if (strcmp(ParameterName, "VehicleExhaust", false) == 0) // If the parametername is correct ("VehicleExhaust")
					components[6] = strval(ParameterValue); // Store the VehicleExhaust
				if (strcmp(ParameterName, "VehicleWheels", false) == 0) // If the parametername is correct ("VehicleWheels")
					components[7] = strval(ParameterValue); // Store the VehicleWheels
				if (strcmp(ParameterName, "VehicleStereo", false) == 0) // If the parametername is correct ("VehicleStereo")
					components[8] = strval(ParameterValue); // Store the VehicleStereo
				if (strcmp(ParameterName, "VehicleHydraulics", false) == 0) // If the parametername is correct ("VehicleHydraulics")
					components[9] = strval(ParameterValue); // Store the VehicleHydraulics
				if (strcmp(ParameterName, "VehicleFrontBumper", false) == 0) // If the parametername is correct ("VehicleFrontBumper")
					components[10] = strval(ParameterValue); // Store the VehicleFrontBumper
				if (strcmp(ParameterName, "VehicleRearBumper", false) == 0) // If the parametername is correct ("VehicleRearBumper")
					components[11] = strval(ParameterValue); // Store the VehicleRearBumper
				if (strcmp(ParameterName, "VehicleVentRight", false) == 0) // If the parametername is correct ("VehicleVentRight")
					components[12] = strval(ParameterValue); // Store the VehicleVentRight
				if (strcmp(ParameterName, "VehicleVentLeft", false) == 0) // If the parametername is correct ("VehicleVentLeft")
					components[13] = strval(ParameterValue); // Store the VehicleVentLeft

				if (strcmp(ParameterName, "Color1", false) == 0) // If the parametername is correct ("Color1")
					Col1 = strval(ParameterValue); // Store the Color1
				if (strcmp(ParameterName, "Color2", false) == 0) // If the parametername is correct ("Color2")
					Col2 = strval(ParameterValue); // Store the Color2

				if (strcmp(ParameterName, "VehicleX", false) == 0) // If the parametername is correct ("VehicleX")
					cx = floatstr(ParameterValue); // Store the VehicleX
				if (strcmp(ParameterName, "VehicleY", false) == 0) // If the parametername is correct ("VehicleY")
					cy = floatstr(ParameterValue); // Store the VehicleY
				if (strcmp(ParameterName, "VehicleZ", false) == 0) // If the parametername is correct ("VehicleZ")
					cz = floatstr(ParameterValue); // Store the VehicleZ
				if (strcmp(ParameterName, "VehicleAngle", false) == 0) // If the parametername is correct ("VehicleAngle")
					crot = floatstr(ParameterValue); // Store the VehicleAngle

				if (strcmp(ParameterName, "NeonsApplied", false) == 0) // If the parametername is correct ("NeonsApplied")
					Neons = strval(ParameterValue); // Store the NeonsApplied

				if (strcmp(ParameterName, "Clamped", false) == 0) // If the parametername is correct ("Clamped")
				{
				    if (strcmp(ParameterValue, "Yes", false) == 0) // If the value "Yes" was read
						VehicleClamped = true; // Vehicle is clamped
					else
						VehicleClamped = false; // Vehicle is not clamped
				}

				if (strcmp(ParameterName, "[/Vehicle]", false) == 0) // If the parametername is correct ("[/Vehicle]")
				{
					// Set both colors to 1 if they are 0 AND if there is a paintjob applied
					if ((Col1 == 0) && (cPaint != 0))
					    Col1 = 1;
					if ((Col2 == 0) && (cPaint != 0))
					    Col2 = 1;

					// The "[/Vehicle]" is found, this means that all data about this vehicle is now stored in the variables
					// Now add the vehicle to the house and set it's data
					vid = House_AddVehicle(HouseID, cModel, cPaint, components, cx, cy, cz, crot, Col1, Col2);
					AVehicleData[vid][Clamped] = VehicleClamped;
					// Apply the neons if they have been loaded
					if (Neons != 0)
					{
						AVehicleData[vid][NeonObjectModel] = Neons;
					    AVehicleData[vid][NeonLeft] = CreateObject(AVehicleData[vid][NeonObjectModel],0,0,0,0,0,0);
					    AVehicleData[vid][NeonRight] = CreateObject(AVehicleData[vid][NeonObjectModel],0,0,0,0,0,0);
						AttachObjectToVehicle(AVehicleData[vid][NeonLeft], vid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
						AttachObjectToVehicle(AVehicleData[vid][NeonRight], vid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
					}

					// Also set the fuel (set it to maximum when the fuel parameter wasn't inside the file)
					if (cFuel == -1)
						AVehicleData[vid][Fuel] = MaxFuel;
					else // If the parameter was there, store it
						AVehicleData[vid][Fuel] = cFuel;
				}
			}

            // Read the next line of the file
			fread(HFile, LineFromFile);
		}

		// Check if the maximum house-level isn't 0 (when updating to the new version)
		if (AHouseData[HouseID][HouseMaxLevel] == 0)
		    AHouseData[HouseID][HouseMaxLevel] = 10; // Set the maximum level to 10

        // Close the file
		fclose(HFile);

        // Return if the file was read correctly
		return 1;
	}
	else
	    return 0; // Return 0 if the file couldn't be read (doesn't exist)
}

// This function will save the given house
HouseFile_Save(HouseID)
{
	new file[100], File:HFile, LineForFile[100], vid;

    // Construct the complete filename for this house
	format(file, sizeof(file), HouseFile, HouseID);

	HFile = fopen(file, io_write); // Open the playerfile for writing

	format(LineForFile, 100, "HouseName %s\r\n", AHouseData[HouseID][HouseName]); // Construct the line: "HouseName <HouseName>"
	fwrite(HFile, LineForFile); // And save it to the file

	format(LineForFile, 100, "HouseX %f\r\n", AHouseData[HouseID][HouseX]); // Construct the line: "HouseX <HouseX>"
	fwrite(HFile, LineForFile); // And save it to the file

	format(LineForFile, 100, "HouseY %f\r\n", AHouseData[HouseID][HouseY]); // Construct the line: "HouseY <HouseY>"
	fwrite(HFile, LineForFile); // And save it to the file

	format(LineForFile, 100, "HouseZ %f\r\n", AHouseData[HouseID][HouseZ]); // Construct the line: "HouseZ <HouseZ>"
	fwrite(HFile, LineForFile); // And save it to the file

	format(LineForFile, 100, "HouseLevel %i\r\n", AHouseData[HouseID][HouseLevel]); // Construct the line: "HouseLevel <HouseLevel>"
	fwrite(HFile, LineForFile); // And save it to the file

	format(LineForFile, 100, "HouseMaxLevel %i\r\n", AHouseData[HouseID][HouseMaxLevel]); // Construct the line: "HouseMaxLevel <HouseMaxLevel>"
	fwrite(HFile, LineForFile); // And save it to the file

	format(LineForFile, 100, "HousePrice %i\r\n", AHouseData[HouseID][HousePrice]); // Construct the line: "HousePrice <HousePrice>"
	fwrite(HFile, LineForFile); // And save it to the file

	if (AHouseData[HouseID][Owned] == true) // Check if the house is owned
	{
		format(LineForFile, 100, "Owned Yes\r\n"); // Construct the line: "Owned Yes"
		fwrite(HFile, LineForFile); // And save it to the file
	}
	else
	{
		format(LineForFile, 100, "Owned No\r\n"); // Construct the line: "Owned No"
		fwrite(HFile, LineForFile); // And save it to the file
	}

	format(LineForFile, 100, "Owner %s\r\n", AHouseData[HouseID][Owner]); // Construct the line: "Owner <Owner>"
	fwrite(HFile, LineForFile); // And save it to the file

	format(LineForFile, 100, "Insurance %i\r\n", AHouseData[HouseID][Insurance]); // Construct the line: "Insurance <Insurance>"
	fwrite(HFile, LineForFile); // And save it to the file

	AHouseData[HouseID][AutoEvictDays] = AutoEvict[AEDays]; // Update the AutoEvictDays for this house when the player logs out
	format(LineForFile, 100, "AutoEvictDays %i\r\n", AutoEvict[AEDays]); // Construct the line: "AutoEvictDays <AutoEvictDays>"
	fwrite(HFile, LineForFile); // And save it to the file



	// Save the vehicle-data for every vehicle added to the house
	for (new CarSlot; CarSlot < 10; CarSlot++)
	{
	    // If a valid vehicle-id has been found
		if (AHouseData[HouseID][VehicleIDs][CarSlot] != 0)
		{
			// Get the vehicle id
			vid = AHouseData[HouseID][VehicleIDs][CarSlot];

		    format(LineForFile, 100, "[Vehicle]\r\n"); // Construct the line: "[Vehicle]"
			fwrite(HFile, LineForFile); // And save it to the file

		    format(LineForFile, 100, "VehicleModel %i\r\n", AVehicleData[vid][Model]); // Construct the line: "VehicleModel <VehicleModel>"
			fwrite(HFile, LineForFile); // And save it to the file
		    format(LineForFile, 100, "Fuel %i\r\n", AVehicleData[vid][Fuel]); // Construct the line: "Fuel <Fuel>"
			fwrite(HFile, LineForFile); // And save it to the file
		    format(LineForFile, 100, "VehiclePaintJob %i\r\n", AVehicleData[vid][PaintJob]); // Construct the line: "VehiclePaintJob <VehiclePaintJob>"
			fwrite(HFile, LineForFile); // And save it to the file

		    format(LineForFile, 100, "VehicleSpoiler %i\r\n", AVehicleData[vid][Components][0]); // Construct the line: "VehicleSpoiler <VehicleSpoiler>"
			fwrite(HFile, LineForFile); // And save it to the file
		    format(LineForFile, 100, "VehicleHood %i\r\n", AVehicleData[vid][Components][1]); // Construct the line: "VehicleHood <VehicleHood>"
			fwrite(HFile, LineForFile); // And save it to the file
		    format(LineForFile, 100, "VehicleRoof %i\r\n", AVehicleData[vid][Components][2]); // Construct the line: "VehicleRoof <VehicleRoof>"
			fwrite(HFile, LineForFile); // And save it to the file
		    format(LineForFile, 100, "VehicleSideSkirt %i\r\n", AVehicleData[vid][Components][3]); // Construct the line: "VehicleSideSkirt <VehicleSideSkirt>"
			fwrite(HFile, LineForFile); // And save it to the file
		    format(LineForFile, 100, "VehicleLamps %i\r\n", AVehicleData[vid][Components][4]); // Construct the line: "VehicleLamps <VehicleLamps>"
			fwrite(HFile, LineForFile); // And save it to the file
		    format(LineForFile, 100, "VehicleNitro %i\r\n", AVehicleData[vid][Components][5]); // Construct the line: "VehicleNitro <VehicleNitro>"
			fwrite(HFile, LineForFile); // And save it to the file
		    format(LineForFile, 100, "VehicleExhaust %i\r\n", AVehicleData[vid][Components][6]); // Construct the line: "VehicleSpoiler <VehicleSpoiler>"
			fwrite(HFile, LineForFile); // And save it to the file
		    format(LineForFile, 100, "VehicleWheels %i\r\n", AVehicleData[vid][Components][7]); // Construct the line: "VehicleWheels <VehicleWheels>"
			fwrite(HFile, LineForFile); // And save it to the file
		    format(LineForFile, 100, "VehicleStereo %i\r\n", AVehicleData[vid][Components][8]); // Construct the line: "VehicleStereo <VehicleStereo>"
			fwrite(HFile, LineForFile); // And save it to the file
		    format(LineForFile, 100, "VehicleHydraulics %i\r\n", AVehicleData[vid][Components][9]); // Construct the line: "VehicleHydraulics <VehicleHydraulics>"
			fwrite(HFile, LineForFile); // And save it to the file
		    format(LineForFile, 100, "VehicleFrontBumper %i\r\n", AVehicleData[vid][Components][10]); // Construct the line: "VehicleFrontBumper <VehicleFrontBumper>"
			fwrite(HFile, LineForFile); // And save it to the file
		    format(LineForFile, 100, "VehicleRearBumper %i\r\n", AVehicleData[vid][Components][11]); // Construct the line: "VehicleRearBumper <VehicleRearBumper>"
			fwrite(HFile, LineForFile); // And save it to the file
		    format(LineForFile, 100, "VehicleVentRight %i\r\n", AVehicleData[vid][Components][12]); // Construct the line: "VehicleVentRight <VehicleVentRight>"
			fwrite(HFile, LineForFile); // And save it to the file
		    format(LineForFile, 100, "VehicleVentLeft %i\r\n", AVehicleData[vid][Components][13]); // Construct the line: "VehicleVentLeft <VehicleVentLeft>"
			fwrite(HFile, LineForFile); // And save it to the file

		    format(LineForFile, 100, "Color1 %i\r\n", AVehicleData[vid][Color1]); // Construct the line: "Color1 <Color1>"
			fwrite(HFile, LineForFile); // And save it to the file
		    format(LineForFile, 100, "Color2 %i\r\n", AVehicleData[vid][Color2]); // Construct the line: "Color2 <Color2>"
			fwrite(HFile, LineForFile); // And save it to the file

		    format(LineForFile, 100, "VehicleX %f\r\n", AVehicleData[vid][SpawnX]); // Construct the line: "VehicleVentLeft <VehicleVentLeft>"
			fwrite(HFile, LineForFile); // And save it to the file
		    format(LineForFile, 100, "VehicleY %f\r\n", AVehicleData[vid][SpawnY]); // Construct the line: "VehicleVentLeft <VehicleVentLeft>"
			fwrite(HFile, LineForFile); // And save it to the file
		    format(LineForFile, 100, "VehicleZ %f\r\n", AVehicleData[vid][SpawnZ]); // Construct the line: "VehicleVentLeft <VehicleVentLeft>"
			fwrite(HFile, LineForFile); // And save it to the file
		    format(LineForFile, 100, "VehicleAngle %f\r\n", AVehicleData[vid][SpawnRot]); // Construct the line: "VehicleVentLeft <VehicleVentLeft>"
			fwrite(HFile, LineForFile); // And save it to the file

		    format(LineForFile, 100, "NeonsApplied %i\r\n", AVehicleData[vid][NeonObjectModel]); // Construct the line: "NeonsApplied <NeonsApplied>"
			fwrite(HFile, LineForFile); // And save it to the file

			if (AVehicleData[vid][Clamped] == true)
			    format(LineForFile, 100, "Clamped Yes\r\n"); // Construct the line: "Clamped <Yes>"
			else
			    format(LineForFile, 100, "Clamped No\r\n"); // Construct the line: "Clamped <No>"

			fwrite(HFile, LineForFile); // And save it to the file

		    format(LineForFile, 100, "[/Vehicle]\r\n"); // Construct the line: "[/Vehicle]"
			fwrite(HFile, LineForFile); // And save it to the file
		}
	}

	fclose(HFile); // Close the file

	return 1;
}



// This function loads all speedcameras
Camera_LoadAll()
{
	// Loop through all cameras and try to load them
	for (new CamID; CamID < MAX_CAMERAS; CamID++)
	{
	    // Try to load the file and check if it was succesfully loaded (file exists)
		if (CameraFile_Load(CamID) == 1)
		{
			// Save the number of camera's that have been loaded, so it can be displayed
		    TotalCameras++;
		}
	}

	return 1;
}



// This function will load the speedcamera's datafile (used when the server is started to load all cameras)
CameraFile_Load(CamID)
{
	// Setup local variables
	new file[100], File:CFile, LineFromFile[100], ParameterName[50], ParameterValue[50];
	new Float:x, Float:y, Float:z, Float:rot, MaxSpeed;

	format(file, sizeof(file), CameraFile, CamID); // Construct the complete filename for this camera-file

	if (fexist(file))
	{
		CFile = fopen(file, io_read); // Open the camerafile for reading

		fread(CFile, LineFromFile); // Read the first line of the file

		// Keep reading until the end of the file is found (no more data)
		while (strlen(LineFromFile) > 0)
		{
			StripNewLine(LineFromFile); // Strip any newline characters from the LineFromFile
			sscanf(LineFromFile, "s[50]s[50]", ParameterName, ParameterValue); // Extract parametername and parametervalue

			// Store the proper value in the proper place
			if (strcmp(ParameterName, "CamX", false) == 0) // If the parametername is correct ("CamX")
			    x = floatstr(ParameterValue); // Store the CamX
			if (strcmp(ParameterName, "CamY", false) == 0) // If the parametername is correct ("CamY")
			    y = floatstr(ParameterValue); // Store the CamY
			if (strcmp(ParameterName, "CamZ", false) == 0) // If the parametername is correct ("CamZ")
			    z = floatstr(ParameterValue); // Store the CamZ
			if (strcmp(ParameterName, "CamAngle", false) == 0) // If the parametername is correct ("CamAngle")
			    rot = floatstr(ParameterValue); // Store the CamAngle
			if (strcmp(ParameterName, "CamSpeed", false) == 0) // If the parametername is correct ("CamSpeed")
			    MaxSpeed = strval(ParameterValue); // Store the CamSpeed

			fread(CFile, LineFromFile); // Read the next line of the file
		}

		fclose(CFile); // Close the file

		// All data has been read about the camera, now setup the camera
		SetupSpeedCamera(CamID, x, y, z, rot, MaxSpeed);

		return 1; // Return that the file was read correctly
	}
	else
	    return 0; // Return 0 if the file couldn't be read (doesn't exist)
}



// This function loads all businesses
Business_LoadAll()
{
	// First load the business-time file, this one holds the current business-time which is increased every minute the server if online
	BusinessTime_Load();

	// Loop through all businesses and try to load them
	for (new BusID = 1; BusID < MAX_BUSINESS; BusID++)
	{
	    // Try to load the file and check if it was succesfully loaded (file exists)
		if (BusinessFile_Load(BusID) == 1)
		{
			// Add a pickup and 3DText for this business
			Business_CreateEntrance(BusID);
			// Count the loaded businesses
		    TotalBusiness++;
		}
	}

	return 1;
}

// This function loads the file that holds the current business-time
BusinessTime_Load()
{
	// Setup local variables
	new File:BFile, LineFromFile[100], ParameterName[50], ParameterValue[50];

	// Try to load the businesstime file
	if (fexist("ServerData/Business/BusinessTime.ini"))
	{
		BFile = fopen("ServerData/Business/BusinessTime.ini", io_read); // Open the businesstime-file for reading

		fread(BFile, LineFromFile); // Read the first line of the file

		// Keep reading until the end of the file is found (no more data)
		while (strlen(LineFromFile) > 0)
		{
			StripNewLine(LineFromFile); // Strip any newline characters from the LineFromFile
			sscanf(LineFromFile, "s[50]s[50]", ParameterName, ParameterValue); // Extract parametername and parametervalue

			// Store the proper value in the proper place
			if (strcmp(ParameterName, "BusinessTime", false) == 0) // If the parametername is correct ("BusinessTime")
				BusinessTransactionTime = strval(ParameterValue); // Store the BusinessTime

            // Read the next line of the file
			fread(BFile, LineFromFile);
		}

        // Close the file
		fclose(BFile);

        // Return if the file was read correctly
		return 1;
	}
	else
	    return 0; // Return 0 if the file couldn't be read (doesn't exist)
}

// This function saves the file that holds the current business-time
BusinessTime_Save()
{
	new File:BFile, LineForFile[100];

	BFile = fopen("ServerData/Business/BusinessTime.ini", io_write); // Open the businesstime-file for writing

	format(LineForFile, 100, "BusinessTime %i\r\n", BusinessTransactionTime); // Construct the line: "BusinessTime <BusinessTransactionTime>"
	fwrite(BFile, LineForFile); // And save it to the file

	fclose(BFile); // Close the file

	return 1;
}



// This function will load the business's datafile (used when the server is started to load all businesses)
BusinessFile_Load(BusID)
{
	// Setup local variables
	new file[100], File:BFile, LineFromFile[100], ParameterName[50], ParameterValue[50];

	format(file, sizeof(file), BusinessFile, BusID); // Construct the complete filename for this business-file

	if (fexist(file))
	{
		BFile = fopen(file, io_read); // Open the housefile for reading

		fread(BFile, LineFromFile); // Read the first line of the file

		// Keep reading until the end of the file is found (no more data)
		while (strlen(LineFromFile) > 0)
		{
			StripNewLine(LineFromFile); // Strip any newline characters from the LineFromFile
			sscanf(LineFromFile, "s[50]s[50]", ParameterName, ParameterValue); // Extract parametername and parametervalue

			// Store the proper value in the proper place
			if (strcmp(ParameterName, "BusinessName", false) == 0) // If the parametername is correct ("BusinessName")
			    format(ABusinessData[BusID][BusinessName], 24, ParameterValue); // Store the BusinessName
			if (strcmp(ParameterName, "BusinessX", false) == 0) // If the parametername is correct ("BusinessX")
				ABusinessData[BusID][BusinessX] = floatstr(ParameterValue); // Store the BusinessX
			if (strcmp(ParameterName, "BusinessY", false) == 0) // If the parametername is correct ("BusinessY")
				ABusinessData[BusID][BusinessY] = floatstr(ParameterValue); // Store the BusinessY
			if (strcmp(ParameterName, "BusinessZ", false) == 0) // If the parametername is correct ("BusinessZ")
				ABusinessData[BusID][BusinessZ] = floatstr(ParameterValue); // Store the BusinessZ
			if (strcmp(ParameterName, "BusinessType", false) == 0) // If the parametername is correct ("BusinessType")
				ABusinessData[BusID][BusinessType] = strval(ParameterValue); // Store the BusinessType
			if (strcmp(ParameterName, "BusinessLevel", false) == 0) // If the parametername is correct ("BusinessLevel")
				ABusinessData[BusID][BusinessLevel] = strval(ParameterValue); // Store the BusinessLevel
			if (strcmp(ParameterName, "LastTransaction", false) == 0) // If the parametername is correct ("LastTransaction")
				ABusinessData[BusID][LastTransaction] = strval(ParameterValue); // Store the LastTransaction
			if (strcmp(ParameterName, "Owned", false) == 0) // If the parametername is correct ("Owned")
			{
			    if (strcmp(ParameterValue, "Yes", false) == 0) // If the value "Yes" was read
					ABusinessData[BusID][Owned] = true; // House is owned
				else
					ABusinessData[BusID][Owned] = false; // House is not owned
			}
			if (strcmp(ParameterName, "Owner", false) == 0) // If the parametername is correct ("Owner")
			    format(ABusinessData[BusID][Owner], 24, ParameterValue);

			if (strcmp(ParameterName, "AutoEvictDays", false) == 0) // If the parametername is correct ("AutoEvictDays")
				ABusinessData[BusID][AutoEvictDays] = strval(ParameterValue); // Store the AutoEvictDays

            // Read the next line of the file
			fread(BFile, LineFromFile);
		}

        // Close the file
		fclose(BFile);

        // Return if the file was read correctly
		return 1;
	}
	else
	    return 0; // Return 0 if the file couldn't be read (doesn't exist)
}

// This function will save the given business
BusinessFile_Save(BusID)
{
	new file[100], File:BFile, LineForFile[100];

    // Construct the complete filename for this business
	format(file, sizeof(file), BusinessFile, BusID);

	BFile = fopen(file, io_write); // Open the business-file for writing

	format(LineForFile, 100, "BusinessName %s\r\n", ABusinessData[BusID][BusinessName]); // Construct the line: "BusinessName <BusinessName>"
	fwrite(BFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "BusinessX %f\r\n", ABusinessData[BusID][BusinessX]); // Construct the line: "BusinessX <BusinessX>"
	fwrite(BFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "BusinessY %f\r\n", ABusinessData[BusID][BusinessY]); // Construct the line: "BusinessY <BusinessY>"
	fwrite(BFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "BusinessZ %f\r\n", ABusinessData[BusID][BusinessZ]); // Construct the line: "BusinessZ <BusinessZ>"
	fwrite(BFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "BusinessType %i\r\n", ABusinessData[BusID][BusinessType]); // Construct the line: "BusinessType <BusinessType>"
	fwrite(BFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "BusinessLevel %i\r\n", ABusinessData[BusID][BusinessLevel]); // Construct the line: "BusinessLevel <BusinessLevel>"
	fwrite(BFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "LastTransaction %i\r\n", ABusinessData[BusID][LastTransaction]); // Construct the line: "LastTransaction <LastTransaction>"
	fwrite(BFile, LineForFile); // And save it to the file

	ABusinessData[BusID][AutoEvictDays] = AutoEvict[AEDays]; // Update the AutoEvictDays for this business when the player logs out
	format(LineForFile, 100, "AutoEvictDays %i\r\n", AutoEvict[AEDays]); // Construct the line: "AutoEvictDays <AutoEvictDays>"
	fwrite(BFile, LineForFile); // And save it to the file

	if (ABusinessData[BusID][Owned] == true) // Check if the house is owned
	{
		format(LineForFile, 100, "Owned Yes\r\n"); // Construct the line: "Owned Yes"
		fwrite(BFile, LineForFile); // And save it to the file
	}
	else
	{
		format(LineForFile, 100, "Owned No\r\n"); // Construct the line: "Owned No"
		fwrite(BFile, LineForFile); // And save it to the file
	}

	format(LineForFile, 100, "Owner %s\r\n", ABusinessData[BusID][Owner]); // Construct the line: "Owner <Owner>"
	fwrite(BFile, LineForFile); // And save it to the file

	fclose(BFile); // Close the file

	return 1;
}



// This function will load the player's bank account and process transfers that were made to his account when he was offline
BankFile_Load(playerid)
{
	// Setup local variables
	new file[100], File:BFile, Name[24], LineFromFile[100], ParameterName[50], ParameterValue[50];
	new TransferMoney, TransferName[24], TransferTime[24], Msg[128];
	new IntrestAmount, OldBankMoney, NewBankMoney;

	format(Name, sizeof(Name), APlayerData[playerid][PlayerName]); // Get the playername
	format(file, sizeof(file), BankFile, Name); // Construct the complete filename for this player's bank-account

	if (fexist(file))
	{
		// Send a message to the player to inform him that he has a bank account
	    SendClientMessage(playerid, 0xFFFFFFFF, "{00BBFF}Banka hesabýnýz var. {FFBB00}/banka{00BBFF} yazarak giriþ yapabilirsiniz.");

		BFile = fopen(file, io_read); // Open the bankfile for reading

		fread(BFile, LineFromFile); // Read the first line of the file

		// Keep reading until the end of the file is found (no more data)
		while (strlen(LineFromFile) > 0)
		{
			StripNewLine(LineFromFile); // Strip any newline characters from the LineFromFile
			sscanf(LineFromFile, "s[50]s[50]", ParameterName, ParameterValue); // Extract parametername and parametervalue

			// Store the proper value in the proper place
			if (strcmp(ParameterName, "Password", false) == 0) // If the parametername is correct ("Password")
			    format(APlayerData[playerid][BankPassword], 24, ParameterValue); // Store the Password
			if (strcmp(ParameterName, "Money", false) == 0) // If the parametername is correct ("Money")
				APlayerData[playerid][BankMoney] = strval(ParameterValue); // Store the Money
			if (strcmp(ParameterName, "LastIntrestTime", false) == 0) // If the parametername is correct ("LastIntrestTime")
				APlayerData[playerid][LastIntrestTime] = strval(ParameterValue); // Store the LastIntrestTime

			// Process transfer-data
			if (strcmp(ParameterName, "[Transfer]", false) == 0) // If the parametername is correct ("[Transfer]")
			{
				TransferMoney = 0; // Clear the money variable
			    for (new i; i < sizeof(TransferName); i++) // Clear the name variable
			        TransferName[i] = 0;
			    for (new i; i < sizeof(TransferTime); i++) // Clear the time variable
			        TransferTime[i] = 0;
			}
			if (strcmp(ParameterName, "TransferMoney", false) == 0) // If the parametername is correct ("TransferMoney")
				TransferMoney = strval(ParameterValue); // Store the TransferMoney
			if (strcmp(ParameterName, "TransferName", false) == 0) // If the parametername is correct ("TransferName")
			    format(TransferName, sizeof(TransferName), ParameterValue); // Store the TransferName
			if (strcmp(ParameterName, "TransferTime", false) == 0) // If the parametername is correct ("TransferTime")
			    format(TransferTime, sizeof(TransferTime), ParameterValue); // Store the TransferTime
			if (strcmp(ParameterName, "[/Transfer]", false) == 0) // If the parametername is correct ("[/Transfer]")
			{
				// Add the money to your bank-account that was transferred by another player
				APlayerData[playerid][BankMoney] = APlayerData[playerid][BankMoney] + TransferMoney;
				// Inform the player that a player has transferred some money to your bank account
				format(Msg, 128, "{00BBFF}Oyuncu {FFBB00}%s{00BBFF} banka hesabýnýza {FFBB00}$%i{00BBFF} havale etti", TransferName, TransferMoney);
				SendClientMessage(playerid, 0xFFFFFFFF, Msg);
				format(Msg, 128, "{00BBFF}Havaleyi þu gün yaptý: {FFBB00}%s", TransferTime);
				SendClientMessage(playerid, 0xFFFFFFFF, Msg);
			}

            // Read the next line of the file
			fread(BFile, LineFromFile);
		}

        // Close the file
		fclose(BFile);

		// Process intrest if intrest is enabled for the time the player was offline
		if (IntrestEnabled == true)
		{
		    // Check if the player has any money in his bank account (adding intrest to $0 is useless)
			if (APlayerData[playerid][BankMoney] > 0)
			{
				// Also process intrest for this bank account for every hour the player was offline
				if (APlayerData[playerid][LastIntrestTime] < CurrentIntrestTime)
				{
				    // Get the old amount of money
				    OldBankMoney = APlayerData[playerid][BankMoney];
					// Count the hours the player was offline and didn't receive intrest yet
					for (new i; i < (CurrentIntrestTime - APlayerData[playerid][LastIntrestTime]); i++)
					{
						// Calculate the intrest
						IntrestAmount = floatround(floatmul(APlayerData[playerid][BankMoney], BankIntrest), floatround_floor);
						// Add the intrest to this player's bank account
						APlayerData[playerid][BankMoney] = APlayerData[playerid][BankMoney] + IntrestAmount;
					}
				    // Get the new amount of money
				    NewBankMoney = APlayerData[playerid][BankMoney];
					// Save the CurrentIntrestTime for this bank account
					APlayerData[playerid][LastIntrestTime] = CurrentIntrestTime;

					// Inform the player that he received intrest on his bank account and how much
					format(Msg, 128, "{00BBFF}Banka hesabýnýza {FFBB00}$%i{00BBFF} faiz geldi", NewBankMoney - OldBankMoney);
					SendClientMessage(playerid, 0xFFFFFFFF, Msg);
				}
			}
		}

		// Re-save the bank account (in case intrest and transfers have been processed)
		BankFile_Save(playerid);

        // Return if the file was read correctly
		return 1;
	}
	else
	{
		// Send a message if the player doesn't have a bank account
	    SendClientMessage(playerid, 0xFFFFFFFF, "{00BBFF}Banka hesabýnýz yok. {FFBB00}/banka{00BBFF} yazarak bir tane açabilirsiniz");

	    return 0; // Return 0 if the file couldn't be read (doesn't exist)
	}
}

// This function will save the player's bank account
BankFile_Save(playerid)
{
	// Setup local variables
	new file[100], File:BFile, LineForFile[100], Name[24];

	format(Name, sizeof(Name), APlayerData[playerid][PlayerName]); // Get the playername
	format(file, sizeof(file), BankFile, Name); // Construct the complete filename for this player's bank-account

	BFile = fopen(file, io_write); // Open the business-file for writing

	format(LineForFile, 100, "Password %s\r\n", APlayerData[playerid][BankPassword]); // Construct the line: "Password <BankPassword>"
	fwrite(BFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "Money %i\r\n", APlayerData[playerid][BankMoney]); // Construct the line: "Money <BankMoney>"
	fwrite(BFile, LineForFile); // And save it to the file
	format(LineForFile, 100, "LastIntrestTime %i\r\n", APlayerData[playerid][LastIntrestTime]); // Construct the line: "LastIntrestTime <LastIntrestTime>"
	fwrite(BFile, LineForFile); // And save it to the file

	fclose(BFile); // Close the file

	return 1;
}



// This function loads the file that holds the current intrest-time
IntrestTime_Load()
{
	// Setup local variables
	new File:BFile, LineFromFile[100], ParameterName[50], ParameterValue[50];

	// Try to load the businesstime file
	if (fexist("ServerData/Bank/IntrestTime.ini"))
	{
		BFile = fopen("ServerData/Bank/IntrestTime.ini", io_read); // Open the intrest-time-file for reading

		fread(BFile, LineFromFile); // Read the first line of the file

		// Keep reading until the end of the file is found (no more data)
		while (strlen(LineFromFile) > 0)
		{
			StripNewLine(LineFromFile); // Strip any newline characters from the LineFromFile
			sscanf(LineFromFile, "s[50]s[50]", ParameterName, ParameterValue); // Extract parametername and parametervalue

			// Store the proper value in the proper place
			if (strcmp(ParameterName, "CurrentIntrestTime", false) == 0) // If the parametername is correct ("CurrentIntrestTime")
				CurrentIntrestTime = strval(ParameterValue); // Store the CurrentIntrestTime

            // Read the next line of the file
			fread(BFile, LineFromFile);
		}

        // Close the file
		fclose(BFile);

        // Return if the file was read correctly
		return 1;
	}
	else
	    return 0; // Return 0 if the file couldn't be read (doesn't exist)
}

// This function saves the file that holds the current intrest-time
IntrestTime_Save()
{
	new File:BFile, LineForFile[100];

	BFile = fopen("ServerData/Bank/IntrestTime.ini", io_write); // Open the intresttime-file for writing

	format(LineForFile, 100, "CurrentIntrestTime %i\r\n", CurrentIntrestTime); // Construct the line: "CurrentIntrestTime <CurrentIntrestTime>"
	fwrite(BFile, LineForFile); // And save it to the file

	fclose(BFile); // Close the file

	return 1;
}

// ************************************************************************************************************************************************************
// PPC_Speedometer
// ************************************************************************************************************************************************************

// Forward the function needed to update the speedometer (used by a timer)
forward Speedometer_Update(playerid);
forward RefuelVehicle(playerid);

// This function sets up the speedometer for the given player
Speedometer_Setup(playerid)
{
	// Setup the speedometer for the player
	APlayerData[playerid][SpeedometerText] = TextDrawCreate(500.0, 395.0, " ");
	APlayerData[playerid][FuelGauge] = TextDrawCreate(500.0, 410.0, " ");
	// Enable the TextDraw for this player
	TextDrawShowForPlayer(playerid, APlayerData[playerid][SpeedometerText]);
	TextDrawShowForPlayer(playerid, APlayerData[playerid][FuelGauge]);

	// Start the speedometer timer
	APlayerData[playerid][SpeedometerTimer] = SetTimerEx("Speedometer_Update", 500, true, "i", playerid);
	APlayerData[playerid][SpeedometerBTimer] = SetTimerEx("Speedometer_BUpdate", 1000 + (500 * (APlayerData[playerid][YakitTasarrufu])), true, "i", playerid);
	return 1;
}

// This function cleans up the speedometer for the given player
Speedometer_Cleanup(playerid)
{
	// Destroy the speedometer textdraw
	TextDrawDestroy(APlayerData[playerid][SpeedometerText]);
	TextDrawDestroy(APlayerData[playerid][FuelGauge]);
	// Kill the speedometer timer
	KillTimer(APlayerData[playerid][SpeedometerTimer]);
	// Set player speed to 0
	APlayerData[playerid][PlayerSpeed] = 0;

	return 1;
}

forward Speedometer_BUpdate(playerid);
public Speedometer_BUpdate(playerid)
{
	if(GetPlayerVehicleID(playerid) != 0)
	{
	    new Float:final_speed, final_speed_int, Float:speed_x, Float:speed_y, Float:speed_z;
		GetVehicleVelocity(GetPlayerVehicleID(playerid), speed_x, speed_y, speed_z);
		final_speed = floatsqroot(((speed_x * speed_x) + (speed_y * speed_y)) + (speed_z * speed_z)) * 158.179;
		final_speed_int = floatround(final_speed, floatround_round);

		if ((final_speed_int > 10) && (AVehicleData[ GetPlayerVehicleID(playerid) ][Fuel] > 0))
			AVehicleData[ GetPlayerVehicleID(playerid) ][Fuel] = AVehicleData[ GetPlayerVehicleID(playerid) ][Fuel] - 1;
	}
}

// Oyuncu 3D Text
LoadPlayer3DText(playerid)
{
	new Yazi[128], Float:oX, Float:oY, Float:oZ;
	GetPlayerPos(playerid, oX, oY, oZ);

	format(Yazi, 128, " ");
	
	if(APlayerData[playerid][PlayerLevel] > 0)
	{
		format(Yazi, 128, "{FFC000}« %s ( %d Level ) »\n", AdminLevelName[ APlayerData[playerid][PlayerLevel] ], APlayerData[playerid][PlayerLevel]);
	}

	if(APlayerData[playerid][VIP] > 0)
	{
 		format(Yazi, 128, "%s{CAFF70}« VIP Üye »\n", Yazi);
	}

	Oyuncu3D[playerid] = Create3DTextLabel(Yazi, 0xFFFFFFFF, oX, oY, oZ, 30.0, GetPlayerVirtualWorld(playerid));
	Attach3DTextLabelToPlayer(Oyuncu3D[playerid], playerid, 0.0, 0.0, 1.0);
}

// This function gets called by a timer which runs every 500ms to display and update the speedometer
public Speedometer_Update(playerid)
{
	// BoomBox Sistemi
	RefreshPlayerBoomBox(playerid);

	// 3D Text
	if(APlayerData[playerid][LoggedIn] == true)
	{
	    Oyuncu3DTimer[playerid]++;
	    if(Oyuncu3DTimer[playerid] == 10)
	    {
			Oyuncu3DTimer[playerid] = 0;
			Delete3DTextLabel(Oyuncu3D[playerid]);
			
        	LoadPlayer3DText(playerid);
		}
	}
	
	// Setup local variables
	new vehicleid, Float:speed_x, Float:speed_y, Float:speed_z, Float:final_speed, speed_string[50], final_speed_int, Float:vehiclehealth;
	new FuelString[50], FuelStatus[20];
	new Msg[128], Name[24];

	// Get the ID of the player's vehicle
	vehicleid = GetPlayerVehicleID(playerid);

	//******************************************************************************************************************************
	// Anti-hack stuff
	//******************************************************************************************************************************

	AntiHack(playerid);
	
	//******************************************************************************************************************************
	// End of anti-hack stuff
	//******************************************************************************************************************************

	// Check and toggle spectate-mode when needed (when target player entered or exited his vehicle)
	if (GetPlayerState(playerid) == PLAYER_STATE_SPECTATING)
	{
	    // Get the target player's ID and name
	    new OtherPlayer = APlayerData[playerid][SpectateID];
		GetPlayerName(OtherPlayer, Name, sizeof(Name));

		// Use the same worldid and interiorid as the OtherPlayer
		SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(OtherPlayer));
		SetPlayerInterior(playerid, GetPlayerInterior(OtherPlayer));

		// Check if the player is spectating a player
		if (APlayerData[playerid][SpectateType] == ADMIN_SPEC_TYPE_PLAYER)
		{
		    // Check if the target player has entered a vehicle
		    if (GetPlayerVehicleSeat(OtherPlayer) != -1)
		    {
				// Change spectate mode to vehicle
				PlayerSpectateVehicle(playerid, GetPlayerVehicleID(OtherPlayer));
				APlayerData[playerid][SpectateID] = OtherPlayer;
				APlayerData[playerid][SpectateVehicle] = GetPlayerVehicleID(OtherPlayer);
				APlayerData[playerid][SpectateType] = ADMIN_SPEC_TYPE_VEHICLE;
				format(Msg, 128, "{00FF00}Oyuncu {FFFF00}%s{00FF00} araca bindi", Name);
				SendClientMessage(playerid, 0xFFFFFFFF, Msg);
		    }
		}
		else // The player is spectating a vehicle
		{
		    // Check if the target player has exited a vehicle
		    if (GetPlayerVehicleSeat(OtherPlayer) == -1)
		    {
				// Change spectate mode to player
				PlayerSpectatePlayer(playerid, OtherPlayer);
				SetPlayerInterior(playerid, GetPlayerInterior(OtherPlayer));
				APlayerData[playerid][SpectateID] = OtherPlayer;
				APlayerData[playerid][SpectateType] = ADMIN_SPEC_TYPE_PLAYER;
				format(Msg, 128, "{00FF00}Oyuncu {FFFF00}%s{00FF00} araçtan indi", Name);
				SendClientMessage(playerid, 0xFFFFFFFF, Msg);
		    }
		}
	}

	// When the player got a wanted level and a police player warned him to stop, a timer is started and a variable is set to "true"
	// Check if this variable has been set
	if (APlayerData[playerid][PoliceWarnedMe] == true)
	{
	    // Check if the player has no wanted level anymore (after finishing a overloaded mission, player got fined, ...)
		if (GetPlayerWantedLevel(playerid) == 0)
		{
			APlayerData[playerid][PoliceCanJailMe] = false; // Clear the variable
			APlayerData[playerid][PoliceWarnedMe] = false; // Clear the variable
			APlayerData[playerid][Value_PoliceCanJailMe] = 0; // Clear the remaining time for the timer
			KillTimer(APlayerData[playerid][Timer_PoliceCanJailMe]); // Kill the timer
		}
	}

	// If the player is inside a vehicle
	if(vehicleid != 0)
	{
		// Get the vehicles velocity
		GetVehicleVelocity(vehicleid, speed_x, speed_y, speed_z);
		// Calculate the speed (in kph)
		final_speed = floatsqroot(((speed_x * speed_x) + (speed_y * speed_y)) + (speed_z * speed_z)) * 158.179;
		// Convert the float value to an int value
		final_speed_int = floatround(final_speed, floatround_round);
		// Also save the speed for the player
		APlayerData[playerid][PlayerSpeed] = final_speed_int;
		// Setup the string to display for the player and display it
		format(speed_string, 50, TXT_SpeedometerSpeed, final_speed_int);
		TextDrawSetString(APlayerData[playerid][SpeedometerText], speed_string);

		// Add the speed to the stats (this will be the meters driven in total)
		APlayerData[playerid][StatsMetersDriven] = APlayerData[playerid][StatsMetersDriven] + (final_speed / 7.2);

		// Also display the vehicle's health through the player-health bar
		GetVehicleHealth(vehicleid, vehiclehealth);
		//SetPlayerHealth(playerid, vehiclehealth / 10.0);

		// Construct the fuelgauge
		if ((AVehicleData[vehicleid][Fuel] > 0) && (AVehicleData[vehicleid][Fuel] < 100000))
			format(FuelStatus, 20, "~g~%s~r~%s", "I", "IIIIIIIII"); // Fuel is between 0% and 10% full

		if ((AVehicleData[vehicleid][Fuel] >= ((MaxFuel / 10) * 1)) && (AVehicleData[vehicleid][Fuel] < ((MaxFuel / 10) * 2)))
			format(FuelStatus, 20, "~g~%s~r~%s", "II", "IIIIIIII"); // Fuel is between 10% and 20% full

		if ((AVehicleData[vehicleid][Fuel] >= ((MaxFuel / 10) * 2)) && (AVehicleData[vehicleid][Fuel] < ((MaxFuel / 10) * 3)))
			format(FuelStatus, 20, "~g~%s~r~%s", "III", "IIIIIII"); // Fuel is between 20% and 30% full

		if ((AVehicleData[vehicleid][Fuel] >= ((MaxFuel / 10) * 3)) && (AVehicleData[vehicleid][Fuel] < ((MaxFuel / 10) * 4)))
			format(FuelStatus, 20, "~g~%s~r~%s", "IIII", "IIIIII"); // Fuel is between 30% and 40% full

		if ((AVehicleData[vehicleid][Fuel] >= ((MaxFuel / 10) * 4)) && (AVehicleData[vehicleid][Fuel] < ((MaxFuel / 10) * 5)))
			format(FuelStatus, 20, "~g~%s~r~%s", "IIIII", "IIIII"); // Fuel is between 40% and 50% full

		if ((AVehicleData[vehicleid][Fuel] >= ((MaxFuel / 10) * 5)) && (AVehicleData[vehicleid][Fuel] < ((MaxFuel / 10) * 6)))
			format(FuelStatus, 20, "~g~%s~r~%s", "IIIIII", "IIII"); // Fuel is between 50% and 60% full

		if ((AVehicleData[vehicleid][Fuel] >= ((MaxFuel / 10) * 6)) && (AVehicleData[vehicleid][Fuel] < ((MaxFuel / 10) * 7)))
			format(FuelStatus, 20, "~g~%s~r~%s", "IIIIIII", "III"); // Fuel is between 60% and 70% full

		if ((AVehicleData[vehicleid][Fuel] >= ((MaxFuel / 10) * 7)) && (AVehicleData[vehicleid][Fuel] < ((MaxFuel / 10) * 8)))
			format(FuelStatus, 20, "~g~%s~r~%s", "IIIIIIII", "II"); // Fuel is between 70% and 80% full

		if ((AVehicleData[vehicleid][Fuel] >= ((MaxFuel / 10) * 8)) && (AVehicleData[vehicleid][Fuel] < ((MaxFuel / 10) * 9)))
			format(FuelStatus, 20, "~g~%s~r~%s", "IIIIIIIII", "I"); // Fuel is between 80% and 90% full

		if ((AVehicleData[vehicleid][Fuel] >= ((MaxFuel / 10) * 9)) && (AVehicleData[vehicleid][Fuel] <= MaxFuel))
			format(FuelStatus, 20, "~g~%s", "IIIIIIIIII"); // Fuel is between 90% and 100% full (all bars are green)

		if (AVehicleData[vehicleid][Fuel] == 0)
			format(FuelStatus, 20, "~r~%s", "IIIIIIIIII"); // Fuel is empty (all bars are red)

		// Format the final fuel-gauge readout
		format(FuelString, 50, TXT_SpeedometerFuel, FuelStatus);
		// Display the fuel-gauge
		TextDrawSetString(APlayerData[playerid][FuelGauge], FuelString);

		// Check if the vehicle is out of fuel
		if (AVehicleData[vehicleid][Fuel] == 0)
		{
			// Stop the engine and turn off the lights
			new engine,lights,alarm,doors,bonnet,boot,objective;
			GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
			SetVehicleParamsEx(vehicleid, 0, 0, alarm, doors, bonnet, boot, objective);
		}

		// Check if the player is not in any plane or helicopter (those cannot be caught by speedcamera's)
		if (IsVehicleAirVehicle(vehicleid) == 0)
			if (APlayerData[playerid][PlayerClass] != ClassPolice) // Check if the player isn't speeding (cops won't get caught)
				CheckPlayerSpeeding(playerid);
	}
	else
	{
		// If the player is not inside a vehicle, display an empty string (looks like the speedometer is gone)
		TextDrawSetString(APlayerData[playerid][SpeedometerText], " ");
		TextDrawSetString(APlayerData[playerid][FuelGauge], " ");
		// Set the speed of the player to 0
		APlayerData[playerid][PlayerSpeed] = 0;
	}
}



// This timer-function is called when a player picks up a refuelpickup
public RefuelVehicle(playerid)
{
	new RefuelMsg[128];
	// Get the vehicle-id of the player's vehicle
	new vID = GetPlayerVehicleID(playerid);
	// Calculate the amount of fuel that needs to be refuelled
	new Amount = MaxFuel - AVehicleData[vID][Fuel];
	// Calculate the price to refuel
	new RefuelPrice = (Amount * RefuelMaxPrice) / MaxFuel;

	// Check if the player has enough cash
	if (APlayerData[playerid][PlayerMoney] >= RefuelPrice)
	{
		// Refuel the vehicle
		AVehicleData[vID][Fuel] = MaxFuel;
		// Withdraw the money from the player
		RewardPlayer(playerid, -RefuelPrice, 0);
		// Let the player know he refuelled his vehicle
		format(RefuelMsg, 128, TXT_RefuelledVehicle, RefuelPrice);
		SendClientMessage(playerid, 0xFFFFFFFF, RefuelMsg);
	}
	else
	    SendClientMessage(playerid, 0xFFFFFFFF, TXT_CannotRefuelVehicle);

	// Allow the player to move again
	TogglePlayerControllable(playerid, 1);

	return 1;
}



// This function checks if the player is speeding near a speedcamera
CheckPlayerSpeeding(playerid)
{
	// Setup local variables
	new Name[24], Msg[128];

	// Check if the player hasn't been caught speeding recently
	if (APlayerData[playerid][PlayerCaughtSpeeding] == 0)
	{
		// Loop through all speedcameras
		for (new CamID; CamID < MAX_CAMERAS; CamID++)
		{
		    // Check if this camera has been created
		    if (ACameras[CamID][CamSpeed] != 0)
		    {
				// Check if the player is the driver of the vehicle
				if (GetPlayerVehicleSeat(playerid) == 0)
				{
					// Check if the player's speed is greater than the speed allowed by this camera (no need to process a distance-check if not speeding)
					if (APlayerData[playerid][PlayerSpeed] > ACameras[CamID][CamSpeed])
					{
						// Check if the player is near the camera
						if (IsPlayerInRangeOfPoint(playerid, 50.0, ACameras[CamID][CamX], ACameras[CamID][CamY], ACameras[CamID][CamZ]))
						{
						    // Prevent the player being caught multiple times by the same speed-camera
						    APlayerData[playerid][PlayerCaughtSpeeding] = 20;
						    // Increase the wanted-level of this player by 1 star
						    SetPlayerWantedLevel(playerid, GetPlayerWantedLevel(playerid) + 1);
						    // Let the player know he's been caught speeding
						    SendClientMessage(playerid, 0xFFFFFFFF, TXT_PlayerCaughtSpeeding);

							// Get the name of the player
							GetPlayerName(playerid, Name, sizeof(Name));
							// Also inform all police players that this player is caught speeding
							format(Msg, 128, "{00FF00}Player {FFFF00}%s{00FF00} is caught speeding, pursue and fine him", Name);
							Police_SendMessage(Msg);
						}
					}
				}
		    }
		}
	}
	else // If the player has been caught before, reduce the value until it's 0 again, then he can be caught again
	    APlayerData[playerid][PlayerCaughtSpeeding]--;
}



// This function processes anti-hack stuff
stock AntiHack(playerid)
{
	// Setup local variables
	new Float:Armour;

	// Skip checking for hacks used by the player if he was reported by the Anti-Hack system already
	if (APlayerData[playerid][AutoReportTime] > 0)
	{
	    // Reduce the time so the player can be reported again soon if he doesn't stop using hacks
	    APlayerData[playerid][AutoReportTime]--;
		// Exit the function, this skips the hack-checks until the AutoReportTime has reached 0
		// Otherwise the player is reported every half a second until he stops using hacks
	    return 1;
	}



	// Check if a filterscript gave some money (or took it) to the player
	if (GetPVarInt(playerid, "PVarMoney") != 0)
	{
		// Add the money to the players account
		APlayerData[playerid][PlayerMoney] = APlayerData[playerid][PlayerMoney] + GetPVarInt(playerid, "PVarMoney");
		// Clear the PVar
		SetPVarInt(playerid, "PVarMoney", 0);
	}
	if (GetPVarInt(playerid, "PVarScore") != 0)
	{
		// Add the money to the players account
		APlayerData[playerid][PlayerScore] = APlayerData[playerid][PlayerScore] + GetPVarInt(playerid, "PVarScore");
		// Clear the PVar
		SetPVarInt(playerid, "PVarScore", 0);
	}

	// Reset the player's money and set it to the stored value in the player's account (do the same for scorepoints)
	ResetPlayerMoney(playerid);
	GivePlayerMoney(playerid, APlayerData[playerid][PlayerMoney]);
	SetPlayerScore(playerid, APlayerData[playerid][PlayerScore]);

	// Limit the cash that the player can have
	if (APlayerData[playerid][PlayerMoney] > 999000000)
	    APlayerData[playerid][PlayerMoney] = 999000000;

	// Limit the cash that the player can have below 0
	if (APlayerData[playerid][PlayerMoney] < -1000000)
	    APlayerData[playerid][PlayerMoney] = -1000000;

	// Port anyone out of the area who is not an admin and inside the area 69
	Player_PortOutAdminZone(playerid, 106.0, 1805.0, -50.0, 285.0, 1940.0, 40.0, 15.0, 1732.0, 25.0);

	// Check if the player got any armour (= health-hack)
	GetPlayerArmour(playerid, Armour);
	// Send an automated report to the admins so they're informed about it and can take action
	if (Armour > 1.0)
        SendReportToAdmins(playerid, "Health-hack", true);

	// Check if the speed is higher than 300 (kick player if it is)
	// Send an automated report to the admins so they're informed about it and can take action
	if (APlayerData[playerid][PlayerSpeed] > 300)
	{
		SendReportToAdmins(playerid, "Speed-hack", true);
	}

	// Check if the player is not allowed to have a jetpack (admins lvl 3 and higher can use /fly, so they will be excluded)
	if (APlayerData[playerid][PlayerLevel] < 6)
	{
		// Check if the player is using a jetpack
		// Send an automated report to the admins so they're informed about it and can take action
		if (GetPlayerSpecialAction(playerid) == 2)
	        SendReportToAdmins(playerid, "Jetpack-hack", true);
	}

	// Detect airbreak hack
	if (GetPlayerVehicleSeat(playerid) == 0)
	{
		// Check if the player is nearly standing still
		if (APlayerData[playerid][PlayerSpeed] < 10)
		{
			// Check if the player switched interior-id's
			if (GetPlayerInterior(playerid) != APlayerData[playerid][PreviousInt])
			{
				// Check if the new interior is the normal world or any mod-shop
			    switch (GetPlayerInterior(playerid))
				{
					case 0, 1, 2, 3: // Check interiors 0, 1, 2 and 3 (normal world and all mod-shops)
					{
						// Store the player's current location and interior-id for the next iteration
						GetPlayerPos(playerid, APlayerData[playerid][PreviousX], APlayerData[playerid][PreviousY], APlayerData[playerid][PreviousZ]);
						APlayerData[playerid][PreviousInt] = GetPlayerInterior(playerid);
						// Exit the function
						return 1;
					}
				}
			}

		    // Check if the player is still near the same place he was half a second ago
			if (IsPlayerInRangeOfPoint(playerid, 7.5, APlayerData[playerid][PreviousX], APlayerData[playerid][PreviousY], APlayerData[playerid][PreviousZ]))
			{
			}
			else{ // Send an automated report to the admins so they're informed about it and can take action
		        SendReportToAdmins(playerid, "Airbreak-hack", true);
			}
		}
	}
	// Store the player's current location and interior-id for the next iteration
	GetPlayerPos(playerid, APlayerData[playerid][PreviousX], APlayerData[playerid][PreviousY], APlayerData[playerid][PreviousZ]);
	APlayerData[playerid][PreviousInt] = GetPlayerInterior(playerid);

	return 1;
}

// ************************************************************************************************************************************************************
// PPC_MissionsTrucking
// ************************************************************************************************************************************************************

// Forward the function to Load or Unload goods during missions (used by a timer)
forward Trucker_LoadUnload(playerid);



// This function is called when a truckdriver enters a checkpoint
Trucker_OnPlayerEnterCheckpoint(playerid)
{
	// Check if the player is inside his vehicle while entering a checkpoint
	if (GetPlayerVehicleID(playerid) == APlayerData[playerid][VehicleID])
	{
		// Also check if the player still has his trailer attached
		if (APlayerData[playerid][TrailerID] == GetVehicleTrailer(GetPlayerVehicleID(playerid)))
		{
		    // Check the jobstep
		    switch (APlayerData[playerid][JobStep])
		    {
				// JobStep is 1 (truckdriver is loading his goods at the checkpoint)
		 		case 1: GameTextForPlayer(playerid, TXT_TruckerLoadingGoods, 5000, 4);
				// JobStep is 2 (truckdriver is unloading his goods at the checkpoint) or 3 (unloading for convoys)
				case 2, 3: GameTextForPlayer(playerid, TXT_TruckerUnloadingGoods, 5000, 4);
		    }

			// Disable the player's actions (he cannot move anymore)
			TogglePlayerControllable(playerid, 0);
			// Start a timer (Public function "LoadUnload(playerid)" gets called when the timer runs out)
			APlayerData[playerid][LoadingTimer] = SetTimerEx("Trucker_LoadUnload", 5000, false, "d" , playerid);
		}
		else
		    SendClientMessage(playerid, 0xFFFFFFFF, TXT_NeedTrailerToProceed);
	}
	else
	    SendClientMessage(playerid, 0xFFFFFFFF, TXT_NeedVehicleToProceed);

	return 1;
}

// After a truckdriver entered a checkpoint, a timer is created. This function is called when the timer runs out
public Trucker_LoadUnload(playerid)
{
	// Check if the player is inside a convoy
	if (APlayerData[playerid][InConvoy] == true)
	{
		// If the player just loaded his goods at the loading-point
	    if (APlayerData[playerid][JobStep] == 1)
		{
	        APlayerData[playerid][JobStep] = 2; // Set the next step of the convoy-job (wait until all members have loaded their cargo)
			TextDrawSetString(APlayerData[playerid][MissionText], TXT_WaitingMembersToLoadCargo);
		}

		// If the player just delivered his goods at the unloading-point
		if (APlayerData[playerid][JobStep] == 3)
		{
	        APlayerData[playerid][JobStep] = 4; // Set the next step of the convoy-job (wait until all members have unloaded their cargo)
	    	TextDrawSetString(APlayerData[playerid][MissionText], TXT_WaitingMembersToUnLoadCargo);
		}

		DisablePlayerCheckpoint(playerid); // Delete the loading/unloading-checkpoint
		TogglePlayerControllable(playerid, 1); // Enable the player again (he can move again)

		return 1; // Don't allow the rest of the function to be executed
	}

	// If the player isn't inside a convoy, this part is executed

	// Check the JobStep
	switch (APlayerData[playerid][JobStep])
	{
		case 1: // Player must load his goods
		{
		    // Setup local variables
			new StartLoc[50], EndLoc[50], Load[50], RouteText[255], Float:x, Float:y, Float:z, UnloadMsg[100];
			// Set JobStep to 2 (unloading goods)
			APlayerData[playerid][JobStep] = 2;
			// Delete the loading-checkpoint
			DisablePlayerCheckpoint(playerid);
			// Get the startlocation, endlocation and the load texts
			format(StartLoc, 50, ALocations[APlayerData[playerid][JobLoc1]][LocationName]);
			format(EndLoc, 50, ALocations[APlayerData[playerid][JobLoc2]][LocationName]);
			format(Load, 50, ALoads[APlayerData[playerid][LoadID]][LoadName]);

			// Randomly set the load as overloaded (15% chance the load is overloaded)
			Trucker_SetRandomOverloaded(playerid);

			// Pre-format the missiontext (there may be some parts appended when overloaded/mafiaload
			format(RouteText, 255, TXT_HaulingCargoFromToDeliver, Load, StartLoc, EndLoc);
			// Check if the player is overloaded
			if (APlayerData[playerid][Overloaded] == true)
			{
			    // Add "(OL)" to the missiontext to let the player know he's been overloaded
				format(RouteText, 255, "%s%s", RouteText, " ~r~(OL)~w~");
				// Send a message to the player to let him know he's been overloaded
				SendClientMessage(playerid, 0xFFFFFFFF, TXT_TruckerOverloaded);
			}
			// Check if the player is carrying a mafia-load
			if (ALoads[APlayerData[playerid][LoadID]][Mafia] == true)
			{
			    // Add "(ML)" to the missiontext to let the player know his load is wanted by the mafia
				format(RouteText, 255, "%s%s", RouteText, " ~r~(ML)~w~");
			    // If the player is carrying a mafia-load, inform him about it
				GameTextForPlayer(playerid, TXT_TruckerMafiaInterested, 5000, 4);
				// Also set the data for the player to indicate he's carrying a mafiaload
				APlayerData[playerid][MafiaLoad] = true;
				// Also set the player's trailer ID (or the vehicle itself) as Mafia-load in the array "AVehicleMafiaLoad"
				if (APlayerData[playerid][TrailerID] == 0)
				    AVehicleData[APlayerData[playerid][VehicleID]][MafiaLoad] = true; // The player has no trailer, so set his main vehicle as wanted by the mafia
				else
                    AVehicleData[APlayerData[playerid][TrailerID]][MafiaLoad] = true; // The player has a trailer, so set his trailer as wanted by the mafia
			}

			// Set the TextDraw so the player can see it
			TextDrawSetString(APlayerData[playerid][MissionText], RouteText);

			// Grab the x, y, z positions for the second location (to unload the goods)
			x = ALocations[APlayerData[playerid][JobLoc2]][LocX];
			y = ALocations[APlayerData[playerid][JobLoc2]][LocY];
			z = ALocations[APlayerData[playerid][JobLoc2]][LocZ];
			// Create a checkpoint where the player should unload the goods
			SetPlayerCheckpoint(playerid, x, y, z, 7);
			// Inform the player that he must unload his goods
			format(UnloadMsg, 100, TXT_DeliverCargoTo, Load, EndLoc);
			SendClientMessage(playerid, 0xFFFFFFFF, UnloadMsg);
		}
		case 2: // Player is delivering his goods
		{
		    // Setup local variables
			new StartLoc[50], EndLoc[50], Load[50], Msg1[128], Msg2[128], Name[24], BonusMsg[128];

			// Get the player name
			GetPlayerName(playerid, Name, sizeof(Name));
			// Get the startlocation, endlocation and the load texts
			format(StartLoc, 50, ALocations[APlayerData[playerid][JobLoc1]][LocationName]);
			format(EndLoc, 50, ALocations[APlayerData[playerid][JobLoc2]][LocationName]);
			format(Load, 50, ALoads[APlayerData[playerid][LoadID]][LoadName]);

			// Construct the message sent to all players that this player completed a trucking mission
			format(Msg1, 128, TXT_PlayerCompletedTruckJob, Name, Load);
			format(Msg2, 128, TXT_PlayerCompletedTruckJobInfo, StartLoc, EndLoc);
			SendClientMessageToAll(0xFFFFFFFF, Msg1);
			SendClientMessageToAll(0xFFFFFFFF, Msg2);



		    // Setup local variables
			new Float:x1, Float:y1, Float:x2, Float:y2, Float:Distance, Message[128], Payment, Bonus;
			// Grab the x, y, z positions for the first location (to load the goods)
			x1 = ALocations[APlayerData[playerid][JobLoc1]][LocX];
			y1 = ALocations[APlayerData[playerid][JobLoc1]][LocY];
			// Grab the x, y, z positions for the second location (to unload the goods)
			x2 = ALocations[APlayerData[playerid][JobLoc2]][LocX];
			y2 = ALocations[APlayerData[playerid][JobLoc2]][LocY];
			// Calculate the distance between both points
			Distance = floatsqroot(((x2 - x1) * (x2 - x1)) + ((y2 - y1) * (y2 - y1)));

			// Calculate the payment for the player
			Payment = floatround((Distance * ALoads[APlayerData[playerid][LoadID]][PayPerUnit]), floatround_floor);

			// Check if the player has done the bonus mission
			if (RandomBonusMission[MissionFinished] == false)
			{
				// Check all paramters (load, startlocation and end-location)
				if (RandomBonusMission[RandomLoad] == APlayerData[playerid][LoadID])
					if (RandomBonusMission[RandomStartLoc] == APlayerData[playerid][JobLoc1])
						if (RandomBonusMission[RandomEndLoc] == APlayerData[playerid][JobLoc2])
						{
						    Payment = Payment * 2; // Double the payment if the player was the first to do the bonus mission
                            RandomBonusMission[MissionFinished] = true; // Only one player can do the bonus mission, a new one is chosen next
							format(BonusMsg, 128, "{00BBFF}Oyuncu {FFBB00}%s{00BBFF} bonus görevi tamamladý", Name);
							SendClientMessageToAll(0xFFFFFFFF, BonusMsg);
						}
			}

			// Pay the player based on the distance between the loading-point and unloading-point
			RewardPlayer(playerid, Payment, 0);
			// Send a message to let the player know he finished his mission and got paid
			format(Message, 128, TXT_RewardJob, Payment);
			SendClientMessage(playerid, 0xFFFFFFFF, Message);

			// Add 25% bonus if the player has been overloaded
			if (APlayerData[playerid][Overloaded] == true)
			{
			    // Calculate the bonus
			    Bonus = (Payment * 25 * APlayerData[playerid][AsiriYuklemeBonusu]) / 100;
				// Pay the bonus to the player
				RewardPlayer(playerid, Bonus, 0);
				// Send a message to let the player know he was overloaded and got paid
				format(Message, 128, TXT_TruckerBonusOverloaded, Bonus);
				SendClientMessage(playerid, 0xFFFFFFFF, Message);
			}

			// Add 50% bonus if the player has delivered a mafia load (mafia couldn't steal his load)
			if (APlayerData[playerid][MafiaLoad] == true)
			{
			    // Calculate the bonus
			    Bonus = (Payment * 50) / 100;
				// Pay the bonus to the player
				RewardPlayer(playerid, Bonus, 0);
				// Send a message to let the player know he was overloaded and got paid
				format(Message, 128, TXT_TruckerBonusMafiaLoad, Bonus);
				SendClientMessage(playerid, 0xFFFFFFFF, Message);
			}

			// Add 10% bonus if the player has delivered the load with his own truck
			if (AVehicleData[APlayerData[playerid][VehicleID]][Owned] == true)
			{
			    // Calculate the bonus
			    Bonus = (Payment * 10) / 100;
				// Pay the bonus to the player
				RewardPlayer(playerid, Bonus, 0);
				// Send a message to let the player know he was overloaded and got paid
				format(Message, 128, TXT_TruckerBonusOwnVehicle, Bonus);
				SendClientMessage(playerid, 0xFFFFFFFF, Message);
			}

			// Also add score-points to the score of the player based on the distance between the loading and unloading points
			if (Distance > 3000.0)
				RewardPlayer(playerid, 0, 2); // Distance is larger than 3000 units, so add 2 points
			else
				RewardPlayer(playerid, 0, 1); // Distance is less than 3000 units, so add 1 point

			// Increase the stats for completing a trucking job
			APlayerData[playerid][StatsTruckerJobs]++;
			// Also save the data (in case the server crashes, progress would be lost)
			PlayerFile_Save(playerid);

			// End the current trucker job (clear mission-data)
			Trucker_EndJob(playerid);
		}
	}

    // Enable the player again (he can move again)
	TogglePlayerControllable(playerid, 1);

	return 1;
}

// This function randomly determines if the load is overloaded and adds 2 to the playerwanted-level
Trucker_SetRandomOverloaded(playerid)
{
	// Setup local variables
	new Name[24], Msg[128];

	// Check the vehicle model that the player is driving
	switch (GetVehicleModel(GetPlayerVehicleID(playerid)))
	{
		case VehicleCementTruck: return 0; // A cementtruck cannot be overloaded
		case VehicleLineRunner, VehicleTanker, VehicleRoadTrain: // When driving a LineRunner, Tanker or RoadTrain
		{
			// A Fluids-trailer cannot be overloaded
			if (GetVehicleModel(GetVehicleTrailer(GetPlayerVehicleID(playerid))) == VehicleTrailerFluids) return 0;
		}
	}

	// The player wasn't driving one of the above vehicle models, so this one can be overloaded
	// There is a 15% chance that your load will be overloaded
	if (random(100) <= 15)
	{
		// Set overloaded for this player to True
	    APlayerData[playerid][Overloaded] = true;
	    // Add 2 to the player's wanted level
	    SetPlayerWantedLevel(playerid, GetPlayerWantedLevel(playerid) + 2);
		// Inform the police this trucker is overloaded
		GetPlayerName(playerid, Name, sizeof(Name));
		format(Msg, 128, "{00FF00}Kamyoncu {FFFF00}%s{00FF00} aþýrý yükleme yaptý. Onu yakalayýn ve cezalandýrýn.", Name);
		Police_SendMessage(Msg);
	}

	return 1;
}

// This function is called when a truckdriver wants to start a job by entering "/work" and has no truckers license
Trucker_StartRandomJob(playerid)
{
	// Check if a job could be set correctly (player must be driving a valid trucking vehicle)
	if (Trucker_SetRandomJob(playerid) != 0)
	{
	    // Setup local variables
		new StartLoc[50], EndLoc[50], Load[50], RouteText[255], Float:x, Float:y, Float:z, LoadMsg[128];

		// Job has started
		APlayerData[playerid][JobStarted] = true;

		// Set jobstep to 1 (going to load the goods)
		APlayerData[playerid][JobStep] = 1;
		// Get the startlocation, endlocation and the load texts
		format(StartLoc, 50, ALocations[APlayerData[playerid][JobLoc1]][LocationName]);
		format(EndLoc, 50, ALocations[APlayerData[playerid][JobLoc2]][LocationName]);
		format(Load, 50, ALoads[APlayerData[playerid][LoadID]][LoadName]);
		// Combine it all into a string for the TextDraw (the player can see this all the time) to describe the mission
		format(RouteText, 255, TXT_HaulingCargoFromToPickup, Load, StartLoc, EndLoc);
		// Set the TextDraw so the player can see it
		TextDrawSetString(APlayerData[playerid][MissionText], RouteText);
		// Grab the x, y, z positions for the first location
		x = ALocations[APlayerData[playerid][JobLoc1]][LocX];
		y = ALocations[APlayerData[playerid][JobLoc1]][LocY];
		z = ALocations[APlayerData[playerid][JobLoc1]][LocZ];
		// Create a checkpoint where the player should load the goods
		SetPlayerCheckpoint(playerid, x, y, z, 7);
		// Set the job-fail-time for the global vehicle-timer
		APlayerData[playerid][VehicleTimerTime] = Job_TimeToFailMission;
		// Inform the player that he must load his goods
		format(LoadMsg, 128, TXT_PickupCargoAt, Load, StartLoc);
		SendClientMessage(playerid, 0xFFFFFFFF, LoadMsg);
	}

	return 1;
}

// This function sets a random job based on the player's vehicle and returns 1 if a job has been set
// The function returns 0 if a job couldn't be set (if the player is driving an invalid vehicle to start trucking-jobs)
Trucker_SetRandomJob(playerid)
{
	// If the player is the driver of the vehicle (GetPlayerVehicleSeat returns -1 if the player is not in a vehicle)
	if (GetPlayerVehicleSeat(playerid) == 0)
	{
		// Check the vehicle-model of the player to decide which job the player can get
		switch (GetVehicleModel(GetPlayerVehicleID(playerid)))
		{
			case VehicleFlatbed, VehicleDFT30: // Select a random job from the routes that don't require a trailer and store the data for the player (Flatbed or DFT-30)
				return Trucker_SetRandomJobData(playerid, PCV_TruckerNoTrailer);
			case VehicleCementTruck: // Select a random job from the routes for cementtrucks and store the data for the player
				return Trucker_SetRandomJobData(playerid, PCV_TruckerCementTruck);
			case VehicleLineRunner, VehicleTanker, VehicleRoadTrain: // If the player's vehicle is a "LineRunner", "Tanker" or "RoadTrain"
			{
				// Select a job based on the trailer model of the player
				switch (GetVehicleModel(GetVehicleTrailer(GetPlayerVehicleID(playerid))))
				{
					case VehicleTrailerCargo, VehicleTrailerCargo2: // Select a random job from the routes that require a cargo-trailer and store the data for the player
						return Trucker_SetRandomJobData(playerid, PCV_TruckerCargoTrailer);
					case VehicleTrailerOre: // Select a random job from the routes that require a ore-trailer and store the data for the player
						return Trucker_SetRandomJobData(playerid, PCV_TruckerOreTrailer);
					case VehicleTrailerFluids: // Select a random job from the routes that require a fluids-trailer and store the data for the player
						return Trucker_SetRandomJobData(playerid, PCV_TruckerFluidsTrailer);
				}
			}
		}
	}

	// If no job could be set correctly, return 0
	return 0;
}

// This function chooses a random product for the trucker with a given vehicle-type and also the start-location and end-location
Trucker_SetRandomJobData(playerid, PCV_Needed)
{
	// Get a random Load from the loads that are defined for truckers with the given vehicle-type
    APlayerData[playerid][LoadID] = Product_GetRandom(PCV_Needed);
	// Get a random start-location and end-location for this load
    APlayerData[playerid][JobLoc1] = Product_GetRandomStartLoc(APlayerData[playerid][LoadID]);
    APlayerData[playerid][JobLoc2] = Product_GetRandomEndLoc(APlayerData[playerid][LoadID]);

	// Store the vehicleID (required to be able to check if the player left his vehicle)
	APlayerData[playerid][VehicleID] = GetPlayerVehicleID(playerid);
	// Store the trailerID (required to be able to check if the player lost his trailer)
	APlayerData[playerid][TrailerID] = GetVehicleTrailer(GetPlayerVehicleID(playerid));

	// Return 1 to indicate that a job has been set correctly
	return 1;
}



// This function is used to cleanup the current job
Trucker_EndJob(playerid)
{
	if (APlayerData[playerid][JobStarted] == true)
	{
		// Clear the Mafia-wanted status of the vehicle (or trailer) in the array "AVehicleData"
		if (APlayerData[playerid][TrailerID] == 0)
		    AVehicleData[APlayerData[playerid][VehicleID]][MafiaLoad] = false; // The player has no trailer, so clear his main vehicle as wanted by the mafia
		else
			AVehicleData[APlayerData[playerid][TrailerID]][MafiaLoad] = false; // The player has a trailer, so clear his trailer as wanted by the mafia

		// Clear all data about the job from the player, so he can start a new one
		APlayerData[playerid][JobStarted] = false;
		APlayerData[playerid][JobStep] = 0;
		APlayerData[playerid][JobID] = 0;
		APlayerData[playerid][VehicleTimerTime] = 0;
		APlayerData[playerid][VehicleID] = 0;
		APlayerData[playerid][TrailerID] = 0;
		APlayerData[playerid][LoadID] = 0;
		APlayerData[playerid][JobLoc1] = 0;
		APlayerData[playerid][JobLoc2] = 0;
		APlayerData[playerid][MafiaLoad] = false;

		// Delete the checkpoint
		DisablePlayerCheckpoint(playerid);
		// Reset the missiontext
		TextDrawSetString(APlayerData[playerid][MissionText], Trucker_NoJobText);
		// Kill the LoadingTimer
		KillTimer(APlayerData[playerid][LoadingTimer]);

		// Check if the player has been overloaded
		if (APlayerData[playerid][Overloaded] == true)
		{
			// Clear the overloaded status of the player
		    APlayerData[playerid][Overloaded] = false;

		    // Check if the player has a wanted level of 2 or higher
			if (GetPlayerWantedLevel(playerid) >= 2)
				SetPlayerWantedLevel(playerid, GetPlayerWantedLevel(playerid) - 2); // Reduce the wanted level by 2
			else
				SetPlayerWantedLevel(playerid, 0); // If the player has a wanted level of less than 2, reset the wanted level to 0
		}
	}

	return 1;
}

// ************************************************************************************************************************************************************
// PPC_MissionsBus
// ************************************************************************************************************************************************************

// Setup a custom type that holds all data about a bus route
enum TBusRoute
{
	HomeDepot, // The ID of the home-depot
	LineNumber, // The number of the busroute
	Score, // Determines the score the player gets when he reaches the end of the busroute
	RouteDescription[100], // The description of the busroute
	Locations[30] // The Location-IDs where the player must load/unload passengers (up to 30 busstops per route)
}

// Setup an array that holds all busroute data
new ABusRoutes[][TBusRoute] =
{
	// HomeDepot, LineNumber, array of BusLocations (location "-1" states the end of the route -> start over from the first location)
	{64, 301, 2, "Las Barrancas - Bayside", {108, 107, 105, 103, 104, 108, -1}},
	{64, 302, 2, "Bayside - Las Payasdas", {103, 104, 106, 109, 105, 103, -1}},
	{64, 303, 2, "Fort Carson - El Quebrados", {112, 108, 105, 106, 108, 111, 112, -1}},
	{64, 401, 2, "Palomino Creek - Dillimore", {116, 117, 120, 118, 115, 116, -1}}
};



// Forward the function to Load or Unload passengers during missions (used by a timer)
forward BusDriver_LoadUnload(playerid, PassengersOnBusStop);



// This function is called when a busdriver enters a checkpoint
Bus_EnterRaceCheckpoint(playerid)
{
	// Check if the player is inside his vehicle while entering a checkpoint
	if (GetPlayerVehicleID(playerid) == APlayerData[playerid][VehicleID])
	{
		// Setup local variables
		new LineNr, Description[100], PassengersOnBus, PassengersOnBusStop, Job, RouteText[255];

		// Show that the player is loading and unloading passengers
	//	GameTextForPlayer(playerid, "Loading/unloading passengers... Please wait", 5000, 4);

		// Disable the player's actions (he cannot move anymore)
		TogglePlayerControllable(playerid, 0);

		// Get the JobID
		Job = APlayerData[playerid][JobID];
		// Get the data to construct the textdraw
		LineNr = ABusRoutes[Job][LineNumber];
		format(Description, 100, "%s", ABusRoutes[Job][RouteDescription]);
		PassengersOnBus = APlayerData[playerid][Passengers];
		// Determine a random number of passengers on the busstop (between 10 and 30 passengers can be waiting at the busstop)
		PassengersOnBusStop = random(20) + 10;
		// Limit the number of passengers to 100
	//	if ((APlayerData[playerid][Passengers] + PassengersOnBusStop) > 100)
	//	    PassengersOnBusStop = 100 - APlayerData[playerid][Passengers];

		// Combine it all into a string for the TextDraw (the player can see this all the time) to describe the mission
		format(RouteText, 255, TXT_BusDriverBusStopInfo, LineNr, Description, PassengersOnBus, PassengersOnBusStop);
		// Set the TextDraw so the player can see it
		TextDrawSetString(APlayerData[playerid][MissionText], RouteText);

		// Start a timer (Public function "BusDriver_LoadUnload(playerid)" gets called when the timer runs out)
		APlayerData[playerid][LoadingTimer] = SetTimerEx("BusDriver_LoadUnload", 5000, false, "di" , playerid, PassengersOnBusStop);
	}

	return 1;
}

// After a truckdriver entered a checkpoint, a timer is created. This function is called when the timer runs out
public BusDriver_LoadUnload(playerid, PassengersOnBusStop)
{
    // Setup local variables
	new RouteText[255], Float:x, Float:y, Float:z, Job, NextLoc, NextStep, Depot, Msg[128];
	new PassengersOnBus, PassengersGettingOff, LineNr, Description[100], Payment;
	new Float:xn, Float: yn, Float:zn;

	// Also delete any race-checkpoint (at the location of the homedepot)
	DisablePlayerCheckpoint(playerid);
	// Delete the checkpoint where the player just loaded/unloaded passengers
	DisablePlayerRaceCheckpoint(playerid);

	// Get the JobID
	Job = APlayerData[playerid][JobID];
	// Select the next location (jobstep)
	APlayerData[playerid][JobStep]++;
	NextStep = APlayerData[playerid][JobStep];
	// Determine a random number of passengers leaving the bus and let them leave (if there are any)
	if (APlayerData[playerid][Passengers] > 0)
		PassengersGettingOff = random(APlayerData[playerid][Passengers]);
	APlayerData[playerid][Passengers] = APlayerData[playerid][Passengers] - PassengersGettingOff;
	// Also let the passengers, that are waiting at the busstop, get on the bus
	APlayerData[playerid][Passengers] = APlayerData[playerid][Passengers] + PassengersOnBusStop;

	// Grab the next locationID
	NextLoc = ABusRoutes[Job][Locations][NextStep];
	// If the end of the route is reached, restart it from location 0 (also add a racecheckpoint at the busdepot to end the mission)
	if (NextLoc == -1)
	{
	    // Setup local variables
		new MissionMsg[128], Name[24];

		// Get the player name
		GetPlayerName(playerid, Name, sizeof(Name));
		// Construct the message sent to all players that this player completed a mafia mission
		format(MissionMsg, 128, TXT_PlayerCompletedBusLine, Name, ABusRoutes[Job][LineNumber]);
		SendClientMessageToAll(0xFFFFFFFF, MissionMsg);



	    // Start the route again from the first location
	    NextStep = 1;
	    APlayerData[playerid][JobStep] = NextStep;
		// Grab the locationID of this busstop
		NextLoc = ABusRoutes[Job][Locations][NextStep];

		// Get the homedepot locationID
		Depot = ABusRoutes[Job][HomeDepot];
		// Grab the coordinates of the homedepot
		x = ALocations[Depot][LocX];
		y = ALocations[Depot][LocY];
		z = ALocations[Depot][LocZ];
		// Create a checkpoint at the coordinates of the homedepot
		SetPlayerCheckpoint(playerid, x, y, z, 7);
		// Reward the player with a score for completing a busroute
		RewardPlayer(playerid, 0, ABusRoutes[Job][Score]);

		// Increase the stats for completing a bus-route
		APlayerData[playerid][StatsBusDriverJobs]++;
		// Also save the data (in case the server crashes, progress would be lost)
		PlayerFile_Save(playerid);
	}

	// Get the data to construct the textdraw
	LineNr = ABusRoutes[Job][LineNumber];
	format(Description, 100, "%s", ABusRoutes[Job][RouteDescription]);
	PassengersOnBus = APlayerData[playerid][Passengers];
	// Combine it all into a string for the TextDraw (the player can see this all the time) to describe the mission
	format(RouteText, 255, TXT_BusDriverJobInfo, LineNr, Description, PassengersOnBus);
	// Set the TextDraw so the player can see it
	TextDrawSetString(APlayerData[playerid][MissionText], RouteText);

	// Grab the coordinates of the next location
	x = ALocations[NextLoc][LocX];
	y = ALocations[NextLoc][LocY];
	z = ALocations[NextLoc][LocZ];
	// Create a new checkpoint where the player should load/unload the passengers
	SetPlayerRaceCheckpoint(playerid, 2, x, y, z, xn, yn, zn, 7);

    // Enable the player again (he can move again)
	TogglePlayerControllable(playerid, 1);

	// Reward the player (every passengers that left the bus pays $9) and let him know about it
	if (PassengersGettingOff != 0)
	{
		// Reward the player (give cash and points)
		Payment = PassengersGettingOff * 9;
		RewardPlayer(playerid, Payment, 0);
		format(Msg, 128, TXT_BusDriverReward, Payment);
		GameTextForPlayer(playerid, Msg, 3000, 4);
	}

	return 1;
}



// This function starts the busdriver job
BusDriver_StartJob(playerid, Job)
{
	new Vehicle = GetPlayerVehicleID(playerid), StartLoc;
	new Float:xn, Float: yn, Float:zn;

    // Setup local variables
	new RouteText[255], Float:x, Float:y, Float:z, LineNr, Description[100], PassengersOnBus;

	// Job has started
	APlayerData[playerid][JobStarted] = true;
	// Store VehicleID
	APlayerData[playerid][VehicleID] = Vehicle;
	// Store the busroute busroute
	APlayerData[playerid][JobID] = Job;
	// Set jobstep to 0 (going to the first busstop)
	APlayerData[playerid][JobStep] = 0;

	// Get the data to construct the textdraw
	LineNr = ABusRoutes[Job][LineNumber];
	format(Description, 100, "%s", ABusRoutes[Job][RouteDescription]);
	PassengersOnBus = 0;
	APlayerData[playerid][Passengers] = PassengersOnBus;
	// Combine it all into a string for the TextDraw (the player can see this all the time) to describe the mission
	format(RouteText, 255, TXT_BusDriverJobInfo, LineNr, Description, PassengersOnBus);
	// Set the TextDraw so the player can see it
	TextDrawSetString(APlayerData[playerid][MissionText], RouteText);
	// Grab the x, y, z positions for the first location
	StartLoc = ABusRoutes[Job][Locations][0];
	x = ALocations[StartLoc][LocX];
	y = ALocations[StartLoc][LocY];
	z = ALocations[StartLoc][LocZ];
	// Create a race-checkpoint where the player should load/unload passengers
	SetPlayerRaceCheckpoint(playerid, 2, x, y, z, xn, yn, zn, 7);
	// Set the job-fail-time for the global vehicle-timer
	APlayerData[playerid][VehicleTimerTime] = Job_TimeToFailMission;

	return 1;
}

// This function is used to cleanup the current job
BusDriver_EndJob(playerid)
{
	if (APlayerData[playerid][JobStarted] == true)
	{
		// Clear all data about the job from the player, so he can start a new one
		APlayerData[playerid][JobStarted] = false;
		APlayerData[playerid][JobStep] = 0;
		APlayerData[playerid][JobID] = 0;
		APlayerData[playerid][Passengers] = 0;
		APlayerData[playerid][VehicleTimerTime] = 0;
		APlayerData[playerid][VehicleID] = 0;

		// Delete the checkpoint
		DisablePlayerCheckpoint(playerid);
		// Also delete any race-checkpoint (at the location of the homedepot)
		DisablePlayerRaceCheckpoint(playerid);
		// Reset the missiontext
		TextDrawSetString(APlayerData[playerid][MissionText], BusDriver_NoJobText);
	}

	return 1;
}

// ************************************************************************************************************************************************************
// PPC_MissionsPilot
// ************************************************************************************************************************************************************

// Forward the public function used as a timer to load/unload your vehicle
forward Pilot_Plane_LoadUnload(playerid);



// This function is called when a pilot wants to start a job by entering "/work"
Pilot_StartRandomJob(playerid)
{
	// Setup local variables
	new PilotJobSet;

	// Check the vehicle-model of the player to decide which job the player can get
	switch (GetVehicleModel(GetPlayerVehicleID(playerid)))
	{
		case VehicleShamal, VehicleNevada: // Select a random job for planes
			PilotJobSet = Pilot_Plane_SetRandomJob(playerid);
		case VehicleMaverick, VehicleCargobob: // Select a random job for helicopters
		    PilotJobSet = Pilot_Heli_SetRandomJob(playerid);
	}

	// Check if a job was set correctly
	switch (PilotJobSet)
	{
		case 1, 2:
		{
		    // Setup local variables
			new StartLoc[50], EndLoc[50], Load[50], RouteText[255], Float:x, Float:y, Float:z, LoadMsg[128];

			// Job has started
			APlayerData[playerid][JobStarted] = true;

			// Set jobstep to 1 (going to load the goods)
			APlayerData[playerid][JobStep] = 1;
			// Get the startlocation, endlocation and the load texts
			format(StartLoc, 50, ALocations[APlayerData[playerid][JobLoc1]][LocationName]);
			format(EndLoc, 50, ALocations[APlayerData[playerid][JobLoc2]][LocationName]);
			format(Load, 50, ALoads[APlayerData[playerid][LoadID]][LoadName]);
			// Combine it all into a string for the TextDraw (the player can see this all the time) to describe the mission
			format(RouteText, 255, TXT_TransportingFromToPickup, Load, StartLoc, EndLoc);
			// Set the TextDraw so the player can see it
			TextDrawSetString(APlayerData[playerid][MissionText], RouteText);
			// Grab the x, y, z positions for the first location
			x = ALocations[APlayerData[playerid][JobLoc1]][LocX];
			y = ALocations[APlayerData[playerid][JobLoc1]][LocY];
			z = ALocations[APlayerData[playerid][JobLoc1]][LocZ];
			// Create a checkpoint where the player should load the goods
			SetPlayerCheckpoint(playerid, x, y, z, 7);
			// Inform the player that he must load his goods
			format(LoadMsg, 128, TXT_PickupCargoAt, Load, StartLoc);
			SendClientMessage(playerid, 0xFFFFFFFF, LoadMsg);
		}
	}

	return 1;
}

// This function sets a random job for a plane vehicle and returns 1 if a job has been set
// The function returns 0 if a job couldn't be set (if the player is driving an invalid vehicle to start piloting-jobs)
Pilot_Plane_SetRandomJob(playerid)
{
	// If the player is the driver of the vehicle (GetPlayerVehicleSeat returns -1 if the player is not in a vehicle)
	if (GetPlayerVehicleSeat(playerid) == 0)
	{
		// Check the vehicle-model of the player to decide which job the player can get
		switch (GetVehicleModel(GetPlayerVehicleID(playerid)))
		{
			case VehicleShamal, VehicleNevada:
			{
				// Get a random LoadID from the pilot-products (only the planes)
				APlayerData[playerid][LoadID] = Product_GetRandom(PCV_PilotPlane);
				// Also get a random start-location and end-location
				APlayerData[playerid][JobLoc1] = Product_GetRandomStartLoc(APlayerData[playerid][LoadID]);
				APlayerData[playerid][JobLoc2] = Product_GetRandomEndLoc(APlayerData[playerid][LoadID]);

				// Make sure the destination is not closeby (pilot-locations are ALL includes in the array)
				while (Locations_CheckDistance(APlayerData[playerid][JobLoc1], APlayerData[playerid][JobLoc2], 1000.0) == 0)
				{
				    // If both locations are too close together, keep searching for a random delivery-location that's further away
				    APlayerData[playerid][JobLoc2] = Product_GetRandomEndLoc(APlayerData[playerid][LoadID]);
				}

				// Return 1 to indicate that a job has been set correctly
				return 1;
			}
		}
	}

	// If no job could be set correctly, return 0
	return 0;
}

// This function sets a random job for a helicopter vehicle and returns 2 if a job has been set
// The function returns 0 if a job couldn't be set (if the player is driving an invalid vehicle to start piloting-jobs)
Pilot_Heli_SetRandomJob(playerid)
{
	// If the player is the driver of the vehicle (GetPlayerVehicleSeat returns -1 if the player is not in a vehicle)
	if (GetPlayerVehicleSeat(playerid) == 0)
	{
		// Check the vehicle-model of the player to decide which job the player can get
		switch (GetVehicleModel(GetPlayerVehicleID(playerid)))
		{
			case VehicleMaverick, VehicleCargobob:
			{
				// Get a random LoadID from the pilot-products (only the helicopters)
				APlayerData[playerid][LoadID] = Product_GetRandom(PCV_PilotHelicopter);
				// Also get a random start-location and end-location
				APlayerData[playerid][JobLoc1] = Product_GetRandomStartLoc(APlayerData[playerid][LoadID]);
				APlayerData[playerid][JobLoc2] = Product_GetRandomEndLoc(APlayerData[playerid][LoadID]);

				// Make sure the destination is not closeby (pilot-locations are ALL includes in the array)
				while (Locations_CheckDistance(APlayerData[playerid][JobLoc1], APlayerData[playerid][JobLoc2], 1000.0) == 0)
				{
				    // If both locations are too close together, keep searching for a random delivery-location that's further away
				    APlayerData[playerid][JobLoc2] = Product_GetRandomEndLoc(APlayerData[playerid][LoadID]);
				}

				// Return 2 to indicate that a job has been set correctly
				return 2;
			}
		}
	}

	// If no job could be set correctly, return 0
	return 0;
}



// This function is called when a pilot enters a checkpoint
Pilot_OnPlayerEnterCheckpoint(playerid)
{
	new LoadMsg[128];

    // Check the jobstep
    switch (APlayerData[playerid][JobStep])
    {
		// JobStep is 1 (pilot is loading his goods at the checkpoint)
 		case 1: format(LoadMsg, 128, TXT_LoadingGoods, ALoads[APlayerData[playerid][LoadID]][LoadName]);
		// JobStep is 2 (pilot is unloading his goods at the checkpoint)
		case 2: format(LoadMsg, 128, TXT_UnloadingGoods, ALoads[APlayerData[playerid][LoadID]][LoadName]);
    }

	// Disable the player's actions (he cannot move anymore)
	TogglePlayerControllable(playerid, 0);

	// Check the vehiclemodel of the player
	new vehicleid = GetPlayerVehicleID(playerid);
	switch (GetVehicleModel(vehicleid))
	{
	    case VehicleShamal, VehicleNevada: // A plane needs 5 seconds to load/unload
		{
			// Show the message to inform him what he's doing (loading/unloading)
			GameTextForPlayer(playerid, LoadMsg, 5000, 5);
			// Start a timer (Public function "LoadUnload(playerid)" gets called when the timer runs out)
			APlayerData[playerid][LoadingTimer] = SetTimerEx("Pilot_Plane_LoadUnload", 5000, false, "d" , playerid);
		}
	    case VehicleMaverick, VehicleCargobob: // A helicopter only needs 3 seconds to load/unload
	    {
			// Show the message to inform him what he's doing (loading/unloading)
			GameTextForPlayer(playerid, LoadMsg, 3000, 3);
			// Start a timer (Public function "LoadUnload(playerid)" gets called when the timer runs out)
			APlayerData[playerid][LoadingTimer] = SetTimerEx("Pilot_Plane_LoadUnload", 3000, false, "d" , playerid);
			// When in a helicopter, turn off the engine so the helicopter lands and doesn't drift away with the wind
			new engine,lights,alarm,doors,bonnet,boot,objective;
			GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
			SetVehicleParamsEx(vehicleid, 0, lights, alarm, doors, bonnet, boot, objective);
	    }
	}

	return 1;
}



// After a pilot entered a checkpoint, a timer is created. This function is called when the timer runs out
public Pilot_Plane_LoadUnload(playerid)
{
	// Check the JobStep
	switch (APlayerData[playerid][JobStep])
	{
		case 1: // Player must load his goods
		{
		    // Setup local variables
			new StartLoc[50], EndLoc[50], Load[50], RouteText[255], Float:x, Float:y, Float:z, UnloadMsg[100];
			// Set JobStep to 2 (unloading goods)
			APlayerData[playerid][JobStep] = 2;
			// Delete the loading-checkpoint
			DisablePlayerCheckpoint(playerid);
			// Get the startlocation, endlocation and the load texts
			format(StartLoc, 50, ALocations[APlayerData[playerid][JobLoc1]][LocationName]);
			format(EndLoc, 50, ALocations[APlayerData[playerid][JobLoc2]][LocationName]);
			format(Load, 50, ALoads[APlayerData[playerid][LoadID]][LoadName]);

			// Update the missiontext
			format(RouteText, 255, TXT_TransportingFromToDeliver, Load, StartLoc, EndLoc);
			// Set the TextDraw so the player can see it
			TextDrawSetString(APlayerData[playerid][MissionText], RouteText);

			// Grab the x, y, z positions for the second location (to unload the goods)
			x = ALocations[APlayerData[playerid][JobLoc2]][LocX];
			y = ALocations[APlayerData[playerid][JobLoc2]][LocY];
			z = ALocations[APlayerData[playerid][JobLoc2]][LocZ];
			// Create a checkpoint where the player should unload the goods
			SetPlayerCheckpoint(playerid, x, y, z, 7);
			// Inform the player that he must unload his goods
			format(UnloadMsg, 100, TXT_DeliverCargoTo, Load, EndLoc);
			SendClientMessage(playerid, 0xFFFFFFFF, UnloadMsg);
		}
		case 2: // Player is delivering his goods
		{
		    // Setup local variables
			new StartLoc[50], EndLoc[50], Load[50], Msg1[128], Msg2[128], Name[24];

			// Get the player name
			GetPlayerName(playerid, Name, sizeof(Name));
			// Get the startlocation, endlocation and the load texts
			format(StartLoc, 50, ALocations[APlayerData[playerid][JobLoc1]][LocationName]);
			format(EndLoc, 50, ALocations[APlayerData[playerid][JobLoc2]][LocationName]);
			format(Load, 50, ALoads[APlayerData[playerid][LoadID]][LoadName]);

			// Construct the message sent to all players that this player completed a pilot mission
			format(Msg1, 128, TXT_PlayerCompletedPilotJob, Name, Load);
			format(Msg2, 128, TXT_PlayerCompletedPilotJobInfo, StartLoc, EndLoc);
			SendClientMessageToAll(0xFFFFFFFF, Msg1);
			SendClientMessageToAll(0xFFFFFFFF, Msg2);



		    // Setup local variables
			new Float:x1, Float:y1, Float:x2, Float:y2, Float:Distance, Message[128], Payment;
			// Grab the x, y, z positions for the first location (to load the goods)
			x1 = ALocations[APlayerData[playerid][JobLoc1]][LocX];
			y1 = ALocations[APlayerData[playerid][JobLoc1]][LocY];
			// Grab the x, y, z positions for the second location (to unload the goods)
			x2 = ALocations[APlayerData[playerid][JobLoc2]][LocX];
			y2 = ALocations[APlayerData[playerid][JobLoc2]][LocY];
			// Calculate the distance between both points
			Distance = floatsqroot(((x2 - x1) * (x2 - x1)) + ((y2 - y1) * (y2 - y1)));

			// Calculate the payment for the player
			Payment = floatround((Distance * ALoads[APlayerData[playerid][LoadID]][PayPerUnit]), floatround_floor);
			// Pay the player based on the distance between the loading-point and unloading-point
			RewardPlayer(playerid, Payment, 1);

			// Send a message to let the player know he finished his mission and got paid
			format(Message, 128, TXT_RewardJob, Payment);
			SendClientMessage(playerid, 0xFFFFFFFF, Message);

			// Increase the stats for completing a pilot job
			APlayerData[playerid][StatsPilotJobs]++;
			// Also save the data (in case the server crashes, progress would be lost)
			PlayerFile_Save(playerid);

			// End the current pilot job (clear mission-data)
			Pilot_EndJob(playerid);
		}
	}

    // Enable the player again (he can move again)
	TogglePlayerControllable(playerid, 1);
	// Start the engine again (in case the vehicle was a helicopter, where the engine was turned off by entering a checkpoint)
	new vehicleid = GetPlayerVehicleID(playerid);
	new engine,lights,alarm,doors,bonnet,boot,objective;
	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
	SetVehicleParamsEx(vehicleid, 1, lights, alarm, doors, bonnet, boot, objective);

	return 1;
}



// This function is used to cleanup the current job
Pilot_EndJob(playerid)
{
	// Check if a job has started
	if (APlayerData[playerid][JobStarted] == true)
	{
		// Clear all data about the job from the player, so he can start a new one
		APlayerData[playerid][JobStarted] = false;
		APlayerData[playerid][JobStep] = 0;
		APlayerData[playerid][LoadID] = 0;
		APlayerData[playerid][JobLoc1] = 0;
		APlayerData[playerid][JobLoc2] = 0;

		// Delete the checkpoint
		DisablePlayerCheckpoint(playerid);
		// Reset the missiontext
		TextDrawSetString(APlayerData[playerid][MissionText], Pilot_NoJobText);
		// Kill the LoadingTimer
		KillTimer(APlayerData[playerid][LoadingTimer]);
	}

	return 1;
}

// ************************************************************************************************************************************************************
// PPC_MissionsPolice
// ************************************************************************************************************************************************************

// Forward the function to timer to check players every second to see if they're wanted
forward Police_CheckWantedPlayers(playerid);
forward UnjailPlayer(playerid);



// This timer is created every time a player changes his class to police
public Police_CheckWantedPlayers(playerid)
{
	// Scan through all players
	for (new PlayerToCheck; PlayerToCheck < MAX_PLAYERS; PlayerToCheck++)
	{
		// check if this player is connected
		if (IsPlayerConnected(PlayerToCheck))
		{
			//Check if that player is wanted
			if (GetPlayerWantedLevel(PlayerToCheck) > 0)
			    SetPlayerMarkerForPlayer(playerid, PlayerToCheck, 0xFF0000FF); // Make that player red to the police-player
			else
			{
				// Reset the playercolor based on the player's class
			    switch (APlayerData[PlayerToCheck][PlayerClass])
			    {
			        case ClassTruckDriver: SetPlayerMarkerForPlayer(playerid, PlayerToCheck, ColorClassTruckDriver);
			        case ClassBusDriver: SetPlayerMarkerForPlayer(playerid, PlayerToCheck, ColorClassBusDriver);
			        case ClassPilot: SetPlayerMarkerForPlayer(playerid, PlayerToCheck, ColorClassPilot);
			        case ClassPolice: SetPlayerMarkerForPlayer(playerid, PlayerToCheck, ColorClassPolice);
			        case ClassMafia: SetPlayerMarkerForPlayer(playerid, PlayerToCheck, ColorClassMafia);
			        case ClassCourier: SetPlayerMarkerForPlayer(playerid, PlayerToCheck, ColorClassCourier);
			        case ClassAssistance: SetPlayerMarkerForPlayer(playerid, PlayerToCheck, ColorClassAssistance);
			    }
			}
		}
	}
}

// This function gets called when a police player presses the SECUNDAIRY FIRE button (to warn nearby wanted players)
Police_WarnNearbyPlayers(playerid)
{
	// Setup local variables
	new Float:x, Float:y, Float:z, Name[24], Msg[128];

	// Scan through all players
	for (new PlayerToCheck; PlayerToCheck < MAX_PLAYERS; PlayerToCheck++)
	{
		// check if this player is connected
		if (IsPlayerConnected(PlayerToCheck))
		{
			// Check if the current player is wanted
			if (GetPlayerWantedLevel(PlayerToCheck) > 0)
			{
			    // Get the position of this player
			    GetPlayerPos(PlayerToCheck, x, y, z);
			    // Check if the police-player is in range of the player
				if (IsPlayerInRangeOfPoint(playerid, 50.0, x, y, z))
				{
					GameTextForPlayer(PlayerToCheck, TXT_PoliceWarnPlayer, 3000, 4); // Warn the player
					// Also start a timer which gives the player a chance to stop and get a fine
					// If he doesn't stop, the player will be sent to jail when he gets fined
					if (APlayerData[PlayerToCheck][PoliceWarnedMe] == false)
					{
					    APlayerData[PlayerToCheck][PoliceWarnedMe] = true;
						APlayerData[PlayerToCheck][Value_PoliceCanJailMe] = 60;
						APlayerData[PlayerToCheck][Timer_PoliceCanJailMe] = SetTimerEx("Timer_PoliceCanJailPlayer", 5000, true, "i", PlayerToCheck);
					}

					// Let the police player know that he warned the player
					GetPlayerName(PlayerToCheck, Name, sizeof(Name));
					format(Msg, 128, "{00FF00}You've warned {FFFF00}%s", Name);
					SendClientMessage(playerid, 0xFFFFFFFF, Msg);
				}
			}
		}
	}

	return 1;
}

// This function gets called when a police player presses the FIRE key (to fine nearby wanted players) when he's on foot
Police_FineNearbyPlayers(playerid)
{
	// Setup local variables
	new Float:x, Float:y, Float:z;

	// Scan through all players
	for (new PlayerToCheck; PlayerToCheck < MAX_PLAYERS; PlayerToCheck++)
	{
		// check if this player is connected
		if (IsPlayerConnected(PlayerToCheck))
		{
			// Check if the other player isn't the same police player
			if (PlayerToCheck != playerid)
			{
				// Check if the current player is wanted and the wanted player is driving slowly (below 30 kph)
				if ((GetPlayerWantedLevel(PlayerToCheck) > 0) && (APlayerData[PlayerToCheck][PlayerSpeed] < 30))
				{
				    // Get the position of this player
				    GetPlayerPos(PlayerToCheck, x, y, z);

				    // Check if the police-player is in range of the player (police player and wanted player must be within 10 meters of eachother)
					if (IsPlayerInRangeOfPoint(playerid, 10.0, x, y, z))
					{
					    // Fine the player
						Police_PayFine(playerid, PlayerToCheck);

						// Exit the function
						return 1;
					}

					// Check if the police-player is in range of the player (he can be inside his vehicle or on foot)
					if (IsPlayerInRangeOfPoint(playerid, 50.0, x, y, z))
					{
						GameTextForPlayer(PlayerToCheck, TXT_PoliceWarnPlayer, 3000, 4); // Warn the player
						// Also start a timer which gives the player a chance to stop and get a fine
						// If he doesn't stop, the player will be sent to jail when he gets fined
						if (APlayerData[PlayerToCheck][PoliceWarnedMe] == false)
						{
						    APlayerData[PlayerToCheck][PoliceWarnedMe] = true;
							APlayerData[PlayerToCheck][Value_PoliceCanJailMe] = DefaultWarnTimeBeforeJail;
							APlayerData[PlayerToCheck][Timer_PoliceCanJailMe] = SetTimerEx("Timer_PoliceCanJailPlayer", 5000, true, "i", PlayerToCheck);
						}
					}
				}
			}
		}
	}

	return 1;
}

// Pay the police player and fine the player
Police_PayFine(playerid, PlayerToFine)
{
	// Setup local variables
	new PoliceName[24], FinedPlayerName[24], PoliceMsg[200], PlayerMsg[200], JailTime, Fine;

	// Get the names of the police player and the wanted player
	GetPlayerName(playerid, PoliceName, 24);
	GetPlayerName(PlayerToFine, FinedPlayerName, 24);

	// Check if the wanted player's timer hasn't ran out yet
	if (APlayerData[PlayerToFine][PoliceCanJailMe] == false)
	{
		// Calculate the fine
		Fine = GetPlayerWantedLevel(PlayerToFine) * DefaultFinePerStar;
		// Reward the police player (give cash and points)
		RewardPlayer(playerid, Fine, GetPlayerWantedLevel(PlayerToFine));
		// Let the police player know that he fined the player
		format(PoliceMsg, 200, TXT_PoliceFinedPlayerReward, FinedPlayerName, Fine);
		SendClientMessage(playerid, 0xFFFFFFFF, PoliceMsg);
		// Let the wanted player pay the fine
		RewardPlayer(PlayerToFine, -Fine, 0);
		format(PlayerMsg, 200, TXT_PlayerGotFinedByPolice, PoliceName, Fine);
		SendClientMessage(PlayerToFine, 0xFFFFFFFF, PlayerMsg);
		// Let the other players know that the police player has fined the wanted player
		format(PoliceMsg, 200, TXT_PoliceFinedPlayer, PoliceName, FinedPlayerName);
		SendClientMessageToAll(0xFFFFFFFF, PoliceMsg);
		// Increase the stats for fining a player
		APlayerData[playerid][StatsPoliceFined]++;
	}
	else // The wanted player didn't pull over, now the police player has the right to send him to jail and double the fine
	{
	    // Set jailtime
	    JailTime = DefaultJailTime;
		// Calculate the fine (double the normal fine)
		Fine = GetPlayerWantedLevel(PlayerToFine) * DefaultFinePerStar * 2;
		// Reward the police player (give cash and points)
		RewardPlayer(playerid, Fine, GetPlayerWantedLevel(PlayerToFine));
		// Let the police player know that he jailed the wanted player
		format(PoliceMsg, 200, TXT_PoliceJailedPlayerReward, FinedPlayerName, Fine);
		SendClientMessage(playerid, 0xFFFFFFFF, PoliceMsg);
		// Let the wanted player pay a double fine
		RewardPlayer(PlayerToFine, -Fine, 0);
		// Let the player know he's been jailed and for how long
		format(PlayerMsg, 200, TXT_PlayerGotJailedByPolice, PoliceName, (JailTime / 60));
		SendClientMessage(PlayerToFine, 0xFFFFFFFF, PlayerMsg);
		// Let the other players know that the police player has jailed the wanted player
		format(PoliceMsg, 200, TXT_PoliceJailedPlayer, PoliceName, FinedPlayerName, (JailTime / 60));
		SendClientMessageToAll(0xFFFFFFFF, PoliceMsg);
		// Teleport the player to jail
		Police_JailPlayer(PlayerToFine, JailTime);
		// Increase the stats for jailing a player
		APlayerData[playerid][StatsPoliceJailed]++;
	}

	// Clear the wanted player's wanted status (the speedometer will automatically clear all data and kill the timer)
	SetPlayerWantedLevel(PlayerToFine, 0);

	// Also save the data (in case the server crashes, progress would be lost)
	PlayerFile_Save(playerid);
	PlayerFile_Save(PlayerToFine);

	return 1;
}

// This function ports the player inside the jail and sets a timer to get him back out
Police_JailPlayer(playerid, JailTime)
{
	// First remove the player from his vehicle
	RemovePlayerFromVehicle(playerid);
	// Set the player in the virtual world of the jail (so other players cannot see the jailed players on their radar)
	SetPlayerVirtualWorld(playerid, WORLD_JAIL);
	// Set player interior to the police station in San Fierro
	SetPlayerInterior(playerid, 10);
	// Put the player inside the jail
	SetPlayerPos(playerid, 220.0, 110.0, 999.1);

	// Store the jailtime for this player
	APlayerData[playerid][PlayerJailed] = JailTime;
	// Start the jailtimer, which checks every second if the player is allowed to get out
	KillTimer(APlayerData[playerid][PlayerJailedTimer]);
	APlayerData[playerid][PlayerJailedTimer] = SetTimerEx("UnjailPlayer", 1000, true, "i", playerid);

	// If the player started a job, let it fail
	if (APlayerData[playerid][JobStarted] == true)
	{
		// Stop any job that may have started
		switch (APlayerData[playerid][PlayerClass])
		{
			case ClassTruckDriver: Trucker_EndJob(playerid);
			case ClassBusDriver: BusDriver_EndJob(playerid);
			case ClassPilot: Pilot_EndJob(playerid);
			case ClassPolice: Police_EndJob(playerid);
			case ClassMafia: Mafia_EndJob(playerid);
			case ClassCourier: Courier_EndJob(playerid);
			case ClassAssistance: Assistance_EndJob(playerid);
		}

		// Inform the player that he failed the mission
		GameTextForPlayer(playerid, TXT_FailedMission, 5000, 4);
		// Reduce the player's cash by 1000
		RewardPlayer(playerid, -1000, 0);
	}

	return 1;
}

// This is the timer that runs for every player who's in jail
public UnjailPlayer(playerid)
{
	new JailMsg[50];

	// Check if the player is allowed to leave yet
	if (APlayerData[playerid][PlayerJailed] == 0)
	{
		// Set the player in the normal world
		SetPlayerVirtualWorld(playerid, 0);
		// Set player interior to the outside
		SetPlayerInterior(playerid, 0);
		// Put the player outside the jail (he should spawn at the location where he spawned after login or after choosing a rescue-point)
		SpawnPlayer(playerid);
		// Also, kill the jailtimer
		KillTimer(APlayerData[playerid][PlayerJailedTimer]);
	}
	else
	{
		// Show the remaining jailtime (only if the remaining time is below 60 seconds)
		if (APlayerData[playerid][PlayerJailed] < 60)
		{
			format(JailMsg, 50, TXT_JailTimer, APlayerData[playerid][PlayerJailed]);
			GameTextForPlayer(playerid, JailMsg, 750, 4);
		}
		// Decrease the jailtime by 1 second
        APlayerData[playerid][PlayerJailed] = APlayerData[playerid][PlayerJailed] - 1;
	}
}

// This function gets called when the police player dies (or changes class)
Police_EndJob(playerid)
{
	// Kill the PlayerCheckTimer
	KillTimer(APlayerData[playerid][PlayerCheckTimer]);

	// Scan through all players (to reset them to their default colors for the police-player)
	for (new PlayerToCheck; PlayerToCheck < MAX_PLAYERS; PlayerToCheck++)
	{
		// check if this player is connected
		if (IsPlayerConnected(PlayerToCheck))
		{
			// Reset the playercolor based on the player's class
		    switch (APlayerData[PlayerToCheck][PlayerClass])
		    {
		        case ClassTruckDriver: SetPlayerMarkerForPlayer(playerid, PlayerToCheck, ColorClassTruckDriver);
		        case ClassBusDriver: SetPlayerMarkerForPlayer(playerid, PlayerToCheck, ColorClassBusDriver);
		        case ClassPilot: SetPlayerMarkerForPlayer(playerid, PlayerToCheck, ColorClassPilot);
		        case ClassPolice: SetPlayerMarkerForPlayer(playerid, PlayerToCheck, ColorClassPolice);
		        case ClassMafia: SetPlayerMarkerForPlayer(playerid, PlayerToCheck, ColorClassMafia);
		        case ClassCourier: SetPlayerMarkerForPlayer(playerid, PlayerToCheck, ColorClassCourier);
		        case ClassAssistance: SetPlayerMarkerForPlayer(playerid, PlayerToCheck, ColorClassAssistance);
		    }
		}
	}

	return 1;
}

// This timer is started when a wanted player was warned by a police player
forward Timer_PoliceCanJailPlayer(playerid);
public Timer_PoliceCanJailPlayer(playerid)
{
	// Setup local variables
	new Msg[128];

	// Let the player know how much time he has left to pull over
	format(Msg, 128, "{FF0000}%i saniye içinde aracýnýzý saða çekin", APlayerData[playerid][Value_PoliceCanJailMe]);
	SendClientMessage(playerid, 0xFFFFFFFF, Msg);

	// Check if the timer has ran out
	if (APlayerData[playerid][Value_PoliceCanJailMe] == 0)
	{
	    // Set a switch that indicates that this player didn't stop when he got the warning from the police player
	    // When the police can catch him now, he'll be sent to jail and the fine is doubled
	    APlayerData[playerid][PoliceCanJailMe] = true;
		// Also kill the timer, as it's not needed anymore
		KillTimer(APlayerData[playerid][Timer_PoliceCanJailMe]);
		// Let the player know what consequences it will have by not stopping
		format(Msg, 128, "{FF0000}Aracýnýzý zamanýnda saða çekmediniz, þimdi polis sizi hapse gönderdi");
		SendClientMessage(playerid, 0xFFFFFFFF, Msg);
		format(Msg, 128, "{FF0000}Cezanýz iki katýna çýktý");
		SendClientMessage(playerid, 0xFFFFFFFF, Msg);
	}

	// Reduce the remaining time by 5 seconds
	APlayerData[playerid][Value_PoliceCanJailMe] = APlayerData[playerid][Value_PoliceCanJailMe] - 5;

	return 1;
}

// This function creates a spikestrip when the player is standing
SpikeStrip_Create(playerid)
{
	// Setup local variables
	new StripIndex = -1, Float:x, Float:y, Float:z, Float:rot;

	// Check if a spikestrip can be created
	for (new i; i < MAX_SPIKESTRIPS; i++)
	{
		if (ASpikeStrips[i][SpikeTime] == 0)
		{
			StripIndex = i;
			break;
		}
	}

	// Check if a free index has been found
	if (StripIndex != -1)
	{
		// Get the position of the player
		GetPlayerPos(playerid, x, y, z);
		GetPlayerFacingAngle(playerid, rot);

		// Create a new spike-strip object at the location of the player and store the coordinates of the spikestrip
		ASpikeStrips[StripIndex][SpikeObject] = CreateObject(2892, x, y, z - 1.0, 0.0, 0.0, rot + 90.0);
		ASpikeStrips[StripIndex][SpikeX] = x;
		ASpikeStrips[StripIndex][SpikeY] = y;
		ASpikeStrips[StripIndex][SpikeZ] = z;
		// Set the time for this timer to 1 minute
		ASpikeStrips[StripIndex][SpikeTime] = 600;
		// Create a timer that checks all players in range to see if they run over the spikestrip
		ASpikeStrips[StripIndex][SpikeTimer] = SetTimerEx("CheckSpikeStrip", 100, true, "i", StripIndex);
		// Let the player know he created a spikestrip
		SendClientMessage(playerid, 0xFFFFFFFF, "{00FF00}Kapan yerleþtirdiniz");
	}
	else
	    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Oluþturulabilecek en fazla kapan oluþturulmuþ, sonra tekrar deneyin.");
}

// This timer checks the spikestrips that have been planted (they automatically disappear after one minute)
forward CheckSpikeStrip(StripIndex);
public CheckSpikeStrip(StripIndex)
{
	// Setup local variables
	new vid, panels, doors, lights, tires;

	// Decrease the time left for the spikestrip
	ASpikeStrips[StripIndex][SpikeTime]--;

	// Check if the spikestrip is still allowed to exist
	if (ASpikeStrips[StripIndex][SpikeTime] > 0)
	{
		// Loop through all players
		for (new playerid; playerid < MAX_PLAYERS; playerid++)
		{
			// Check if the player is connected
			if (APlayerData[playerid][LoggedIn] == true)
			{
				// Check if the player is the driver of a vehicle
				if (GetPlayerVehicleSeat(playerid) == 0)
				{
					// Get the vehicleid
					vid = GetPlayerVehicleID(playerid);
					// Check if the player is near the spikestrip object
					if (IsPlayerInRangeOfPoint(playerid, 7.0, ASpikeStrips[StripIndex][SpikeX], ASpikeStrips[StripIndex][SpikeY], ASpikeStrips[StripIndex][SpikeZ]))
					{
						// Pop all the tires of the player's vehicle
						GetVehicleDamageStatus(vid, panels, doors, lights, tires);
						UpdateVehicleDamageStatus(vid, panels, doors, lights, 15);
					}
				}
			}
		}
	}
	else
	{
		// Kill the timer and destroy the spikestrip object
		DestroyObject(ASpikeStrips[StripIndex][SpikeObject]);
		KillTimer(ASpikeStrips[StripIndex][SpikeTimer]);
	}

	return 1;
}



// This function sends the given message to all police players
Police_SendMessage(PoliceMessage[])
{
	for (new PoliceID; PoliceID < MAX_PLAYERS; PoliceID++) // Loop through all players
		if (APlayerData[PoliceID][LoggedIn] == true) // Check if this player has logged in
		    if (APlayerData[PoliceID][PlayerClass] == ClassPolice) // Check if this player is a police player
				SendClientMessage(PoliceID, 0xFFFFFFFF, PoliceMessage); // Send the message to the police player
}

// ************************************************************************************************************************************************************
// PPC_MissionsMafia
// ************************************************************************************************************************************************************

// Forward the function to timer to check players every second to see if they're carrying a mafia-load
forward Mafia_CheckMafiaLoads(playerid);
// Forward the public function used as a timer to load/unload your vehicle
forward Mafia_LoadUnload(playerid);



// This function is called when a mafia wants to start a job by entering "/work"
Mafia_StartRandomJob(playerid)
{
	if (APlayerData[playerid][JobStarted] == false)
	{
	    // Setup local variables
		new StartLoc[50], EndLoc[50], Load[50], RouteText[255], Float:x, Float:y, Float:z, LoadMsg[128];

		// Job has started
		APlayerData[playerid][JobStarted] = true;

		// Get a random LoadID from the mafia-products
		APlayerData[playerid][LoadID] = Product_GetRandom(PCV_MafiaVan);
		// Also get a random start-location and end-location
		APlayerData[playerid][JobLoc1] = Product_GetRandomStartLoc(APlayerData[playerid][LoadID]);
		APlayerData[playerid][JobLoc2] = Product_GetRandomEndLoc(APlayerData[playerid][LoadID]);

		// Set jobstep to 1 (going to load the goods)
		APlayerData[playerid][JobStep] = 1;
		// Get the startlocation, endlocation and the load texts
		format(StartLoc, 50, ALocations[APlayerData[playerid][JobLoc1]][LocationName]);
		format(EndLoc, 50, ALocations[APlayerData[playerid][JobLoc2]][LocationName]);
		format(Load, 50, ALoads[APlayerData[playerid][LoadID]][LoadName]);
		// Combine it all into a string for the TextDraw (the player can see this all the time) to describe the mission
		format(RouteText, 255, TXT_HaulingCargoFromToPickup, Load, StartLoc, EndLoc);
		// Set the TextDraw so the player can see it
		TextDrawSetString(APlayerData[playerid][MissionText], RouteText);
		// Grab the x, y, z positions for the first location
		x = ALocations[APlayerData[playerid][JobLoc1]][LocX];
		y = ALocations[APlayerData[playerid][JobLoc1]][LocY];
		z = ALocations[APlayerData[playerid][JobLoc1]][LocZ];
		// Create a checkpoint where the player should load the goods
		SetPlayerCheckpoint(playerid, x, y, z, 7);
		// Store the vehicleID (required to be able to check if the player left his vehicle)
		APlayerData[playerid][VehicleID] = GetPlayerVehicleID(playerid);
		// Set the job-fail-time for the global vehicle-timer
		APlayerData[playerid][VehicleTimerTime] = Job_TimeToFailMission;
		// Inform the player that he must load his goods
		format(LoadMsg, 128, TXT_PickupCargoAt, Load, StartLoc);
		SendClientMessage(playerid, 0xFFFFFFFF, LoadMsg);
	}

	return 1;
}



// This timer is created every time a player changes his class to mafia and is called every second
public Mafia_CheckMafiaLoads(playerid)
{
	// Scan through all players
	for (new PlayerToCheck; PlayerToCheck < MAX_PLAYERS; PlayerToCheck++)
	{
		// check if this player is connected
		if (IsPlayerConnected(PlayerToCheck))
		{
			//Check if that player is carrying a mafia-load
			if (APlayerData[PlayerToCheck][MafiaLoad] == true)
			    SetPlayerMarkerForPlayer(playerid, PlayerToCheck, 0xFF0000FF); // Make that player red to the mafia-player
			else
			    if (APlayerData[PlayerToCheck][PlayerClass] == ClassTruckDriver) // Reset the playercolor for truckers (only truckers can carry mafia-loads)
			        SetPlayerMarkerForPlayer(playerid, PlayerToCheck, ColorClassTruckDriver);
		}
	}

	// If the mafia-player hasn't started a job, check if he has stolen a mafiaload from a trucker
	if (APlayerData[playerid][JobStarted] == false)
	{
		new vehicle = GetPlayerVehicleID(playerid);
		new trailer = GetVehicleTrailer(vehicle);

		// Check if the mafia-player has hijacked a mafia-load already
		if (APlayerData[playerid][MafiaLoadHijacked] == false)
		{
			// If the mafia-player hasn't hijacked a mafia-load yet, check if he did now (check vehicle and trailer)
			if ((AVehicleData[vehicle][MafiaLoad] == true) || (AVehicleData[trailer][MafiaLoad] == true))
			{
				// Store the vehicleid and trailerid to be able to check if the mafia-player lost his load afterwards
				APlayerData[playerid][VehicleID] = vehicle;
				APlayerData[playerid][TrailerID] = trailer;
			    // Now the mafia-player has hijacked a mafia-load
			    APlayerData[playerid][MafiaLoadHijacked] = true;
			    // Set the checkpoint where the mafia-player must bring the load
			    SetPlayerCheckpoint(playerid, 2867, 939, 10.8, 7.0);
				// Update the missiontext
				TextDrawSetString(APlayerData[playerid][MissionText], TXT_MafiaDeliverStolenLoad);
			}
		}

		// Check if the mafia-player already hijacked a mafia-load
		if (APlayerData[playerid][MafiaLoadHijacked] == true)
		{
			// If the mafia-player has hijacked a mafia-load, check if he still has the load (check vehicle and trailer)
			if ((APlayerData[playerid][VehicleID] == vehicle) && (APlayerData[playerid][TrailerID] == trailer))
				// Do nothing if vehicle and trailer are the same
				return 1;
			else
			{
				// Clear the vehicleid and trailerid
				APlayerData[playerid][VehicleID] = 0;
				APlayerData[playerid][TrailerID] = 0;
			    // Now the mafia-player lost his stolen load
			    APlayerData[playerid][MafiaLoadHijacked] = false;
			    // Disable the checkpoint where he must bring his load
				DisablePlayerCheckpoint(playerid);
				// Reset the missiontext
				TextDrawSetString(APlayerData[playerid][MissionText], Mafia_NoJobText);
			}
		}
	}

	return 1;
}



// This function is called whenever a mafia player enters a checkpoint
Mafia_OnPlayerEnterCheckpoint(playerid)
{
	// First check if the mafia player started a job or not
	if (APlayerData[playerid][JobStarted] == false) // Mafia player delivered a mafia-load
	{
	    // This code handles stolen mafia-loads
		new vehicle = GetPlayerVehicleID(playerid);
		new trailer = GetVehicleTrailer(vehicle);

		// If the mafia player has a trailer, so detach and respawn the trailer
		if (trailer > 0)
		{
			DetachTrailerFromVehicle(vehicle);
			SetVehicleToRespawn(trailer);
		}
		else // The mafia player has no trailer, so the load is inside the truck -> remove player from vehicle and respawn the vehicle
		{
		    RemovePlayerFromVehicle(playerid);
			SetVehicleToRespawn(vehicle);
		}

		// Reward the mafia player (give cash and points)
		RewardPlayer(playerid, 5000, 2);
		// Let the player know he succesfully delivered a stolen load to the mafia hideout
		SendClientMessage(playerid, 0xFFFFFFFF, TXT_MafiaDeliveredStolenLoad);

		// Increase the stats for completing a delivery of a stolen mafiaload
		APlayerData[playerid][StatsMafiaStolen]++;
		// Also save the data (in case the server crashes, progress would be lost)
		PlayerFile_Save(playerid);

		// Cleanup
		APlayerData[playerid][VehicleID] = 0;
		APlayerData[playerid][TrailerID] = 0;
	    // Disable the checkpoint where he must bring his load
		DisablePlayerCheckpoint(playerid);
		// Reset the missiontext
		TextDrawSetString(APlayerData[playerid][MissionText], Mafia_NoJobText);
	}
	else // The mafia-player is doing a job
	{
		// Check if the player is inside his vehicle while entering a checkpoint
		if (GetPlayerVehicleID(playerid) == APlayerData[playerid][VehicleID])
		{
			new LoadMsg[128];

		    // Check the jobstep
		    switch (APlayerData[playerid][JobStep])
		    {
				// JobStep is 1 (mafia is loading his goods at the checkpoint)
		 		case 1: format(LoadMsg, 128, TXT_LoadingGoods, ALoads[APlayerData[playerid][LoadID]][LoadName]);
				// JobStep is 2 (mafia is unloading his goods at the checkpoint)
				case 2: format(LoadMsg, 128, TXT_UnloadingGoods, ALoads[APlayerData[playerid][LoadID]][LoadName]);
		    }

			// Disable the player's actions (he cannot move anymore)
			TogglePlayerControllable(playerid, 0);

			// Show the message to inform him what he's doing (loading/unloading)
			GameTextForPlayer(playerid, LoadMsg, 5000, 5);
			// Start a timer (Public function "LoadUnload(playerid)" gets called when the timer runs out)
			APlayerData[playerid][LoadingTimer] = SetTimerEx("Mafia_LoadUnload", 5000, false, "d" , playerid);
		}
	}

	return 1;
}



// After a mafia entered a checkpoint, a timer is created. This function is called when the timer runs out
public Mafia_LoadUnload(playerid)
{
	// Setup local variables
	new Name[24], Msg[128];

	// Get the player name
	GetPlayerName(playerid, Name, sizeof(Name));

	// Check the JobStep
	switch (APlayerData[playerid][JobStep])
	{
		case 1: // Player must load his goods
		{
		    // Setup local variables
			new StartLoc[50], EndLoc[50], Load[50], RouteText[255], Float:x, Float:y, Float:z, UnloadMsg[100];
			// Set JobStep to 2 (unloading goods)
			APlayerData[playerid][JobStep] = 2;
			// Delete the loading-checkpoint
			DisablePlayerCheckpoint(playerid);
			// Get the startlocation, endlocation and the load texts
			format(StartLoc, 50, ALocations[APlayerData[playerid][JobLoc1]][LocationName]);
			format(EndLoc, 50, ALocations[APlayerData[playerid][JobLoc2]][LocationName]);
			format(Load, 50, ALoads[APlayerData[playerid][LoadID]][LoadName]);

			// Update the missiontext
			format(RouteText, 255, TXT_HaulingCargoFromToDeliver, Load, StartLoc, EndLoc);
			// Set the TextDraw so the player can see it
			TextDrawSetString(APlayerData[playerid][MissionText], RouteText);

			// Grab the x, y, z positions for the second location (to unload the goods)
			x = ALocations[APlayerData[playerid][JobLoc2]][LocX];
			y = ALocations[APlayerData[playerid][JobLoc2]][LocY];
			z = ALocations[APlayerData[playerid][JobLoc2]][LocZ];
			// Create a checkpoint where the player should unload the goods
			SetPlayerCheckpoint(playerid, x, y, z, 7);
		    // Add 4 to the player's wanted level
		    SetPlayerWantedLevel(playerid, GetPlayerWantedLevel(playerid) + 4);
			// Inform the police this mafia player is wanted
			format(Msg, 128, "{00FF00}Mafya {FFFF00}%s{00FF00} kaçak yük taþýyor, onu yakalayýn ve cezalandýrýn!", Name);
			Police_SendMessage(Msg);
			// Inform the player that he must unload his goods
			format(UnloadMsg, 100, TXT_DeliverCargoTo, Load, EndLoc);
			SendClientMessage(playerid, 0xFFFFFFFF, UnloadMsg);
		}
		case 2: // Player is delivering his goods
		{
		    // Setup local variables
			new StartLoc[50], EndLoc[50], Load[50], Msg1[128], Msg2[128];

			// Get the startlocation, endlocation and the load texts
			format(StartLoc, 50, ALocations[APlayerData[playerid][JobLoc1]][LocationName]);
			format(EndLoc, 50, ALocations[APlayerData[playerid][JobLoc2]][LocationName]);
			format(Load, 50, ALoads[APlayerData[playerid][LoadID]][LoadName]);

			// Construct the message sent to all players that this player completed a mafia mission
			format(Msg1, 128, TXT_PlayerCompletedMafiaJob, Name, Load);
			format(Msg2, 128, TXT_PlayerCompletedMafiaJobInfo, StartLoc, EndLoc);
			SendClientMessageToAll(0xFFFFFFFF, Msg1);
			SendClientMessageToAll(0xFFFFFFFF, Msg2);



		    // Setup local variables
			new Float:x1, Float:y1, Float:x2, Float:y2, Float:Distance, Message[128], Payment;
			// Grab the x, y, z positions for the first location (to load the goods)
			x1 = ALocations[APlayerData[playerid][JobLoc1]][LocX];
			y1 = ALocations[APlayerData[playerid][JobLoc1]][LocY];
			// Grab the x, y, z positions for the second location (to unload the goods)
			x2 = ALocations[APlayerData[playerid][JobLoc2]][LocX];
			y2 = ALocations[APlayerData[playerid][JobLoc2]][LocY];
			// Calculate the distance between both points
			Distance = floatsqroot(((x2 - x1) * (x2 - x1)) + ((y2 - y1) * (y2 - y1)));

			// Calculate the payment for the player
			Payment = floatround((Distance * ALoads[APlayerData[playerid][LoadID]][PayPerUnit]), floatround_floor);
			// Reward the player (give cash and points)
			RewardPlayer(playerid, Payment, 2);

			// Send a message to let the player know he finished his mission and got paid
			format(Message, 128, TXT_RewardJob, Payment);
			SendClientMessage(playerid, 0xFFFFFFFF, Message);

			// Increase the stats for completing a mafia job
			APlayerData[playerid][StatsMafiaJobs]++;
			// Also save the data (in case the server crashes, progress would be lost)
			PlayerFile_Save(playerid);

			// End the current mafia job (clear mission-data)
			Mafia_EndJob(playerid);
		}
	}

    // Enable the player again (he can move again)
	TogglePlayerControllable(playerid, 1);

	return 1;
}



// This function gets called when the mafia player dies (or changes class)
Mafia_EndJob(playerid)
{
	// Kill the PlayerCheckTimer
	KillTimer(APlayerData[playerid][PlayerCheckTimer]);

	// Scan through all players (to reset them to their default colors for the mafia-player)
	for (new PlayerToCheck; PlayerToCheck < MAX_PLAYERS; PlayerToCheck++)
	{
		// Check if this player is connected
		if (IsPlayerConnected(PlayerToCheck))
		    if (APlayerData[PlayerToCheck][PlayerClass] == ClassTruckDriver) // Reset the playercolor for truckers (only truckers can carry mafia-loads)
		        SetPlayerMarkerForPlayer(playerid, PlayerToCheck, ColorClassTruckDriver);
	}

	// Check if a job has started
	if (APlayerData[playerid][JobStarted] == true)
	{
		// Clear all data about the job from the player, so he can start a new one
		APlayerData[playerid][JobStarted] = false;
		APlayerData[playerid][JobID] = 0;
		APlayerData[playerid][JobStep] = 0;
		APlayerData[playerid][LoadID] = 0;
		APlayerData[playerid][JobLoc1] = 0;
		APlayerData[playerid][JobLoc2] = 0;
		// Reset the missiontext
		TextDrawSetString(APlayerData[playerid][MissionText], Mafia_NoJobText);
		// Kill the LoadingTimer
		KillTimer(APlayerData[playerid][LoadingTimer]);
	    // Check if the player has a wanted level of 4 or higher
		if (GetPlayerWantedLevel(playerid) >= 4)
			SetPlayerWantedLevel(playerid, GetPlayerWantedLevel(playerid) - 4); // Reduce the wanted level by 4
		else
			SetPlayerWantedLevel(playerid, 0); // If the player has a wanted level of less than 4, reset the wanted level to 0
	}

	// Also cleanup the vehicle and trailer id's
	APlayerData[playerid][VehicleID] = 0;
	APlayerData[playerid][TrailerID] = 0;
    // Disable the checkpoint where he must bring his load
	DisablePlayerCheckpoint(playerid);

	return 1;
}

// ************************************************************************************************************************************************************
// PPC_MissionsAssistance
// ************************************************************************************************************************************************************

// This timer is created every time a player changes his class to assistance
forward Assistance_CheckPlayers(playerid);
public Assistance_CheckPlayers(playerid)
{
	// Scan through all players
	for (new PlayerToCheck; PlayerToCheck < MAX_PLAYERS; PlayerToCheck++)
	{
		// check if this player is connected
		if (IsPlayerConnected(PlayerToCheck))
		{
			//Check if that player needs assistance
			if (APlayerData[PlayerToCheck][AssistanceNeeded] == true)
			    SetPlayerMarkerForPlayer(playerid, PlayerToCheck, 0xFF0000FF); // Make that player red to the assistance-player
			else
			{
				// Reset the playercolor based on the player's class
			    switch (APlayerData[PlayerToCheck][PlayerClass])
			    {
			        case ClassTruckDriver: SetPlayerMarkerForPlayer(playerid, PlayerToCheck, ColorClassTruckDriver);
			        case ClassBusDriver: SetPlayerMarkerForPlayer(playerid, PlayerToCheck, ColorClassBusDriver);
			        case ClassPilot: SetPlayerMarkerForPlayer(playerid, PlayerToCheck, ColorClassPilot);
			        case ClassPolice: SetPlayerMarkerForPlayer(playerid, PlayerToCheck, ColorClassPolice);
			        case ClassMafia: SetPlayerMarkerForPlayer(playerid, PlayerToCheck, ColorClassMafia);
			        case ClassCourier: SetPlayerMarkerForPlayer(playerid, PlayerToCheck, ColorClassCourier);
			        case ClassAssistance: SetPlayerMarkerForPlayer(playerid, PlayerToCheck, ColorClassAssistance);
			    }
			}
		}
	}
}

// This function lets the assistance player repair and refuel another player's vehicle if he called for assistance
Assistance_FixVehicle(playerid)
{
	// Setup local variables
	new vid, Float:vhealth, Float:FPayment, Payment, Float:x, Float:y, Float:z, Name[24], AssistName[24], Msg[128];
	new vFuel;

	// Get the assistance player's name
	GetPlayerName(playerid, AssistName, sizeof(AssistName));

	// Loop through all players
	for (new OtherPlayer; OtherPlayer < MAX_PLAYERS; OtherPlayer++)
	{
		// Check if this player is online
		if (IsPlayerConnected(OtherPlayer))
		{
			// Check if this player isn't the assistance player
			if (OtherPlayer != playerid)
			{
				// Check if this player needs assistance
				if (APlayerData[OtherPlayer][AssistanceNeeded] == true)
				{
					// Check if this player is the driver of a vehicle
					if (GetPlayerVehicleSeat(OtherPlayer) == 0)
					{
					    // Get the location of the player
					    GetPlayerPos(OtherPlayer, x, y, z);
						// Check if this player is closeby the assistance player
						if (IsPlayerInRangeOfPoint(playerid, 5.0, x, y, z))
						{
							// Clear the other player's need for assistance
							APlayerData[OtherPlayer][AssistanceNeeded] = false;
							// Get the name of the other player
							GetPlayerName(OtherPlayer, Name, sizeof(Name));
							// Get the vehicle-id of that player's vehicle
							vid = GetPlayerVehicleID(OtherPlayer);

							// Get the current health of that vehicle
							GetVehicleHealth(vid, vhealth);
							// Calculate the price to repair the vehicle (calculate as a float, then convert to integer)
							FPayment = (1000.0 - vhealth) * 1.0;
							Payment = floatround(FPayment, floatround_round);
							// Repair the other player's vehicle
							RepairVehicle(vid);
							// Pay the assistance player and give 1 scorepoint
							RewardPlayer(playerid, Payment * 2, 1);
							// Let the other player pay for the repairs
							RewardPlayer(OtherPlayer, -Payment, 0);
							// Let the other player know that his vehicle has been repaired
							format(Msg, 128, "{00FF00}Aracýnýz {FFFF00}$%i{00FF00}'a tamir edildi. Tamir Eden: \"{FFFF00}%s{00FF00}\"", Payment, AssistName);
							SendClientMessage(OtherPlayer, 0xFFFFFFFF, Msg);
							// Let the assistance player know who's vehicle has been repaired
							format(Msg, 128, "{FFFF00}%s{00FF00}'nýn aracýný tamir ettiniz ve {FFFF00}$%i {00FF00}kazandýnýz.", Name, Payment);
							SendClientMessage(playerid, 0xFFFFFFFF, Msg);

							// Calculate the amount of fuel that needs to be refuelled
							vFuel = MaxFuel - AVehicleData[vid][Fuel];
							// Calculate the price to refuel
							Payment = (vFuel * RefuelMaxPrice) / MaxFuel;
							// Pay the assistance player and give 1 scorepoint
							RewardPlayer(playerid, Payment * 2, 1);
							// Let the other player pay for the refuel
							RewardPlayer(OtherPlayer, -Payment, 0);
							// Refuel the other player's vehicle
							AVehicleData[vid][Fuel] = MaxFuel;
							// Increase the stats
							APlayerData[playerid][StatsAssistance]++;
							// Let the other player know that his vehicle has been refuelled
							format(Msg, 128, "{00FF00}Hatta aracýnýzýn benzin deposu {FFFF00}$%i{00FF00}'a dolduruldu. Dolduran: \"{FFFF00}%s{00FF00}\"", Payment, AssistName);
							SendClientMessage(OtherPlayer, 0xFFFFFFFF, Msg);
							// Let the assistance player know who's vehicle has been refuelled
							format(Msg, 128, "{00FF00}Hatta {FFFF00}%s{00FF00}'ýn aracýna benzin doldurdunuz ve {FFFF00}$%i {00FF00}kazandýnýz.", Name, Payment);
							SendClientMessage(playerid, 0xFFFFFFFF, Msg);

							// Save the player's account
							PlayerFile_Save(playerid);
						}
					}
				}
			}
		}
	}

	return 1;
}

// This function allows the assistance player to repair and refuel his own vehicle
Assistance_FixOwnVehicle(playerid)
{
	// Get the vehicle-id of the player's vehicle
	new vid = GetPlayerVehicleID(playerid);
	// Repair the player's vehicle
	RepairVehicle(vid);
	// Refuel the other player's vehicle
	AVehicleData[vid][Fuel] = MaxFuel;
	// Let the player know that he has repaired and refuelled his own vehicle
	SendClientMessage(playerid, 0xFFFFFFFF, "{00FF00}Aracýnýzý tamir ettiniz ve benzin koydunuz.");
}

// This function gets called when the assistance player dies (or changes class)
Assistance_EndJob(playerid)
{
	// Kill the PlayerCheckTimer
	KillTimer(APlayerData[playerid][PlayerCheckTimer]);

	// Scan through all players (to reset them to their default colors for the assistance-player)
	for (new PlayerToCheck; PlayerToCheck < MAX_PLAYERS; PlayerToCheck++)
	{
		// Check if this player is connected
		if (IsPlayerConnected(PlayerToCheck))
		{
			// Reset the playercolor based on the player's class
		    switch (APlayerData[PlayerToCheck][PlayerClass])
		    {
		        case ClassTruckDriver: SetPlayerMarkerForPlayer(playerid, PlayerToCheck, ColorClassTruckDriver);
		        case ClassBusDriver: SetPlayerMarkerForPlayer(playerid, PlayerToCheck, ColorClassBusDriver);
		        case ClassPilot: SetPlayerMarkerForPlayer(playerid, PlayerToCheck, ColorClassPilot);
		        case ClassPolice: SetPlayerMarkerForPlayer(playerid, PlayerToCheck, ColorClassPolice);
		        case ClassMafia: SetPlayerMarkerForPlayer(playerid, PlayerToCheck, ColorClassMafia);
		        case ClassCourier: SetPlayerMarkerForPlayer(playerid, PlayerToCheck, ColorClassCourier);
		        case ClassAssistance: SetPlayerMarkerForPlayer(playerid, PlayerToCheck, ColorClassAssistance);
		    }
		}
	}

	return 1;
}

// ************************************************************************************************************************************************************
// PPC_MissionsCourier
// ************************************************************************************************************************************************************

// This function gets called whenever a courier player enters "/work"
Courier_StartJob(playerid)
{
	// Setup local variables
	new HouseCounter, HousesInRange[200], DialogList[200];

	// First clear the house-list
	for (new i; i < 11; i++)
		APlayerData[playerid][CourierHouses][i] = 0;

	// Count how many owned houses are in range of the player
	for (new HouseID = 1; HouseID < MAX_HOUSES; HouseID++)
	{
		// Check if the house is owned
		if (AHouseData[HouseID][Owned] == true)
		{
			// Check if the house is in range of the player
			if (IsPlayerInRangeOfPoint(playerid, CourierJobRange, AHouseData[HouseID][HouseX], AHouseData[HouseID][HouseY], AHouseData[HouseID][HouseZ]))
			{
			    // Check if there aren't 200 in-range houses have been found yet
				if (HouseCounter < 200)
				{
					HousesInRange[HouseCounter] = HouseID; // Store the HouseID in the list of in-range houses
					HouseCounter++; // Increase the number of owned houses in range of the player (range = 1000 meters)
				}
				else
				{
					break; // Stop searching for more houses (200 is the maximum)
				}
			}
		}
	}

	// Abort the mission if there are less than 2 houses in range and inform the player
	if (HouseCounter < 2)
	{
	    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Not enough owned houses in range to deliver packages, try some other spot");
		return 0;
	}

	// Try to add the 3 lines to the dialog-list
	if (HouseCounter >= 2)
	{
	    format(DialogList, sizeof(DialogList), "Deliver 2 packages\n"); // Add the line to the dialog
		APlayerData[playerid][CourierMaxStep] = 2; // Set the number of houses for the job to 2
	}
	if (HouseCounter >= 5)
	{
	    format(DialogList, sizeof(DialogList), "%sDeliver 5 packages\n", DialogList); // Add the line to the dialog
		APlayerData[playerid][CourierMaxStep] = 5; // Set the number of houses for the job to 5
	}
	if (HouseCounter >= 10)
	{
	    format(DialogList, sizeof(DialogList), "%sDeliver 10 packages\n", DialogList); // Add the line to the dialog
		APlayerData[playerid][CourierMaxStep] = 10; // Set the number of houses for the job to 10
	}

	// Choose a random house for the first house to visit
	APlayerData[playerid][CourierHouses][1] = HousesInRange[random(HouseCounter)];
	// Now choose as many houses randomly as allowed, starting from the second
	for (new i = 2; i <= APlayerData[playerid][CourierMaxStep]; i++)
	{
		// Copy a random HouseID from the prepared list on in-range houses to the job-list
	    APlayerData[playerid][CourierHouses][i] = HousesInRange[random(HouseCounter)];

		// If the HouseID is the same as the previous HouseID (the player would visit the same house twice in a row)
		while (APlayerData[playerid][CourierHouses][i - 1] == APlayerData[playerid][CourierHouses][i])
			APlayerData[playerid][CourierHouses][i] = HousesInRange[random(HouseCounter)]; // Get a new random HouseID as long as the HouseID is the same as the previous one
	}

	// Let the player choose how many packages he wants to deliver
	ShowPlayerDialog(playerid, DialogCourierSelectQuant, DIALOG_STYLE_LIST, "Choose how many packages you want to deliver", DialogList, TXT_DialogButtonSelect, TXT_DialogButtonCancel);

	return 1;
}

// This function is called when the player has chosen how many packages he wants to deliver
Courier_BeginJob(playerid)
{
	// Setup local variables
	new RouteText[128], Step, HouseID, Float:x, Float:y, Float:z;

	// Job has started
	APlayerData[playerid][JobStarted] = true;
	// Store the vehicleID (required to be able to check if the player left his vehicle)
	APlayerData[playerid][VehicleID] = GetPlayerVehicleID(playerid);
	// Set jobstep to 1 (going to the first house)
	Step = 1;
	APlayerData[playerid][JobStep] = Step;
	// Get the HouseID of the house where the mission starts (the first house in the list of in-range owned house)
	HouseID = APlayerData[playerid][CourierHouses][Step];
	// Set the TextDraw so the player can see it
	format(RouteText, 255, "~w~Deliver package ~b~%i/%i~w~ to: ~r~%s", Step, APlayerData[playerid][CourierMaxStep], AHouseData[HouseID][HouseName]);
	TextDrawSetString(APlayerData[playerid][MissionText], RouteText);
	// Grab the x, y, z positions for the first location
	x = AHouseData[HouseID][HouseX];
	y = AHouseData[HouseID][HouseY];
	z = AHouseData[HouseID][HouseZ];
	// Create a checkpoint where the player should deliver his package
	SetPlayerCheckpoint(playerid, x, y, z, 3);
	// Set the job-fail-time for the global vehicle-timer
	APlayerData[playerid][VehicleTimerTime] = Job_TimeToFailMission;
	// Send the player a message to inform him that the mission has started
	SendClientMessage(playerid, 0xFFFFFFFF, "{00FF00}Deliver packages to player's houses");

	return 1;
}



// This function is called when a courier enters a checkpoint
Courier_OnPlayerEnterCheckpoint(playerid)
{
	// Setup local variables
	new RouteText[128], Step, HouseID, Float:x, Float:y, Float:z, Name[24], Msg[128], Payment;

	// Check if the player is outside his vehicle while entering a checkpoint
	if (GetPlayerVehicleSeat(playerid) == -1)
	{
		// Check if all the packages haven't been delivered
		if (APlayerData[playerid][CourierMaxStep] != APlayerData[playerid][JobStep])
		{
			// First disable the current checkpoint
			DisablePlayerCheckpoint(playerid);
			// Let the player know he delivered a package
			GameTextForPlayer(playerid, TXT_PackageDeliveredGameText, 5000, 4);
			SendClientMessage(playerid, 0xFFFFFFFF, TXT_PackageDeliveredMessage);
			// Set next JobStep (next house)
			APlayerData[playerid][JobStep]++;
			Step = APlayerData[playerid][JobStep];
			// Get the HouseID of the house where the mission starts (the first house in the list of in-range owned house)
			HouseID = APlayerData[playerid][CourierHouses][Step];
			// Set the TextDraw so the player can see it
			format(RouteText, 255, "~w~Deliver package ~b~%i/%i~w~ to: ~r~%s", Step, APlayerData[playerid][CourierMaxStep], AHouseData[HouseID][HouseName]);
			TextDrawSetString(APlayerData[playerid][MissionText], RouteText);
			// Grab the x, y, z positions for the first location
			x = AHouseData[HouseID][HouseX];
			y = AHouseData[HouseID][HouseY];
			z = AHouseData[HouseID][HouseZ];
			// Create a checkpoint where the player should deliver his package
			SetPlayerCheckpoint(playerid, x, y, z, 3);
		}
		else // All packages have been delivered, the player has to get paid now
		{
			// Get the player name
			GetPlayerName(playerid, Name, sizeof(Name));
			// Send a message to all players to inform them that this player completed a courier-job
			format(Msg, 128, TXT_PlayerCompletedCourierJob, Name, APlayerData[playerid][CourierMaxStep]);
			SendClientMessageToAll(0xFFFFFFFF, Msg);
			// Set a payment based on the number of packages
			Payment = APlayerData[playerid][CourierMaxStep] * PaymentPerPackage;
			// Pay the player money and give scorepoints, both based on the number of packages delivered
			RewardPlayer(playerid, Payment, APlayerData[playerid][CourierMaxStep]);
			// Send a message to let the player know he finished his mission and got paid
			format(Msg, 128, TXT_RewardJob, Payment);
			SendClientMessage(playerid, 0xFFFFFFFF, Msg);

			// Increase the stats for completing a courier job
			APlayerData[playerid][StatsCourierJobs]++;
			// End the current trucker job (clear mission-data)
			Courier_EndJob(playerid);
			// Also save the data (in case the server crashes, progress would be lost)
			PlayerFile_Save(playerid);
		}
	}
	else
	    SendClientMessage(playerid, 0xFFFFFFFF, TXT_NeedOnFootToProceed);

	return 1;
}



// This function is used to stop any Courier-mission that has been started
Courier_EndJob(playerid)
{
	if (APlayerData[playerid][JobStarted] == true)
	{
		// Clear all data about the job from the player, so he can start a new one
		APlayerData[playerid][JobStarted] = false;
		APlayerData[playerid][JobStep] = 0;
		APlayerData[playerid][VehicleTimerTime] = 0;
		APlayerData[playerid][VehicleID] = 0;
		APlayerData[playerid][CourierMaxStep] = 0;

		// Clear the list of houses-in-range
		for (new i; i < 11; i++)
			APlayerData[playerid][CourierHouses][i] = 0;

		// Delete the checkpoint
		DisablePlayerCheckpoint(playerid);
		// Reset the missiontext
		TextDrawSetString(APlayerData[playerid][MissionText], Courier_NoJobText);
	}

	return 1;
}

// ************************************************************************************************************************************************************
// PPC_MissionsRoadworker
// ************************************************************************************************************************************************************

// Forward the function used to repair a camera (when the player entered a racecheckpoint)
forward Roadworker_RepairCamera(playerid);



enum TBrokenVehicleLocation
{
	BrokenName[50], // Holds the name of the location where the vehicle is located
	Float:BrokenX, // Holds the X coordinate where the vehicle spawns
	Float:BrokenY, // Holds the Y coordinate where the vehicle spawns
	Float:BrokenZ // Holds the Z coordinate where the vehicle spawns
}
new ABrokenVehicles[][TBrokenVehicleLocation] =
{
	{"Shady Creeks", -2047.5, -1882.25, 52.4},
	{"Angel Pine", -2072.5, -2407.75, 30.7},
	{"Shady Creeks", -1595.25, -2625.0, 52.6},
	{"Back O Beyond", -990.25, -2335.5, 66.8},
	{"Flint County", 46.5, -2654.25, 40.5},
	{"Los Santos Inlet", -313.5, -1959.75, 20.0},
	{"Leafy Hollow", -833.0, -1737.25, 80.8},
	{"Flint Range", -347.5, -1331.0, 17.1},
	{"Flint County", 17.25, -987.75, 28.7},
	{"Fallen Tree", -763.0, -621.25, 61.5},
	{"Foster Valley", -1885.5, -435.5, 25.2},
	{"Missionary Hill", -2451.25, -681.0, 133.6},
	{"Garcia", -2371.5, 118.25, 35.3},
	{"Downtown", -1781.5, 429.25, 16.6},
	{"Palisades", -2905.0, 656.5, 6.3},
	{"Paradiso", -2771.25, 1239.5, 22.6}
//	{"nnnnnnnnnn", xxxxxxx, yyyyyyyy, zzzzzzz},
};



// This function is called when a roadworker wants to start a job by entering "/work"
Roadworker_StartRandomJob(playerid)
{
	// Setup local variables
	new vid, trailerid;

	// If the player is the driver of the vehicle (GetPlayerVehicleSeat returns -1 if the player is not in a vehicle)
	if (GetPlayerVehicleSeat(playerid) == 0)
	{
		// Get the vehicle-id
		vid = GetPlayerVehicleID(playerid);
		// Get the trailer-id
		trailerid = GetVehicleTrailer(vid);

		switch (GetVehicleModel(vid))
		{
		    case VehicleUtilityVan: // With a Utility Van, you're gonna do "repair speedcamera" job-type
		    {
			    // Check if the player has a utility trailer attached
			    if (trailerid != 0)
				{
					// Check if there is a utility trailer attached
			        if (GetVehicleModel(trailerid) == VehicleUtilityTrailer)
					{
					    // Setup local variables
						new Float:x, Float:y, Float:z, CamID;
						// Get a random speedcamera (no previous camera has been fixed yet, so Exception = -1 (invalid camera))
						CamID = GetRandomCamera(-1);
						// Check if there are no speedcamera's
						if (CamID == -1)
						{
							SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Görev baþlatýlamadý çünkü oyunda hýz kamerasý yok");
							return 1;
						}

						// Job has started
						APlayerData[playerid][JobStarted] = true;
						// Set job-type
						APlayerData[playerid][JobID] = 1; // Job-type: "repair speedcameras"
						// Store the CamID
						APlayerData[playerid][JobLoc1] = CamID;
						// Set the TextDraw so the player can see it
						TextDrawSetString(APlayerData[playerid][MissionText], TXT_RepairSpeedcamera);

						// Grab the x, y, z positions for the checkpoint
						x = ACameras[CamID][CamX];
						y = ACameras[CamID][CamY];
						z = ACameras[CamID][CamZ];
						// Create a racecheckpoint where the player should repair a speedcamera
	                    SetPlayerRaceCheckpoint(playerid, 1, x, y, z, 0.0, 0.0, 0.0, 2.5);
						// Create a checkpoint to indicate the base
						SetPlayerCheckpoint(playerid, -1870.0, -1710.0, 21.8, 7.0);

						// Store the vehicleID (required to be able to check if the player left his vehicle)
						APlayerData[playerid][VehicleID] = vid;
						APlayerData[playerid][TrailerID] = trailerid;
						// Start a timer that ticks every second to see if the player is still inside his vehicle
						APlayerData[playerid][VehicleTimerTime] = Job_TimeToFailMission;
						// Inform the player what he must do
						SendClientMessage(playerid, 0xFFFFFFFF, "{00FF00}Haritada iþaretlenen hýz kamerasýný tamir edin ve merkeze geri dönün");
					}
					else
					    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Utility Van'a takýlmýþ Utility Trailer'e ihtiyacýnýz var.");
				}
				else
				    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Utility Van'a takýlmýþ Utility Trailer'e ihtiyacýnýz var.");
			}
			case VehicleTowTruck: // With a towtruck, you're gonna do "tow broken vehicle to shredder" job-type
			{
			    // Setup local variables
				new Float:x, Float:y, Float:z, RouteText[128];

				// Job has started
				APlayerData[playerid][JobStarted] = true;
				// Set job-type
				APlayerData[playerid][JobID] = 2; // Job-type: "tow broken vehicles to shredder"
				// Choose a random spawn-location for the vehicle
				APlayerData[playerid][JobLoc1] = random(sizeof(ABrokenVehicles));
				// Set the job-step to 1 (going to pickup the broken vehicle)
				APlayerData[playerid][JobStep] = 1;

				// Set the TextDraw so the player can see it
				format(RouteText, 128, TXT_TowBrokenVehicle, ABrokenVehicles[APlayerData[playerid][JobLoc1]][BrokenName]);
				TextDrawSetString(APlayerData[playerid][MissionText], RouteText);

				// Grab the x, y, z positions for the checkpoint where the vehicle will spawn, once the player comes into range (100m)
				x = ABrokenVehicles[APlayerData[playerid][JobLoc1]][BrokenX];
				y = ABrokenVehicles[APlayerData[playerid][JobLoc1]][BrokenY];
				z = ABrokenVehicles[APlayerData[playerid][JobLoc1]][BrokenZ];
				// Create a checkpoint to indicate the location of the vehicle
				SetPlayerCheckpoint(playerid, x, y, z, 10.0);
				// Also create the vehicle inside the checkpoint and store the vehicle's reference as the LoadID
				APlayerData[playerid][LoadID] = CreateBrokenVehicle(x, y, z);

				// Store the vehicleID (required to be able to check if the player left his vehicle)
				APlayerData[playerid][VehicleID] = vid;
				// Set the job-fail-time for the global vehicle-timer
				APlayerData[playerid][VehicleTimerTime] = Job_TimeToFailMission;
				// Inform the player what he must do
				SendClientMessage(playerid, 0xFFFFFFFF, "{00FF00}Bozuk aracý hurdalýða çekin.");
			}
		}
	}

	return 1;
}

// This function gets executed when the player entered a checkpoint (to tow a broken vehicle to the shredder)
Roadworker_EnterCheckpoint(playerid)
{
	// Setup local variables
	new RouteText[128];

	// Check which job-type you're doing
	if (APlayerData[playerid][JobID] == 2) // Job-type: tow broken vehicle to shredder
	{
		// Check if the player is still inside his towtruck
		if (GetPlayerVehicleID(playerid) == APlayerData[playerid][VehicleID])
		{
			// Select action based on JobStep
			switch (APlayerData[playerid][JobStep])
			{
			    case 1: // Going to pickup the broken vehicle
			    {
					// Delete the checkpoint
					DisablePlayerCheckpoint(playerid);
					// Attach the broken vehicle to your towtruck
					AttachTrailerToVehicle(APlayerData[playerid][LoadID], GetPlayerVehicleID(playerid));
					// Update the TextDraw so the player can see it
					format(RouteText, 128, TXT_DeliverBrokenVehicle, ABrokenVehicles[APlayerData[playerid][JobLoc1]][BrokenName]);
					TextDrawSetString(APlayerData[playerid][MissionText], RouteText);
					// Create a checkpoint to indicate the location of the shredder
					SetPlayerCheckpoint(playerid, -1868.5, -1684.0, 21.8, 10.0);
					// Set the next jobstep (2 = going to deliver the broken vehicle to the shredder)
					APlayerData[playerid][JobStep] = 2;

					// Update the vehicleID AND the id of the broken vehicle as trailer (required to be able to check if the player left his vehicle)
					APlayerData[playerid][VehicleID] = GetPlayerVehicleID(playerid);
					APlayerData[playerid][TrailerID] = APlayerData[playerid][LoadID];

					// Inform the player what he must do
					SendClientMessage(playerid, 0xFFFFFFFF, "{00FF00}Hasarlý aracý hurdalýða çekin");
			    }
			    case 2: // Going to deliver the broken vehicle to the shredder
			    {
			        // Delete the broken vehicle
			        AVehicleData[APlayerData[playerid][LoadID]][Owned] = false;
			        DetachTrailerFromVehicle(GetPlayerVehicleID(playerid));
			        DestroyVehicle(APlayerData[playerid][LoadID]);
			        APlayerData[playerid][LoadID] = 0;

					// End the mission, clearing all data
					Roadworker_EndJob(playerid);
					// Pay the player for delivering the broken vehicle to the shredder
					RewardPlayer(playerid, 3500, 1);
					// Let the player know he earned money for delivering the broken vehicle to the shredder
					SendClientMessage(playerid, 0xFFFFFFFF, "{00FF00}Bozuk aracý hurdalýða taþýdýðýnýz için {FFFF00}$3500{00FF00} kazandýnýz.");
					// Also increase the stats
					APlayerData[playerid][StatsRoadworkerJobs]++;
					// Save the player's account
					PlayerFile_Save(playerid);
			    }
			}
		}
		else
			SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Görevi yapabilmek için çekici kamyonunda bulunmalýsýnýz.");
	}

	return 1;
}

// This function gets executed when the player entered a race-checkpoint (to repair a speedcamera)
Roadworker_EnterRaceCheckpoint(playerid)
{
	// Check which job-type you're doing
	if (APlayerData[playerid][JobID] == 1) // Repairing speedcamera's
	{
		// Check if the player is on foot
		if (GetPlayerVehicleSeat(playerid) == -1)
		{
			// Inform the player that he's repairing the camera
	 		GameTextForPlayer(playerid, "Hiz kamerasi tamir ediliyor...", 5000, 4);

			// Disable the player's actions (he cannot move anymore)
			TogglePlayerControllable(playerid, 0);
			// Start a timer (Public function "Roadworker_RepairCamera(playerid)" gets called when the timer runs out)
			APlayerData[playerid][LoadingTimer] = SetTimerEx("Roadworker_RepairCamera", 5000, false, "d" , playerid);
		}
		else
		    SendClientMessage(playerid, 0xFFFFFFFF, TXT_NeedOnFootToProceed);
	}

	return 1;
}

// Repair the camera, pay the player and choose a new camera to fix
public Roadworker_RepairCamera(playerid)
{
    // Setup local variables
	new Float:x, Float:y, Float:z, CamID;

	// Pay the player for fixing this camera
	RewardPlayer(playerid, 2500, 1);
	// Let the player know he earned money for fixing this camera
	SendClientMessage(playerid, 0xFFFFFFFF, "{00FF00}Hýz kamerasýný tamir ettiðiniz için {FFFF00}$2500{00FF00} kazandýnýz.");
	// Also increase the stats
	APlayerData[playerid][StatsRoadworkerJobs]++;
	// Save the player's account
	PlayerFile_Save(playerid);

	// Get a random speedcamera (don't allow the function to choose the same camera that just has been fixed)
	CamID = GetRandomCamera(APlayerData[playerid][JobLoc1]);
	// Store the CamID
	APlayerData[playerid][JobLoc1] = CamID;

	// Set the mission-TextDraw so the player can see it
	TextDrawSetString(APlayerData[playerid][MissionText], TXT_RepairSpeedcamera);

	// First delete the racecheckpoint
	DisablePlayerRaceCheckpoint(playerid);
	// Grab the x, y, z positions for the checkpoint
	x = ACameras[CamID][CamX];
	y = ACameras[CamID][CamY];
	z = ACameras[CamID][CamZ];
	// Create a new racecheckpoint where the player should repair a speedcamera
	SetPlayerRaceCheckpoint(playerid, 1, x, y, z, 0.0, 0.0, 0.0, 2.5);

	// Inform the player what he must do
	SendClientMessage(playerid, 0xFFFFFFFF, "{00FF00}Ýþaretlenen yeni hýz kamerasýný tamir edin veya merkeze geri dönün.");
	// Enable the player's actions (he can move again)
	TogglePlayerControllable(playerid, 1);
}



// This function checks if there are camera's defined and returns a random CamID
GetRandomCamera(Exception)
{
	// Setup local variables
	new CameraList[100], CamCount = -1, CamID;

	// Build the list of camera's
	for (CamID = 0; CamID < 100; CamID++)
	{
	    // Check if there is a camera defined at this location
		if (ACameras[CamID][CamSpeed] > 0)
		{
			// Increase the camera-counter to select the next index in the list
			CamCount++;
			// Store the CamID in the list
			CameraList[CamCount] = CamID;
		}
	}

	// If there are no camera's, return -1
	if (CamCount == -1)
	    return -1;

	// Get a random CameraID
	CamID = CameraList[random(CamCount + 1)];

	// Prevent the same camera being chosen as before
	while (CamID == Exception)
		CamID = CameraList[random(CamCount + 1)];

	// Choose a random camera from the list
	return CamID;
}



// This function is used to cleanup the current job
Roadworker_EndJob(playerid)
{
	if (APlayerData[playerid][JobStarted] == true)
	{
		// Clear all data about the job from the player, so he can start a new one
		APlayerData[playerid][JobStarted] = false;
		APlayerData[playerid][JobStep] = 0;
		APlayerData[playerid][JobID] = 0;
		APlayerData[playerid][VehicleTimerTime] = 0;
		APlayerData[playerid][VehicleID] = 0;
		APlayerData[playerid][TrailerID] = 0;
		APlayerData[playerid][JobLoc1] = 0;
		APlayerData[playerid][JobLoc2] = 0;
		// If the player was doing the "tow broken vehicle" job-type, check if there was a vehicle created
		if (APlayerData[playerid][LoadID] != 0)
		{
			DestroyVehicle(APlayerData[playerid][LoadID]); // Destroy the vehicle
			APlayerData[playerid][LoadID] = 0; // Clear the LoadID
		}

		// Delete the checkpoints
		DisablePlayerCheckpoint(playerid);
		DisablePlayerRaceCheckpoint(playerid);
		// Reset the missiontext
		TextDrawSetString(APlayerData[playerid][MissionText], RoadWorker_NoJobText);
		// Kill the LoadingTimer
		KillTimer(APlayerData[playerid][LoadingTimer]);
	}

	return 1;
}



// This function creates a random vehicle, spawns it and damages it and protects it from the /cleanupcars command, so admins cannot
// bug missions by cleaning up the world from spawned cars
CreateBrokenVehicle(Float:x, Float:y, Float:z)
{
	// Setup local variables
	new vid, panels, doors, lights, tires;
	new paramsengine, paramslights, paramsalarm, paramsdoors, paramsbonnet, paramsboot, paramsobjective;
	new BrokenVids[] = {400, 401, 402, 404, 405, 409, 410, 411, 412, 415, 419, 420, 421, 424, 426, 429, 434, 436, 438, 439, 442, 445, 451, 458, 466, 467, 474, 475, 477, 479, 480, 489, 490, 491, 492, 494, 495, 496, 500, 502, 503, 504, 505, 506, 507, 516, 517, 518, 526, 527, 528, 529, 533, 534, 535, 536, 540, 541, 542, 543, 545, 546, 547, 549, 550, 551, 552, 554, 555, 558, 559, 560, 561, 562, 565, 566, 567, 568, 575, 576, 579, 580, 582, 585, 587, 588, 589, 596, 597, 598, 599, 600, 602, 603};

	// Create the vehicle (choose a random vehicle from the array BrokenVids)
    vid = CreateVehicle(BrokenVids[random(sizeof(BrokenVids))], x, y, z, random(360), random(126), random(126), 3600);
	// Also set the data to prevent /cleanupcars deleting this vehicle
	AVehicleData[vid][Owned] = true;
	// Create an arrow above the vehicle to point to it (objective) and lock the doors so nobody can steal it
	GetVehicleParamsEx(vid, paramsengine, paramslights, paramsalarm, paramsdoors, paramsbonnet, paramsboot, paramsobjective);
	SetVehicleParamsEx(vid, paramsengine, paramslights, paramsalarm, true, paramsbonnet, paramsboot, true);

	// Damage all components of the vehicle
	tires = encode_tires(1, 1, 1, 1); // All tires popped
	panels = encode_panels(3, 3, 3, 3, 3, 3, 3); // All panels broken off
	doors = encode_doors(4, 4, 4, 4, 4, 4); // All doors broken
	lights = encode_lights(1, 1, 1, 1); // All lights damaged
	// Update the damage status of the vehicle
	UpdateVehicleDamageStatus(vid, panels, doors, lights, tires);
	// Set the vehicle damage quite low (this will make the vehicle smoke)
	SetVehicleHealth(vid, 300.0);

	return vid;
}



encode_tires(tire1, tire2, tire3, tire4)
{
	return tire1 | (tire2 << 1) | (tire3 << 2) | (tire4 << 3);
}
encode_panels(flp, frp, rlp, rrp, windshield, front_bumper, rear_bumper)
{
    return flp | (frp << 4) | (rlp << 8) | (rrp << 12) | (windshield << 16) | (front_bumper << 20) | (rear_bumper << 24);
}
encode_doors(bonnet, boot, driver_door, passenger_door, behind_driver_door, behind_passenger_door)
{
    #pragma unused behind_driver_door
    #pragma unused behind_passenger_door
    return bonnet | (boot << 8) | (driver_door << 16) | (passenger_door << 24);
}
encode_lights(light1, light2, light3, light4)
{
    return light1 | (light2 << 1) | (light3 << 2) | (light4 << 3);
}

// ************************************************************************************************************************************************************
// PPC_Convoys
// ************************************************************************************************************************************************************

// This include file holds all functions for doing convoys
forward Convoy_Timer(Convoy);

// This function is called only once and is used to setup the textdraws and default data for convoys
Convoys_Init()
{
	for (new i; i < MAX_CONVOYS; i++)
	{
		AConvoys[i][ConvoyTextLeader] = TextDrawCreate(320.0, 1.0, " "); // Create the textdraw for the leader
		TextDrawSetShadow(AConvoys[i][ConvoyTextLeader], 1); // Reduce the shadow to 1
		TextDrawAlignment(AConvoys[i][ConvoyTextLeader], 2); // Align the convoy-infobar to the center for the leader
		TextDrawUseBox(AConvoys[i][ConvoyTextLeader], 1); // Set the missiontext to display inside a box
		TextDrawBoxColor(AConvoys[i][ConvoyTextLeader] ,0x00000066); // Set the box color of the missiontext

		AConvoys[i][ConvoyTextMember] = TextDrawCreate(320.0, 1.0, " "); // Create the textdraw for the members
		TextDrawSetShadow(AConvoys[i][ConvoyTextLeader], 1); // Reduce the shadow to 1
		TextDrawAlignment(AConvoys[i][ConvoyTextMember], 2); // Align the convoy-infobar to the center for the members
		TextDrawUseBox(AConvoys[i][ConvoyTextMember], 1); // Set the missiontext to display inside a box
		TextDrawBoxColor(AConvoys[i][ConvoyTextMember] ,0x00000066); // Set the box color of the missiontext
	}
}

// This function is used when a player selected an empty convoy-slot (the player will start the convoy and become the leader)
Convoy_Create(playerid, Convoy)
{
	// Setup local variables
	new Name[24], Msg[128];

	// Get the name of the player
	GetPlayerName(playerid, Name, sizeof(Name));

	// Check if the player is allowed to create a convoy (he must be a trucker without a job and not part of a convoy yet)
	if (Convoy_PlayerAllowed(playerid))
	{
		// Set status of the convoy to "open"
		AConvoys[Convoy][Status] = CONVOY_OPEN;
		// Set the player as leader of the convoy
		AConvoys[Convoy][Members][0] = playerid;
		// Set the player as a member of a convoy
		APlayerData[playerid][InConvoy] = true;
		APlayerData[playerid][ConvoyID] = Convoy;

		// Set all other member-indices to "-1" (no player yet)
		for (new i = 1; i < CONVOY_MAX_MEMBERS; i++)
		    AConvoys[Convoy][Members][i] = -1;
		// Start the convoy-timer (this timer updates and checks everything for the whole convoy), it runs every second
		AConvoys[Convoy][ConvoyTimer] = SetTimerEx("Convoy_Timer", 1000, true, "i", Convoy);

		// Let all players know that this player wants to start a convoy
		format(Msg, 128, TXT_PlayerStartsConvoy, Name);
		SendClientMessageToAll(0xFFFFFFFF, Msg);
	}
}



// This function is used to let another player join a convoy
Convoy_Join(playerid, Convoy)
{
	// Setup local variables
	new Name[24], Msg[128];

	// Get the name of the player
	GetPlayerName(playerid, Name, sizeof(Name));

	// Check if the player is allowed to join the convoy (he must be a trucker without a job and not part of a convoy yet)
	if (Convoy_PlayerAllowed(playerid))
	{
	    // Check if the convoy isn't full already
		if (Convoy_CountMembers(Convoy) < CONVOY_MAX_MEMBERS)
		{
			// Inform all the members of the convoy that this player joined the convoy
			format(Msg, 128, TXT_PlayerJoinedConvoy, Name);
			Convoy_SendMessage(Convoy, Msg);
			// Inform the player that he joined the convoy
			SendClientMessage(playerid, 0xFFFFFFFF, TXT_YouJoinedConvoy);

			// Set the player as member of the convoy (find a free spot for this player)
			for (new i; i < CONVOY_MAX_MEMBERS; i++)
			{
			    if (AConvoys[Convoy][Members][i] == -1) // Check if this member-spot is empty
				{
					AConvoys[Convoy][Members][i] = playerid; // Put the player in this member-spot
					break; // Stop the for-loop
				}
			}
			// Set the player as a member of a convoy
			APlayerData[playerid][InConvoy] = true;
			APlayerData[playerid][ConvoyID] = Convoy;

			// Set the convoystatus as "Full" if all member-spots are occupied
			if (Convoy_CountMembers(Convoy) == CONVOY_MAX_MEMBERS)
			    AConvoys[Convoy][Status] = CONVOY_FULL;

			// Also update the player's missiontext to inform the player that he must wait for the leader to start a job
			TextDrawSetString(APlayerData[playerid][MissionText], TXT_WaitingLeaderJob);
		}
		else
		    SendClientMessage(playerid, 0xFFFFFFFF, TXT_ConvoyFull);
	}
}



// This function is used to let a player leave a convoy (when he disconnects, finishes the convoy, when he dies, ...)
Convoy_Leave(playerid)
{
	// Setup local variables
	new Convoy, NumMembers, MemberID;

	// First theck if the player is part of a convoy
	if (APlayerData[playerid][InConvoy] == false)
	    return 1; // Exit the function if the player isn't part of a convoy

	// Get the convoy-id from the player
	Convoy = APlayerData[playerid][ConvoyID];

	// Get the number of members in the convoy
	NumMembers = Convoy_CountMembers(Convoy);

	// If there is only 1 member in the convoy (convoy will have no members if this one leaves), cancel the convoy
	if (NumMembers == 1)
	{
		// Cancel the convoy
		Convoy_Cancel(Convoy);
		// Exit the function
		return 1;
	}

	// Remove the player from the convoy
	APlayerData[playerid][InConvoy] = false;
	APlayerData[playerid][ConvoyID] = 0;
	// Hide both convoy-textdraws (for leader and members) as the member leaves the convoy
	TextDrawHideForPlayer(playerid, AConvoys[Convoy][ConvoyTextLeader]);
	TextDrawHideForPlayer(playerid, AConvoys[Convoy][ConvoyTextMember]);
	// Also update the player's missiontext to inform the player that he can start a job now (if there isn't a job started)
	if (APlayerData[playerid][JobStarted] == false)
		TextDrawSetString(APlayerData[playerid][MissionText], Trucker_NoJobText);

    // If the player is the leader
	if (AConvoys[Convoy][Members][0] == playerid)
	{
		// Set another player as leader
		for (new j = 1; j < CONVOY_MAX_MEMBERS; j++)
		{
			// Get the playerid of the member
			MemberID = AConvoys[Convoy][Members][j];
			if (MemberID != -1) // If a valid playerid is found
			{
				// Hide the member-textdraw as the member just became the leader
				TextDrawHideForPlayer(MemberID, AConvoys[Convoy][ConvoyTextMember]);
                // Set this member as leader
				AConvoys[Convoy][Members][0] = MemberID;
                // Clear this index, or the player would be twice in the same convoy
				AConvoys[Convoy][Members][j] = -1;
                // Exit the function
				return 1;
			}
		}
	}
	else // The leaving player isn't the leader
	{
		// Find the player inside the convoy
		for (new i = 1; i < CONVOY_MAX_MEMBERS; i++)
		{
			// If the current player is this player
			if (AConvoys[Convoy][Members][i] == playerid)
			{
			    // Reset the stored playerid in the convoy
			    AConvoys[Convoy][Members][i] = -1;
				// Stop the job for this player (all data gets cleared, including the missiontext)
				Trucker_EndJob(playerid);

				return 1; // Exit the function
			}
		}
	}

	return 1;
}

// This function cancels the convoy, kicking every member in it
Convoy_Cancel(Convoy)
{
	// Setup local variables
	new MemberID;

	// Loop through all members
	for (new i; i < CONVOY_MAX_MEMBERS; i++)
	{
		// Get the member's playerid
	    MemberID = AConvoys[Convoy][Members][i];
		// If a valid playerid is found
		if (MemberID != -1)
		{
			// Remove the player from the convoy
			APlayerData[MemberID][InConvoy] = false;
			APlayerData[MemberID][ConvoyID] = 0;
			// Hide both convoy-textdraws (for leader and members)
   	        TextDrawHideForPlayer(MemberID, AConvoys[Convoy][ConvoyTextLeader]);
   	        TextDrawHideForPlayer(MemberID, AConvoys[Convoy][ConvoyTextMember]);
			// Cancel the trucker-job
			Trucker_EndJob(MemberID);
		    // Reset the stored playerid in the convoy
		    AConvoys[Convoy][Members][i] = -1;
			// Send the member a message that the convoy was cancelled by the leader
			SendClientMessage(MemberID, 0xFFFFFFFF, TXT_LeaderCancelledConvoy);
		}
	}

	// Clear all the data of the convoy
	AConvoys[Convoy][LoadID] = 0;
	AConvoys[Convoy][Location1] = 0;
	AConvoys[Convoy][Location2] = 0;
	AConvoys[Convoy][Status] = CONVOY_EMPTY;
	AConvoys[Convoy][ConvoyStep] = 0;
	AConvoys[Convoy][TrailerModel] = 0;
	AConvoys[Convoy][LeaderInformedTrailers] = false;
	// Kill the convoy-timer
	KillTimer(AConvoys[Convoy][ConvoyTimer]);
}



// This function is called for every member when the leader of the convoy started a job (missiontext is updated, loading-checkpoint is created, ...
Convoy_StartMemberJob(playerid, Convoy)
{
    // Setup local variables
	new StartLoc[50], EndLoc[50], Load[50], RouteText[255], Float:x, Float:y, Float:z, LoadMsg[128];

	// Job has started
	APlayerData[playerid][JobStarted] = true;
	// Copy the convoy-data to this player
	APlayerData[playerid][LoadID] = AConvoys[Convoy][LoadID];
	APlayerData[playerid][JobLoc1] = AConvoys[Convoy][Location1];
	APlayerData[playerid][JobLoc2] = AConvoys[Convoy][Location2];

	// Store the vehicleID (required to be able to check if the player left his vehicle)
	APlayerData[playerid][VehicleID] = GetPlayerVehicleID(playerid);
	// Store the trailerID (required to be able to check if the player lost his trailer)
	APlayerData[playerid][TrailerID] = GetVehicleTrailer(GetPlayerVehicleID(playerid));

	// Set jobstep to 1 (going to load the goods)
	APlayerData[playerid][JobStep] = 1;
	// Get the startlocation, endlocation and the load texts
	format(StartLoc, 50, ALocations[APlayerData[playerid][JobLoc1]][LocationName]);
	format(EndLoc, 50, ALocations[APlayerData[playerid][JobLoc2]][LocationName]);
	format(Load, 50, ALoads[APlayerData[playerid][LoadID]][LoadName]);
	// Combine it all into a string for the TextDraw (the player can see this all the time) to describe the mission
	format(RouteText, 255, TXT_HaulingCargoFromToPickup, Load, StartLoc, EndLoc);
	// Set the TextDraw so the player can see it
	TextDrawSetString(APlayerData[playerid][MissionText], RouteText);
	// Grab the x, y, z positions for the first location
	x = ALocations[APlayerData[playerid][JobLoc1]][LocX];
	y = ALocations[APlayerData[playerid][JobLoc1]][LocY];
	z = ALocations[APlayerData[playerid][JobLoc1]][LocZ];
	// Create a checkpoint where the player should load the goods
	SetPlayerCheckpoint(playerid, x, y, z, 7);
	// Set the job-fail-time for the global vehicle-timer
	APlayerData[playerid][VehicleTimerTime] = Job_TimeToFailMission;
	// Inform the player that he must load his goods
	format(LoadMsg, 128, TXT_PickupCargoAt, Load, StartLoc);
	SendClientMessage(playerid, 0xFFFFFFFF, LoadMsg);
	SendClientMessage(playerid, 0xFFFFFFFF, TXT_MeetOtherConvoyMembers);
}



// This function is called when all convoy-members have loaded their cargo (it updates the missiontext and creates the unload-checkpoint)
Convoy_UpdateMemberJob(playerid)
{
    // Setup local variables
	new StartLoc[50], EndLoc[50], Load[50], RouteText[255], Float:x, Float:y, Float:z, UnloadMsg[128];

	// Set the jobstep to 3 (going to unload the cargo at the destination)
	APlayerData[playerid][JobStep] = 3;
	// Get the startlocation, endlocation and the load texts
	format(StartLoc, 50, ALocations[APlayerData[playerid][JobLoc1]][LocationName]);
	format(EndLoc, 50, ALocations[APlayerData[playerid][JobLoc2]][LocationName]);
	format(Load, 50, ALoads[APlayerData[playerid][LoadID]][LoadName]);
	// Update the missiontext
	format(RouteText, 255, TXT_HaulingCargoFromToDeliver, Load, StartLoc, EndLoc);
	// Set the TextDraw so the player can see it
	TextDrawSetString(APlayerData[playerid][MissionText], RouteText);
	// Grab the x, y, z positions for the second location (to unload the goods)
	x = ALocations[APlayerData[playerid][JobLoc2]][LocX];
	y = ALocations[APlayerData[playerid][JobLoc2]][LocY];
	z = ALocations[APlayerData[playerid][JobLoc2]][LocZ];
	// Create a checkpoint where the player should unload the goods
	SetPlayerCheckpoint(playerid, x, y, z, 7);
	// Inform the player that he must unload his goods
	format(UnloadMsg, 128, TXT_DeliverCargoTo, Load, EndLoc);
	SendClientMessage(playerid, 0xFFFFFFFF, UnloadMsg);
}



// This is the timer used by every convoy (it updates and checks everything), is executed every 2.5 seconds
public Convoy_Timer(Convoy)
{
	// Setup local variables
	new LeaderID, MemberID;

	// Update the textdraws for all convoy members
    Convoy_UpdateTextDraws(Convoy);
	// Get the leader-id
	LeaderID = AConvoys[Convoy][Members][0];

    // Check the jobstep for the entire convoy
	switch (AConvoys[Convoy][ConvoyStep])
	{
		case 0: // Convoy has just been created, but a job hasn't started yet by the leader
		{
			new bool:AllSameTrailer = true;

			// Keep checking if the leader has started a job already
			if (APlayerData[LeaderID][JobStarted] == true)
			{
				// Copy the job-data from the leader to the convoy
				AConvoys[Convoy][LoadID] = APlayerData[LeaderID][LoadID];
				AConvoys[Convoy][Location1] = APlayerData[LeaderID][JobLoc1];
				AConvoys[Convoy][Location2] = APlayerData[LeaderID][JobLoc2];
				// Set the trailer-model required by all members to the convoy
				AConvoys[Convoy][TrailerModel] = GetVehicleModel(GetVehicleTrailer(GetPlayerVehicleID(LeaderID)));

				// First check if the leader has a trailer attached or not
				if (AConvoys[Convoy][TrailerModel] != 0)
				{
					// First check if all players have the correct trailer (except for the leader)
					for (new i = 1; i < CONVOY_MAX_MEMBERS; i++)
					{
						MemberID = AConvoys[Convoy][Members][i]; // Get the member-id from this member-spot
						if (MemberID != -1) // Check if the member-id is a valid playerid
						{
						    // Check if the player has the same trailer-model attached to his vehicle as the convoy requires
							if (GetVehicleModel(GetVehicleTrailer(GetPlayerVehicleID(MemberID))) != AConvoys[Convoy][TrailerModel])
							{
							    // Inform the player that he hasn't got the correct trailer
							    switch (AConvoys[Convoy][TrailerModel])
							    {
									case VehicleTrailerCargo, VehicleTrailerCargo2: TextDrawSetString(APlayerData[MemberID][MissionText], TXT_MemberNeedsCargoTrailer);
									case VehicleTrailerOre: TextDrawSetString(APlayerData[MemberID][MissionText], TXT_MemberNeedsOreTrailer);
									case VehicleTrailerFluids: TextDrawSetString(APlayerData[MemberID][MissionText], TXT_MemberNeedsFluidsTrailer);
								}
								// Not everyone has the same trailer
								AllSameTrailer = false;
							}
						}
					}
				}
				else // Leader has no trailer attached, so check for the vehiclemodel
				{
					// First check if all players have the correct trailer (except for the leader)
					for (new i = 1; i < CONVOY_MAX_MEMBERS; i++)
					{
						MemberID = AConvoys[Convoy][Members][i]; // Get the member-id from this member-spot
						if (MemberID != -1) // Check if the member-id is a valid playerid
						{
						    // Get the vehiclemodel of the member
						    new vModel = GetVehicleModel(GetPlayerVehicleID(MemberID));
						    // Check if the member has a valid trucking vehicle (flatbed or DFT30)
							switch (vModel)
							{
								case VehicleFlatbed, VehicleDFT30: AllSameTrailer = true;
								default:
								{
									TextDrawSetString(APlayerData[MemberID][MissionText], "Flatbed veya DFT-30'a ihtiyacýnýz var.");
									AllSameTrailer = false;
								}
							}
						}
					}
				}

				// If all members have the same trailer
				if (AllSameTrailer == true)
				{
					// Inform the leader that everyone has the same trailer
					SendClientMessage(LeaderID, 0xFFFFFFFF, TXT_AllMembersSameTrailer);

					// Start the same job for every member if they all have the same trailer
					for (new i = 1; i < CONVOY_MAX_MEMBERS; i++)
					{
						MemberID = AConvoys[Convoy][Members][i]; // Get the member-id from this member-spot
						if (MemberID != -1) // Check if the member-id is a valid playerid
							Convoy_StartMemberJob(MemberID, Convoy); // Start the job for the member
					}

					// Select the next step for the convoy (all members are now en-route to the loading-point)
	                AConvoys[Convoy][ConvoyStep] = 1;
					// Also close the convoy so no more members can join
				    AConvoys[Convoy][Status] = CONVOY_CLOSED;
				}
				else
				{
				    // Check if the leader has been informed already that not all members have the same trailer
					if (AConvoys[Convoy][LeaderInformedTrailers] == false)
					{
						// Inform the leader that not every member has the same trailer, convoy cannot start yet
						SendClientMessage(LeaderID, 0xFFFFFFFF, TXT_AllMembersNotSameTrailer);
						AConvoys[Convoy][LeaderInformedTrailers] = true; // Leader is informed now
					}
				}
			}
		}
		case 1: // Everyone has received their job-data (but haven't loaded their cargo yet)
		{
			new bool:AllMembersLoaded = true;

			// Check if everyone has loaded their cargo before moving on to convoystep 2
			for (new i; i < CONVOY_MAX_MEMBERS; i++)
			{
				MemberID = AConvoys[Convoy][Members][i]; // Get the playerid of the member
				if (MemberID != -1) // Check if the memberid is a valid id
					if (APlayerData[MemberID][JobStep] != 2) // Check if the player hasn't loaded his cargo yet
					    AllMembersLoaded = false; // Not all members have loaded their cargo yet
			}

			// Check if everyone has loaded their cargo
			if (AllMembersLoaded == true)
			{
				// Inform the leader that everyone has the same trailer
				SendClientMessage(LeaderID, 0xFFFFFFFF, TXT_AllMembersLoadedCargo);

				// Update the job for every member if they all have loaded their cargo
				for (new i; i < CONVOY_MAX_MEMBERS; i++)
				{
					MemberID = AConvoys[Convoy][Members][i]; // Get the member-id from this member-spot
					if (MemberID != -1) // Check if the member-id is a valid playerid
						Convoy_UpdateMemberJob(MemberID); // Start the job for the member
				}

				// Select the next step for the convoy (all members are now en-route to the unloading-point)
                AConvoys[Convoy][ConvoyStep] = 2;
			}
		}
		case 2: // Everybody has loaded their cargo and all members have their job updated, all members are en-route to the destination
		{
			// Check if everyone is staying close to the leader and check if all members have unloaded their cargo
			new bool:AllMembersUnloaded = true;

			// Also check if all players have delivered their load
			for (new i; i < CONVOY_MAX_MEMBERS; i++)
			{
				MemberID = AConvoys[Convoy][Members][i]; // Get the playerid of the member
				if (MemberID != -1) // Check if the memberid is a valid id
					if (APlayerData[MemberID][JobStep] != 4) // Check if the player hasn't unloaded his cargo yet
					    AllMembersUnloaded = false; // Not all members have unloaded their cargo yet
			}

			if (AllMembersUnloaded == true) // Check if all members have unloaded their cargo (nobody cleared this variable)
				AConvoys[Convoy][ConvoyStep] = 3; // Set the jobstep for the entire convoy to 3 (everybody unloaded their cargo, but jobs must still be payed out)
		}
		case 3: // Everybody has unloaded their cargo (now it's time to pay all members and finish the job)
		{
		    // Setup local variables
			new Float:x1, Float:y1, Float:x2, Float:y2, Float:Distance, Message[128], Payment, Bonus, NumMembers, Name[24], BonusMsg[128];

			// Count the number of members in the convoy
			NumMembers = Convoy_CountMembers(Convoy);

			// Get the name of the convoy-leader
			GetPlayerName(LeaderID, Name, sizeof(Name));

			// Grab the x, y, z positions for the first location (to load the goods)
			x1 = ALocations[APlayerData[LeaderID][JobLoc1]][LocX];
			y1 = ALocations[APlayerData[LeaderID][JobLoc1]][LocY];
			// Grab the x, y, z positions for the second location (to unload the goods)
			x2 = ALocations[APlayerData[LeaderID][JobLoc2]][LocX];
			y2 = ALocations[APlayerData[LeaderID][JobLoc2]][LocY];
			// Calculate the distance between both points
			Distance = floatsqroot(((x2 - x1) * (x2 - x1)) + ((y2 - y1) * (y2 - y1)));

			// Calculate the payment for the player
			Payment = floatround((Distance * ALoads[APlayerData[LeaderID][LoadID]][PayPerUnit]), floatround_floor);

			// Check if the convoy has done the bonus mission
			if (RandomBonusMission[MissionFinished] == false)
			{
				// Check all paramters (load, startlocation and end-location)
				if (RandomBonusMission[RandomLoad] == APlayerData[LeaderID][LoadID])
					if (RandomBonusMission[RandomStartLoc] == APlayerData[LeaderID][JobLoc1])
						if (RandomBonusMission[RandomEndLoc] == APlayerData[LeaderID][JobLoc2])
						{
						    Payment = Payment * 2; // Double the payment is the player was the first to do the bonus mission
                            RandomBonusMission[MissionFinished] = true; // Only one player/convoy can do the bonus mission, a new one is chosen next
							format(BonusMsg, 128, "{FFBB00}%s{00BBFF} liderliðindeki konvoy bonus görevi bitirdi.", Name);
							SendClientMessageToAll(0xFFFFFFFF, BonusMsg);
						}
			}

		    // Calculate convoy-bonus (standard payment of 100% and 25% extra for each convoy-member)
		    Bonus = (NumMembers * 25) + 100; // For every member, 25% bonus is added to the payment, on top of the standard payment
			// Calculate total payment for each member
			Payment = (Payment * Bonus) / 100;

			// Pay every member and finish their mission
			for (new i; i < CONVOY_MAX_MEMBERS; i++)
			{
				MemberID = AConvoys[Convoy][Members][i]; // Get the playerid of the member
				if (MemberID != -1) // Check if the memberid is a valid id
				{
					// Reward the player (give cash and points)
					RewardPlayer(MemberID, Payment, 5);

					// Increase the stats for completing a trucking job while in a convoy
					APlayerData[MemberID][StatsConvoyJobs]++;
					// Also save the data (in case the server crashes, progress would be lost)
					PlayerFile_Save(MemberID);

					// End the member's job
					Trucker_EndJob(MemberID);
					// Send a message to let the player know he finished his mission and got paid
					format(Message, 128, TXT_FinishedConvoy, Payment);
					SendClientMessage(MemberID, 0xFFFFFFFF, Message);
					// Also update the player's missiontext to inform the player that he must wait for the leader to start a job
					if (i != 0) // Skip this if the current index is the leader (the leader doesn't have to wait for a new job)
						TextDrawSetString(APlayerData[MemberID][MissionText], TXT_WaitingLeaderJob);
				}
			}

			// Clear the data in the convoy
			AConvoys[Convoy][LoadID] = 0; // Clear the load-id
			AConvoys[Convoy][Location1] = 0; // Clear the loadingpoint id
			AConvoys[Convoy][Location2] = 0; // Clear the unloading point id
			AConvoys[Convoy][Status] = CONVOY_OPEN; // Set status to "open" again, so new members can join
			AConvoys[Convoy][ConvoyStep] = 0; // Set convoystep to 0 (wait for a new job to be started by the leader)
			AConvoys[Convoy][TrailerModel] = 0; // Clear trailer model (the next job can be for another trailer)
			AConvoys[Convoy][LeaderInformedTrailers] = false; // Allow the leader to be informed again if not all members have the correct trailer
		}
	}

	return 1;
}



// This function is used to update the textdraws for the leader and all members (used by the convoy-timer)
Convoy_UpdateTextDraws(Convoy)
{
	// Setup local variables
	new LeaderID, MemberID, LeaderName[24], NumMembers, TextLeader[128], TextMember[128], LastMember[24], LastMemberID, Float:Distance;

	// Get the leader-id
	LeaderID = AConvoys[Convoy][Members][0];
	// Get the name of the convoy-leader
	GetPlayerName(LeaderID, LeaderName, sizeof(LeaderName));
	// Get the number of members of the convoy
	NumMembers = Convoy_CountMembers(Convoy);

	// Check if there members besides the leader
	if (NumMembers > 1)
	{
	    LastMemberID = Convoy_GetFurthestMember(Convoy); // Get the playerid of the member who is furthest away from the leader
		GetPlayerName(LastMemberID, LastMember, sizeof(LastMember)); // Get the name of the furthest member
		Distance = PlayerToPlayer(LeaderID, LastMemberID); // Get the distance to the last member
	}
	else // No other members are in the convoy yet
	{
		format(LastMember, 24, " - ");
		Distance = 0.0;
	}

	// Update the convoy-textdraw for the leader
	format(TextLeader, 128, TXT_LeaderInfoBar, NumMembers, LastMember, Distance);
	TextDrawSetString(AConvoys[Convoy][ConvoyTextLeader], TextLeader);
	// Enable the convoy-textDraw for the leader
	TextDrawShowForPlayer(LeaderID, AConvoys[Convoy][ConvoyTextLeader]);

	// Update the convoy-textdraw for every member
	for (new i = 1; i < CONVOY_MAX_MEMBERS; i++)
	{
		MemberID = AConvoys[Convoy][Members][i]; // Get the playerid of the member
		if (MemberID != -1) // Check if the memberid is a valid id
		{
			// Calculate the distance to the leader
			Distance = PlayerToPlayer(LeaderID, MemberID);
			// Update the textdraw for the members
			format(TextMember, 128, TXT_MemberInfoBar, LeaderName, Distance, NumMembers);
			TextDrawSetString(AConvoys[Convoy][ConvoyTextMember], TextMember);
			TextDrawShowForPlayer(MemberID, AConvoys[Convoy][ConvoyTextMember]);
		}
	}
}



// This function counts the members in the convoy
Convoy_CountMembers(Convoy)
{
	// Setup local variables
	new NumMembers;

	// Loop through all members
	for (new i; i < CONVOY_MAX_MEMBERS; i++)
	{
		// Check if there is a valid member-id stored (playerid)
		if (AConvoys[Convoy][Members][i] != -1)
		    NumMembers++; // Increase the number of members
	}

	// Return the number of members to the calling routine
	return NumMembers;
}



// This function checks the player and determines if he's a valid trucker who's able to create or join a convoy
Convoy_PlayerAllowed(playerid)
{
	// Make sure that the leader is a trucker
	if (APlayerData[playerid][PlayerClass] == ClassTruckDriver)
	{
		// Check if the player isn't a member of a convoy already
		if (APlayerData[playerid][InConvoy] == false)
		{
			// Make sure that the player hasn't started a job
			if (APlayerData[playerid][JobStarted] == false)
				return true; // The player is allowed to create or join a convoy
			else
			    SendClientMessage(playerid, 0xFFFFFFFF, TXT_CannotJoinJobStarted);
		}
		else
		    SendClientMessage(playerid, 0xFFFFFFFF, TXT_ConvoyAllreadyJoined);
	}
	else
	    SendClientMessage(playerid, 0xFFFFFFFF, TXT_ConvoyNeedsTruckerClass);

	// If any condition wasn't true, the player isn't allowed to create or join a convoy
	return false;
}

// This function sends the given message to all members of the convoy
Convoy_SendMessage(Convoy, Message[])
{
	// Setup local variables
	new MemberID;

	// Loop through all members
	for (new i; i < CONVOY_MAX_MEMBERS; i++)
	{
	    MemberID = AConvoys[Convoy][Members][i]; // Get the member-id on this index
	    if (MemberID != -1) // Check if this member has a valid playerid
		{
			SendClientMessage(MemberID, 0xFFFFFFFF, Message); // Send the given message to the member
		}
	}
}

// This function returns "true" is the given player is the leader of the convoy
stock Convoy_IsLeader(playerid, Convoy)
{
	// Check if the player is part of a convoy
	if ((APlayerData[playerid][InConvoy] == true) && (AConvoys[Convoy][Members][0] = playerid))
	    return true; // Player is in a convoy AND he's the leader of it
	else
	    return false; // Player is a member of the convoy (or not in the same convoy)
}

// This function returns true if the player is a member of the given convoy
stock Convoy_IsMember(playerid, Convoy)
{
	// Loop through all members (excluding the leader)
	for (new i = 1; i < CONVOY_MAX_MEMBERS; i++)
	    if (AConvoys[Convoy][Members][i] == playerid) // Check if this member is the given player
			return true; // Return true (the player is a member of the convoy)

	// If the given playerid wasn't found among the members, return false
	return false;
}



// A function that returns the member of a convoy that's the furthest away from the leader
Convoy_GetFurthestMember(Convoy)
{
	// Setup local variables
	new Float:distance = 0.0, Float:distance2 = 0.0, LeaderID, MemberID, result = -1;

	// Get the leader-id
	LeaderID = AConvoys[Convoy][Members][0];

	// Loop through all members (excluding the leader)
	for(new i = 1; i < CONVOY_MAX_MEMBERS; i++)
	{
		MemberID = AConvoys[Convoy][Members][i]; // Get the playerid of the member
		if (MemberID != -1) // Check if the memberid is a valid id
		{
			// Get the distance between leader and member
			distance2 = PlayerToPlayer(LeaderID, MemberID);
			// Check if the distance is bigger than the previous distance
			if(distance2 > distance)
			{
				// Store the distance
				distance = distance2;
				// Store the member-id
				result = MemberID;
			}
		}
	}

	// Return the vehicle-id of the closest vehicle
	return result;
}

// Get the distance between the two players
PlayerToPlayer(player1, player2)
{
	// Setup local variables
	new Float:pX, Float:pY, Float:pZ, Float:cX, Float:cY, Float:cZ, Float:distance;
	// Get the player1 position
	GetPlayerPos(player1, pX, pY, pZ);
	// Get the player2 position
	GetPlayerPos(player2, cX, cY, cZ);
	// Calculate the distance
	distance = floatsqroot(floatpower(floatabs(floatsub(cX, pX)), 2) + floatpower(floatabs(floatsub(cY, pY)), 2) + floatpower(floatabs(floatsub(cZ, pZ)), 2));
	// Return the distance to the calling routine
	return floatround(distance);
}

// ************************************************************************************************************************************************************
// PPC_Dialogs
// ************************************************************************************************************************************************************

// Process the Register-dialog
Dialog_Register(playerid, response, inputtext[])
{
	new file[100], Name[MAX_PLAYER_NAME]; // Setup local variables
	GetPlayerName(playerid, Name, sizeof(Name)); // Get the playername
	format(file, sizeof(file), PlayerFile, Name); // Construct the complete filename for this player's account

	switch (response) // Check which button was clicked
	{
		case 1: // Player clicked "Register"
		{
			// Check if the player entered a password
			if(strlen(inputtext)>0)
			{
				// Store the password
				format(APlayerData[playerid][PlayerPassword], 50, "%s", inputtext);

				// Create the file and save default data to it, then reload it (so all data is put into the correct place)
				PlayerFile_Create(playerid);
				PlayerFile_Load(playerid);

				// Send a message to the client to inform him that his account has been registered
				SendClientMessage(playerid, 0xFFFFFFFF, TXT_AccountRegistered);
				APlayerData[playerid][LoggedIn] = true; // The player has logged in properly
			}
			else
			{
				SendClientMessage(playerid, 0xFFFFFFFF, TXT_WrongPassword);
				SafeKick(playerid);
			}
		}
	    case 0: // Player clicked "Cancel"
		{
			// Show a message that the player must be registered to play on this server
			SendClientMessage(playerid, 0xFFFFFFFF, TXT_PlayerMustRegister);
		    // Kick the player
			SafeKick(playerid);
		}
	}

	return 1;
}



// Process the login-dialog
Dialog_Login(playerid, response, inputtext[])
{
	switch (response) // Check which button was clicked
	{
	    case 1: // Player clicked "Login"
		{
			// Check if the player entered a password
			if (strlen(inputtext) > 0)
			{
				// Check if the entered password is the same as the password saved in the player's account
			    if (strcmp(APlayerData[playerid][PlayerPassword], inputtext, false) == 0)
				{
					APlayerData[playerid][LoggedIn] = true; // The player has logged in properly
                    BankFile_Load(playerid); // Load your bank account (if it exists, the player will be notified about this)
					SendClientMessage(playerid, 0xFFFFFFFF, TXT_LoggedIn); // Send a message to the client to inform him that he logged in properly
					LoadPlayer3DText(playerid);
				}
				else
				{
					SendClientMessage(playerid, 0xFFFFFFFF, TXT_WrongPassword);
					SafeKick(playerid);
				}
			}
			else
			{
				SendClientMessage(playerid, 0xFFFFFFFF, TXT_WrongPassword);
				SafeKick(playerid);
			}
		}
	    case 0: // Player clicked "Cancel"
		{
			// Show a message that the player must be logged in to play on this server
			SendClientMessage(playerid, 0xFFFFFFFF, TXT_PlayerMustLogin);
		    // Kick the player
			SafeKick(playerid);
		}
	}

	return 1;
}



// Process the rescue dialog
Dialog_Rescue(playerid, response, listitem)
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Check the class of the player
	switch (APlayerData[playerid][PlayerClass])
	{
		case ClassTruckDriver:
		{
			// Set the spawn coordinates based on the selection in the list
			switch (listitem)
			{
				case 0: SetSpawnInfo(playerid, 0, GetPlayerSkin(playerid), -525.0, -502.0, 26.0, 0.0, 0, 0, 0, 0, 0, 0);
				case 1: SetSpawnInfo(playerid, 0, GetPlayerSkin(playerid), -74.7, -1137.5, 4.5, 0.0, 0, 0, 0, 0, 0, 0);
				case 2: SetSpawnInfo(playerid, 0, GetPlayerSkin(playerid), 1457.0, 975.5, 11.0, 0.0, 0, 0, 0, 0, 0, 0);
				case 3: SetSpawnInfo(playerid, 0, GetPlayerSkin(playerid), -2136.0, -247.5, 36.5, 270.0, 0, 0, 0, 0, 0, 0);
				case 4: SetSpawnInfo(playerid, 0, GetPlayerSkin(playerid), 1766.5, -2040.7, 14.0, 270.0, 0, 0, 0, 0, 0, 0);
				case 5: SetSpawnInfo(playerid, 0, GetPlayerSkin(playerid), -546.0, 2594.0, 54.0, 270.0, 0, 0, 0, 0, 0, 0);
				case 6: SetSpawnInfo(playerid, 0, GetPlayerSkin(playerid), 332.0, 900.0, 25.0, 205.0, 0, 0, 0, 0, 0, 0);
				case 7: SetSpawnInfo(playerid, 0, GetPlayerSkin(playerid), -1575.0, -2724.0, 49.0, 146.0, 0, 0, 0, 0, 0, 0);
			}
		}
		case ClassBusDriver:
		{
			// Set the spawn coordinates based on the selection in the list
			switch (listitem)
			{
				case 0: SetSpawnInfo(playerid, 0, GetPlayerSkin(playerid), 1809.0, -1905.0, 13.6, 90.0, 0, 0, 0, 0, 0, 0);
				case 1: SetSpawnInfo(playerid, 0, GetPlayerSkin(playerid), -1983.0, 110.0, 27.7, 180.0, 0, 0, 0, 0, 0, 0);
				case 2: SetSpawnInfo(playerid, 0, GetPlayerSkin(playerid), 1060.0, 1260.0, 11.0, 270.0, 0, 0, 0, 0, 0, 0);
			}
		}
		case ClassPilot:
		{
			// Set the spawn coordinates based on the selection in the list
			switch (listitem)
			{
				case 0: SetSpawnInfo(playerid, 0, GetPlayerSkin(playerid), 2010.0, -2345.0, 13.6, 90.0, 0, 0, 0, 0, 0, 0);
				case 1: SetSpawnInfo(playerid, 0, GetPlayerSkin(playerid), -1211.0, -105.0, 14.2, 135.0, 0, 0, 0, 0, 0, 0);
				case 2: SetSpawnInfo(playerid, 0, GetPlayerSkin(playerid), 1630.0, 1615.0, 10.9, 90.0, 0, 0, 0, 0, 0, 0);
			}
		}
		case ClassPolice:
		{
			// Set the spawn coordinates based on the selection in the list
			switch (listitem)
			{
				case 0: SetSpawnInfo(playerid, 0, GetPlayerSkin(playerid), 1568.5, -1693.5, 6.0, 180.0, 0, 0, 0, 0, 0, 0);
				case 1: SetSpawnInfo(playerid, 0, GetPlayerSkin(playerid), -1590.0, 716.25, -5.0, 270.0, 0, 0, 0, 0, 0, 0);
				case 2: SetSpawnInfo(playerid, 0, GetPlayerSkin(playerid), 2275.0, 2460.0, 10.9, 90.0, 0, 0, 0, 0, 0, 0);
			}
		}
		case ClassCourier:
		{
			// Set the spawn coordinates based on the selection in the list
			switch (listitem)
			{
				case 0: SetSpawnInfo(playerid, 0, GetPlayerSkin(playerid), 798.0, -618.75, 16.4, 0.0, 0, 0, 0, 0, 0, 0);
				case 1: SetSpawnInfo(playerid, 0, GetPlayerSkin(playerid), -1849.25, -135.0, 12.0, 90.0, 0, 0, 0, 0, 0, 0);
				case 2: SetSpawnInfo(playerid, 0, GetPlayerSkin(playerid), 1050.5, 1931.0, 10.9, 270.0, 0, 0, 0, 0, 0, 0);
			}
		}
	}

	SpawnPlayer(playerid); // Force the player to spawn at the requested coordinates
	SendClientMessage(playerid, 0xFFFFFFFF, TXT_PlayerRescued); // Send the player a message that using "/kurtul" costs $200
	// Reduce the player's money by 200
	if(APlayerData[playerid][VIP] == 0) RewardPlayer(playerid, -200, 0);

	return 1;
}



// Process the BuyLicense dialog
Dialog_BuyLicenses(playerid, response, listitem)
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	switch (listitem)
	{
		case 0: // Player wants to buy a trucker license
		{
			// Check if the player is a trucker
			if (APlayerData[playerid][PlayerClass] == ClassTruckDriver)
			{
			    // Check if the player hasn't acquired his trucker's license yet
				if (APlayerData[playerid][TruckerLicense] == 0)
				{
					// Check if the player has enough money and enough score
					if ((APlayerData[playerid][PlayerMoney] >= 50000) && (APlayerData[playerid][PlayerScore] >= 100))
					{
						// Withdraw the money and score from the player's account
						RewardPlayer(playerid, -50000, -100);
						// Give the player the trucker's license
						APlayerData[playerid][TruckerLicense] = 1;
						// Let the player know he acquired his trucker's license
						SendClientMessage(playerid, 0xFFFFFFFF, TXT_TruckerLicenseBought);
					}
					else
					    SendClientMessage(playerid, 0xFFFFFFFF, TXT_TruckerLicenseNotEnoughMoney);
				}
				else
				    SendClientMessage(playerid, 0xFFFFFFFF, TXT_TruckerLicenseOwned);
			}
			else
				SendClientMessage(playerid, 0xFFFFFFFF, TXT_TruckerLicenseWrongClass);
		}
		case 1: // Player wants to buy a busdriver license
		{
			// Check if the player is a busdriver
			if (APlayerData[playerid][PlayerClass] == ClassBusDriver)
			{
			    // Check if the player hasn't acquired his busdriver's license yet
				if (APlayerData[playerid][BusLicense] == 0)
				{
					// Check if the player has enough money and enough score
					if ((APlayerData[playerid][PlayerMoney] >= 25000) && (APlayerData[playerid][PlayerScore] >= 50))
					{
						// Withdraw the money and score from the player's account
						RewardPlayer(playerid, -25000, -50);
						// Give the player the busdriver's license
						APlayerData[playerid][BusLicense] = 1;
						// Let the player know he acquired his busdriver's license
						SendClientMessage(playerid, 0xFFFFFFFF, TXT_BusLicenseBought);
					}
					else
					    SendClientMessage(playerid, 0xFFFFFFFF, TXT_BusLicenseNotEnoughMoney);
				}
				else
				    SendClientMessage(playerid, 0xFFFFFFFF, TXT_BusLicenseOwned);
			}
			else
				SendClientMessage(playerid, 0xFFFFFFFF, TXT_BusLicenseWrongClass);
		}
	}

	return 1;
}



// Process the work dialog for licensed truckers (show the list of loads after the player selected to choose his own load)
Dialog_TruckerSelectJobMethod(playerid, response, listitem)
{
	// Setup local variables
	new ProductList[50], NumProducts, TotalLoadList[1000];

	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Select what to do after the player chose "Select your own load" or "Auto assigned load"
	switch (listitem)
	{
		case 0: // Let the player choose his own load
		{
			switch (GetVehicleModel(GetPlayerVehicleID(playerid))) // Check the vehicle-model of the player to decide which loads the player can carry
			{
				case VehicleFlatbed, VehicleDFT30: // If the player's vehicle is a "Flatbed" or "DFT-30"
					ProductList = Product_GetList(PCV_TruckerNoTrailer, NumProducts); // Build a list of products defined for truckers without a trailer
				case VehicleCementTruck: // If the player's vehicle is a "CementTruck"
					ProductList = Product_GetList(PCV_TruckerCementTruck, NumProducts); // Build a list of products defined for truckers witha cement truck
				case VehicleLineRunner, VehicleTanker, VehicleRoadTrain: // If the player's vehicle is a "LineRunner", "Tanker" or "RoadTrain"
				{
					switch (GetVehicleModel(GetVehicleTrailer(GetPlayerVehicleID(playerid)))) // Select the loads based on the trailer model of the player
					{
						case VehicleTrailerCargo, VehicleTrailerCargo2: // A cargo-trailer is attached
							ProductList = Product_GetList(PCV_TruckerCargoTrailer, NumProducts); // Build a list of products defined for truckers with a cargo-trailer
						case VehicleTrailerOre: // An Ore-trailer is attached
							ProductList = Product_GetList(PCV_TruckerOreTrailer, NumProducts); // Build a list of products defined for truckers with an ore-trailer
						case VehicleTrailerFluids: // A fluids-trailer is attached
							ProductList = Product_GetList(PCV_TruckerFluidsTrailer, NumProducts); // Build a list of products defined for truckers with a fluids-trailer
					}
				}
			}

			// Build the List with product-names
			for (new i; i < NumProducts; i++)
				format(TotalLoadList, 1000, "%s%s\n", TotalLoadList, ALoads[ProductList[i]][LoadName]);

			// Let the player choose a load
 			ShowPlayerDialog(playerid, DialogTruckerSelectLoad, DIALOG_STYLE_LIST, TXT_TruckerDialogSelectLoad, TotalLoadList, TXT_DialogButtonSelect, TXT_DialogButtonCancel);
		}

		case 1: Trucker_StartRandomJob(playerid); // Start a random trucker-job
	}

	return 1;
}



// Process the selected load and create the startlocation-dialog
Dialog_TruckerSelectLoad(playerid, response, listitem)
{
    // Setup local variables
	new TotalStartLocList[1000], ProductList[50], NumProducts, ProductID, LocID;

	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// First get the list of products again, so we can retrieve the selected load from it
	switch (GetVehicleModel(GetPlayerVehicleID(playerid))) // Check the vehicle-model of the player
	{
		case VehicleFlatbed, VehicleDFT30: // If the player's vehicle is a "Flatbed" or "DFT-30"
			ProductList = Product_GetList(PCV_TruckerNoTrailer, NumProducts); // Build a list of products defined for truckers without a trailer
		case VehicleCementTruck: // If the player's vehicle is a "CementTruck"
			ProductList = Product_GetList(PCV_TruckerCementTruck, NumProducts); // Build a list of products defined for truckers witha cement truck
		case VehicleLineRunner, VehicleTanker, VehicleRoadTrain: // If the player's vehicle is a "LineRunner", "Tanker" or "RoadTrain"
		{
			switch (GetVehicleModel(GetVehicleTrailer(GetPlayerVehicleID(playerid)))) // Select the loads based on the trailer model of the player
			{
				case VehicleTrailerCargo, VehicleTrailerCargo2: // A cargo-trailer is attached
					ProductList = Product_GetList(PCV_TruckerCargoTrailer, NumProducts); // Build a list of products defined for truckers with a cargo-trailer
				case VehicleTrailerOre: // An Ore-trailer is attached
					ProductList = Product_GetList(PCV_TruckerOreTrailer, NumProducts); // Build a list of products defined for truckers with an ore-trailer
				case VehicleTrailerFluids: // A fluids-trailer is attached
					ProductList = Product_GetList(PCV_TruckerFluidsTrailer, NumProducts); // Build a list of products defined for truckers with a fluids-trailer
			}
		}
	}

	// Store the selected LoadID in the player's account
	APlayerData[playerid][LoadID] = ProductList[listitem];
	ProductID = APlayerData[playerid][LoadID];

	// Build a list of start-locations for this product
	for (new i; i < 30; i++)
	{
	    // Get the location-id
	    LocID = ALoads[ProductID][FromLocations][i];
	    // Check if it a valid location-id (not 0)
	    if (LocID != 0)
			format(TotalStartLocList, 1000, "%s%s\n", TotalStartLocList, ALocations[LocID][LocationName]); // Add the location-name to the list
		else
		    break; // As soon as an invalid location-id has been found, stop adding entries to the location-list
	}

	// Ask the player to choose a start-location
	ShowPlayerDialog(playerid, DialogTruckerStartLoc, DIALOG_STYLE_LIST, TXT_TruckerDialogSelectStartLoc, TotalStartLocList, TXT_DialogButtonSelect, TXT_DialogButtonCancel); // Let the player choose a starting location

	return 1;
}



// Process the selected startlocation and create the endlocation-dialog
Dialog_TruckerSelectStartLoc(playerid, response, listitem)
{
    // Setup local variables
	new ProductID, LocID, TotalEndLocList[1000];

	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Get the LoadID that's stored in the player's account
	ProductID = APlayerData[playerid][LoadID];
	// Store the chosen start-location in the player's account
	APlayerData[playerid][JobLoc1] = ALoads[ProductID][FromLocations][listitem];

	// Build a list of end-locations for this product
	for (new i; i < 30; i++)
	{
	    // Get the location-id
	    LocID = ALoads[ProductID][ToLocations][i];
	    // Check if it a valid location-id (not 0)
	    if (LocID != 0)
			format(TotalEndLocList, 1000, "%s%s\n", TotalEndLocList, ALocations[LocID][LocationName]); // Add the location-name to the list
		else
		    break; // As soon as an invalid location-id has been found, stop adding entries to the location-list
	}

	// Ask the player to choose an end-location
	ShowPlayerDialog(playerid, DialogTruckerEndLoc, DIALOG_STYLE_LIST, TXT_TruckerDialogSelectEndLoc, TotalEndLocList, TXT_DialogButtonSelect, TXT_DialogButtonCancel); // Let the player choose a endlocation

	return 1;
}



// Process the selected endlocation and start the job
Dialog_TruckerSelectEndLoc(playerid, response, listitem)
{
    // Setup local variables
	new RouteText[128], loadName[50], startlocName[50], endlocName[50], LoadMsg[128], Float:x, Float:y, Float:z, ProductID;

	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Get the LoadID that's stored in the player's account
	ProductID = APlayerData[playerid][LoadID];
	// Store the chosen end-location in the player's account
	APlayerData[playerid][JobLoc2] = ALoads[ProductID][ToLocations][listitem];

    // Get the names for the load, startlocation and endlocation
	format(loadName, 50, "%s", ALoads[ProductID][LoadName]);
	format(startlocName, 50, "%s", ALocations[APlayerData[playerid][JobLoc1]][LocationName]);
	format(endlocName, 50, "%s", ALocations[APlayerData[playerid][JobLoc2]][LocationName]);

	// Job has started
	APlayerData[playerid][JobStarted] = true;
	// Store the vehicleID (required to be able to check if the player left his vehicle)
	APlayerData[playerid][VehicleID] = GetPlayerVehicleID(playerid);
	// Store the trailerID (required to be able to check if the player lost his trailer)
	APlayerData[playerid][TrailerID] = GetVehicleTrailer(GetPlayerVehicleID(playerid));
	// Set jobstep to 1 (going to load the goods)
	APlayerData[playerid][JobStep] = 1;
	// Combine all data into a string for the TextDraw (the player can see this all the time) to describe the mission
	format(RouteText, 255, TXT_HaulingCargoFromToPickup, loadName, startlocName, endlocName);
	// Set the TextDraw so the player can see it
	TextDrawSetString(APlayerData[playerid][MissionText], RouteText);
	// Grab the x, y, z positions for the first location
	x = ALocations[APlayerData[playerid][JobLoc1]][LocX];
	y = ALocations[APlayerData[playerid][JobLoc1]][LocY];
	z = ALocations[APlayerData[playerid][JobLoc1]][LocZ];
	// Create a checkpoint where the player should load the goods
	SetPlayerCheckpoint(playerid, x, y, z, 7);
	// Set the job-fail-time for the global vehicle-timer
	APlayerData[playerid][VehicleTimerTime] = Job_TimeToFailMission;
	// Inform the player that he must load his goods
	format(LoadMsg, 128, TXT_PickupCargoAt, loadName, startlocName);
	SendClientMessage(playerid, 0xFFFFFFFF, LoadMsg);

	return 1;
}



// Process the work dialog for licensed busdrivers (show the list of busroutes after the player selected to choose his own route)
Dialog_BusSelectJobMethod(playerid, response, listitem)
{
	// Setup local variables
	new BusLine, Description[100], TotalRouteList[500];

	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

    // Check if the player already started a job
	if (APlayerData[playerid][JobStarted] == false)
	{
		// Select what to do after the player chose "Choose your own busroute" or "Auto assigned busroute"
		switch (listitem)
		{
			case 0: // Let the player choose his own busroute
			{
				// Construct the list of busroutes
				for (new i; i < sizeof(ABusRoutes); i++)
				{
					// Get the data about the route
					BusLine = ABusRoutes[i][LineNumber];
					format(Description, 100, ABusRoutes[i][RouteDescription]);
					// Add the busline to the list
					format(TotalRouteList, 500, "%s%Durak %i (%s)", TotalRouteList, "\n", BusLine, Description);
				}

				// Let the player choose a busroute
 				ShowPlayerDialog(playerid, DialogBusSelectRoute, DIALOG_STYLE_LIST, TXT_SelectBusRoute, TotalRouteList, TXT_DialogButtonSelect, TXT_DialogButtonCancel);
			}

			case 1: BusDriver_StartJob(playerid, random(sizeof(ABusRoutes))); // Start a random job
		}
	}
	else // Send a message to let the player know he already has a job
	    SendClientMessage(playerid, 0xFFFFFFFF, TXT_BusdriverAlreadyDoingJob);

	return 1;
}

// Process the work dialog for licensed busdrivers (let the player start the job he selects from the busroute-list)
Dialog_BusSelectRoute(playerid, response, listitem)
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// The selected listitem is automatically the busroute, so start the job based on the item selected in the busroute-list
	BusDriver_StartJob(playerid, listitem);

	return 1;
}



// Process the chosen quantity for courier job
Dialog_CourierSelectQuant(playerid, response, listitem)
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Listitem 0 represent maximum 2 houses to deliver a package, listitem 1 is max 5 houses, item 2 is max 10 houses
	switch (listitem)
	{
		case 0: APlayerData[playerid][CourierMaxStep] = 2;
		case 1: APlayerData[playerid][CourierMaxStep] = 5;
		case 2: APlayerData[playerid][CourierMaxStep] = 10;
	}

	// Start the job
	Courier_BeginJob(playerid);

	return 1;
}



// Process the bike dialog
Dialog_Bike(playerid, response, listitem)
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Setup local variables
	new Float:x, Float:y, Float:z, Float:rot, CarID, msg[120], vID, pName[24];
	new engine,lights,alarm,doors,bonnet,boot,objective;

	// Get the player's position and name
	GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, rot);
	GetPlayerName(playerid, pName, 24);

	// Spawn the motorcycle based on the selection in the list, and spawn it 5 units north of the player
	switch (listitem)
	{
		case 0: CarID = VehicleBike; // Bike
		case 1: CarID = VehicleBMX; // BMX
		case 2: CarID = VehicleMountainBike; // Mountain Bike
		case 3: CarID = VehicleFaggio; // Faggio
		case 4: CarID = VehiclePizzaBoy; // Pizzaboy
		case 5: CarID = VehicleBF400; // BF-400
		case 6: CarID = VehicleNRG500; // NRG-500
		case 7: CarID = VehiclePCJ600; // PCJ-600
		case 8: CarID = VehicleFCR900; // FCR-900
		case 9: CarID = VehicleFreeway; // Freeway
		case 10: CarID = VehicleWayfarer; // Wayfarer
		case 11: CarID = VehicleSanchez; // Sanchez
		case 12: CarID = VehicleQuad; // Quad
	}

	// Spawn the vehicle based on the selection in the list with a random color
	// Also set max-fuel and save the model for the vehicle
	vID = Vehicle_Create(CarID, x, y, z, rot, random(126), random(126), 600);
	// Put the player in the vehicle
	PutPlayerInVehicle(playerid, vID, 0);
	// Turn on the engine and lights
	GetVehicleParamsEx(vID, engine, lights, alarm, doors, bonnet, boot, objective);
	SetVehicleParamsEx(vID, 1, 1, alarm, doors, bonnet, boot, objective);
	// Store the player's current location and interior-id, otherwise anti-airbreak hack code could kick you
	GetPlayerPos(playerid, APlayerData[playerid][PreviousX], APlayerData[playerid][PreviousY], APlayerData[playerid][PreviousZ]);
	APlayerData[playerid][PreviousInt] = GetPlayerInterior(playerid);
	// Inform all players about it
	format(msg, 120, TXT_PlayerSpawnedVehicle, pName, vID, CarID, x, y, z);
	SendClientMessageToAll(0xFFFFFFFF, msg);

	return 1;
}



// Process the car dialog
Dialog_Car(playerid, response, listitem)
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response)
	{
		// Reset the FirstCar (so the list won't start at an unexpected location in the list, but back at the start of the list)
		APlayerData[playerid][DialogCarFirstCar] = 0;
		return 1; // Exit the function
	}

	// Process the selected listitem
	switch (listitem)
	{
		case 10: // Player chooses the empty line between the carlist and "Next...", so refresh the current list
		{
		    // Refresh the current list of cars and let the player choose one (show dialog)
		    CarList_Create(playerid);
			// Exit the function
			return 1;
		}
		case 11: // Player chooses "Next..."
		{
		    // Add 10 to the FirstCar, so the list will start further down the array (will show the next 10 cars)
		    APlayerData[playerid][DialogCarFirstCar] = APlayerData[playerid][DialogCarFirstCar] + 10;
		    // Create a new list of cars and show the dialog
		    CarList_Create(playerid);
		}
		default: // Player chooses a car
		{
		    // Setup local variables
	    	new Float:x, Float:y, Float:z, Float:rot, CarIndex, msg[128], vID, pName[24];
			new engine,lights,alarm,doors,bonnet,boot,objective;

			// FirstCar is the index of the first car in the list, so select the proper index when a car is chosen by the player
			CarIndex = APlayerData[playerid][DialogCarFirstCar] + listitem;

			// Get the player's position and name
			GetPlayerPos(playerid, x, y, z);
			GetPlayerFacingAngle(playerid, rot);
			GetPlayerName(playerid, pName, 24);

			// Spawn the vehicle based on the selection in the list with a random color
			// Also set max-fuel and save the model for the vehicle
			vID = Vehicle_Create(ACars[CarIndex][CarModel], x, y, z, rot, random(126), random(126), 600);
			// Put the player in the vehicle
			PutPlayerInVehicle(playerid, vID, 0);
			// Turn on the engine and lights
			GetVehicleParamsEx(vID, engine, lights, alarm, doors, bonnet, boot, objective);
			SetVehicleParamsEx(vID, 1, 1, alarm, doors, bonnet, boot, objective);
			// Store the player's current location and interior-id, otherwise anti-airbreak hack code could kick you
			GetPlayerPos(playerid, APlayerData[playerid][PreviousX], APlayerData[playerid][PreviousY], APlayerData[playerid][PreviousZ]);
			APlayerData[playerid][PreviousInt] = GetPlayerInterior(playerid);
			// Inform all players about it
			format(msg, 120, TXT_PlayerSpawnedVehicle, pName, vID, ACars[CarIndex][CarModel], x, y, z);
			SendClientMessageToAll(0xFFFFFFFF, msg);
			// Also, after spawning a vehicle, reset FirstCar (so next time, the list starts from the start)
			APlayerData[playerid][DialogCarFirstCar] = 0;
		}
	}

	return 1;
}



// Process the Plane dialog
Dialog_Plane(playerid, response, listitem)
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response)
	{
		// Reset the FirstPlane (so the list won't start at an unexpected location in the list, but back at the start of the list)
		APlayerData[playerid][DialogPlaneFirstPlane] = 0;
		return 1; // Exit the function
	}

	// Process the selected listitem
	switch (listitem)
	{
		case 10: // Player chooses the empty line between the Planelist and "Next...", so refresh the current list
		{
		    // Refresh the current list of Planes and let the player choose one (show dialog)
		    PlaneList_Create(playerid);
			// Exit the function
			return 1;
		}
		case 11: // Player chooses "Next..."
		{
		    // Add 10 to the FirstPlane, so the list will start further down the array (will show the next 10 Planes)
		    APlayerData[playerid][DialogPlaneFirstPlane] = APlayerData[playerid][DialogPlaneFirstPlane] + 10;
		    // Create a new list of Planes and show the dialog
		    PlaneList_Create(playerid);
		}
		default: // Player chooses a Plane
		{
		    // Setup local variables
	    	new Float:x, Float:y, Float:z, Float:rot, PlaneIndex, msg[128], vID, pName[24];
			new engine,lights,alarm,doors,bonnet,boot,objective;

			// FirstPlane is the index of the first Plane in the list, so select the proper index when a Plane is chosen by the player
			PlaneIndex = APlayerData[playerid][DialogPlaneFirstPlane] + listitem;

			// Get the player's position and name
			GetPlayerPos(playerid, x, y, z);
			GetPlayerFacingAngle(playerid, rot);
			GetPlayerName(playerid, pName, 24);

			// Spawn the vehicle based on the selection in the list with a random color
			// Also set max-fuel and save the model for the vehicle
			vID = Vehicle_Create(APlanes[PlaneIndex][PlaneModel], x, y, z, rot, random(126), random(126), 600);
			// Put the player in the vehicle
			PutPlayerInVehicle(playerid, vID, 0);
			// Turn on the engine and lights
			GetVehicleParamsEx(vID, engine, lights, alarm, doors, bonnet, boot, objective);
			SetVehicleParamsEx(vID, 1, 1, alarm, doors, bonnet, boot, objective);
			// Store the player's current location and interior-id, otherwise anti-airbreak hack code could kick you
			GetPlayerPos(playerid, APlayerData[playerid][PreviousX], APlayerData[playerid][PreviousY], APlayerData[playerid][PreviousZ]);
			APlayerData[playerid][PreviousInt] = GetPlayerInterior(playerid);
			// Inform the player about it
			format(msg, 128, TXT_PlayerSpawnedVehicle, pName, vID, APlanes[PlaneIndex][PlaneModel], x, y, z);
			SendClientMessageToAll(0xFFFFFFFF, msg);
			// Also, after spawning a vehicle, reset FirstPlane (so next time, the list starts from the start)
			APlayerData[playerid][DialogPlaneFirstPlane] = 0;
		}
	}

	return 1;
}



// Process the Trailer dialog
Dialog_Trailer(playerid, response, listitem)
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response)
	{
		// Reset the FirstTrailer (so the list won't start at an unexpected location in the list, but back at the start of the list)
		APlayerData[playerid][DialogTrailerFirstTrailer] = 0;
		return 1; // Exit the function
	}

	// Process the selected listitem
	switch (listitem)
	{
		case 10: // Player chooses the empty line between the Trailerlist and "Next...", so refresh the current list
		{
		    // Refresh the current list of Trailers and let the player choose one (show dialog)
		    TrailerList_Create(playerid);
			// Exit the function
			return 1;
		}
		case 11: // Player chooses "Next..."
		{
		    // Add 10 to the FirstTrailer, so the list will start further down the array (will show the next 10 Trailers)
		    APlayerData[playerid][DialogTrailerFirstTrailer] = APlayerData[playerid][DialogTrailerFirstTrailer] + 10;
		    // Create a new list of Trailers and show the dialog
		    TrailerList_Create(playerid);
		}
		default: // Player chooses a Trailer
		{
		    // Setup local variables
	    	new Float:x, Float:y, Float:z, TrailerIndex, msg[128], vID, pName[24];

			// FirstTrailer is the index of the first Trailer in the list, so select the proper index when a Trailer is chosen by the player
			TrailerIndex = APlayerData[playerid][DialogTrailerFirstTrailer] + listitem;

			// Get the player's position and name
			GetPlayerPos(playerid, x, y, z);
			GetPlayerName(playerid, pName, 24);

			// Spawn the vehicle based on the selection in the list with a random color, and spawn it 10 units north of the player
			// Also set max-fuel and save the model for the vehicle
			vID = Vehicle_Create(ATrailers[TrailerIndex][TrailerModel], x, y + 10.0, z + 5.0, 0.0, random(126), random(126), 600);
			// Inform the player about it
			format(msg, 128, TXT_PlayerSpawnedVehicle, pName, vID, ATrailers[TrailerIndex][TrailerModel], x, y + 10.0, z + 5.0);
			SendClientMessageToAll(0xFFFFFFFF, msg);
			// Also, after spawning a vehicle, reset FirstTrailer (so next time, the list starts from the start)
			APlayerData[playerid][DialogTrailerFirstTrailer] = 0;
		}
	}

	return 1;
}



// Process the boat dialog
Dialog_Boat(playerid, response, listitem)
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Setup local variables
	new Float:x, Float:y, Float:z, Float:rot, CarID, msg[120], vID, pName[24];
	new engine,lights,alarm,doors,bonnet,boot,objective;

	// Get the player's position and name
	GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, rot);
	GetPlayerName(playerid, pName, 24);

	// Spawn the boat based on the selection in the list
	switch (listitem)
	{
		case 0: CarID = VehicleCoastguard; // Coastguard
		case 1: CarID = VehicleDinghy; // Dinghy
		case 2: CarID = VehicleJetmax; // Jetmax
		case 3: CarID = VehicleLaunch; // Launch
		case 4: CarID = VehicleMarquis; // Marquis
		case 5: CarID = VehiclePredator; // Predator
		case 6: CarID = VehicleReefer; // Reefer
		case 7: CarID = VehicleSpeeder; // Speeder
		case 8: CarID = VehicleSquallo; // Squallo
		case 9: CarID = VehicleTropic; // Tropic
	}

	// Spawn the vehicle based on the selection in the list with a random color
	// Also set max-fuel and save the model for the vehicle
	vID = Vehicle_Create(CarID, x, y, z, rot, random(126), random(126), 600);
	// Put the player in the vehicle
	PutPlayerInVehicle(playerid, vID, 0);
	// Turn on the engine and lights
	GetVehicleParamsEx(vID, engine, lights, alarm, doors, bonnet, boot, objective);
	SetVehicleParamsEx(vID, 1, 1, alarm, doors, bonnet, boot, objective);
	// Store the player's current location and interior-id, otherwise anti-airbreak hack code could kick you
	GetPlayerPos(playerid, APlayerData[playerid][PreviousX], APlayerData[playerid][PreviousY], APlayerData[playerid][PreviousZ]);
	APlayerData[playerid][PreviousInt] = GetPlayerInterior(playerid);
	// Inform all players about it
	format(msg, 120, TXT_PlayerSpawnedVehicle, pName, vID, CarID, x, y, z);
	SendClientMessageToAll(0xFFFFFFFF, msg);

	return 1;
}



// Process the neon dialog
Dialog_Neon(playerid, response, listitem)
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Setup local variables
	new vehicleid;

	// Get the player's vehicle
	vehicleid = GetPlayerVehicleID(playerid);

	// Check if the player chose anothet option than "Remove neons"
	if (listitem != 7)
	{
		// Check if the vehicle already has neon lights attached
	    if (AVehicleData[vehicleid][NeonObjectModel] != 0)
	    {
	        // Delete the current neon-lights and clear the variables
            DestroyObject(AVehicleData[vehicleid][NeonLeft]);
            DestroyObject(AVehicleData[vehicleid][NeonRight]);
            AVehicleData[vehicleid][NeonLeft] = 0;
            AVehicleData[vehicleid][NeonRight] = 0;
            AVehicleData[vehicleid][NeonObjectModel] = 0;
	    }
	}

	// Process the option chosen from the dialog
	if (listitem == 0) // Police Light
	{
	    AVehicleData[vehicleid][NeonLeft] = CreateObject(18646,0,0,0,0,0,0);
	    AVehicleData[vehicleid][NeonRight] = CreateObject(18646,0,0,0,0,0,0);
		AVehicleData[vehicleid][NeonObjectModel] = 18646;
		AttachObjectToVehicle(AVehicleData[vehicleid][NeonLeft], vehicleid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
		AttachObjectToVehicle(AVehicleData[vehicleid][NeonRight], vehicleid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
		GameTextForPlayer(playerid, "~p~Police lambasi~w~ araciniza eklendi", 3500, 5);
	}

	if (listitem == 1) // Red light
	{
	    AVehicleData[vehicleid][NeonLeft] = CreateObject(18647,0,0,0,0,0,0);
	    AVehicleData[vehicleid][NeonRight] = CreateObject(18647,0,0,0,0,0,0);
		AVehicleData[vehicleid][NeonObjectModel] = 18647;
		AttachObjectToVehicle(AVehicleData[vehicleid][NeonLeft], vehicleid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
		AttachObjectToVehicle(AVehicleData[vehicleid][NeonRight], vehicleid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
		GameTextForPlayer(playerid, "~p~Kirmizi Neon~w~ araciniza eklendi", 3500, 5);
	}

	if (listitem == 2) // Blue light
	{
	    AVehicleData[vehicleid][NeonLeft] = CreateObject(18648,0,0,0,0,0,0);
	    AVehicleData[vehicleid][NeonRight] = CreateObject(18648,0,0,0,0,0,0);
		AVehicleData[vehicleid][NeonObjectModel] = 18648;
		AttachObjectToVehicle(AVehicleData[vehicleid][NeonLeft], vehicleid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
		AttachObjectToVehicle(AVehicleData[vehicleid][NeonRight], vehicleid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
		GameTextForPlayer(playerid, "~p~Mavi Neon~w~ araciniza eklendi", 3500, 5);
	}

	if (listitem == 3) // Green Light
	{
	    AVehicleData[vehicleid][NeonLeft] = CreateObject(18649,0,0,0,0,0,0);
	    AVehicleData[vehicleid][NeonRight] = CreateObject(18649,0,0,0,0,0,0);
		AVehicleData[vehicleid][NeonObjectModel] = 18649;
		AttachObjectToVehicle(AVehicleData[vehicleid][NeonLeft], vehicleid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
		AttachObjectToVehicle(AVehicleData[vehicleid][NeonRight], vehicleid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
		GameTextForPlayer(playerid, "~p~Yesil Neon~w~ araciniza eklendi", 3500, 5);
	}

	if (listitem == 4) // Yellow Light
	{
	    AVehicleData[vehicleid][NeonLeft] = CreateObject(18650,0,0,0,0,0,0);
	    AVehicleData[vehicleid][NeonRight] = CreateObject(18650,0,0,0,0,0,0);
		AVehicleData[vehicleid][NeonObjectModel] = 18650;
		AttachObjectToVehicle(AVehicleData[vehicleid][NeonLeft], vehicleid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
		AttachObjectToVehicle(AVehicleData[vehicleid][NeonRight], vehicleid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
		GameTextForPlayer(playerid, "~p~Sari Neon~w~ araciniza eklendi", 3500, 5);
	}

	if (listitem == 5) // Pink Light
	{
	    AVehicleData[vehicleid][NeonLeft] = CreateObject(18651,0,0,0,0,0,0);
	    AVehicleData[vehicleid][NeonRight] = CreateObject(18651,0,0,0,0,0,0);
		AVehicleData[vehicleid][NeonObjectModel] = 18651;
		AttachObjectToVehicle(AVehicleData[vehicleid][NeonLeft], vehicleid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
		AttachObjectToVehicle(AVehicleData[vehicleid][NeonRight], vehicleid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
		GameTextForPlayer(playerid, "~p~Pembe Neon~w~ araciniza eklendi", 3500, 5);
	}

	if (listitem == 6) // White Light
	{
	    AVehicleData[vehicleid][NeonLeft] = CreateObject(18652,0,0,0,0,0,0);
	    AVehicleData[vehicleid][NeonRight] = CreateObject(18652,0,0,0,0,0,0);
		AVehicleData[vehicleid][NeonObjectModel] = 18652;
		AttachObjectToVehicle(AVehicleData[vehicleid][NeonLeft], vehicleid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
		AttachObjectToVehicle(AVehicleData[vehicleid][NeonRight], vehicleid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
		GameTextForPlayer(playerid, "~p~Beyaz Neon~w~ araciniza eklendi", 3500, 5);
	}

	if (listitem == 7) // Remove neons
	{
        // Delete the current neon-lights and clear the variables
        DestroyObject(AVehicleData[vehicleid][NeonLeft]);
        DestroyObject(AVehicleData[vehicleid][NeonRight]);
        AVehicleData[vehicleid][NeonLeft] = 0;
        AVehicleData[vehicleid][NeonRight] = 0;
		AVehicleData[vehicleid][NeonObjectModel] = 0;
		GameTextForPlayer(playerid, "Aracinizdaki neonlar kaldirildi", 3500, 5);
	}

	return 1;
}



// Process the chosen vehicleclass to show the actual vehicle-list of this vehicleclass
Dialog_RentProcessClass(playerid, response, listitem)
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Setup local variables
	new CarList[1000], DialogTitle[128];

	// Set the player's chosen vehicle-class based on the listitem he chose (add 1 as the vehicleclass starts at 1)
	APlayerData[playerid][DialogRentVClass] = listitem + 1;

	// Add all vehicles of the same class to the list
	for (new i; i < sizeof(ABuyableVehicles); i++)
	{
		// Check if the vehicle in the list has the same class as requested
		if (ABuyableVehicles[i][VehicleClass] == APlayerData[playerid][DialogRentVClass])
		{
			// Add the carname to the list and it's price
			format(CarList, 1000, "%s%s%s ($%i)", CarList, "\n", ABuyableVehicles[i][CarName], ABuyableVehicles[i][Price] / 10); // Add the name of the next car to the list on the next line
		}
	}

	// Check if the list is empty
	if (strlen(CarList) == 0)
	{
		// Send the player a message that all vehicles have been disabled of the chosen class (no vehicles in the array of this class)
		SendClientMessage(playerid, 0xFFFFFFFF, TXT_BuyRentCarEmptyList);
		// Exit the function (don't ask to choose a vehicle)
		return 1;
	}

	// Set a title for the dialog based on the requested vehicleclass
	switch (APlayerData[playerid][DialogRentVClass])
	{
		case VClassBike: format(DialogTitle, 128, TXT_RentBike);
		case VClassBoat: format(DialogTitle, 128, TXT_RentBoat);
		case VClassConvertible: format(DialogTitle, 128, TXT_RentConvertible);
		case VClassHelicopter: format(DialogTitle, 128, TXT_RentHelicopter);
		case VClassIndustrial: format(DialogTitle, 128, TXT_RentIndustrial);
		case VClassLowRider: format(DialogTitle, 128, TXT_RentLowRider);
		case VClassOffRoad: format(DialogTitle, 128, TXT_RentOffRoad);
		case VClassPlane: format(DialogTitle, 128, TXT_RentPlane);
		case VClassPublic: format(DialogTitle, 128, TXT_RentPublicService);
		case VClassRCVehicle: format(DialogTitle, 128, TXT_RentRC);
		case VClassSaloons: format(DialogTitle, 128, TXT_RentSaloon);
		case VClassSportCar: format(DialogTitle, 128, TXT_RentSport);
		case VClassStationCar: format(DialogTitle, 128, TXT_RentStationWagon);
		case VClassTrailer: format(DialogTitle, 128, TXT_RentTrailer);
		case VClassUnique: format(DialogTitle, 128, TXT_RentUnique);
	}

	// Ask which car the player wants to have by showing the dialog
	ShowPlayerDialog(playerid, DialogRentCar, DIALOG_STYLE_LIST, DialogTitle, CarList, TXT_DialogButtonSelect, TXT_DialogButtonCancel);

	return 1;
}



// This dialog gives the chosen vehicle to the player (bought or rented)
Dialog_RentCar(playerid, response, listitem)
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Setup local variables
	new Counter, Name[24], Float:x, Float:y, Float:z, Msg[128];

	// Loop through the entire list of buyable vehicles
	for (new i; i < sizeof(ABuyableVehicles); i++)
	{
		// Check if the vehicle in the list has the same class as requested
		if (ABuyableVehicles[i][VehicleClass] == APlayerData[playerid][DialogRentVClass])
		{
		    // Check if this is the vehicle that the player chose
		    if (Counter == listitem)
			{
			    // Check if the player has enough money to afford renting this vehicle
			    if (APlayerData[playerid][PlayerMoney] >= (ABuyableVehicles[i][Price] / 10) || APlayerData[playerid][VIP] == 1)
			    {
					// Check if the player already has a rented vehicle
					if (APlayerData[playerid][RentedVehicleID] != 0)
					{
						// Clear the data for the already rented vehicle
						AVehicleData[APlayerData[playerid][RentedVehicleID]][Model] = 0;
						AVehicleData[APlayerData[playerid][RentedVehicleID]][Fuel] = 0;
						AVehicleData[APlayerData[playerid][RentedVehicleID]][Owned] = false;
						AVehicleData[APlayerData[playerid][RentedVehicleID]][Owner] = 0;
						AVehicleData[APlayerData[playerid][RentedVehicleID]][PaintJob] = 0;
						for (new j; j < 14; j++)
						{
							AVehicleData[APlayerData[playerid][RentedVehicleID]][Components][j] = 0;
						}
						// Destroy the vehicle
						DestroyVehicle(APlayerData[playerid][RentedVehicleID]);
						// Send the player a message that his previously rented vehicle has been replaced by the new one
						SendClientMessage(playerid, 0xFFFFFFFF, TXT_AlreadyRentedVehicle);
					}

					// Create the vehicle and link it to the player's account
					GetPlayerPos(playerid, x, y, z);
				    APlayerData[playerid][RentedVehicleID] = CreateVehicle(ABuyableVehicles[i][CarModel], x, y, z, 0.0, -1, -1, 600);
					// Also set owndership data
					AVehicleData[APlayerData[playerid][RentedVehicleID]][Model] = ABuyableVehicles[i][CarModel];
					AVehicleData[APlayerData[playerid][RentedVehicleID]][Fuel] = MaxFuel;
					AVehicleData[APlayerData[playerid][RentedVehicleID]][Owned] = true;
					GetPlayerName(playerid, Name, sizeof(Name));
					format(AVehicleData[APlayerData[playerid][RentedVehicleID]][Owner], 24, Name);
					// Put the player in the vehicle
					PutPlayerInVehicle(playerid, APlayerData[playerid][RentedVehicleID], 0);
					// Turn on the engine
					new engine,lights,alarm,doors,bonnet,boot,objective;
					GetVehicleParamsEx(APlayerData[playerid][RentedVehicleID], engine, lights, alarm, doors, bonnet, boot, objective);
					SetVehicleParamsEx(APlayerData[playerid][RentedVehicleID], 1, lights, alarm, doors, bonnet, boot, objective);
					// Store the player's current location and interior-id, otherwise anti-airbreak hack code could kick you
					GetPlayerPos(playerid, APlayerData[playerid][PreviousX], APlayerData[playerid][PreviousY], APlayerData[playerid][PreviousZ]);
					APlayerData[playerid][PreviousInt] = GetPlayerInterior(playerid);
					// Let the player pay for renting the vehicle
					if(APlayerData[playerid][VIP] == 0) APlayerData[playerid][PlayerMoney] = APlayerData[playerid][PlayerMoney] - (ABuyableVehicles[i][Price] / 10);
					// Let the player know he rented a vehicle
					format(Msg, 128, TXT_PlayerRentsVehicle, ABuyableVehicles[i][CarName], (ABuyableVehicles[i][Price] / 10));
					SendClientMessage(playerid, 0xFFFFFFFF, Msg);
				}
				else // The player has not enough money to rent this vehicle
				    SendClientMessage(playerid, 0xFFFFFFFF, TXT_RentingTooExpensive);

				// Stop looking for the vehicle, as it's found and given to the player already
				return 1;
			}
		    else // The player chose another vehicle from the same class, keep looking for another one
		        Counter++;
		}
	}

	return 1;
}



// Process the weather dialog
Dialog_Weather(playerid, response, listitem)
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Setup local variables
	new WeatherID;

	// Select the weather
	switch (listitem)
	{
		case 0: WeatherID = 0; // Normal
		case 1: WeatherID = 8; // Stormy
		case 2: WeatherID = 9; // Foggy
		case 3: WeatherID = 11; // Scorching hot
		case 4: WeatherID = 16; // Dull, cloudy, rainy
		case 5: WeatherID = 19; // Sandstorm
		case 6: WeatherID = 20; // Green Fog
		case 7: WeatherID = 33; // Dark, cloudy, brown
		case 8: WeatherID = 39; // Extremely bright
		case 9: WeatherID = 43; // Dark toxic clouds
		case 10: WeatherID = 44; // Black & white sky
	}

	// Set the weather
    SetWeather(WeatherID);
    // Inform the player about it
	SendClientMessage(playerid, 0xFFFFFFFF, TXT_ChangedWeather);

	return 1;
}

// Process the caroption dialog
Dialog_CarOption(playerid, response, listitem)
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

    // Setup local variables
	new vehicleid, engine, lights, bool:alarm, bool:doors, bool:bonnet, bool:boot, bool:objective;

	// Get the player's vehicle
	vehicleid = GetPlayerVehicleID(playerid);

	// Get the current status of the vehicle
	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);

	// Select the weather
	switch (listitem)
	{
		case 0: SetVehicleParamsEx(vehicleid, 1 - engine, lights, alarm, doors, bonnet, boot, objective);
		case 1: SetVehicleParamsEx(vehicleid, engine, 1 - lights, alarm, doors, bonnet, boot, objective);
		case 2:
		{
			if (alarm == true)
				SetVehicleParamsEx(vehicleid, engine, lights, false, doors, bonnet, boot, objective);
			else
				SetVehicleParamsEx(vehicleid, engine, lights, true, doors, bonnet, boot, objective);
		}
		case 3:
		{
			if (doors == true)
				SetVehicleParamsEx(vehicleid, engine, lights, alarm, false, bonnet, boot, objective);
			else
				SetVehicleParamsEx(vehicleid, engine, lights, alarm, true, bonnet, boot, objective);
		}
		case 4:
		{
			if (bonnet == true)
				SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, false, boot, objective);
			else
				SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, true, boot, objective);
		}
		case 5:
		{
			if (boot == true)
				SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, false, objective);
			else
				SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, true, objective);
		}
		case 6:
		{
			if (objective == true)
				SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, false);
			else
				SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, true);
		}
	}

	return 1;
}



// This function processes the convoy dialog
Dialog_SelectConvoy(playerid, response, listitem)
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Setup local variables
	new Convoy;

	// The convoy-id is automatically the listitem
	Convoy = listitem;

	// Check the status of the selected convoy to determine what to do
	switch (AConvoys[Convoy][Status])
	{
	    case CONVOY_EMPTY: // Convoy isn't started yet, this is a free convoy
		{
			Convoy_Create(playerid, Convoy); // Try to create the convoy
		}
	    case CONVOY_OPEN: // Convoy has been created but still open for new members to join
		{
		    Convoy_Join(playerid, Convoy); // Try to join the convoy
		}
	    case CONVOY_FULL: // Convoy is full (10 members)
		{
			SendClientMessage(playerid, 0xFFFFFFFF, TXT_ConvoyFull);
		}
	    case CONVOY_CLOSED: // Convoy has started already (the leader already chose a job, causing the convoy to close)
		{
			SendClientMessage(playerid, 0xFFFFFFFF, TXT_ConvoyEnRoute);
		}
	}

	return 1;
}

// This function processes the housemenu dialog
Dialog_HouseMenu(playerid, response, listitem)
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Setup local variables
	new UpgradeList[2000], HouseID, DialogTitle[200], Counter, UpgradePrice, Msg[128], CarSlot, VehicleClassList[1000], VehicleList[500];

	// Get the HouseID of the house where the player is
	HouseID = APlayerData[playerid][CurrentHouse];

	// Select an option based on the selection in the list
	switch(listitem)
	{
	    case 0: // Change house name
	    {
			// Only the house-owner can use this option
			if (House_PlayerIsOwner(playerid, HouseID) == 1)
			{
		        format(DialogTitle, 200, TXT_DialogOldHouseName, AHouseData[HouseID][HouseName]);
				ShowPlayerDialog(playerid, DialogHouseNameChange, DIALOG_STYLE_INPUT, DialogTitle, TXT_DialogEnterNewHouseName, TXT_DialogButtonSelect, TXT_DialogButtonCancel);
			}
			else
			    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Bu seçeneði sadece ev sahibi kullanabilir");
	    }
	    case 1: // Upgrade the house
	    {
			// Only the house-owner can use this option
			if (House_PlayerIsOwner(playerid, HouseID) == 1)
			{
		        // Check if it's possible to upgrade further
				if (AHouseData[HouseID][HouseLevel] < AHouseData[HouseID][HouseMaxLevel])
				{
					// Add only the upgrades above the current house-level to the upgradelist
					for (new i = AHouseData[HouseID][HouseLevel] + 1; i <= AHouseData[HouseID][HouseMaxLevel]; i++)
					{
					    Counter++; // Add 1 to the counter each time an upgrade is added to the upgradelist
					    UpgradePrice = ((AHouseData[HouseID][HousePrice] * Counter) / 100) * HouseUpgradePercent;
					    // Add the upgrade-info in green if the player can afford it, and in red if he cannot afford it
						if (APlayerData[playerid][PlayerMoney] >= UpgradePrice)
							format(UpgradeList, 2000, "%s{00FF00}%s (seviye %i)\t\t$%i\n", UpgradeList, AHouseInteriors[i][InteriorName], i, UpgradePrice);
						else
							format(UpgradeList, 2000, "%s{FF0000}%s (seviye %i)\t\t$%i\n", UpgradeList, AHouseInteriors[i][InteriorName], i, UpgradePrice);
					}

			        // Show another dialog to let the player select which upgrade he wants for his house
					ShowPlayerDialog(playerid, DialogUpgradeHouse, DIALOG_STYLE_LIST, TXT_DialogSelectHouseUpgrade, UpgradeList, TXT_DialogButtonSelect, TXT_DialogButtonCancel);
				}
				else
				    SendClientMessage(playerid, 0xFFFFFFFF, TXT_HouseReachedMaxLevel);
			}
			else
			    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Sadece ev sahibi bu seçeneði kullanabilir");
	    }
		case 2: // Buy house-car
		{
			// Only the house-owner can use this option
			if (House_PlayerIsOwner(playerid, HouseID) == 1)
			{
			    // Find a free carslot
			    CarSlot = House_GetFreeCarSlot(HouseID);
			    // Check if the carslot is valid
			    if (CarSlot != -1)
			    {
				    // Let the player choose a vehicle-class
					format(VehicleClassList, 1000, "%s{00FF00}%s{FFFFFF}\n", VehicleClassList, "Bisikletler");
					format(VehicleClassList, 1000, "%s{40FF00}%s{FFFFFF}\n", VehicleClassList, "Tekneler");
					format(VehicleClassList, 1000, "%s{80FF00}%s{FFFFFF}\n", VehicleClassList, "Üstü Açýk Arabalar");
					format(VehicleClassList, 1000, "%s{B0FF00}%s{FFFFFF}\n", VehicleClassList, "Helikopterler");
					format(VehicleClassList, 1000, "%s{FFFF00}%s{FFFFFF}\n", VehicleClassList, "Endüstriyel Araçlar");
					format(VehicleClassList, 1000, "%s{B0FF40}%s{FFFFFF}\n", VehicleClassList, "Lowriderlar");
					format(VehicleClassList, 1000, "%s{80FF80}%s{FFFFFF}\n", VehicleClassList, "Off-Road Araçlar");
					format(VehicleClassList, 1000, "%s{40FFB0}%s{FFFFFF}\n", VehicleClassList, "Uçaklar");
					format(VehicleClassList, 1000, "%s{00FFFF}%s{FFFFFF}\n", VehicleClassList, "Halka Hizmet Araçlarý");
					format(VehicleClassList, 1000, "%s{00B0FF}%s{FFFFFF}\n", VehicleClassList, "RC Araçlar");
					format(VehicleClassList, 1000, "%s{0080FF}%s{FFFFFF}\n", VehicleClassList, "Sedan Araçlar");
					format(VehicleClassList, 1000, "%s{0040FF}%s{FFFFFF}\n", VehicleClassList, "Spor Araçlar");
					format(VehicleClassList, 1000, "%s{0000FF}%s{FFFFFF}\n", VehicleClassList, "Station Wagon Araçlar");
					format(VehicleClassList, 1000, "%s{4000FF}%s{FFFFFF}\n", VehicleClassList, "Kasalar");
					format(VehicleClassList, 1000, "%s{8000FF}%s{FFFFFF}\n", VehicleClassList, "Özel Araçlar");
					// Ask which vehicle class the player wants to see to buy a vehicle
					ShowPlayerDialog(playerid, DialogBuyCarClass, DIALOG_STYLE_LIST, TXT_DialogBuyCarSelectClass, VehicleClassList, TXT_DialogButtonSelect, TXT_DialogButtonCancel);
			    }
			    else
			        SendClientMessage(playerid, 0xFFFFFFFF, TXT_HouseHasMaxVehicles);
			}
			else
			    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Bu seçeneði sadece ev sahibi kullanabilir");
		}
		case 3: // Buy house-car insurance
		{
			// Only the house-owner can use this option
			if (House_PlayerIsOwner(playerid, HouseID) == 1)
			{
			    new MsgInsurance[128];
			    // Check if this house doesn't have insurance yet
			    if (AHouseData[HouseID][Insurance] == 0)
			    {
			        // Check if the player can afford the insurance
			        if (APlayerData[playerid][PlayerMoney] >= (AHouseData[HouseID][HousePrice] / 10))
			        {
					    // Construct the message for the dialog, this includes the price for the insurance
					    format(MsgInsurance, 128, TXT_DialogBuyInsurance, AHouseData[HouseID][HousePrice] / 10);
						// Ask the player if the wants to buy an insurance for this house's vehicles
						ShowPlayerDialog(playerid, DialogBuyInsurance, DIALOG_STYLE_MSGBOX, TXT_DialogTitleBuyInsurance, MsgInsurance, TXT_DialogButtonYes, TXT_DialogButtonNo);
					}
					else
					    SendClientMessage(playerid, 0xFFFFFFFF, TXT_CannotAffordInsurance);
				}
				else
				    SendClientMessage(playerid, 0xFFFFFFFF, TXT_HouseAlreadyHasInsurance);
			}
			else
			    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Bu seçeneði sadece ev sahibi kullanabilir");
		}
		case 4: // Sell house-car
		{
			// Only the house-owner can use this option
			if (House_PlayerIsOwner(playerid, HouseID) == 1)
			{
			    new BuyableCarIndex, bool:HouseHasCars = false;

				// Check if the house has any cars assigned to it
				for (CarSlot = 0; CarSlot < 10; CarSlot++)
				    if (AHouseData[HouseID][VehicleIDs][CarSlot] != 0)
				        HouseHasCars = true;

				// Check if the house has any cars assigned to it
				if (HouseHasCars == true)
				{
					// Add all vehicles to the list
					for (CarSlot = 0; CarSlot < 10; CarSlot++)
					{
						if (AHouseData[HouseID][VehicleIDs][CarSlot] != 0)
						{
						    // Get the index where the first vehicle is found in the ABuyableVehicles array
						    BuyableCarIndex = VehicleBuyable_GetIndex(GetVehicleModel(AHouseData[HouseID][VehicleIDs][CarSlot]));
						    // Add the name of the vehicle to the list
						    format(VehicleList, 500, "%s{00FF00}%s: $%i{FFFFFF}\n", VehicleList, ABuyableVehicles[BuyableCarIndex][CarName], ABuyableVehicles[BuyableCarIndex][Price] / 2);
						}
						else
							format(VehicleList, 500, TXT_EmptyCarSlot, VehicleList);
					}

					// Ask which vehicle class the player wants to see to buy a vehicle
					ShowPlayerDialog(playerid, DialogSellCar, DIALOG_STYLE_LIST, TXT_SelectVehicleToSell, VehicleList, TXT_DialogButtonSelect, TXT_DialogButtonCancel);
				}
				else
				    SendClientMessage(playerid, 0xFFFFFFFF, TXT_NoHouseVehicles);
			}
			else
			    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Bu seçeneði sadece ev sahibi kullanabilir");
		}
		case 5: // Sell house
		{
			// Only the house-owner can use this option
			if (House_PlayerIsOwner(playerid, HouseID) == 1)
			{
			    // Setup local variables
			    new bool:HouseHasCars = false;

				// Check if the house has any cars assigned to it
				for (CarSlot = 0; CarSlot < 10; CarSlot++)
				    if (AHouseData[HouseID][VehicleIDs][CarSlot] != 0)
				        HouseHasCars = true;

				// Check if all house-cars have been sold (all slots are empty)
				if (HouseHasCars == false)
				{
				    format(Msg, 128, TXT_SureSellHouse, House_CalcSellPrice(HouseID));
					ShowPlayerDialog(playerid, DialogSellHouse, DIALOG_STYLE_MSGBOX, TXT_AreYouSure, Msg, TXT_DialogButtonYes, TXT_DialogButtonNo);
				}
				else
				    SendClientMessage(playerid, 0xFFFFFFFF, TXT_CannotSellHouseWithCars);
			}
			else
			    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Bu seçeneði sadece ev sahibi kullanabilir");
		}
	    case 6: // Open the house to the public (everyone can enter it)
	    {
			// Only the house-owner can use this option
			if (House_PlayerIsOwner(playerid, HouseID) == 1)
			{
			    // Open the house to the public
				AHouseData[HouseID][HouseOpened] = true;
				// Let the player know he opened the house to the public
				SendClientMessage(playerid, 0xFFFFFFFF, "{00FF00}Evinizin kildini açtýnýz, artýk herkes girebilir.");
			}
			else
			    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Bu seçeneði sadece ev sahibi kullanabilir");
	    }
	    case 7: // Close the house to the public (only the owner can enter it)
	    {
			// Only the house-owner can use this option
			if (House_PlayerIsOwner(playerid, HouseID) == 1)
			{
			    // Close the house to the public
				AHouseData[HouseID][HouseOpened] = false;
				// Let the player know he closed the house to the public
				SendClientMessage(playerid, 0xFFFFFFFF, "{00FF00}Evinizi kilitlediniz, artýk sadece siz girebilirsiniz.");
			}
			else
			    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Bu seçeneði sadece ev sahibi kullanabilir");
	    }
	    case 8: // Exit the house
	    {
			House_Exit(playerid, HouseID);
	    }
	}

	return 1;
}

// This function processes the house-upgrade menu
Dialog_UpgradeHouse(playerid, response, listitem)
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Get the HouseID of the house where the player is
	new HouseID = APlayerData[playerid][CurrentHouse];
	// Calculate the new house-level based on the selection in the list (the first entry is 1 level higher than the current house-level)
	new hLevel = listitem + 1 + AHouseData[HouseID][HouseLevel];
	// Calculate the price for upgrading
	new Payment = ((AHouseData[HouseID][HousePrice] * (listitem + 1)) / 100) * HouseUpgradePercent;

	// Check if the player can afford it
	if (APlayerData[playerid][PlayerMoney] >= Payment)
	{
		// Upgrade the house
		AHouseData[HouseID][HouseLevel] = hLevel;
		// Set the worldid so other players cannot see him anymore
		SetPlayerVirtualWorld(playerid, 1000 + playerid);
		// Set the player inside the new interior of the house
		SetPlayerInterior(playerid, AHouseInteriors[hLevel][InteriorID]);
		// Set the position of the player at the spawn-location of the house's interior
		SetPlayerPos(playerid, AHouseInteriors[hLevel][IntX], AHouseInteriors[hLevel][IntY], AHouseInteriors[hLevel][IntZ]);

		// Let the player pay for the upgrade
		new Msg[128];
		RewardPlayer(playerid, -Payment, 0);
		format(Msg, 128, TXT_PlayerUpgradedHouse, AHouseData[HouseID][HouseLevel], Payment);
		SendClientMessage(playerid, 0xFFFFFFFF, Msg);

		// Also update the 3DText at the entrance of the house
		House_UpdateEntrance(APlayerData[playerid][CurrentHouse]);

		// Save the player-file (and his houses)
		PlayerFile_Save(playerid);
	}
	else
	    SendClientMessage(playerid, 0xFFFFFFFF, TXT_CannotAffordUpgrade);

	return 1;
}



// Check which house the player chose, and port him to it
Dialog_GoHome(playerid, response, listitem)
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Setup local variables
	new HouseIndex, HouseID;

	// The listitem directly indicates the house-index
	HouseIndex = listitem;
	HouseID = APlayerData[playerid][Houses][HouseIndex];

	// Check if this is a valid house (HouseID != 0)
	if (HouseID != 0)
	{
		// Get the coordinates of the house's entrance
		SetPlayerPos(playerid, AHouseData[HouseID][HouseX], AHouseData[HouseID][HouseY], AHouseData[HouseID][HouseZ]);
	}
	else
	    SendClientMessage(playerid, 0xFFFFFFFF, TXT_NoHouseInSlot);

	return 1;
}

// Let the player change the name of his house
Dialog_ChangeHouseName(playerid, response, inputtext[])
{
	// Just close the dialog if the player clicked "Cancel" or if the player didn't input any text
	if ((!response) || (strlen(inputtext) == 0)) return 1;

	// Change the name of the house
	format(AHouseData[APlayerData[playerid][CurrentHouse]][HouseName], 100, inputtext);
	// Also update the 3DText at the entrance of the house
	House_UpdateEntrance(APlayerData[playerid][CurrentHouse]);
	// Let the player know that the name of his house has been changed
	SendClientMessage(playerid, 0xFFFFFFFF, TXT_ChangedHouseName);

	// Save the player-file (and his houses)
	PlayerFile_Save(playerid);

	return 1;
}

// Choose a vehicle class from which to buy a vehicle
Dialog_BuyCarClass(playerid, response, listitem)
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Setup local variables
	new CarList[1000], DialogTitle[128];

	// Set the player's chosen vehicle-class based on the listitem he chose (add 1 as the vehicleclass starts at 1)
	APlayerData[playerid][DialogBuyVClass] = listitem + 1;

	// Add all vehicles of the same class to the list
	for (new i; i < sizeof(ABuyableVehicles); i++)
	{
		// Check if the vehicle in the list has the same class as requested
		if (ABuyableVehicles[i][VehicleClass] == APlayerData[playerid][DialogBuyVClass])
		{
			// Add the carname to the list and it's price
			format(CarList, 1000, "%s%s%s ($%i)", CarList, "\n", ABuyableVehicles[i][CarName], ABuyableVehicles[i][Price]); // Add the name of the next car to the list on the next line
		}
	}

	// Check if the list is empty
	if (strlen(CarList) == 0)
	{
		// Send the player a message that all vehicles have been disabled of the chosen class (no vehicles in the array of this class)
		SendClientMessage(playerid, 0xFFFFFFFF, TXT_BuyRentCarEmptyList);
		// Exit the function (don't ask to choose a vehicle)
		return 1;
	}

	// Set a title for the dialog based on the requested vehicleclass
	switch (APlayerData[playerid][DialogBuyVClass])
	{
		case VClassBike: format(DialogTitle, 128, TXT_BuyBike);
		case VClassBoat: format(DialogTitle, 128, TXT_BuyBoat);
		case VClassConvertible: format(DialogTitle, 128, TXT_BuyConvertible);
		case VClassHelicopter: format(DialogTitle, 128, TXT_BuyHelicopter);
		case VClassIndustrial: format(DialogTitle, 128, TXT_BuyIndustrial);
		case VClassLowRider: format(DialogTitle, 128, TXT_BuyLowRider);
		case VClassOffRoad: format(DialogTitle, 128, TXT_BuyOffRoad);
		case VClassPlane: format(DialogTitle, 128, TXT_BuyPlane);
		case VClassPublic: format(DialogTitle, 128, TXT_BuyPublicService);
		case VClassRCVehicle: format(DialogTitle, 128, TXT_BuyRC);
		case VClassSaloons: format(DialogTitle, 128, TXT_BuySaloon);
		case VClassSportCar: format(DialogTitle, 128, TXT_BuySport);
		case VClassStationCar: format(DialogTitle, 128, TXT_BuyStationWagon);
		case VClassTrailer: format(DialogTitle, 128, TXT_BuyTrailer);
		case VClassUnique: format(DialogTitle, 128, TXT_BuyUnique);
	}

	// Ask which car the player wants to have by showing the dialog
	ShowPlayerDialog(playerid, DialogBuyCar, DIALOG_STYLE_LIST, DialogTitle, CarList, TXT_DialogButtonSelect, TXT_DialogButtonCancel);

	return 1;
}

// Buy a vehicle and assign it to the house
Dialog_BuyCar(playerid, response, listitem)
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Setup local variables
	new Counter, Msg[128], cComponents[14];

	// Get the HouseID
	new HouseID = APlayerData[playerid][CurrentHouse];

	// Loop through the entire list of buyable vehicles
	for (new i; i < sizeof(ABuyableVehicles); i++)
	{
		// Check if the vehicle in the list has the same class as requested
		if (ABuyableVehicles[i][VehicleClass] == APlayerData[playerid][DialogBuyVClass])
		{
		    // Check if this is the vehicle that the player chose
		    if (Counter == listitem)
			{
			    // Check if the player has enough money to afford buying this vehicle
			    if (APlayerData[playerid][PlayerMoney] >= (ABuyableVehicles[i][Price]))
			    {
					// Add the vehicle to the house (this sets ownership and other data that's needed)
					// The vehicles are by default created inside the hangar of KACC Military Fuels instead of near the EasterBoard Farm
					House_AddVehicle(HouseID, ABuyableVehicles[i][CarModel], 0, cComponents, 2585.0, 2829.0, 10.9, 0.0, -1, -1);

					// Let the player pay for buying the vehicle
					APlayerData[playerid][PlayerMoney] = APlayerData[playerid][PlayerMoney] - ABuyableVehicles[i][Price];
					// Let the player know he bought a vehicle
					format(Msg, 128, TXT_PlayerBoughtVehicle, ABuyableVehicles[i][CarName], ABuyableVehicles[i][Price]);
					SendClientMessage(playerid, 0xFFFFFFFF, Msg);
					SendClientMessage(playerid, 0xFFFFFFFF, TXT_PlayerMustUseGetcarAndPark);

					// Save the player-file (and his houses)
					PlayerFile_Save(playerid);
				}
				else // The player has not enough money to buy this vehicle
				    SendClientMessage(playerid, 0xFFFFFFFF, TXT_CannotAffordVehicle);

				// Stop looking for the vehicle, as it's found and given to the player already
				return 1;
			}
		    else // The player chose another vehicle from the same class, keep looking for another one
		        Counter++;
		}
	}

	return 1;
}

// Buy insurance for the house's vehicles
Dialog_BuyInsurance(playerid, response)
{
	// Just close the dialog if the player clicked "No"
	if(!response) return 1;

	// Setup local variables
	new Msg[128];

	// Get the HouseID where the player is right now
	new HouseID = APlayerData[playerid][CurrentHouse];

	// Buy an insurance for this house's vehicles (insurance costs 10% of the house's baseprice)
	AHouseData[HouseID][Insurance] = 1;
	RewardPlayer(playerid, -(AHouseData[HouseID][HousePrice] / 10), 0);

	// Let the player know he has bought a vehicle-insurance for this house
	format(Msg, 128, TXT_PlayerBoughtInsurance, AHouseData[HouseID][HousePrice] / 10);
	SendClientMessage(playerid, 0xFFFFFFFF, Msg);

	// Save the player-file (and his houses)
	PlayerFile_Save(playerid);
	// Also save the sold house, otherwise the old ownership-data is still there
	HouseFile_Save(HouseID);

	return 1;
}

// Sell the house
Dialog_SellHouse(playerid, response)
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Get the HouseID where the player is right now
	new HouseID = APlayerData[playerid][CurrentHouse];

	// Set the player in the normal world again
	SetPlayerVirtualWorld(playerid, 0);
	SetPlayerInterior(playerid, 0);
	// Set the position of the player at the entrance of his house
	SetPlayerPos(playerid, AHouseData[HouseID][HouseX], AHouseData[HouseID][HouseY], AHouseData[HouseID][HouseZ]);

	// Also clear the tracking-variable to track in which house the player is
	APlayerData[playerid][CurrentHouse] = 0;

	// Clear the owner of the house
	AHouseData[HouseID][Owned] = false;
	AHouseData[HouseID][Owner] = 0;
	// Clear the house-name and house-level
	AHouseData[HouseID][HouseName] = 0;
	AHouseData[HouseID][HouseLevel] = 1;

	// Refund the player 50% of the worth of the house
	RewardPlayer(playerid, House_CalcSellPrice(HouseID), 0);
	SendClientMessage(playerid, 0xFFFFFFFF, TXT_PlayerSoldHouse);

	// Clear the house-id from the player
	for (new i; i < MAX_HOUSESPERPLAYER; i++)
	{
		// If the house-slot if found where the house was added to the player
		if (APlayerData[playerid][Houses][i] == HouseID)
		{
		    // Clear the house-id
		    APlayerData[playerid][Houses][i] = 0;
		    // Stop searching
		    break;
		}
	}

	// Update the 3DText near the house's entrance to show other players that it's for sale again
	House_UpdateEntrance(HouseID);

	// Save the player-file (and his houses)
	PlayerFile_Save(playerid);
	// Also save the sold house, otherwise the old ownership-data is still there
	HouseFile_Save(HouseID);

	return 1;
}



// Sell the house
Dialog_SellCar(playerid, response, listitem)
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Setup local variables
	new HouseID = APlayerData[playerid][CurrentHouse];
	new vid = AHouseData[HouseID][VehicleIDs][listitem];

	// Check if there is a vehicle stored in this carslot
	if (vid != 0)
	{
		new BuyableCarIndex = VehicleBuyable_GetIndex(GetVehicleModel(vid));
		new Msg[128];

		// Destroy the vehicle and remove it from the house
		DestroyVehicle(vid);
		AHouseData[HouseID][VehicleIDs][listitem] = 0;
		// Also clear the data
		AVehicleData[vid][Owned] = false;
		AVehicleData[vid][Owner] = 0;
		AVehicleData[vid][Model] = 0;
		AVehicleData[vid][PaintJob] = 0;
		for (new i; i < 14; i++)
			AVehicleData[vid][Components][i] = 0;
		AVehicleData[vid][SpawnX] = 0.0;
		AVehicleData[vid][SpawnY] = 0.0;
		AVehicleData[vid][SpawnZ] = 0.0;
		AVehicleData[vid][SpawnRot] = 0.0;
		DestroyDynamic3DTextLabel(AVehicleData[vid][VehicleText]);

		// Refund the player with 50% of the vehicle's buying price
		APlayerData[playerid][PlayerMoney] = APlayerData[playerid][PlayerMoney] + (ABuyableVehicles[BuyableCarIndex][Price] / 2);
		// Let the player know about it
		format(Msg, 128, TXT_PlayerSoldVehicle, ABuyableVehicles[BuyableCarIndex][CarName], ABuyableVehicles[BuyableCarIndex][Price] / 2);
		SendClientMessage(playerid, 0xFFFFFFFF, Msg);

		// Save the player-file (and his houses)
		PlayerFile_Save(playerid);
	}
	else
	    SendClientMessage(playerid, 0xFFFFFFFF, TXT_NoVehicleInSlot);

	return 1;
}

// This dialog processes the selected house from which to get a vehicle using /getcar
Dialog_GetCarSelectHouse(playerid, response, listitem)
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Get the houseid based on the chosen listitem
	new HouseID = APlayerData[playerid][Houses][listitem];

	// Check if it was a valid house
	if (HouseID != 0)
	{
		// Setup local variables
	    new BuyableCarIndex, VehicleList[500], bool:HouseHasCars = false, CarSlot;

		// Store the HouseID, otherwise the next dialog won't be able to get a car from the chosen house
		APlayerData[playerid][DialogGetCarHouseID] = HouseID;

		// Check if the house has any cars assigned to it
		for (CarSlot = 0; CarSlot < 10; CarSlot++)
			if (AHouseData[HouseID][VehicleIDs][CarSlot] != 0)
			    HouseHasCars = true;

		// Check if the house has any cars assigned to it
		if (HouseHasCars == true)
		{
			// Add all vehicles to the list
			for (CarSlot = 0; CarSlot < 10; CarSlot++)
			{
				// Check if the carslot has a vehicle in it
				if (AHouseData[HouseID][VehicleIDs][CarSlot] != 0)
				{
				    // Get the index where the first vehicle is found in the ABuyableVehicles array
				    BuyableCarIndex = VehicleBuyable_GetIndex(GetVehicleModel(AHouseData[HouseID][VehicleIDs][CarSlot]));
				    // Add the name of the vehicle to the list
					if (AVehicleData[AHouseData[HouseID][VehicleIDs][CarSlot]][Clamped] == true)
					    format(VehicleList, 500, "%s{00FF00}%s (kelepcelenmis)\n", VehicleList, ABuyableVehicles[BuyableCarIndex][CarName]);
					else
					    format(VehicleList, 500, "%s{00FF00}%s\n", VehicleList, ABuyableVehicles[BuyableCarIndex][CarName]);
				}
				else
					format(VehicleList, 500, TXT_EmptyCarSlot, VehicleList);
			}

			// Ask which vehicle the player wants to teleport to his location
			ShowPlayerDialog(playerid, DialogGetCarSelectCar, DIALOG_STYLE_LIST, TXT_SelectVehicleToGet, VehicleList, TXT_DialogButtonSelect, TXT_DialogButtonCancel);
		}
		else
		    SendClientMessage(playerid, 0xFFFFFFFF, TXT_NoHouseVehicles);
	}
	else
	    SendClientMessage(playerid, 0xFFFFFFFF, TXT_NoHouseInSlot);

	return 1;
}

// This dialog processes the chosen car and spawns it at the player's location
Dialog_GetCarSelectCar(playerid, response, listitem)
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Get the HouseID from which to get the car
	new HouseID = APlayerData[playerid][DialogGetCarHouseID];

	// Get the vehicleid from the chosen listitem
	new vid = AHouseData[HouseID][VehicleIDs][listitem];

	// Check if it was a valid vehicleid
	if (vid != 0)
	{
		// Check if the vehicle is clamped
		if (AVehicleData[vid][Clamped] == false)
		{
			// Setup local variables
			new Float:x, Float:y, Float:z, Float:Angle;
			// Get the player's position
			GetPlayerPos(playerid, x, y, z);
			GetPlayerFacingAngle(playerid, Angle);
			// Port the vehicle to the player
			SetVehiclePos(vid, x, y, z);
			// Put the player inside the vehicle and rotate the vehicle to face where the player was facing
			PutPlayerInVehicle(playerid, vid, 0);
			SetVehicleZAngle(vid, Angle);
			// Turn on the engine and lights
			new engine,lights,alarm,doors,bonnet,boot,objective;
			GetVehicleParamsEx(vid, engine, lights, alarm, doors, bonnet, boot, objective);
			SetVehicleParamsEx(vid, 1, 1, alarm, doors, bonnet, boot, objective);
			// Store the player's current location and interior-id, otherwise anti-airbreak hack code could kick you
			GetPlayerPos(playerid, APlayerData[playerid][PreviousX], APlayerData[playerid][PreviousY], APlayerData[playerid][PreviousZ]);
			APlayerData[playerid][PreviousInt] = GetPlayerInterior(playerid);
			// Let the player know he should park the vehicle
			SendClientMessage(playerid, 0xFFFFFFFF, TXT_PlayerMustUsePark);
		}
		else // Inform the player that this vehicle is clamped and how he can un-clamp it
		{
		    SendClientMessage(playerid, 0xFFFFFFFF, TXT_SpeedometerClampedVehicle);
		    SendClientMessage(playerid, 0xFFFFFFFF, TXT_SpeedometerClampedVehicle2);
		}
	}
	else
	    SendClientMessage(playerid, 0xFFFFFFFF, TXT_NoVehicleInSlot);

	return 1;
}



// This dialog processes the chosen business-type and creates the business
Dialog_CreateBusSelType(playerid, response, listitem)
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

    // Setup some local variables
	new BusType, BusID, Float:x, Float:y, Float:z, Msg[128], bool:EmptySlotFound = false;

	// Get the player's position
	GetPlayerPos(playerid, x, y, z);

	// Get the business-type from the option the player chose
	BusType = listitem + 1;

	// Find a free business-id
	for (BusID = 1; BusID < MAX_BUSINESS; BusID++)
	{
		// Check if this business ID is free
		if (ABusinessData[BusID][BusinessType] == 0)
		{
			EmptySlotFound = true;
		    break; // Stop processing
		}
	}

	// Check if an empty slot has been found
	if (EmptySlotFound == false)
	{
		// If no empty slot was found, let the player know about it and exit the function
		SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Eklenebilecek en fazla iþyeri eklendi");
		return 1;
	}

	// Set some default data at the index of NextFreeBusinessID (NextFreeBusinessID will point to the next free business-index)
	ABusinessData[BusID][BusinessX] = x;
	ABusinessData[BusID][BusinessY] = y;
	ABusinessData[BusID][BusinessZ] = z;
	ABusinessData[BusID][BusinessType] = BusType;
	ABusinessData[BusID][BusinessLevel] = 1;
	ABusinessData[BusID][Owned] = false;

	// Add the pickup and 3DText at the location of the business-entrance (where the player is standing when he creates the business)
	Business_CreateEntrance(BusID);

	// Save the business
	BusinessFile_Save(BusID);

	// Inform the player that he created a new house
	format(Msg, 128, "{00FF00}Baþarýyla iþyeri oluþturdunuz. Ýþyeri ID: {FF00FF}%i{00FF00}", BusID);
	SendClientMessage(playerid, 0xFFFFFFFF, Msg);

	return 1;
}

// This function processes the businessmenu dialog
Dialog_BusinessMenu(playerid, response, listitem)
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Setup local variables
	new BusID, BusType, Msg[128], DialogTitle[200], UpgradePrice;

	// Get the HouseID of the house where the player is
	BusID = APlayerData[playerid][CurrentBusiness];
	BusType = ABusinessData[BusID][BusinessType];

	// Select an option based on the selection in the list
	switch(listitem)
	{
	    case 0: // Change business name
	    {
	        if(!strcmp(ABusinessData[BusID][Owner], GetName(playerid), true))
	        {
	        	format(DialogTitle, 200, TXT_DialogOldBusinessName, ABusinessData[BusID][BusinessName]);
				ShowPlayerDialog(playerid, DialogBusinessNameChange, DIALOG_STYLE_INPUT, DialogTitle, TXT_DialogEnterNewBusinessName, TXT_DialogButtonSelect, TXT_DialogButtonCancel);
			}
	    }
	    case 1: // Upgrade the business
	    {
   	        if(!strcmp(ABusinessData[BusID][Owner], GetName(playerid), true))
	        {
	        	// Check if it's possible to upgrade further
				if (ABusinessData[BusID][BusinessLevel] < 5)
				{
			    	// Get the upgrade-price
			    	UpgradePrice = ABusinessInteriors[BusType][BusPrice];
			    	// Check if the player can afford the upgrade
					if (APlayerData[playerid][PlayerMoney] >= UpgradePrice)
					{
				    	// Give the current earnings of the business to the player and update the LastTransaction time
						Business_PayEarnings(playerid, BusID);
						// Upgrade the business 1 level
				    	ABusinessData[BusID][BusinessLevel]++;
						// Let the player pay for the upgrade
						RewardPlayer(playerid, -UpgradePrice, 0);
						// Update the 3DText near the business's entrance to show what level the business is
						Business_UpdateEntrance(BusID);
						// Let the player know about it
						format(Msg, 128, "{00FF00}Ýþyerinizi {FFFF00}%i {00FF00}seviyesine çýkardýnýz", ABusinessData[BusID][BusinessLevel]);
						SendClientMessage(playerid, 0xFFFFFFFF, Msg);
					}
					else
						SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Geliþtirmeyi alacak paranýz yok!");
				}
				else
			    	SendClientMessage(playerid, 0xFFFFFFFF, TXT_BusinessReachedMaxLevel);
			}
	    }
		case 2: // Retrieve business earnings
		{
 	        if(!strcmp(ABusinessData[BusID][Owner], GetName(playerid), true))
	        {
		    	// Give the current earnings of the business to the player and update the LastTransaction time
				Business_PayEarnings(playerid, BusID);
			}
		}
		case 3: // Sell business
		{
 	        if(!strcmp(ABusinessData[BusID][Owner], GetName(playerid), true))
	        {
		    	format(Msg, 128, TXT_SureSellBusiness, (ABusinessInteriors[BusType][BusPrice] * ABusinessData[BusID][BusinessLevel]) / 2);
				ShowPlayerDialog(playerid, DialogSellBusiness, DIALOG_STYLE_MSGBOX, TXT_AreYouSure, Msg, TXT_DialogButtonYes, TXT_DialogButtonNo);
			}
		}
	    case 4: // Exit the business
	    {
			Business_Exit(playerid, BusID);
	    }
	}

	return 1;
}

// This function processes the /gobus dialog
Dialog_GoBusiness(playerid, response, listitem)
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Setup local variables
	new BusIndex, BusID;

	// The listitem directly indicates the business-index
	BusIndex = listitem;
	BusID = APlayerData[playerid][Business][BusIndex];

	// Check if this is a valid business (BusID != 0)
	if (BusID != 0)
	{
		// Get the coordinates of the business's entrance
		SetPlayerPos(playerid, ABusinessData[BusID][BusinessX], ABusinessData[BusID][BusinessY], ABusinessData[BusID][BusinessZ]);
	}
	else
	    SendClientMessage(playerid, 0xFFFFFFFF, TXT_NoBusinessInSlot);

	return 1;
}

// Let the player change the name of his business
Dialog_ChangeBusinessName(playerid, response, inputtext[])
{
	// Just close the dialog if the player clicked "Cancel" or if the player didn't input any text
	if ((!response) || (strlen(inputtext) == 0)) return 1;

	// Change the name of the business
	format(ABusinessData[APlayerData[playerid][CurrentBusiness]][BusinessName], 100, inputtext);
	// Also update the 3DText at the entrance of the business
	Business_UpdateEntrance(APlayerData[playerid][CurrentBusiness]);
	// Let the player know that the name of his business has been changed
	SendClientMessage(playerid, 0xFFFFFFFF, TXT_ChangedBusinessName);

	// Save the player-file (and his houses and businesses)
	PlayerFile_Save(playerid);

	return 1;
}

// Sell the business
Dialog_SellBusiness(playerid, response)
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Get the BusinessID where the player is right now and the business-type
	new BusID = APlayerData[playerid][CurrentBusiness];
	new BusType = ABusinessData[BusID][BusinessType];

	// Set the player in the normal world again
	SetPlayerVirtualWorld(playerid, 0);
	SetPlayerInterior(playerid, 0);
	// Set the position of the player at the entrance of his business
	SetPlayerPos(playerid, ABusinessData[BusID][BusinessX], ABusinessData[BusID][BusinessY], ABusinessData[BusID][BusinessZ]);

	// Also clear the tracking-variable to track in which business the player is
	APlayerData[playerid][CurrentBusiness] = 0;

	// Clear the owner of the business
	ABusinessData[BusID][Owned] = false;
	ABusinessData[BusID][Owner] = 0;
	// Clear the house-name and business-level
	ABusinessData[BusID][BusinessName] = 0;
	ABusinessData[BusID][BusinessLevel] = 1;

	// Refund the player 50% of the worth of the business
	RewardPlayer(playerid, (ABusinessInteriors[BusType][BusPrice] * ABusinessData[BusID][BusinessLevel]) / 2, 0);
	SendClientMessage(playerid, 0xFFFFFFFF, TXT_PlayerSoldBusiness);

	// Clear the house-id from the player
	for (new i; i < MAX_BUSINESSPERPLAYER; i++)
	{
		// If the business-slot if found where the business was added to the player
		if (APlayerData[playerid][Business][i] == BusID)
		{
		    // Clear the business-id
		    APlayerData[playerid][Business][i] = 0;
		    // Stop searching
		    break;
		}
	}

	// Update the 3DText near the business's entrance to show other players that it's for sale again
	Business_UpdateEntrance(BusID);

	// Save the player-file (and his houses and businesses)
	PlayerFile_Save(playerid);
	// Also save the sold business, otherwise the old ownership-data is still there
	BusinessFile_Save(BusID);

	return 1;
}

// Process the commands dialog
Dialog_PlayerCommands(playerid, response, listitem)
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response)
	{
		// Reset the FirstCommand (so the list won't start at an unexpected location in the list, but back at the start of the list)
		APlayerData[playerid][DialogFirstItem] = 0;
		return 1; // Exit the function
	}

	// Process the selected listitem
	switch (listitem)
	{
		case 11: // Player chooses "Next..."
		{
		    // Add 5 to the FirstCommand, so the list will start further down the array (will show the next 5 commands)
		    APlayerData[playerid][DialogFirstItem] = APlayerData[playerid][DialogFirstItem] + 5;
		    // Create a new list of commands and show the dialog
		    CommandList_Create(playerid);
		}
	}

	return 1;
}

Dialog_PlayerCommands2(playerid, response, listitem)
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response)
	{
		// Reset the FirstCommand (so the list won't start at an unexpected location in the list, but back at the start of the list)
		APlayerData[playerid][DialogFirstItem] = 0;
		return 1; // Exit the function
	}

	// Process the selected listitem
	switch (listitem)
	{
		case 11: // Player chooses "Next..."
		{
		    // Add 5 to the FirstCommand, so the list will start further down the array (will show the next 5 commands)
		    APlayerData[playerid][DialogFirstItem] = APlayerData[playerid][DialogFirstItem] + 5;
		    // Create a new list of commands and show the dialog
		    CommandList_Create2(playerid);
		}
	}

	return 1;
}

// Process the primary car color dialog
Dialog_PrimaryCarColor(playerid, response, listitem)
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Setup local variables
	new vid = GetPlayerVehicleID(playerid);

	// Save the primary car-color and apply the colors
	AVehicleData[vid][Color1] = listitem;
	ChangeVehicleColor(GetPlayerVehicleID(playerid), AVehicleData[vid][Color1], AVehicleData[vid][Color2]);
	// If the primary color is black, remove the paintjob
	if (listitem == 0)
		AVehicleData[vid][PaintJob] = 0;

	// Let the player pay $150 for changing the color
	RewardPlayer(playerid, -150, 0);
	SendClientMessage(playerid, 0xFFFFFFFF, "{00FF00}Aracýnýzýn rengini $150'a deðiþtirdiniz");

	return 1;
}

// Process the secundary car color dialog
Dialog_SedundaryCarColor(playerid, response, listitem)
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Setup local variables
	new vid = GetPlayerVehicleID(playerid);

	// Save the primary car-color and apply the colors
	AVehicleData[vid][Color2] = listitem;
	ChangeVehicleColor(GetPlayerVehicleID(playerid), AVehicleData[vid][Color1], AVehicleData[vid][Color2]);

	// Let the player pay $150 for changing the color
	RewardPlayer(playerid, -150, 0);
	SendClientMessage(playerid, 0xFFFFFFFF, "{00FF00}Aracýnýzýn rengini $150'a deðiþtirdiniz");

	return 1;
}

// Process the unclamp dialog
Dialog_UnclampVehicles(playerid, response)
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Setup local variables
	new HouseID, vid, ClampedVehicles, UnclampPrice, Msg[128];

	// Loop through all vehicles owned by this player
	for (new HouseSlot; HouseSlot < MAX_HOUSESPERPLAYER; HouseSlot++)
	{
		// Get the HouseID that exists on this index
		HouseID = APlayerData[playerid][Houses][HouseSlot];

		// Check if this house-slot is used
		if (HouseID != 0)
		{
			// Loop through all vehicles assigned to this house
			for (new CarSlot; CarSlot < 10; CarSlot++)
			{
				// Get the vehicle-id of the vehicle in this carslot
				vid = AHouseData[HouseID][VehicleIDs][CarSlot];

				// Check if this carslot is used
				if (vid != 0)
				{
					// Check if this vehicle is clamped
					if (AVehicleData[vid][Clamped] == true)
					    ClampedVehicles++; // Count the clamped vehicles
				}
			}
		}
	}

	// Calculate the price to unclamp all the player's vehicles
	UnclampPrice = ClampedVehicles * UnclampPricePerVehicle;

	// Check if the player has enough cash to unclamp his vehicles
	if (APlayerData[playerid][PlayerMoney] >= UnclampPrice)
	{
		// Loop through all vehicles owned by this player
		for (new HouseSlot; HouseSlot < MAX_HOUSESPERPLAYER; HouseSlot++)
		{
			// Get the HouseID that exists on this index
			HouseID = APlayerData[playerid][Houses][HouseSlot];

			// Check if this house-slot is used
			if (HouseID != 0)
			{
				// Loop through all vehicles assigned to this house
				for (new CarSlot; CarSlot < 10; CarSlot++)
				{
					// Get the vehicle-id of the vehicle in this carslot
					vid = AHouseData[HouseID][VehicleIDs][CarSlot];

					// Check if this carslot is used
					if (vid != 0)
					{
						// Check if this vehicle is clamped
						if (AVehicleData[vid][Clamped] == true)
						    AVehicleData[vid][Clamped] = false; // Unclamp the vehicle
					}
				}
			}
		}

		// Remove the money from the player
		RewardPlayer(playerid, -UnclampPrice, 0);

		// Let the player know his vehicles have been unclamped
		format(Msg, 128, "{00FF00}Aracýnýzý kelepçeden {FFFF00}$%i{00FF00}'a kurtardýnýz.", UnclampPrice);
		SendClientMessage(playerid, 0xFFFFFFFF, Msg);

		// Save the player's profile
		PlayerFile_Save(playerid);
	}
	else
	    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Aracýnýzý kelepçeden kurtaracak paranýz yok!");

	return 1;
}

// Process the rules dialog
Dialog_Rules(playerid, response)
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Check if the player accepted the rules already
	if (APlayerData[playerid][RulesRead] == false)
	{
		// Reward the player with $5000 for accepting the rules
		RewardPlayer(playerid, 5000, 0);
		// Save that the player has accepted the rules
		APlayerData[playerid][RulesRead] = true;

		// Let the player know he earned some money for accepting the rules
		SendClientMessage(playerid, 0xFFFFFFFF, "{00FF00}Kurallarý kabul ederek {FFFF00}$5000{00FF00} kazandýnýz.");

		// Save the player's profile
		PlayerFile_Save(playerid);
	}

	return 1;
}



// Process the dialog that displays statistics of another player (accessed through the scoreboard)
Dialog_StatsOtherPlayer(playerid, response, listitem)
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Setup local variables
	new Name[24], DialogTitle[128], HouseList[1000], BusinessList[1000], BusID, BusType, Earnings, OtherPlayer, HouseID;

	// Get the ID of the other player
	OtherPlayer = APlayerData[playerid][DialogOtherPlayer];

	// If the player chose the line "Houses: xxx" or "Businesses: xxx", open a new dialog that displays them
	switch (listitem)
	{
		case 20: // Player chose to display the other player's houses
		{
			// Construct the dialog-title
			GetPlayerName(OtherPlayer, Name, sizeof(Name));
			format(DialogTitle, 128, "%s'nýn Evleri", Name);

			// Add all house-names of the other player to the list
			for (new i; i < MAX_HOUSESPERPLAYER; i++)
			{
			    // Get the HouseID
			    HouseID = APlayerData[OtherPlayer][Houses][i];

				// Check if this houseindex is occupied
				if (HouseID != 0)
					format(HouseList, 1000, "%s{00FF00}%s{FFFFFF}\n", HouseList, AHouseData[HouseID][HouseName]);
				else
					format(HouseList, 1000, "%s{FFFFFF}%s{FFFFFF}\n", HouseList, "Boþ Ev Slotu");
			}

			// Display the dialog (displays all statistics about the house, such as level, bought vehicles, insurance, ...)
			ShowPlayerDialog(playerid, DialogStatsHouse, DIALOG_STYLE_LIST, DialogTitle, HouseList, "Seç", "Ýptal");
		}
		case 21: // Player chose to display the other player's businesses
		{
			// Construct the dialog-title
			GetPlayerName(OtherPlayer, Name, sizeof(Name));
			format(DialogTitle, 128, "%s'nýn Ýþyerleri", Name);

			// Ask to which business the player wants to port
			for (new i; i < MAX_BUSINESSPERPLAYER; i++)
			{
				// Get the business-id
			    BusID = APlayerData[OtherPlayer][Business][i];

				// Check if this businessindex is occupied
				if (BusID != 0)
				{
					// Get the business-type
					BusType = ABusinessData[BusID][BusinessType];
					Earnings = (BusinessTransactionTime - ABusinessData[BusID][LastTransaction]) * ABusinessInteriors[BusType][BusEarnings] * ABusinessData[BusID][BusinessLevel];
					format(BusinessList, 1000, "%s{00FF00}%s{FFFFFF} (Gelir: $%i)\n", BusinessList, ABusinessData[BusID][BusinessName], Earnings);
				}
				else
					format(BusinessList, 1000, "%s{FFFFFF}%s{FFFFFF}\n", BusinessList, "Boþ Ýþyeri Slotu");
			}

			// Display the dialog (and allow the player to port there)
			ShowPlayerDialog(playerid, DialogStatsGoBusiness, DIALOG_STYLE_LIST, DialogTitle, BusinessList, "Iþýnlan", "Ýptal");
		}
	}

	return 1;
}

// Process the chosen house from another player (displays the statistics of the chosen house)
Dialog_StatsHouse(playerid, response, listitem)
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Setup local variables
	new OtherPlayer, HouseID, HouseData[2000], BuyableCarIndex, DialogTitle[128], Name[24];

	// Get the other player and chosen HouseID
	OtherPlayer = APlayerData[playerid][DialogOtherPlayer];
	HouseID = APlayerData[OtherPlayer][Houses][listitem];

	// Construct the dialog-title
	GetPlayerName(OtherPlayer, Name, sizeof(Name));
	format(DialogTitle, 128, "%s'ýn Evi", Name);

	// Check if this is a valid HouseID
	if (HouseID != 0)
	{
		// Add all data about the house to the dialog
		format(HouseData, sizeof(HouseData), "%s{FFFFFF}Ýsim: {00FF00}%s\n", HouseData, AHouseData[HouseID][HouseName]);
		if (AHouseData[HouseID][Insurance] == 1)
			format(HouseData, sizeof(HouseData), "%s{FFFFFF}Sigorta: {00FF00}Var\n", HouseData);
		else
			format(HouseData, sizeof(HouseData), "%s{FFFFFF}Sigorta: {00FF00}Yok\n", HouseData);

		format(HouseData, sizeof(HouseData), "%s{FFFFFF}Ev Seviyesi: {00FF00}%i/%i\n", HouseData, AHouseData[HouseID][HouseLevel], AHouseData[HouseID][HouseMaxLevel]);
		format(HouseData, sizeof(HouseData), "%s{FFFFFF}Ev Fiyatý: {00FF00}%i\n \n", HouseData, AHouseData[HouseID][HousePrice]);
		format(HouseData, sizeof(HouseData), "%s{FFFFFF}Araçlar:\n", HouseData);

		// Add all vehicles to the list
		for (new CarSlot; CarSlot < 10; CarSlot++)
		{
			// Check if the carslot has a vehicle in it
			if (AHouseData[HouseID][VehicleIDs][CarSlot] != 0)
			{
			    // Get the index where the first vehicle is found in the ABuyableVehicles array
			    BuyableCarIndex = VehicleBuyable_GetIndex(GetVehicleModel(AHouseData[HouseID][VehicleIDs][CarSlot]));
			    // Add the name of the vehicle to the list
				if (AVehicleData[AHouseData[HouseID][VehicleIDs][CarSlot]][Clamped] == true)
				    format(HouseData, 500, "%s{00FF00}%s (kelepçelenmiþ)\n", HouseData, ABuyableVehicles[BuyableCarIndex][CarName]);
				else
				    format(HouseData, 500, "%s{00FF00}%s\n", HouseData, ABuyableVehicles[BuyableCarIndex][CarName]);
			}
			else
				format(HouseData, 500, TXT_EmptyCarSlot, HouseData);
		}

		// Store the HouseID that was chosen of the other player so the other dialogs can display the statistics further
		APlayerData[playerid][DialogOtherPlayerHouse] = HouseID;

		// Display the dialog (and allow the player to port there)
		ShowPlayerDialog(playerid, DialogStatsGoHouse, DIALOG_STYLE_LIST, DialogTitle, HouseData, "Iþýnlan", "Ýptal");
	}
	else
	    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Bu ev slotunda ev yok!");

	return 1;
}

// Port to the house that was chosen by the player when viewing stats about a house and choosing "Goto"
Dialog_StatsGoHouse(playerid, response, listitem)
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Setup local variables
	new HouseID, CarSlot, Float:x, Float:y, Float:z;

	// Get the HouseID
	HouseID = APlayerData[playerid][DialogOtherPlayerHouse];

	switch (listitem)
	{
	    case 6, 7, 8, 9, 10: // One of the cars in the list
	    {
			// Calculate the CarSlot
			CarSlot = listitem - 6;

			// Check if the carslot has a car in it
			if (AHouseData[HouseID][VehicleIDs][CarSlot] != 0)
			{
				// Get the position of the vehicle
				GetVehiclePos(AHouseData[HouseID][VehicleIDs][CarSlot], x, y, z);
				// Port the player to the vehicle
				SetPlayerPos(playerid, x, y, z);
			}
			else
			    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Bu araç slotunda araç yok!");
	    }
	    default: // Any other line
		{
			// Port the player to the house entrance
			SetPlayerPos(playerid, AHouseData[HouseID][HouseX], AHouseData[HouseID][HouseY], AHouseData[HouseID][HouseZ]);
		}
	}

	return 1;
}

// Process the chosen business from another player to port to
Dialog_StatsGoBusiness(playerid, response, listitem)
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Setup local variables
	new BusIndex, BusID;

	// The listitem directly indicates the business-index
	BusIndex = listitem;
	BusID = APlayerData[APlayerData[playerid][DialogOtherPlayer]][Business][BusIndex];

	// Check if this is a valid business (BusID != 0)
	if (BusID != 0)
	{
		// Get the coordinates of the business's entrance
		SetPlayerPos(playerid, ABusinessData[BusID][BusinessX], ABusinessData[BusID][BusinessY], ABusinessData[BusID][BusinessZ]);
	}
	else
	    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Bu iþyeri slotunda iþyeri yok!");

	return 1;
}



// Process the password to register a bank account
Dialog_BankPasswordRegister(playerid, response, inputtext[])
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Check if the player entered a valid password
	if ((strlen(inputtext) > 0) && (strlen(inputtext) < 20))
	{
		// Store the password
		format(APlayerData[playerid][BankPassword], 24, inputtext);
		// Save the bank account
		BankFile_Save(playerid);
		// Inform the player that he has succesfully registered a bank account
		SendClientMessage(playerid, 0xFFFFFFFF, "{00FF00}Baþarýyla banka hesabý açtýnýz");
	}
	else
		SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Banka hesabý açmak için þifre girmelisiniz!");

	return 1;
}

// Process the password to login to your bank account
Dialog_BankPasswordLogin(playerid, response, inputtext[])
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Check if the player entered a valid password
	if ((strlen(inputtext) > 0) && (strlen(inputtext) < 20))
	{
		// Check if the player entered the correct password to login to his bank account
	    if (strcmp(APlayerData[playerid][BankPassword], inputtext, false) == 0)
		{
			// The player has logged in to his bank account
	       	APlayerData[playerid][BankLoggedIn] = true;
			// Inform the player that he has succesfully registered a bank account
			SendClientMessage(playerid, 0xFFFFFFFF, "{00FF00}Banka hesabýnýza baþarýyla giriþ yaptýnýz");
			// Show the bank dialog
			ShowBankMenu(playerid);
		}
		else // The player entered the wrong password
			SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Banka hesabýnýzýn þifresini yanlýþ girdiniz!");
	}
	else
		SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Banka hesabýnýza giriþ yapmak için þifre girmelisiniz!");

	return 1;
}

// Process the options in the bank dialog
Dialog_BankOptions(playerid, response, listitem)
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Setup local variables
	new DialogMsg[500];

	// Check what to do based on which option is chosen
	switch (listitem)
	{
	    case 0: // Deposit funds in your bank account
		{
		    format(DialogMsg, sizeof(DialogMsg), "{FFFFFF}Paranýz: {00FF00}$%i\n", APlayerData[playerid][PlayerMoney]);
		    format(DialogMsg, sizeof(DialogMsg), "%s{FFFFFF}Banka Hesabýndaki Para: {00FF00}$%i\n \n", DialogMsg, APlayerData[playerid][BankMoney]);
		    format(DialogMsg, sizeof(DialogMsg), "%s{FFFFFF}Banka hesabýnýza yatýrmak istediðiniz parayý girin:", DialogMsg);
			ShowPlayerDialog(playerid, DialogBankDeposit, DIALOG_STYLE_INPUT, "Para Yatýr", DialogMsg, TXT_DialogButtonSelect, TXT_DialogButtonCancel);
		}
	    case 1: // Withdraw funds from your bank account
		{
		    // Check if you have any money in your bank account to withdraw from it
		    if (APlayerData[playerid][BankMoney] > 0)
		    {
			    format(DialogMsg, sizeof(DialogMsg), "{FFFFFF}Paranýz: {00FF00}$%i\n", APlayerData[playerid][PlayerMoney]);
			    format(DialogMsg, sizeof(DialogMsg), "%s{FFFFFF}Banka Hesabýndaki Para: {00FF00}$%i\n \n", DialogMsg, APlayerData[playerid][BankMoney]);
			    format(DialogMsg, sizeof(DialogMsg), "%s{FFFFFF}Banka hesabýnýzdan çekmek istediðiniz parayý girin:", DialogMsg);
				ShowPlayerDialog(playerid, DialogBankWithdraw, DIALOG_STYLE_INPUT, "Para Çek", DialogMsg, TXT_DialogButtonSelect, TXT_DialogButtonCancel);
			}
			else
				SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Boþ banka hesabýndan para çekemezsiniz");
		}
	    case 2: // Transfer funds from your bank account to another player's bank account
		{
		    // Check if you have any money in your bank account to transfer from it
		    if (APlayerData[playerid][BankMoney] > 0)
		    {
			    format(DialogMsg, sizeof(DialogMsg), "{FFFFFF}Paranýz: {00FF00}$%i\n", APlayerData[playerid][PlayerMoney]);
			    format(DialogMsg, sizeof(DialogMsg), "%s{FFFFFF}Banka Hesabýndaki Para: {00FF00}$%i\n \n", DialogMsg, APlayerData[playerid][BankMoney]);
			    format(DialogMsg, sizeof(DialogMsg), "%s{FFFFFF}Havale etmek istediðiniz para miktarýný girin:", DialogMsg);
				ShowPlayerDialog(playerid, DialogBankTransferMoney, DIALOG_STYLE_INPUT, "Havale Ýþlemleri", DialogMsg, TXT_DialogButtonSelect, TXT_DialogButtonCancel);
			}
			else
				SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Boþ banka hesabýndan havale iþlemi yapamazsýnýz");
		}
		case 3: // Cancel your bank account
		{
			if (APlayerData[playerid][BankMoney] > 0)
			{
			    format(DialogMsg, sizeof(DialogMsg), "{FFFFFF}Banka hesabýnýzda {00FF00}$%i{FFFFFF} var\n", APlayerData[playerid][BankMoney]);
			    format(DialogMsg, sizeof(DialogMsg), "%s{FFFFFF}Hesabý kapattýðýnýzda bu para size verilecek\n", DialogMsg, APlayerData[playerid][BankMoney]);
			}
		    format(DialogMsg, sizeof(DialogMsg), "%s{FFFFFF}Banka hesabýnýzý kapatmak istediðinizden emin misiniz?", DialogMsg);

			// Ask the player if he's sure he wants to cancel his bank account
			ShowPlayerDialog(playerid, DialogBankCancel, DIALOG_STYLE_MSGBOX, TXT_AreYouSure, DialogMsg, TXT_DialogButtonYes, TXT_DialogButtonNo);
		}
	}

	return 1;
}

// Process the entered amount of money that needs to be deposited into the player's bank account
Dialog_BankDeposit(playerid, response, inputtext[])
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Setup local variables
	new DepositMoney, Msg[128];

	// Convert the entered text into an integer
	DepositMoney = strval(inputtext);

	// Check if the player entered a positive amount of money
	if (DepositMoney > 0)
	{
		// Check if the player has enough money
		if (DepositMoney <= APlayerData[playerid][PlayerMoney])
		{
			// Add the money to your bank account
	        APlayerData[playerid][BankMoney] = APlayerData[playerid][BankMoney] + DepositMoney;
			// Take the money away from yourself
			APlayerData[playerid][PlayerMoney] = APlayerData[playerid][PlayerMoney] - DepositMoney;
			// Save the player's account
			PlayerFile_Save(playerid);
			// Save the bank account
			BankFile_Save(playerid);
			// Inform the player that his money has been deposited
			format(Msg, 128, "{00FF00}Banka hesabýnýza {FFFF00}$%i{00FF00} yatýrdýnýz", DepositMoney);
			SendClientMessage(playerid, 0xFFFFFFFF, Msg);
			// Show the bank dialog
			ShowBankMenu(playerid);
		}
		else
		    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Bu kadar paranýz yok");
	}
	else
	    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Lütfen 0 dan büyük bir deðer girin!");

	return 1;
}

// Process the entered amount of money that needs to be withdrawn from the player's bank account
Dialog_BankWithdraw(playerid, response, inputtext[])
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Setup local variables
	new WithdrawMoney, Msg[128];

	// Convert the entered text into an integer
	WithdrawMoney = strval(inputtext);

	// Check if the player entered a positive amount of money
	if (WithdrawMoney > 0)
	{
		// Check if the player has enough money in his bank account
		if (WithdrawMoney <= APlayerData[playerid][BankMoney])
		{
			// Withdraw the money from your bank account
	        APlayerData[playerid][BankMoney] = APlayerData[playerid][BankMoney] - WithdrawMoney;
			// Give the money to yourself
			APlayerData[playerid][PlayerMoney] = APlayerData[playerid][PlayerMoney] + WithdrawMoney;
			// Save the player's account
			PlayerFile_Save(playerid);
			// Save the bank account
			BankFile_Save(playerid);
			// Inform the player that his money has been withdrawn
			format(Msg, 128, "{00FF00}Banka hesabýnýzdan {FFFF00}$%i{00FF00} çektiniz", WithdrawMoney);
			SendClientMessage(playerid, 0xFFFFFFFF, Msg);
			// Show the bank dialog
			ShowBankMenu(playerid);
		}
		else
		    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Banka hesabýnýzda bu kadar para yok");
	}
	else
	    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Lütfen 0 dan büyük bir deðer girin!");

	return 1;
}

// Process the transfer option (player entered the amount of money to transfer to another player)
Dialog_BankTransferMoney(playerid, response, inputtext[])
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Setup local variables
	new DialogMsg[500];

	// Check if there is a text entered
	if (strlen(inputtext) == 0)
	{
		// Let the player know he must enter a valid amount of money into the input field
	    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Para miktarý girmediniz");
		return 1;
	}

	// Convert the entered text into an integer and store it
	APlayerData[playerid][UseMoney] = strval(inputtext);

	// Check if the player entered a valid amount of money to be transferred
	if (APlayerData[playerid][UseMoney] > 0)
	{
		// Check if the player has enough money in his bank account to transfer it to another player's account
		if (APlayerData[playerid][UseMoney] <= APlayerData[playerid][BankMoney])
		{
			// Ask the player to which account he wants to transfer the money
		    format(DialogMsg, sizeof(DialogMsg), "{FFFFFF}Paranýz {00FF00}$%i\n", APlayerData[playerid][PlayerMoney]);
		    format(DialogMsg, sizeof(DialogMsg), "%s{FFFFFF}Banka Hesabýnýzdaki Para: {00FF00}$%i\n", DialogMsg, APlayerData[playerid][BankMoney]);
		    format(DialogMsg, sizeof(DialogMsg), "%s{FFFFFF}Havale Edilecek Para: {00FF00}$%i\n \n", DialogMsg, APlayerData[playerid][UseMoney]);
		    format(DialogMsg, sizeof(DialogMsg), "%s{FFFFFF}Havale iþlemi yapmak istediðiniz banka hesabýnýn sahibinin ismini girin:", DialogMsg);
			ShowPlayerDialog(playerid, DialogBankTransferName, DIALOG_STYLE_INPUT, "Havale Yap", DialogMsg, TXT_DialogButtonSelect, TXT_DialogButtonCancel);
		}
		else
		    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Banka hesabýnýzda bu kadar para yok");
	}
	else
	    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Lütfen 0 dan büyük bir deðer girin!");

	return 1;
}

// Process the transfer option (player entered the name of the other player who must receive the money)
Dialog_BankTransferName(playerid, response, inputtext[])
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Setup local variables
	new file[100], File:BFile, LineForFile[100], ReceiverName[24], SenderName[24], Msg[128];
	new OtherPlayer, Day, Month, Year, Hour, Minute, Second, sDay[3], sMonth[3], sYear[5], sHour[3], sMinute[3];

    // Get the playername of the sender (the player who executes the transfer)
	format(SenderName, sizeof(SenderName), APlayerData[playerid][PlayerName]);

	// Check if there is a text entered
	if (strlen(inputtext) == 0)
	{
		// Let the player know he must enter a playername or playerid into the input field
	    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Oyuncu ismi veya ID'i girmelisiniz.");
		return 1;
	}

	// Try to convert the given playername OR playerid to a playerid
	sscanf(inputtext, "u", OtherPlayer);

	// Check if an online player was found by sscanf
	if (OtherPlayer != INVALID_PLAYER_ID)
	{
		// Check if that other player is online (use online bank-transfer)
		if (APlayerData[OtherPlayer][LoggedIn] == true)
		{
			format(ReceiverName, sizeof(ReceiverName), APlayerData[OtherPlayer][PlayerName]); // Get the playername of the receiver
			format(file, sizeof(file), BankFile, ReceiverName); // Construct the complete filename for the receiver's bank-account

			// Check if the receiver has a bank account
			if (fexist(file))
			{
			    // Transfer the money from your bank account to the other player's bank account
			    APlayerData[OtherPlayer][BankMoney] = APlayerData[OtherPlayer][BankMoney] + APlayerData[playerid][UseMoney];
				// Take the money away from your own bank account
				APlayerData[playerid][BankMoney] = APlayerData[playerid][BankMoney] - APlayerData[playerid][UseMoney];
				// Save both bank accounts
				BankFile_Save(OtherPlayer);
				BankFile_Save(playerid);
				// Inform the receiver that money was transferred to his bank account
				format(Msg, 128, "{00FF00}Banka hesabýnýza {FFFF00}$%i{00FF00} havale edildi. Gönderen: {FFFF00}%s", APlayerData[playerid][UseMoney], SenderName);
				SendClientMessage(OtherPlayer, 0xFFFFFFFF, Msg);
				// Inform the sender that money was transferred from his bank account to the receiver
				format(Msg, 128, "{FFFF00}$%i{00FF00} havale ettiniz. Gönderilen Kiþi: {FFFF00}%s{00FF00}", APlayerData[playerid][UseMoney], ReceiverName);
				SendClientMessage(playerid, 0xFFFFFFFF, Msg);
				// Exit the function (bank transfer was completed), skipping offline transfer
				return 1;
			}
			else // The target player is online, but has no bank account
			{
				format(Msg, 128, "{FF0000}Oyuncu {FFFF00}%s{FF0000} oyunda, fakat banka hesabý yok, havale baþarýsýz.", inputtext);
			    SendClientMessage(playerid, 0xFFFFFFFF, Msg);
				// Exit the function (bank transfer failed as the target player has no bank account), skipping offline transfer
				return 1;
			}
		}
		else
		{
			// An online player was found here, but he hasn't logged in yet, so treat him as an offline player
			// The rest of the function will be executes to process offline bank transfers
		}
	}

	// The player might be offline or doesn't exist (no player account with that name), so try to use an offline bank-transfer
	// This part of the code is executed because sscanf failed to find an online player with the given name
	// or the player is connected to the server, but hasn't logged in yet (didn't type his password already), this is treated
	// as being offline

	// Construct the complete filename for the receiver's bank-account
	format(file, sizeof(file), BankFile, inputtext);

	// Check if the receiver has a bank account
	if (fexist(file))
	{
	    // Open the file
		BFile = fopen(file, io_append); // Open the receiver's bank account for appending data to it

		fwrite(BFile, "[Transfer]\r\n");
		format(LineForFile, 100, "TransferMoney %i\r\n", APlayerData[playerid][UseMoney]); // Construct the line: "TransferMoney <TransferMoney>"
		fwrite(BFile, LineForFile); // And save it to the file
		format(LineForFile, 100, "TransferName %s\r\n", SenderName); // Construct the line: "TransferName <SenderName>"
		fwrite(BFile, LineForFile); // And save it to the file
		// Get the current date and time
		getdate(Year, Month, Day);
		gettime(Hour, Minute, Second);

		// Make sure the Day is 2 characters long
		if (Day < 10) format(sDay, sizeof(sDay), "0%i", Day);
		else format(sDay, sizeof(sDay), "%i", Day);
		// Make sure the Month is 2 characters long
		if (Month < 10) format(sMonth, sizeof(sMonth), "0%i", Month);
		else format(sMonth, sizeof(sMonth), "%i", Month);
		// Convert the Year into a string
	    format(sYear, sizeof(sYear), "%i", Year);
		// Make sure the Hour is 2 characters long
		if (Hour < 10) format(sHour, sizeof(sHour), "0%i", Hour);
		else format(sHour, sizeof(sHour), "%i", Hour);
		// Make sure the Minute is 2 characters long
		if (Minute < 10) format(sMinute, sizeof(sMinute), "0%i", Minute);
		else format(sMinute, sizeof(sMinute), "%i", Minute);

		format(LineForFile, 100, "TransferTime %s/%s/%s %s:%s\r\n", sDay, sMonth, sYear, sHour, sMinute); // Construct the line: "TransferTime <TransferTime>"
		fwrite(BFile, LineForFile); // And save it to the file
		fwrite(BFile, "[/Transfer]\r\n"); // Save the transfer-terminator string to the file

		fclose(BFile); // Close the file

		// Take the money away from your own bank account
		APlayerData[playerid][BankMoney] = APlayerData[playerid][BankMoney] - APlayerData[playerid][UseMoney];
		// Save your bank account
		BankFile_Save(playerid);

		// Inform the sender that the transfer was completed
		format(Msg, 128, "{00FF00}Oyuncu {FFFF00}%s{00FF00} oyunda deðil fakat banka hesabý var. {FFFF00}$%i{00FF00} baþarýyla havale edildi.", inputtext, APlayerData[playerid][UseMoney]);
		SendClientMessage(playerid, 0xFFFFFFFF, Msg);
	}
	else
	{
		format(Msg, 128, "{FFFF00}%s{FF0000} isminde banka hesabý bulunamadý, havale baþarýsýz.", inputtext);
	    SendClientMessage(playerid, 0xFFFFFFFF, Msg);
	}

	return 1;
}

// Process the Bank Cancel option
Dialog_BankCancel(playerid, response)
{
	// Just close the dialog if the player clicked "No"
	if(!response) return 1;

	// Setup local variables
	new file[100], Name[24];

    // Get the playername
	format(Name, sizeof(Name), APlayerData[playerid][PlayerName]);
	// Construct the complete filename for this player's bank-account
	format(file, sizeof(file), BankFile, Name);

	// Check if the player's ban account exists (to be sure it's still there)
	if (fexist(file))
		fremove(file); // Delete the bank account

	// If there is any money left in the account, give the funds back to the player
	RewardPlayer(playerid, APlayerData[playerid][BankMoney], 0);
	// Inform the player about the remaining funds of your bank account
	if (APlayerData[playerid][BankMoney] > 0)
	    SendClientMessage(playerid, 0xFFFFFFFF, "{00FF00}Banka hesabýnýzdaki para size verildi.");

	// Save the player's account
	PlayerFile_Save(playerid);

	// Clear the data from the player's account
	APlayerData[playerid][BankPassword] = 0;
	APlayerData[playerid][BankLoggedIn] = false;
	APlayerData[playerid][BankMoney] = 0;

	// Inform the player about it
	SendClientMessage(playerid, 0xFFFFFFFF, "{00FF00}Banka hesabýnýz silindi.");

	return 1;
}

// Process the chosen help-item
Dialog_HelpItemChosen(playerid, response, listitem)
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Setup local variables
	new DialogTitle[128];

	// Clear the dialog-message
	format(DialogMsg5000, 5000, "");

	// Set the dialog-title for the help-topic to be shown
	format(DialogTitle, 128, AHelpTopics[listitem]);

	// Select the help-item and create a dialog that displays all text about that item
	for (new i; i < sizeof(AHelpText); i++)
	{
		// Check if this textline belongs to the help-item
		if (AHelpText[i][HelpID] == listitem)
		{
		    // Add all help-textlines to the list
			format(DialogMsg5000, 5000, "%s%s\n", DialogMsg5000, AHelpText[i][HelpText]);
		}
	}

	// Show the help-text in a dialog
	ShowPlayerDialog(playerid, DialogHelpItem, DIALOG_STYLE_MSGBOX, DialogTitle, DialogMsg5000, "Geri", TXT_DialogButtonCancel);

	return 1;
}

// Process the help-item (select "Back" or "Cancel"
Dialog_HelpItem(playerid, response)
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// If the player chose "Back", re-open the helplist
	HelpList_Create(playerid);

	return 1;
}



// Process the old password of the player
Dialog_OldPassword(playerid, response, inputtext[])
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Check if the entered password is the same as the password saved in the player's account
    if (strcmp(APlayerData[playerid][PlayerPassword], inputtext, false) == 0)
	{
		// Ask the player to enter a new password
		ShowPlayerDialog(playerid, DialogNewPassword, DIALOG_STYLE_INPUT, "Þifreni Deðiþtir", "Yeni þifre giriniz:", "Deðiþtir", "Ýptal");
	}
	else
	    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Yanlýþ þifre girdiniz!");

	return 1;
}

// Process the new password of the player
Dialog_NewPassword(playerid, response, inputtext[])
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Setup local variables
	new Msg[256];

	// Check if the entered password is valid (not empty)
    if (strlen(inputtext) > 0)
	{
		// Check if the player didn't enter the same password
	    if (strcmp(APlayerData[playerid][PlayerPassword], inputtext, false) != 0)
		{
			// Store the new password
			format(APlayerData[playerid][PlayerNewPassword], 50, inputtext);
			// Construct the content of the dialog, which displays the old and new password
			format(Msg, 256, "{FFFFFF}Eski Þifreniz: \t{00FF00}%s{FFFFFF}\n", APlayerData[playerid][PlayerPassword]);
			format(Msg, 256, "%sYeni Þifreniz: \t{00FF00}%s{FFFFFF}\n \n", Msg, APlayerData[playerid][PlayerNewPassword]);
			format(Msg, 256, "%sÞifrenizin deðiþtirmek istediðinizden emin misiniz?", Msg);

			// Ask the player if he really wants to change his password
			ShowPlayerDialog(playerid, DialogConfirmPassword, DIALOG_STYLE_MSGBOX, "Þifreni Deðiþtir", Msg, "Evet", "Hayýr");
		}
		else
		    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Yeni þifre eskisiyle ayný olamaz!");
	}
	else
	    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Yanlýþ þifre!");

	return 1;
}

// Process the dialog where the player needs to confirm the password-change
Dialog_ConfirmPassword(playerid, response)
{
	// Just close the dialog if the player clicked "Cancel"
	if(!response) return 1;

	// Copy the new password to the old one, overwriting the old one
	format(APlayerData[playerid][PlayerPassword], 50, APlayerData[playerid][PlayerNewPassword]);
	// Clear the new password
	format(APlayerData[playerid][PlayerNewPassword], 50, "");

	// Let the player know his password has been changed
    SendClientMessage(playerid, 0xFFFFFFFF, "{00FF00}Þifreniz deðiþtirildi");

	// Save the player's account
	PlayerFile_Save(playerid);


	return 1;
}

// ************************************************************************************************************************************************************
// PPC_PlayerCommands
// ************************************************************************************************************************************************************
/*
// This is just a joke command
COMMAND:me(playerid,params[])
{
	// Setup local variables
	new Msg[128], Message[128], Name[24];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/me", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		if (sscanf(params, "s[128]", Message)) SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/me <action>\"");
		else
		{
		    // Check if the player isn't muted
		    if (APlayerData[playerid][Muted] == false)
		    {
				GetPlayerName(playerid, Name, sizeof(Name));
				format(Msg, sizeof(Msg), "* %s: %s", Name, Message);
				SendClientMessageToAll(0xFFFF00AA, Msg);
			}
			else
			    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}You are still muted");
		}
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}
*/
// This command gives a truckers license to a player
COMMAND:givelicense(playerid,params[])
{
	// Setup local variables
	new OtherPlayer, Msg[128], Name[24], OtherName[24];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/givelicense", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 3
		if (APlayerData[playerid][PlayerLevel] >= 3)
		{
			if (sscanf(params, "u", OtherPlayer)) SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/givelicense <ID>\"");
			else
			{
			    // Check if the other player is logged in
			    if (APlayerData[OtherPlayer][LoggedIn] == true)
			    {
					// Get the admin's name
					GetPlayerName(playerid, Name, sizeof(Name));
					// Get the other player's name
					GetPlayerName(OtherPlayer, OtherName, sizeof(OtherName));
					// Give the other player a truckers license
					APlayerData[OtherPlayer][TruckerLicense] = 1;

					// Save the player-file (and his houses)
					PlayerFile_Save(OtherPlayer);

					// Inform the admin that you've given a player a truckers license
					format(Msg, sizeof(Msg), "{FFFF00}%s{00FF00}'a kamyon ehliyeti verdiniz", OtherName);
					SendClientMessage(playerid, 0xFFFFFFFF, Msg);
					// Inform the player that he received a free truckers license from an admin
					format(Msg, sizeof(Msg), "{FFFF00}%s {00FF00}size kamyon ehliyeti verdi", Name);
					SendClientMessage(OtherPlayer, 0xFFFFFFFF, Msg);
				}
				else
				    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Hatalý oyuncu ID'i");
			}
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// This commands allows the player to send a private message to another player
COMMAND:pm(playerid, params[])
{
	// Setup local variables
	new OtherPlayer, Message[128], Msg[128];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/pm", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		if (sscanf(params, "us[128]", OtherPlayer, Message)) SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/pm <ID> <Mesaj>\"");
		else
		{
			// Check if that other player is online
			if (IsPlayerConnected(OtherPlayer))
			{
			    // Check if the player isn't muted
			    if (APlayerData[playerid][Muted] == false)
			    {
					format(Msg, 128, "{ADFF2F}PM %s(%d): %s", GetName(playerid), playerid, Message);

					SendClientMessage(playerid, 0xFFFFFFFF, Msg);
					SendClientMessage(OtherPlayer, 0xFFFFFFFF, Msg);
				}
				else
				    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Susturulmuþken PM atamazsýnýz");
			}
			else
			    SendClientMessage(playerid, 0xFF0000FF, "Hatalý oyuncu ID'i");
		}
	}
	else
	 return 0;

	// Let the server know that this was a valid command
	return 1;
}


// Lets the player add new houses
COMMAND:createhouse(playerid, params[])
{
	// Setup local variables
	new HPrice, MaxLevel, HouseID;

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/createhouse", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 5
		if (APlayerData[playerid][PlayerLevel] >= 10)
		{
			// Check if the player isn't inside a vehicle
			if (GetPlayerVehicleSeat(playerid) == -1)
			{
				if (sscanf(params, "ii", HPrice, MaxLevel)) SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/createhouse <Fiyat> <MaxLevel (1-10)>\"");
				else
				{
					// Check if the player entered a proper maxlevel
					if ((MaxLevel >= 1) && (MaxLevel <= 10))
					{
						// Find the first free HouseID
						for (HouseID = 1; HouseID < MAX_HOUSES; HouseID++)
							if (AHouseData[HouseID][PickupID] == 0) // Check if an empty house-index has been found (PickupID is 0)
							    break; // Stop searching, the first free HouseID has been found now

					    // Check if the house-limit hasn't been reached yet
						if (HouseID < MAX_HOUSES)
						{
						    // Setup some local variables
							new Float:x, Float:y, Float:z, Msg[128];
							// Get the player's position
							GetPlayerPos(playerid, x, y, z);
							// Set some default data
							AHouseData[HouseID][HouseX] = x;
							AHouseData[HouseID][HouseY] = y;
							AHouseData[HouseID][HouseZ] = z;
							AHouseData[HouseID][HouseLevel] = 1;
							AHouseData[HouseID][HouseMaxLevel] = MaxLevel;
							AHouseData[HouseID][HousePrice] = HPrice;
							AHouseData[HouseID][Owned] = false;

							// Add the pickup and 3DText at the location of the house-entrance (where the player is standing when he creates the house)
							House_CreateEntrance(HouseID);

							// Save the house
							HouseFile_Save(HouseID);

							// Inform the player that he created a new house
							format(Msg, 128, "{00FF00}Baþarýyla ev oluþturdunuz. ID: {FF00FF}%i{00FF00}", HouseID);
							SendClientMessage(playerid, 0xFFFFFFFF, Msg);
						}
						else
						    SendClientMessage(playerid, 0xFF0000FF, "Eklenebilecek en fazla ev sayýsýna ulaþýldý");
					}
					else
					    SendClientMessage(playerid, 0xFF0000FF, "Sadece 1 ve 10 arasý max level girebilirsiniz!");
				}
			}
			else
			    SendClientMessage(playerid, 0xFF0000FF, "Araçtayken ev ekleyemezsiniz!");
		}
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}



// This command lets the player delete a house
COMMAND:delhouse(playerid, params[])
{
	// Setup local variables
	new file[100], Msg[128];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/delhouse", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 5
		if (APlayerData[playerid][PlayerLevel] >= 10)
		{
			// Make sure the player isn't inside a vehicle
			if (GetPlayerVehicleID(playerid) == 0)
			{
				// Loop through all player-owned houses
				for (new HouseID = 1; HouseID < MAX_HOUSES; HouseID++)
				{
					// Check if the house exists
					if (AHouseData[HouseID][PickupID] != 0)
					{
						// Check if the house has no owner
						if (AHouseData[HouseID][Owned] == false)
						{
							// Check if the player is in range of the house-pickup
							if (IsPlayerInRangeOfPoint(playerid, 2.5, AHouseData[HouseID][HouseX], AHouseData[HouseID][HouseY], AHouseData[HouseID][HouseZ]))
							{
								// Clear all data of the house
	                            AHouseData[HouseID][HouseName] = 0;
	                            AHouseData[HouseID][Insurance] = 0;
	                            AHouseData[HouseID][HouseX] = 0.0;
	                            AHouseData[HouseID][HouseY] = 0.0;
	                            AHouseData[HouseID][HouseZ] = 0.0;
	                            AHouseData[HouseID][HouseLevel] = 0;
	                            AHouseData[HouseID][HouseMaxLevel] = 0;
	                            AHouseData[HouseID][HousePrice] = 0;
	                            AHouseData[HouseID][Owned] = false;
	                            AHouseData[HouseID][Owner] = 0;
	                            AHouseData[HouseID][HouseName] = 0;
	                            AHouseData[HouseID][HouseName] = 0;
	                            AHouseData[HouseID][HouseName] = 0;
								// Destroy the mapicon, 3DText and pickup for the house
								DestroyDynamicPickup(AHouseData[HouseID][PickupID]);
								DestroyDynamicMapIcon(AHouseData[HouseID][MapIconID]);
								DestroyDynamic3DTextLabel(AHouseData[HouseID][DoorText]);
	                            AHouseData[HouseID][PickupID] = 0;
	                            AHouseData[HouseID][MapIconID] = 0;

								// Delete the House-file
								format(file, sizeof(file), HouseFile, HouseID); // Construct the complete filename for this house-file
								if (fexist(file)) // Make sure the file exists
									fremove(file); // Delete the file

								// Also let the player know he deleted the house
								format(Msg, 128, "{00FF00}Yanýnýzdaki evi sildiniz. Ev ID'i: {FFFF00}%i", HouseID);
								SendClientMessage(playerid, 0xFFFFFFFF, Msg);

								// Exit the function
								return 1;
							}
						}
					}
				}

				// There was no house in range, so let the player know about it
				SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Yakýnlarda ev yok!");
			}
			else
			    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Araçtayken ev silemezsiniz!");
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}




// This command lets the player buy a house when he's standing in range of a house that isn't owned yet
COMMAND:eval(playerid, params[])
{
	// Setup local variables
	new Msg[128];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/eval", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Make sure the player isn't inside a vehicle
		if (GetPlayerVehicleID(playerid) == 0)
		{
			// Check if the player is near a house-pickup
			for (new i = 1; i < sizeof(AHouseData); i++)
			{
				// Check if this house is created (it would have a valid pickup in front of the door)
				if (AHouseData[i][PickupID] != 0)
				{
					// Check if the player is in range of the house-pickup
					if (IsPlayerInRangeOfPoint(playerid, 2.5, AHouseData[i][HouseX], AHouseData[i][HouseY], AHouseData[i][HouseZ]))
					{
					    // Check if the house isn't owned yet
					    if (AHouseData[i][Owned] == false)
					    {
					        // Check if the player can afford this house
					        if (APlayerData[playerid][PlayerMoney] >= AHouseData[i][HousePrice])
					            House_SetOwner(playerid, i); // Give ownership of the house to the player
					        else
					            SendClientMessage(playerid, 0xFF0000FF, "Bu evi alacak paranýz yok!"); // The player cannot afford this house
					    }
					    else
					    {
					        // Let the player know that this house is already owned by a player
							format(Msg, 128, "{FF0000}Bu evin zaten sahibi var! Sahip: {00FF00}%s{FFFFFF}", AHouseData[i][Owner]);
							SendClientMessage(playerid, 0xFFFFFFFF, Msg);
					    }

						// The player was in range of a house-pickup, so stop searching for the other house pickups
					    return 1;
					}
				}
			}

			// All houses have been processed, but the player wasn't in range of any house-pickup, let him know about it
			SendClientMessage(playerid, 0xFF0000FF, "Ev almak için ev ikonunun yanýnda bulunmalýsýnýz!");
		}
		else
		    SendClientMessage(playerid, 0xFF0000FF, "Araçtayken ev alamazsýnýz!");
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// This command lets the player enter the house/business if he's the owner
COMMAND:gir(playerid, params[])
{
	// Setup local variables
	new HouseID, hLevel, BusType;

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/gir", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Make sure the player isn't inside a vehicle
		if (GetPlayerVehicleID(playerid) == 0)
		{
			// Loop through all houses
			for (HouseID = 1; HouseID < MAX_HOUSES; HouseID++)
			{
				// Check if this house exists
				if (AHouseData[HouseID][PickupID] != 0)
				{
					// Check if the player is in range of the house-pickup
					if (IsPlayerInRangeOfPoint(playerid, 2.5, AHouseData[HouseID][HouseX], AHouseData[HouseID][HouseY], AHouseData[HouseID][HouseZ]))
					{
						// Check if the house is closed to the public
						if (AHouseData[HouseID][HouseOpened] == false)
						{
							// The house isn't open to the public, so keep anyone out who isn't the owner of the house
							if (House_PlayerIsOwner(playerid, HouseID) == 0)
							{
							    // Let the player know that this house isn't open to the public and he can't enter it
								SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Bu ev kilitli olduðu için giremezsiniz!");
							    return 1;
							}
						}

						// The house is open to the public, or the player trying to enter is the owner, so let the player inside the house

					    // Get the level of the house
						hLevel = AHouseData[HouseID][HouseLevel];
						// Set the worldid so other players cannot see him anymore
						SetPlayerVirtualWorld(playerid, 5000 + HouseID);
						// Set the player inside the interior of the house
						SetPlayerInterior(playerid, AHouseInteriors[hLevel][InteriorID]);
						// Set the position of the player at the spawn-location of the house's interior
						SetPlayerPos(playerid, AHouseInteriors[hLevel][IntX], AHouseInteriors[hLevel][IntY], AHouseInteriors[hLevel][IntZ]);
						// Also set a tracking-variable to enable /evmenu to track in which house the player is
						APlayerData[playerid][CurrentHouse] = HouseID;
						// Also let the player know he can use /evmenu to upgrade/exit his house
						SendClientMessage(playerid, 0xFFFFFFFF, "{FFFF00}/evmenu{00FF00} yazarak ev seçeneklerine ulaþabilirsiniz.");

						// Exit the function
						return 1;
					}
				}
			}


			for(new i; i < MAX_BUSINESS; i++)
			{
			    if(ABusinessData[i][BusinessType] == 0) continue;
				if (IsPlayerInRangeOfPoint(playerid, 2.5, ABusinessData[i][BusinessX], ABusinessData[i][BusinessY], ABusinessData[i][BusinessZ]))
				{
    				BusType = ABusinessData[i][BusinessType];
					SetPlayerVirtualWorld(playerid, 1000 + i);
					SetPlayerInterior(playerid, ABusinessInteriors[BusType][InteriorID]);

					SetPlayerPos(playerid, ABusinessInteriors[BusType][IntX], ABusinessInteriors[BusType][IntY], ABusinessInteriors[BusType][IntZ]);
					APlayerData[playerid][CurrentBusiness] = i;
					SendClientMessage(playerid, 0xFFFFFFFF, "{FFFF00}/isyeri{00FF00} yazarak iþyeri seçeneklerine ulaþabilirsiniz.");
					SendClientMessage(playerid, 0xFFFFFFFF, "{00FF00}Ýþyerinden çýkmak için tekrar {FFFF00}/isyeri {00FF00}yazýp çýk diyebilirsiniz.");
				}
			}
			// Loop through all player-owned businesses
/*
			for (new i; i < MAX_BUSINESSPERPLAYER; i++)
			{
			    // Get the business-id at the selected slot from the player
			    BusID = APlayerData[playerid][Business][i];

				// Check if the player has owned a business in this slot
				if (BusID != 0)
				{
					// Check if the player is in range of the business-pickup
					if (IsPlayerInRangeOfPoint(playerid, 2.5, ABusinessData[BusID][BusinessX], ABusinessData[BusID][BusinessY], ABusinessData[BusID][BusinessZ]))
					{
					    // Get the business-type
					    BusType = ABusinessData[BusID][BusinessType];
						// Set the worldid so other players cannot see him anymore
						SetPlayerVirtualWorld(playerid, 1000 + playerid);
						// Set the player inside the interior of the business
						SetPlayerInterior(playerid, ABusinessInteriors[BusType][InteriorID]);

						// Set the position of the player at the spawn-location of the business's interior
						SetPlayerPos(playerid, ABusinessInteriors[BusType][IntX], ABusinessInteriors[BusType][IntY], ABusinessInteriors[BusType][IntZ]);
						// Also set a tracking-variable to enable /busmenu to track in which business the player is
						APlayerData[playerid][CurrentBusiness] = BusID;
						// Also let the player know he can use /busmenu to upgrade/exit his business
						SendClientMessage(playerid, 0xFFFFFFFF, "{FFFF00}/isyeri{00FF00} yazarak iþyeri seçeneklerine ulaþabilirsiniz.");

						// Exit the function
						return 1;
					}
				}
			}
*/
		}
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// This command opens a menu when you're inside your house to allow to access the options of your house
COMMAND:evmenu(playerid, params[])
{
	// Setup local variables
	new OptionsList[200], DialogTitle[200];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/evmenu", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player is inside a house
		if (APlayerData[playerid][CurrentHouse] != 0)
		{
			format(DialogTitle, sizeof(DialogTitle), "Ev %s", AHouseData[APlayerData[playerid][CurrentHouse]][HouseName]);

			format(OptionsList, sizeof(OptionsList), "%sEv Ýsmini Deðiþtir\n", OptionsList);
			format(OptionsList, sizeof(OptionsList), "%sEvi Geliþtir\n", OptionsList);
			format(OptionsList, sizeof(OptionsList), "%sEve Araç Al\n", OptionsList);
			format(OptionsList, sizeof(OptionsList), "%sEv Araçlarýna Sigorta Yaptýr\n", OptionsList);
			format(OptionsList, sizeof(OptionsList), "%sEv Aracý Sat\n", OptionsList);
			format(OptionsList, sizeof(OptionsList), "%sEvi Sat\n", OptionsList);
			format(OptionsList, sizeof(OptionsList), "%sEvin Kilidini Aç\n", OptionsList);
			format(OptionsList, sizeof(OptionsList), "%sEvi Kilitle\n", OptionsList);
			format(OptionsList, sizeof(OptionsList), "%sEvden Çýk\n", OptionsList);
			// Show the housemenu
			ShowPlayerDialog(playerid, DialogHouseMenu, DIALOG_STYLE_LIST, DialogTitle, OptionsList, "Seç", "Ýptal");
		}
		else
		    SendClientMessage(playerid, 0xFF0000FF, "Evde Deðilsiniz!");
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}



// This command allows you to port a vehicle from your house to your location
COMMAND:getcar(playerid, params[])
{
	// Setup local variables
	new HouseList[1000];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/getcar", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player is not jailed
		if (APlayerData[playerid][PlayerJailed] == 0)
		{
			// Check if the player is not inside a vehicle
			if (GetPlayerVehicleID(playerid) == 0)
			{
				// Ask to which house the player wants to add his vehicle
				for (new i; i < MAX_HOUSESPERPLAYER; i++)
				{
					// Check if this houseindex is occupied
					if (APlayerData[playerid][Houses][i] != 0)
						format(HouseList, 1000, "%s{00FF00}%s{FFFFFF}\n", HouseList, AHouseData[APlayerData[playerid][Houses][i]][HouseName]);
					else
						format(HouseList, 1000, "%s{FFFFFF}%s{FFFFFF}\n", HouseList, "Boþ Ev Slotu");
				}
				ShowPlayerDialog(playerid, DialogGetCarSelectHouse, DIALOG_STYLE_LIST, "Aracý Çekilecek Evini Seç", HouseList, "Seç", "Ýptal");
			}
			else
				SendClientMessage(playerid, 0xFF0000FF, "Ev aracýný çekebilmek için ayakta olmalýsýnýz");
		}
		else
		    SendClientMessage(playerid, 0xFF0000FF, "Hapisteyken /getcar yazamazsýnýz!");
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// This command checks if the player is inside a vehicle that he owns and if he's in range of the house where the vehicle is assigned to
COMMAND:park(playerid, params[])
{
	// Setup local variables
	new Float:x, Float:y, Float:z, Float:rot, vid, HouseID, Msg[128];
	new engine,lights,alarm,doors,bonnet,boot,objective;

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/park", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player is inside a vehicle (he must be the driver)
		if (GetPlayerVehicleSeat(playerid) == 0)
		{
			// Get the vehicle-id
			vid = GetPlayerVehicleID(playerid);
			// Get the HouseID to which this vehicle belongs
			HouseID = AVehicleData[vid][BelongsToHouse];

			// Check if the vehicle is owned (owner-check is not really required, as another player would get kicked out very fast)
			// AND it must belong to a house that the player owns
			if ((AVehicleData[vid][Owned] == true) && (HouseID != 0))
			{
				// Check if the vehicle is in range of the house-entrance (you cannot park a vehicle further away from your house than 150m)
				if (IsPlayerInRangeOfPoint(playerid, ParkRange, AHouseData[HouseID][HouseX], AHouseData[HouseID][HouseY], AHouseData[HouseID][HouseZ]))
				{
					// Get the player's position and angle
					GetVehiclePos(vid, x, y, z);
					GetVehicleZAngle(vid, rot);
					// Save those values for the vehicle
					AVehicleData[vid][SpawnX] = x;
					AVehicleData[vid][SpawnY] = y;
					AVehicleData[vid][SpawnZ] = z;
					AVehicleData[vid][SpawnRot] = rot;

					// Find the vehicle in the player's houses
					for (new i; i < MAX_HOUSESPERPLAYER; i++)
					{
						// Get the HouseID of the current house
					    HouseID = APlayerData[playerid][Houses][i];

						// Loop through all carslots of this house to find the vehicle-id
						for (new CarSlot; CarSlot < 10; CarSlot++)
						{
							// Check if this carslot holds the same vehicle-id
						    if (AHouseData[HouseID][VehicleIDs][CarSlot] == vid)
						    {
			                    House_ReplaceVehicle(HouseID, CarSlot); // Re-create the vehicle at the same spot the player wants to park his vehicle
			                    PutPlayerInVehicle(playerid, AHouseData[HouseID][VehicleIDs][CarSlot], 0);
								// Turn on the engine
								GetVehicleParamsEx(AHouseData[HouseID][VehicleIDs][CarSlot], engine, lights, alarm, doors, bonnet, boot, objective);
								SetVehicleParamsEx(AHouseData[HouseID][VehicleIDs][CarSlot], 1, lights, alarm, doors, bonnet, boot, objective);
			                    break; // Stop the for-loop
							}
						}
					}

					// Let the player know he parked his vehicle
					SendClientMessage(playerid, 0x00FF00FF, "Aracýnýzý park ettiniz");

					// Save the player-file (and his houses)
					PlayerFile_Save(playerid);
				}
				else
				{
				    format(Msg, 128, "{FF0000}Aracýnýzý park edebilmek için eve en fazla %im uzaklýkta olmalýsýnýz!", floatround(ParkRange));
				    SendClientMessage(playerid, 0xFFFFFFFF, Msg);
				}
			}
			else
			    SendClientMessage(playerid, 0xFF0000FF, "Kendinize ait olmayan aracý park edemezsiniz!");
		}
		else
		    SendClientMessage(playerid, 0xFF0000FF, "Park edebilmek için aracý sürüyor olmalýsýnýz!");
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}



// Lets the player rent a vehicle
COMMAND:arabakirala(playerid, params[])
{
	// Setup local variables
	new VehicleClassList[1000];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/arabakirala", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Make sure the player isn't inside a vehicle
		if (GetPlayerVehicleID(playerid) == 0)
		{
			// Check if the player is near a cardealerpickup
			for (new i; i < sizeof(ACarDealerPickups); i++)
			{
				// Check if a valid cardealerpickup is found
				if (ACarDealerPickups[i][PickupID] != 0)
				{
					// Check if the player is in range of the cardealerpickup
					if(IsPlayerInRangeOfPoint(playerid, 2.5, ACarDealerPickups[i][pux], ACarDealerPickups[i][puy], ACarDealerPickups[i][puz]))
					{
					    // Let the player choose a vehicle-class
						format(VehicleClassList, 1000, "%s{00FF00}%s{FFFFFF}\n", VehicleClassList, "Bisikletler");
						format(VehicleClassList, 1000, "%s{40FF00}%s{FFFFFF}\n", VehicleClassList, "Tekneler");
						format(VehicleClassList, 1000, "%s{80FF00}%s{FFFFFF}\n", VehicleClassList, "Üstü Açýk Arabalar");
						format(VehicleClassList, 1000, "%s{B0FF00}%s{FFFFFF}\n", VehicleClassList, "Helikopterler");
						format(VehicleClassList, 1000, "%s{FFFF00}%s{FFFFFF}\n", VehicleClassList, "Endüstriyel Araçlar");
						format(VehicleClassList, 1000, "%s{B0FF40}%s{FFFFFF}\n", VehicleClassList, "Lowriderlar");
						format(VehicleClassList, 1000, "%s{80FF80}%s{FFFFFF}\n", VehicleClassList, "Off-Road Araçlarý");
						format(VehicleClassList, 1000, "%s{40FFB0}%s{FFFFFF}\n", VehicleClassList, "Uçaklar");
						format(VehicleClassList, 1000, "%s{00FFFF}%s{FFFFFF}\n", VehicleClassList, "Halka Hizmet Araçlarý");
						format(VehicleClassList, 1000, "%s{00B0FF}%s{FFFFFF}\n", VehicleClassList, "RC Araçlar");
						format(VehicleClassList, 1000, "%s{0080FF}%s{FFFFFF}\n", VehicleClassList, "Sedan Araçlar");
						format(VehicleClassList, 1000, "%s{0040FF}%s{FFFFFF}\n", VehicleClassList, "Spor Araçlar");
						format(VehicleClassList, 1000, "%s{0000FF}%s{FFFFFF}\n", VehicleClassList, "Station Wagon Araçlar");
						format(VehicleClassList, 1000, "%s{4000FF}%s{FFFFFF}\n", VehicleClassList, "Kasalar");
						format(VehicleClassList, 1000, "%s{8000FF}%s{FFFFFF}\n", VehicleClassList, "Özel Araçlar");
						// Ask which vehicle class the player wants to see to buy a vehicle
						ShowPlayerDialog(playerid, DialogRentCarClass, DIALOG_STYLE_LIST, "Araç Tipi Seçin", VehicleClassList, "Seç", "Ýptal");
						// Exit the function
						return 1;
					}
				}
			}

			// The player wasn't in range of a cardealer
			SendClientMessage(playerid, 0xFF0000FF, "Galeride deðilken araç kiralayamazsýnýz!");
		}
		else
		    SendClientMessage(playerid, 0xFF0000FF, "Araçtayken araç kiralayamazsýnýz!");
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}



// This command teleports you to your selected house
COMMAND:evegit(playerid, params[])
{
	// Setup local variables
	new HouseList[1000];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/evegit", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player has a wanted level of less than 3
		if (GetPlayerWantedLevel(playerid) < 3)
		{
			// Check if the player is not jailed
			if (APlayerData[playerid][PlayerJailed] == 0)
			{
				// Check if the player is not inside a vehicle
				if (GetPlayerVehicleID(playerid) == 0)
				{
					// Ask to which house the player wants to add his vehicle
					for (new i; i < MAX_HOUSESPERPLAYER; i++)
					{
						// Check if this houseindex is occupied
						if (APlayerData[playerid][Houses][i] != 0)
							format(HouseList, 1000, "%s{00FF00}%s{FFFFFF}\n", HouseList, AHouseData[APlayerData[playerid][Houses][i]][HouseName]);
						else
							format(HouseList, 1000, "%s{FFFFFF}%s{FFFFFF}\n", HouseList, "Boþ Ev Slotu");
					}
					ShowPlayerDialog(playerid, DialogGoHome, DIALOG_STYLE_LIST, "Iþýnlanmak Ýstediðiniz Evi Seçin:", HouseList, "Seç", "Ýptal");
				}
				else
					SendClientMessage(playerid, 0xFF0000FF, "Eve Iþýnlanmak için Ayakta Olmalýsýnýz");
			}
			else
			    SendClientMessage(playerid, 0xFF0000FF, "Hapisteyken /evegit kullanamazsýnýz!");
		}
		else
			SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Aranýyorken /evegit kullanamazsýnýz!");
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}



// Gives the player the cash he requests
COMMAND:cash(playerid, params[])
{
	new Amount, Msg[128];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/cash", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 4
		if (APlayerData[playerid][PlayerLevel] >= 9)
		{
			if (sscanf(params, "i", Amount)) SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/cash <Miktar>\"");
			else
			{
				// Check if the player gave himself too much at once
				if (Amount > 10000000)
				{
				    // Inform the player and quit the command
					SendClientMessage(playerid, 0xFF0000AA, "Kendinize tek seferde 10M'den fazla veremezsiniz!");
					return 1;
				}

				// Reward the player (give cash and points)
				RewardPlayer(playerid, Amount, 0);
				format(Msg, 128, "Kendinize $%i verdiniz.", Amount);
				SendClientMessage(playerid, 0x00FF00AA, Msg);
			}
		}
		else
		    return 0;
	}
	else
	    return 0;

	return 1;
}

// Gives the player the cash he requests
COMMAND:score(playerid, params[])
{
	new Amount, Msg[128];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/score", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 4
		if (APlayerData[playerid][PlayerLevel] >= 9)
		{
			if (sscanf(params, "i", Amount)) SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/score <Miktar>\"");
			else
			{
				// Reward the player (give cash and points)
				RewardPlayer(playerid, 0, Amount);
				format(Msg, 128, "Kendinize %i skor verdiniz", Amount);
				SendClientMessage(playerid, 0x00FF00AA, Msg);
			}
		}
		else
		    return 0;
	}
	else
	    return 0;

	return 1;
}

// Detaches the trailer from the vehicle
COMMAND:detach(playerid, params[])
{
	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/detach", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Detach the trailer from the vehicle
		DetachTrailerFromVehicle(GetPlayerVehicleID(playerid));
		// Send the player a message that the trailer has been detached
		SendClientMessage(playerid, 0x0000FFFF, "Kasanýz çýkarýldý");
	}
	else
		return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Puts the player's vehicle back onto his wheels
COMMAND:cevir(playerid, params[])
{
	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/cevir", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "{FF0000}Arabada Deðilsiniz!");
		new Float:rz;
		GetVehicleZAngle(GetPlayerVehicleID(playerid),rz);
		SetVehicleZAngle(GetPlayerVehicleID(playerid), rz);
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Repairs the player's vehicle
COMMAND:repair(playerid, params[])
{
	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 1
		if (APlayerData[playerid][PlayerLevel] >= 4)
		{
		    // Check if the player is inside a vehicle
			if(!IsPlayerInAnyVehicle(playerid))
				return SendClientMessage(playerid, 0xFF0000FF, "Araçta deðilsiniz!"); // Let the player know he's not inside a vehicle and let the server know that this was a valid command
			// Fully repair the vehicle (damage value and bodywork)
			RepairVehicle(GetPlayerVehicleID(playerid));
			// Send the player a message to inform him that his vehicle has been repaired
			SendClientMessage(playerid, 0x00FF00FF, "Aracýnýz baþarýyla tamir edildi!");
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Repairs all vehicles
COMMAND:repairall(playerid, params[])
{
	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/repairall", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 3
		if (APlayerData[playerid][PlayerLevel] >= 8)
		{
			// Loop through all vehicles
			for (new i; i < 2000; i++)
				RepairVehicle(i); // Fully repair the vehicle (damage value and bodywork)

			// Send all players a message to inform them that all vehicles have been repaired
			SendClientMessageToAll(0x00FF00FF, "Bütün araçlar tamir edildi!");
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Heals all players
COMMAND:healall(playerid, params[])
{
	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/healall", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 3
		if (APlayerData[playerid][PlayerLevel] >= 8)
		{
			// Loop through all players
			for (new i; i < MAX_PLAYERS; i++)
				if (IsPlayerConnected(i)) // Check if the player is connected
				    if (IsPlayerInAnyVehicle(i) == 0) // Check if the player isn't inside a vehicle
				        SetPlayerHealth(i, 100.0); // Heal the player

			// Send all players a message to inform them that all players have been healed
			SendClientMessageToAll(0x00FF00FF, "Bütün oyuncular iyileþtirildi!");
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}



// Kills the player
COMMAND:kill(playerid, params[])
{
	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/kill", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player has a wanted level of less than 3
		if (GetPlayerWantedLevel(playerid) < 3)
		{
			// Check if the player isn't in jail
			if (APlayerData[playerid][PlayerJailed] == 0)
			{
			    // Force the player back into class-selection
				ForceClassSelection(playerid);
				// Kill the player (required after ForceClassSelection)
				SetPlayerHealth(playerid, 0.0);
			}
			else
			    SendClientMessage(playerid, 0xFF0000FF, "Hapisteyken /kill komutunu kullanamazsýnýz!");
		}
		else
		    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Aranýyorken /kill komutunu kullanamazsýnýz!");
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Lets the player choose another class
COMMAND:reclass(playerid, params[])
{
	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/reclass", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player has a wanted level of less than 3
		if (GetPlayerWantedLevel(playerid) < 3)
		{
			// Check if the player isn't in jail
			if (APlayerData[playerid][PlayerJailed] == 0)
			{
			    // Force the player back into class-selection
				ForceClassSelection(playerid);
				// Kill the player (required after ForceClassSelection)
				SetPlayerHealth(playerid, 0.0);
			}
			else
			    SendClientMessage(playerid, 0xFF0000FF, "Hapisteyken /reclass kullanamazsýnýz");
		}
		else
		    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Aranýyorken /reclass komutunu kullanamazsýnýz");
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Starts a job
COMMAND:work(playerid, params[])
{
	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/work", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// First check if the player already has a job
		if (APlayerData[playerid][JobStarted] == false)
		{
		    // Check the player's class
			switch (APlayerData[playerid][PlayerClass])
			{
				case ClassTruckDriver:
				{
					// Get the id of the convoy (if the player is in a convoy)
					new Convoy = APlayerData[playerid][ConvoyID];

					// Check if the player is part of a convoy AND is not the leader
					if ((APlayerData[playerid][InConvoy] == true) && (AConvoys[Convoy][Members][0] != playerid))
					{
						// Let the player know he's not the leader of his convoy and cannot start a job
						SendClientMessage(playerid, 0xFF0000FF, "Konvoy lideri deðilsiniz, görev baþlatamazsýnýz!");
						// Exit the function
						return 1;
					}

					// A convoy-leader proceeds here, and also a normal player (no convoy-member)

					// Check if the player is the driver of a vehicle
					if (GetPlayerVehicleSeat(playerid) == 0)
					{
						// Check if the player is inside a valid trucking vehicle
						switch (GetVehicleModel(GetPlayerVehicleID(playerid)))
						{
							case VehicleFlatbed, VehicleDFT30, VehicleCementTruck: // Flatbed, DFT-30, CementTruck
								if (APlayerData[playerid][TruckerLicense] == 1) // Check if the player has acquired a truckers license
									ShowPlayerDialog(playerid, DialogTruckerJobMethod, DIALOG_STYLE_LIST, "Yöntem Seçin:", "Kendi yol rotanýz\r\nRastgele rota", "Select", "Cancel");
								else
								    Trucker_StartRandomJob(playerid); // Start a random job

							case VehicleLineRunner, VehicleTanker, VehicleRoadTrain: // Player is driving a truck which needs a trailer
								if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid))) // Check if there is a trailer attached
									if (APlayerData[playerid][TruckerLicense] == 1) // Check if the player has acquired a truckers license
										ShowPlayerDialog(playerid, DialogTruckerJobMethod, DIALOG_STYLE_LIST, "Yöntem Seçin:", "Kendi yol rotanýz\r\nRastgele rota", "Select", "Cancel");
									else
									    Trucker_StartRandomJob(playerid); // Start a random job
								else
								    SendClientMessage(playerid, 0xFF0000FF, "Görev baþlatmak için týrýnýza kasa takýn!");

							default: SendClientMessage(playerid, 0xFF0000FF, "Görev baþlatmak için týrý sürüyor olmalýsýnýz!");
						}
					}
					else
		                SendClientMessage(playerid, 0xFF0000FF, "Görev baþlatmak için týrý sürüyor olmalýsýnýz");
				}
				case ClassBusDriver:
				{
					// Check if the player is the driver of a vehicle
					if (GetPlayerVehicleSeat(playerid) == 0)
						if (GetVehicleModel(GetPlayerVehicleID(playerid)) == VehicleCoach) // Check if the player is inside a valid busdriver vehicle
							if (APlayerData[playerid][BusLicense] == 1) // Check if the player has acquired a busdriver license
								ShowPlayerDialog(playerid, DialogBusJobMethod, DIALOG_STYLE_LIST, "Yöntem Seçin:", "Kendi yol rotanýz\r\nRastgele rota", "Seç", "Ýptal");
							else
								BusDriver_StartJob(playerid, random(sizeof(ABusRoutes))); // Start a random job
						else
			                SendClientMessage(playerid, 0xFF0000FF, "Görev baþlatabilmek için otobüste olmalýsýnýz!");
					else
		                SendClientMessage(playerid, 0xFF0000FF, "Görev baþlatabilmek için otobüste olmalýsýnýz!");
				}
				case ClassPilot:
				{
					// Check if the player is the driver of a vehicle
					if (GetPlayerVehicleSeat(playerid) == 0)
					{
						// Check if the player is inside a valid piloting vehicle
						switch (GetVehicleModel(GetPlayerVehicleID(playerid)))
						{
							case VehicleShamal, VehicleNevada, VehicleMaverick, VehicleCargobob: // Plane (Shamal), Plane (Nevada), helicopter (Maverick)
								Pilot_StartRandomJob(playerid); // Start a random piloting job
							default: SendClientMessage(playerid, 0xFF0000FF, "Görev baþlatabilmek için uçak veya helikopterde olmalýsýnýz!");
						}
					}
					else
		                SendClientMessage(playerid, 0xFF0000FF, "Görev baþlatabilmek için uçak veya helikopterde olmalýsýnýz!");
				}
				case ClassMafia:
				{
					// Check if the player is the driver of a vehicle
					if (GetPlayerVehicleSeat(playerid) == 0)
					{
						// Check if the player is inside a valid piloting vehicle
						switch (GetVehicleModel(GetPlayerVehicleID(playerid)))
						{
							case VehicleSandKing, VehicleMoonbeam: // Sangking, Moonbeam
								Mafia_StartRandomJob(playerid); // Start a random mafia job
							default: SendClientMessage(playerid, 0xFF0000FF, "Görev baþlatabilmek için mafya aracýnda olmalýsýnýz!");
						}
					}
					else
		                SendClientMessage(playerid, 0xFF0000FF, "Görev baþlatabilmek için mafya aracýnda olmalýsýnýz!");
				}
				case ClassCourier:
				{
					// Check if the player is the driver of a vehicle
					if (GetPlayerVehicleSeat(playerid) == 0)
					{
						// Check if the player is inside a valid courier vehicle
						switch (GetVehicleModel(GetPlayerVehicleID(playerid)))
						{
							case VehicleBurrito, VehicleFaggio, VehicleBenson: // Van (Burrito), bike (Faggio)
								Courier_StartJob(playerid); // Start a random courier job
							default: SendClientMessage(playerid, 0xFF0000FF, "You need to be the driver of a courier vehicle to start a job");
						}
					}
					else
		                SendClientMessage(playerid, 0xFF0000FF, "You need to be the driver of a courier vehicle to start a job");
				}
				case ClassRoadWorker:
				{
					// Check if the player is the driver of a vehicle
					if (GetPlayerVehicleSeat(playerid) == 0)
					{
						// Check if the player is inside a valid courier vehicle
						switch (GetVehicleModel(GetPlayerVehicleID(playerid)))
						{
							case VehicleUtilityVan, VehicleTowTruck: // Utility Van, Towtruck
								Roadworker_StartRandomJob(playerid); // Start a random roadworker job
							default: SendClientMessage(playerid, 0xFF0000FF, "Görev baþlatabilmek için yol iþçisi aracýnda olmalýsýnýz!");
						}
					}
					else
		                SendClientMessage(playerid, 0xFF0000FF, "Görev baþlatabilmek için yol iþçisi aracýnda olmalýsýnýz!");
				}
				default: SendClientMessage(playerid, 0xFF0000FF, "Bu komut mesleðiniz için deðil!");
			}
		}
		else // Send a message to let the player know he already has a job
		    SendClientMessage(playerid, 0xFF0000FF, "Þuan zaten görevdesiniz!");
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Stops the current job
COMMAND:stopwork(playerid, params[])
{
	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/stopwork", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
	    // Check if the player has a job started
		if (APlayerData[playerid][JobStarted] == true)
		{
		    // Check the class of the player
			switch (APlayerData[playerid][PlayerClass])
			{
				case ClassTruckDriver: Trucker_EndJob(playerid); // Stop any trucker job
				case ClassBusDriver: BusDriver_EndJob(playerid); // Stop any busdriver job
				case ClassPilot: Pilot_EndJob(playerid); // Stop any pilot job
				case ClassMafia: Mafia_EndJob(playerid); // Stop any mafia job
				case ClassCourier: Courier_EndJob(playerid);
				case ClassRoadWorker: Roadworker_EndJob(playerid);
				default: SendClientMessage(playerid, 0xFF0000FF, "Bu komut mesleðiniz için deðil!");
			}

			// Inform the player that he failed the mission
			GameTextForPlayer(playerid, "~w~Gorev ~r~iptal edildi. ~y~$1000~w~ kaybettiniz.", 5000, 4);
			// Reduce the player's cash by 1000
			RewardPlayer(playerid, -1000, 0);
		}
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Displays the player's coordinates on the map
COMMAND:loc(playerid, params[])
{
	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/loc", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 3
		if (APlayerData[playerid][PlayerLevel] >= 0)
		{
		    // Setup some local variables
			new Message[200], Float:x, Float:y, Float:z, Float:rot, Interior, World;
			// Get the player's position
			GetPlayerPos(playerid, x, y, z);
			// Check if the player is on foot or in a vehicle
			if (GetPlayerVehicleSeat(playerid) == -1)
				GetPlayerFacingAngle(playerid, rot); // Get the player's angle
			else
			    GetVehicleZAngle(GetPlayerVehicleID(playerid), rot);

			// Get the interior where the player is located
			Interior = GetPlayerInterior(playerid);
			// Get the virtual world of the player
			World = GetPlayerVirtualWorld(playerid);
			// combine the position and angle into a proper message
		    format(Message, sizeof(Message), "Koordinatlar: X=%4.2f, Y=%4.2f, Z=%4.2f, RZ=%4.2f, Interior=%i, World=%i", x, y, z, rot, Interior, World);
		    // Send the message with the coordinates and the angle of the player
			SendClientMessage(playerid, 0xFF0000AA, Message);
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Saves the location into a file
COMMAND:saveloc(playerid, params[])
{
	new File:LocFile, LineForFile[255], LineMsg[255];
	new Float:x, Float:y, Float:z, LocName[255], ID;

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/saveloc", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 5
		if (APlayerData[playerid][PlayerLevel] >= 10)
		{
			if (sscanf(params, "is[255]", ID, LocName)) SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/saveloc <ID> <Yer Ismi>\"");
			else
			{
				if (!fexist("ServerData/Locations.txt"))
				{
				    LocFile = fopen("ServerData/Locations.txt", io_write); // Create the file
					fclose(LocFile); // Close the file
				}

				// Get the player's position
				GetPlayerPos(playerid, x, y, z);
				// Combine all the data in a proper structure, so it can be used directly for setting up the ALocations array
			    format(LineForFile, sizeof(LineForFile), "\t{\"%s\", %4.2f, %4.2f, %4.2f}, // ID = %i", LocName, x, y, z, ID);

				LocFile = fopen("ServerData/Locations.txt", io_append); // Open the locationfile for appending data to it
				fwrite(LocFile, LineForFile); // Append the data to the end of the file
				fwrite(LocFile, "\r\n"); // Start a new line, or all the data is saved in one line
				fclose(LocFile); // Close the file

				// Let the player know what data has been saved
				format(LineMsg, 255, "Yer kaydedildi. Kaydedilen Yer Ýsmi: %s", LineForFile);
				SendClientMessage(playerid, 0x808080FF, LineMsg);
			}
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Lets the player choose where he wants to respawn (costs $200)
COMMAND:kurtul(playerid, params[])
{
	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/kurtul", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player has a wanted level of less than 3
		if (GetPlayerWantedLevel(playerid) < 3)
		{
			// Check if the player isn't in jail
			if (APlayerData[playerid][PlayerJailed] == 0)
			{
				if (APlayerData[playerid][JobStarted] == false)
				{
					// Make sure you can't use "/kurtul" when you're inside a vehicle (doesn't respawn you at the requested coords
					// and puts a random item (bottle, sigarette, ...) in the player's hands
					if (GetPlayerVehicleID(playerid) == 0)
					{
					    // Create a dialog based on the player's class
						switch (APlayerData[playerid][PlayerClass])
						{
							case ClassTruckDriver: // Ask where the trucker player wants to respawn
								ShowPlayerDialog(playerid, DialogRescue, DIALOG_STYLE_LIST, "Kamyoncu Baþlama Noktasý Seçin:", "Fallen Tree Depot\r\nFlint Trucking Depot\r\nLVA Freight Depot\r\nDoherty Depot\r\nEl Corona Depot\r\nLas Payasdas Depot\r\nQuarry Top\r\nShady Creek Depot", "Spawn", "Cancel");
							case ClassBusDriver: // Ask where the busdriver wants to respawn
								ShowPlayerDialog(playerid, DialogRescue, DIALOG_STYLE_LIST, "Otobüsçü Baþlama Noktasý Seçin:", "Los Santos\r\nSan Fierro\r\nLas Venturas", "Spawn", "Cancel");
							case ClassPilot: // Ask where the pilot wants to respawn
								ShowPlayerDialog(playerid, DialogRescue, DIALOG_STYLE_LIST, "Pilot Baþlama Noktasý Seçin:", "Los Santos\r\nSan Fierro\r\nLas Venturas", "Spawn", "Cancel");
							case ClassPolice: // Ask where the police player wants to respawn
								ShowPlayerDialog(playerid, DialogRescue, DIALOG_STYLE_LIST, "Polis Baþlama Noktasý Seçin:", "Los Santos\r\nSan Fierro\r\nLas Venturas", "Spawn", "Cancel");
							case ClassCourier: // Ask where the courier player wants to respawn
								ShowPlayerDialog(playerid, DialogRescue, DIALOG_STYLE_LIST, "Choose courier spawn point:", "Los Santos\r\nSan Fierro\r\nLas Venturas", "Spawn", "Cancel");
						}
					}
					else
						SendClientMessage(playerid, 0xFF0000FF, "Araçtayken '/kurtul' komutunu kullanamazsýnýz!"); // "/kurtul" doesn't work inside a vehicle
				}
				else
				    SendClientMessage(playerid, 0xFF0000FF, "Görev yaparken bu komutun kullanamazsýnýz"); // "/kurtul" doesn't work during a job
			}
			else
			    SendClientMessage(playerid, 0xFF0000FF, "Hapisteyken bu komutu kullanamazsýnýz");
		}
		else
		    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Aranýyorken bu komutu kullanamazsýnýz");
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Increases the player's wanted level by 1
COMMAND:wanted(playerid, params[])
{
	new OtherPlayer, Stars;

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/wanted", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 2
		if (APlayerData[playerid][PlayerLevel] >= 3)
		{
			if (sscanf(params, "ui", OtherPlayer, Stars)) SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/wanted <ID> <Yýldýz>\"");
			else
				if (IsPlayerConnected(OtherPlayer)) // If the player is a valid playerid (he's connected)
					SetPlayerWantedLevel(OtherPlayer, Stars);
				else
				    SendClientMessage(playerid, 0xFF0000FF, "Yanlýþ oyuncu ID'i");
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}


// Lets the player choose a car to spawn (in a split list which shows only 10 cars at a time)
COMMAND:car(playerid, params[])
{
	SendAdminText(playerid, "/car", params);

	if (APlayerData[playerid][LoggedIn] == true)
	{
		if (APlayerData[playerid][PlayerLevel] >= 7)
		{
		    new VehicleModel[70], Renk1, Renk2, Float:oX, Float:oY, Float:oZ, Float:oRot, Msg[128], vID;
		    GetPlayerPos(playerid, oX, oY, oZ);
		    GetPlayerFacingAngle(playerid, oRot);
		    
			if (sscanf(params, "sii", VehicleModel, Renk1, Renk2)) SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/car <Model> <Renk1> <Renk2>\"");
			else
			{
			    new VehicleModel_ = GetVehicleModelIDFromName(VehicleModel);
			    
			    if(VehicleModel_ < 400 || VehicleModel_ > 611) return SendClientMessage(playerid, -1, "{FF0000}Hatalý araç modeli!");
			    
			    oX += 5.0 * floatcos(-oRot, degrees);
			    oY += 5.0 * floatsin(-oRot, degrees);
			    
				vID = Vehicle_Create(VehicleModel_, oX, oY, oZ + 0.5, oRot + 90.0, Renk1, Renk2, -1);

				format(Msg, 128, "Araç oluþturdunuz. ID: %i (Model = %s | Renk1 = %d | Renk2 = %d)", vID, VehNames[VehicleModel_-400], Renk1, Renk2);
				SendClientMessage(playerid, 0x00FF00FF, Msg);
			}		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Jail a player
COMMAND:jail(playerid, params[])
{
	new PlayerToJail, JailTime, Reason[128], Msg[128], Name[24], AdminName[24];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/jail", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 1
		if (APlayerData[playerid][PlayerLevel] >= 2)
		{
			if (sscanf(params, "uis[128]", PlayerToJail, JailTime, Reason)) SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/jail <ID> <Süre> <Sebep>\"");
			else
				if (IsPlayerConnected(PlayerToJail)) // If the player is a valid playerid (he's connected)
				{
				    // Jail the player
					Police_JailPlayer(PlayerToJail, JailTime);
					// Get the name of the player who jailed the player
					GetPlayerName(playerid, AdminName, sizeof(AdminName));
					// Get the name of the player who's being sent to jail
					GetPlayerName(PlayerToJail, Name, sizeof(Name));
					// Send the jailed player a message who jailed him, why he's been jailed and how long
					format(Msg, 128, "%s %s tarafýndan %i saniye hapse atýldýnýz", AdminLevelName[APlayerData[playerid][PlayerLevel]], AdminName, JailTime);
					SendClientMessage(PlayerToJail, 0xFF0000FF, Msg);
					format(Msg, 128, "Reason: %s", Reason);
					SendClientMessage(PlayerToJail, 0xFF0000FF, Msg);
					format(Msg, 128, "{FFFF00}%s{00FF00}'ý {FFFF00}%i{00FF00} saniye hapse attýnýz", Name, JailTime);
					SendClientMessage(playerid, 0xFFFFFFFF, Msg);
				}
				else
				    SendClientMessage(playerid, 0xFF0000FF, "Yanlýþ oyuncu ID!");
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Warn a player
COMMAND:warn(playerid, params[])
{
	new PlayerToWarn, Reason[128], ReasonMsg[128], Name[24];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/warn", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 1
		if (APlayerData[playerid][PlayerLevel] >= 1)
		{
			if (sscanf(params, "us[128]", PlayerToWarn, Reason)) SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/warn <ID> <Sebep>\"");
			else
				if (IsPlayerConnected(PlayerToWarn)) // If the player is a valid playerid (he's connected)
				{
					// Increase the number of warnings
					APlayerData[PlayerToWarn][Warnings]++;

					// Get the name of the player who warned the player
					GetPlayerName(playerid, Name, sizeof(Name));
					// Send the warned player a message who warned him and why he's been warned
					format(ReasonMsg, 128, "%s %s sizi uyardý", AdminLevelName[APlayerData[playerid][PlayerLevel]], Name);
					SendClientMessage(PlayerToWarn, 0xFF0000FF, ReasonMsg);
					format(ReasonMsg, 128, "Sebep: %s", Reason);
					SendClientMessage(PlayerToWarn, 0xFF0000FF, ReasonMsg);
					format(ReasonMsg, 128, "~w~Uyarý %i/%i: ~r~%s~w~", APlayerData[PlayerToWarn][Warnings], AutoKickWarnings, Reason);
					GameTextForPlayer(PlayerToWarn, ReasonMsg, 5000, 4);

					// Get the name of the warned player
					GetPlayerName(PlayerToWarn, Name, sizeof(Name));
					// Let the admin know who has been warned and why
					format(ReasonMsg, 128, "%s'ý uyardýnýz (Uyarý: %i/%i)", Name, APlayerData[PlayerToWarn][Warnings], AutoKickWarnings);
					SendClientMessage(playerid, 0x00FF00FF, ReasonMsg);
					format(ReasonMsg, 128, "Sebep: %s", Reason);
					SendClientMessage(playerid, 0xFF0000FF, ReasonMsg);

					// Automatically kick the player if he got 3 warnings (if autokick is enabled)
					if ((APlayerData[PlayerToWarn][Warnings] == AutoKickWarnings) && (AutoKickAfterWarn == 1))
						SafeKick(PlayerToWarn);
				}
				else
				    SendClientMessage(playerid, 0xFF0000FF, "Yanlýþ oyuncu ID!");
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

COMMAND:slap(playerid, params[])
{
	new PlayerToKick, Reason[128], ReasonMsg[128], Name[24];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/slap", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 1
		if (APlayerData[playerid][PlayerLevel] >= 2)
		{
			if (sscanf(params, "us[128]", PlayerToKick, Reason)) SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/slap <ID> <Sebep>\"");
			else
				if (IsPlayerConnected(PlayerToKick)) // If the player is a valid playerid (he's connected)
				{
					// Get the name of the player who warned the player
					GetPlayerName(playerid, Name, sizeof(Name));
					// Send the warned player a message who kicked him and why he's been kicked
					format(ReasonMsg, 128, "%s %s tarafýndan tokatlandýnýz", AdminLevelName[APlayerData[playerid][PlayerLevel]], Name);
					SendClientMessage(PlayerToKick, 0xFF0000FF, ReasonMsg);
					format(ReasonMsg, 128, "Sebep: %s", Reason);
					SendClientMessage(PlayerToKick, 0xFF0000FF, ReasonMsg);

					format(ReasonMsg, 128, "%s'yi tokatladýnýz.", GetName(PlayerToKick));
					SendClientMessage(playerid, 0xFF0000FF, ReasonMsg);
					
					new Float:oX, Float:oY, Float:oZ;
					GetPlayerPos(PlayerToKick, oX, oY, oZ);
					SetPlayerPos(PlayerToKick, oX, oY, oZ+10);
				}
				else
				    SendClientMessage(playerid, 0xFF0000FF, "Yanlýþ oyuncu ID");
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}


// Kicks a player with a reason
COMMAND:kick(playerid, params[])
{
	new PlayerToKick, Reason[128], ReasonMsg[128], Name[24];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/kick", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 1
		if (APlayerData[playerid][PlayerLevel] >= 2)
		{
			if (sscanf(params, "us[128]", PlayerToKick, Reason)) SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/kick <ID> <Sebep>\"");
			else
				if (IsPlayerConnected(PlayerToKick)) // If the player is a valid playerid (he's connected)
				{
				    if(APlayerData[playerid][PlayerLevel] < APlayerData[PlayerToKick][PlayerLevel]) return SendClientMessage(playerid, -1, "{FF0000}Sizden daha yüksek levelli yöneticiye bu komutu uygulayamazsýnýz!");
					// Get the name of the player who warned the player
					GetPlayerName(playerid, Name, sizeof(Name));
					// Send the warned player a message who kicked him and why he's been kicked
					format(ReasonMsg, 128, "%s, %s tarafýndan kicklendi ( %s )", GetName(PlayerToKick), Name, Reason);
					SendClientMessageToAll(0xFF0000FF, ReasonMsg);

					// Kick the player
					SafeKick(PlayerToKick);
				}
				else
				    SendClientMessage(playerid, 0xFF0000FF, "Yanlýþ oyuncu ID");
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Bans a player for (days, hours, minutes, seconds)
COMMAND:ban(playerid, params[])
{
	// Setup local variables
	new PlayerToBan, Days, Hours, Reason[128], TotalBanTime, Msg[128], Name[24], AdminName[24];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/ban", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 3
		if (APlayerData[playerid][PlayerLevel] >= 5)
		{
			if (sscanf(params, "uiis[128]", PlayerToBan, Days, Hours, Reason))
				SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/ban <ID> <Gun> <Saat> <Sebep>\"");
			else
			{
				if (IsPlayerConnected(PlayerToBan))
				{
				    if(APlayerData[playerid][PlayerLevel] < APlayerData[PlayerToBan][PlayerLevel]) return SendClientMessage(playerid, -1, "{FF0000}Sizden daha yüksek levelli yöneticiye bu komutu uygulayamazsýnýz!");
					// Get the names of the player and the admin who executed the ban
					GetPlayerName(playerid, AdminName, sizeof(AdminName));
					GetPlayerName(PlayerToBan, Name, sizeof(Name));

					// Increase the number of bans
					APlayerData[PlayerToBan][Bans]++;
					// Calculate the total bantime (when the player can login again)
					TotalBanTime = (Days * 86400) + (Hours * 3600) + gettime();
					// Check if this is the player's 5th ban
					if (APlayerData[PlayerToBan][Bans] == 5)
						APlayerData[PlayerToBan][BanTime] = 2147483640; // Make the ban permanent (as high as it can go)
					else
						APlayerData[PlayerToBan][BanTime] = TotalBanTime; // Store this value for the player

					// Inform the player about his ban
					// Check if this is the player's 5th ban
					if (APlayerData[PlayerToBan][Bans] == 5)
					{
						format(Msg, 128, "%s tarafýndan sýnýrsýz banlandýnýz, bu 5. banýnýzdý", AdminName);
						SendClientMessage(PlayerToBan, 0x808080FF, Msg);
					}
					else
					{
						format(Msg, 128, "%s tarafýndan %i gün ve %i saat banlandýnýz", AdminName, Days, Hours);
						SendClientMessage(PlayerToBan, 0x808080FF, Msg);
						format(Msg, 128, "Sebep: %s", Reason);
						SendClientMessage(PlayerToBan, 0x808080FF, Msg);
						format(Msg, 128, "%i kere banlandýnýz, 5. sinde sýnýrsýz olacak.", APlayerData[PlayerToBan][Bans]);
						SendClientMessage(PlayerToBan, 0x808080FF, Msg);
					}

					// Kick the player (his data will be saved)
					SafeKick(PlayerToBan);

					// Inform everybody else which player was banned and for how long
					format(Msg, 128, "%s %s, %s'ý %i gün ve %i saat banladý", AdminLevelName[APlayerData[playerid][PlayerLevel]], AdminName, Name, Days, Hours);
					SendClientMessageToAll(0x808080FF, Msg);
				}
			}
		}
		else
		    return 0;
	}
	else
	    return 0;

	return 1;
}

// Unbans a player (cleares the ban-time)
COMMAND:unban(playerid, params[])
{
	// Setup local variables
	new PlayerToUnban[24], Msg[128], Name[24];
	new file[100], File:PFile, LineForFile[100];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/unban", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 3
		if (APlayerData[playerid][PlayerLevel] >= 5)
		{
			if (sscanf(params, "s[128]", PlayerToUnban))
				SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/unban <Isim>\"");
			else
			{
			    // Get the name of the admin
				GetPlayerName(playerid, Name, sizeof(Name));

				// Construct the complete filename for this player's account
				format(file, sizeof(file), PlayerFile, PlayerToUnban);

				// Check if the file exists
				if (fexist(file))
				{
					PFile = fopen(file, io_append); // Open the playerfile for appending (this command only appends a new line to overwrite the bantime)

					format(LineForFile, 100, "BanTime 0\r\n"); // Construct the line: "BanTime <0>"
					fwrite(PFile, LineForFile); // And save it to the file

					fclose(PFile); // Close the file

					// Inform everybody else which player was unbanned
					format(Msg, 128, "%s %s, %s'ýn banýný açtý", AdminLevelName[APlayerData[playerid][PlayerLevel]], Name, PlayerToUnban);
					SendClientMessageToAll(0x808080FF, Msg);
				}
				else
				    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Bu isimde oyuncu yok!");
			}
		}
		else
		    return 0;
	}
	else
	    return 0;

	return 1;
}

// Spawns the object at the location given by the player
COMMAND:object(playerid, params[])
{
    // Setup local variables
	new ObjectModel, ObjID, Msg[128], Float:x, Float:y, Float:z, Float:Angle;

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/object", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 5
		if (APlayerData[playerid][PlayerLevel] >= 10)
		{
			if (sscanf(params, "iffff", ObjectModel, x, y, z, Angle)) SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/object <Obje Modeli> <x> <y> <z> <Açý>\"");
			else
			{
				// Spawn the object 5 units north of the player
				ObjID = CreateObject(ObjectModel, x, y, z, 0.0, 0.0, Angle, 250.0);
				// Inform the player about it
				format(Msg, 128, "Obje oluþturdunuz. ID: %i (ModelID = %i) Koordinatlar: x=%4.2f, y=%4.2f, z=%4.2f", ObjID, ObjectModel, x, y, z);
				SendClientMessage(playerid, 0x00FF00FF, Msg);
			}
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Spawns the pickup at the location given by the player
COMMAND:pickup(playerid, params[])
{
    // Setup local variables
	new PickupModel, PickID, Msg[128], Float:x, Float:y, Float:z, PickupType;

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/pickup", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 5
		if (APlayerData[playerid][PlayerLevel] >= 10)
		{
			if (sscanf(params, "ifffi", PickupModel, x, y, z, PickupType)) SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/pickup <Pickup Modeli> <x> <y> <z> <Pickup Tipi>\"");
			else
			{
				// Spawn the pickup
				PickID = CreatePickup(PickupModel, PickupType, x, y, z, -1);
				// Inform the player about it
				format(Msg, 128, "Pickup oluþturdunuz. ID: %i (ModelID = %i) Koordinatlar: x=%4.2f, y=%4.2f, z=%4.2f", PickID, PickupModel, x, y, z);
				SendClientMessage(playerid, 0x00FF00FF, Msg);
			}
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Deletes the given vehicle from the game
COMMAND:dcar(playerid, params[])
{
	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/dcar", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 5
		if (APlayerData[playerid][PlayerLevel] >= 9)
		{
			if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "{FF0000}Bir aracý silebilmek için o araçta olmalýsýnýz!");
			DestroyVehicle(GetPlayerVehicleID(playerid));
			SendClientMessage(playerid, 0x00FF00FF, "Binmiþ olduðunuz araç silindi.");
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

COMMAND:spawnallcars(playerid, params[])
{
	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/spawnallcars", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 5
		if (APlayerData[playerid][PlayerLevel] >= 9)
		{
			for(new i; i < MAX_VEHICLES; i++)
			{
			    if(GetVehicleModel(i) == 0) continue;
			    if(GetVehicleDriver(i) != -1) continue;
				SetVehicleToRespawn(i);
			}
			
			SendClientMessageToAll(-1, "{F8F8FF}Bütün araçlar respawn edildi.");
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

GetVehicleDriver(vehicleid)
{
	new Sonuc = -1;
	foreach(new i:Player)
	{
	    if(GetPlayerState(i) != PLAYER_STATE_DRIVER) continue;
	    if(GetPlayerVehicleID(i) == vehicleid)
	    {
	        Sonuc = i;
	        break;
	    }
	}
	return Sonuc;
}

// Deletes the given vehicle from the game
COMMAND:delobject(playerid, params[])
{
    // Setup local variables
	new oID, Msg[128];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/delobject", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 5
		if (APlayerData[playerid][PlayerLevel] >= 10)
		{
			if (sscanf(params, "i", oID)) SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/delobject <Obje ID>\"");
			else
			{
				// Destroy the given vehicle
				DestroyObject(oID);
				// Inform the player about it
				format(Msg, 128, "%i ID'li objeyi sildiniz.", oID);
				SendClientMessage(playerid, 0x00FF00FF, Msg);
			}
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Ports the player to the given coordinates
COMMAND:gotoloc(playerid, params[])
{
	// Setup local variables
	new Float:x, Float:y, Float:z, PortMsg[128];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/gotoloc", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 1
		if (APlayerData[playerid][PlayerLevel] >= 8)
		{
			// Check if the player has a wanted level of less than 3
			if (GetPlayerWantedLevel(playerid) < 3)
			{
				// Check if the player is not jailed
				if (APlayerData[playerid][PlayerJailed] == 0)
				{
					if (sscanf(params, "fff", x, y, z)) SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/gotoloc <x> <y> <z>\"");
					else
					{
						// Port the player to the given location
						SetPlayerPos(playerid, x, y, z);
						// Let the player know about it
						format(PortMsg, 128, "Þu koordinatlara ýþýnlandýnýz: %4.2f, %4.2f, %4.2f", x, y, z);
						SendClientMessage(playerid, 0x00FF00FF, PortMsg);
					}
				}
				else
				    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Hapisteyken bu komutu kullanamazsýnýz");
			}
			else
			    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Aranýyorken bu komutu kullanamazsýnýz");
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Ports the player to the given player
COMMAND:goto(playerid, params[])
{
	// Setup local variables
	new OtherPlayer, Float:x, Float:y, Float:z, PortMsg[128], IntID, WorldID;

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/goto", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 1
		if (APlayerData[playerid][PlayerLevel] >= 6)
		{
			// Check if the player has a wanted level of less than 3
			if (GetPlayerWantedLevel(playerid) < 6)
			{
				// Check if the player is not jailed
				if (APlayerData[playerid][PlayerJailed] == 0)
				{
					if (sscanf(params, "u", OtherPlayer)) SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/goto <ID>\"");
					else
					{
						// Check if that other player is online
						if (IsPlayerConnected(OtherPlayer))
						{
							// Get the location of the other player
							GetPlayerPos(OtherPlayer, x, y, z);
							IntID = GetPlayerInterior(OtherPlayer);
							WorldID = GetPlayerVirtualWorld(OtherPlayer);
							// Port the player to the given location
							SetPlayerVirtualWorld(playerid, WorldID);
							SetPlayerInterior(playerid, IntID);
							SetPlayerPos(playerid, x+5.0, y+5.0, z + 3.0);
							// Let the player know about it
							format(PortMsg, 128, "Þu koordinatlara ýþýnlandýnýz: %4.2f, %4.2f, %4.2f", x, y, z + 3.0);
							SendClientMessage(playerid, 0x00FF00FF, PortMsg);
						}
						else
						    SendClientMessage(playerid, 0xFF0000FF, "Yanlýþ oyuncu ID");
					}
				}
				else
				    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Hapisteyken bu komutu kullanamazsýnýz");
			}
			else
			    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Aranýyorken bu komutu kullanamazsýnýz");
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Ports one player to another player
COMMAND:tele(playerid, params[])
{
	// Setup local variables
	new Player1, Player2, Float:x, Float:y, Float:z, PortMsg[128], IntID, WorldID, Name[24], AdminName[24];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/tele", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 1
		if (APlayerData[playerid][PlayerLevel] >= 6)
		{
			if (sscanf(params, "uu", Player1, Player2)) SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/tele <ID> <Hedef ID>\"");
			else
			{
				// Check if player1 is online
				if (APlayerData[Player1][LoggedIn] == true)
				{
					// Check if player2 is online
					if (APlayerData[Player2][LoggedIn] == true)
					{
					    // Get the name of the admin and the second player
					    GetPlayerName(playerid, AdminName, sizeof(AdminName));
					    GetPlayerName(Player2, Name, sizeof(Name));
						// Get the location of the second player
						GetPlayerPos(Player2, x, y, z);
						IntID = GetPlayerInterior(Player2);
						WorldID = GetPlayerVirtualWorld(Player2);
						// Port the first player to player2's location
						SetPlayerVirtualWorld(Player1, WorldID);
						SetPlayerInterior(Player1, IntID);
						SetPlayerPos(Player1, x, y, z + 3.0);
						// Let the first player know he's been ported
						format(PortMsg, 128, "{FFFF00}%s{00FF00} adlý oyuncuya {FFFF00}%s {00FF00}tarafýndan ýþýnlandýnýz.", Name, AdminName);
						SendClientMessage(Player1, 0xFFFFFFFF, PortMsg);
					}
					else
					    SendClientMessage(playerid, 0xFF0000FF, "Hedef oyuncu oyunda deðil");
				}
				else
				    SendClientMessage(playerid, 0xFF0000FF, "Iþýnlanacak oyuncu oyunda deðil");
			}
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Ports the player to the given vehicle
COMMAND:gotovehicle(playerid, params[])
{
	// Setup local variables
	new Car, Float:x, Float:y, Float:z, PortMsg[128];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/gotovehicle", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 1
		if (APlayerData[playerid][PlayerLevel] >= 1)
		{
			// Check if the player has a wanted level of less than 3
			if (GetPlayerWantedLevel(playerid) < 8)
			{
				// Check if the player is not jailed
				if (APlayerData[playerid][PlayerJailed] == 0)
				{
					if (sscanf(params, "i", Car)) SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/gotovehicle <Araç ID>\"");
					else
					{
						// Get the location of the car
						GetVehiclePos(Car, x, y, z);
						// Port the player to the given location
						SetPlayerPos(playerid, x, y, z + 3.0);
						// Let the player know about it
						format(PortMsg, 128, "Þu koordinatlara ýþýnlandýnýz: %4.2f, %4.2f, %4.2f", x, y, z + 3.0);
						SendClientMessage(playerid, 0x00FF00FF, PortMsg);
					}
				}
				else
				    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Hapisteyken bu komutu kullanamazsýnýz");
			}
			else
			    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Aranýyorken bu komutu kullanamazsýnýz");
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Sets the admin-level of another player
COMMAND:setlevel(playerid, params[])
{
	// Setup local variables
	new OtherPlayer, Level, Msg[128], Name[24], AdminName[24], OldLevel;

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/setlevel", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 5
		if (APlayerData[playerid][PlayerLevel] >= 10 || IsPlayerAdmin(playerid))
		{
			if (sscanf(params, "ui", OtherPlayer, Level)) SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/setlevel <ID> <Level>\"");
			else
			{
				// Check if that other player is online
				if (IsPlayerConnected(OtherPlayer))
				{
				    if(Level < 0 || Level > 10) return SendClientMessage(playerid, 0xFF0000FF, "Oyuncunun adminlik seviyesi 0 ile 10 arasý olabilir.");
				    
				    // Get the old level of the other player
				    OldLevel = APlayerData[OtherPlayer][PlayerLevel];
					// Get the playername of the admin
					GetPlayerName(playerid, AdminName, sizeof(AdminName));
					// Also get the name of the player that has been promoted
					GetPlayerName(OtherPlayer, Name, sizeof(Name));
					// Store the level of the player
					APlayerData[OtherPlayer][PlayerLevel] = Level;
					// Let all players know about it
					if (OldLevel != Level)
					{
						// Check if the player has been promoted or demoted
						if (OldLevel < Level)
							format(Msg, 128, "Oyuncu %s, %s'lýða %s tarafýndan terfi edildi.", Name, AdminLevelName[Level], AdminName);
						if (OldLevel > Level)
							format(Msg, 128, "Oyuncu %s, %s'lýða %s tarafýndan düþürüldü.", Name, AdminLevelName[Level], AdminName);
						SendClientMessageToAll(0x00FF00FF, Msg);
					}
					else
						SendClientMessage(playerid, 0xFF0000FF, "Oyuncunun seviyesi deðiþmedi.");
				}
				else
				    SendClientMessage(playerid, 0xFF0000FF, "Yanlýþ oyuncu ID'i!");
			}
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

COMMAND:setvip(playerid, params[])
{
	new OtherPlayer, Level, Msg[128];

	SendAdminText(playerid, "/setvip", params);

	if (APlayerData[playerid][LoggedIn] == true)
	{
		if (APlayerData[playerid][PlayerLevel] >= 10 || IsPlayerAdmin(playerid))
		{
			if (sscanf(params, "ui", OtherPlayer, Level)) SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/setvip <ID> <VIP Durum (0 = Normal | 1 = VIP)>\"");
			else
			{
				if (IsPlayerConnected(OtherPlayer))
				{
				    if(Level < 0 || Level > 1) return SendClientMessage(playerid, 0xFF0000FF, "Oyuncunun VIP'lik seviyesi 0 ile 1 arasý olabilir.");

					APlayerData[OtherPlayer][VIP] = Level;

					switch(Level)
					{
					    case 0: format(Msg, 128, "Yönetici %s, %s'nin VIP'liðini aldý.", GetName(playerid), GetName(OtherPlayer));
					    case 1: format(Msg, 128, "Yönetici %s, %s'yi VIP Üye yaptý.", GetName(playerid), GetName(OtherPlayer));
					}
                    SendClientMessageToAll(0x00FF00FF, Msg);
				}
				else
				    SendClientMessage(playerid, 0xFF0000FF, "Yanlýþ oyuncu ID'i!");
			}
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Refuel the player's vehicle
COMMAND:fuel(playerid, params[])
{
	// Setup local variables
	new vID;

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 1
		if (APlayerData[playerid][PlayerLevel] >= 4)
		{
			// Check if the player is inside a vehicle
			if (IsPlayerInAnyVehicle(playerid))
			{
			    // Get the vehicleid
			    vID = GetPlayerVehicleID(playerid);
			    // Refuel the vehicle
			    AVehicleData[vID][Fuel] = MaxFuel;
				// Let the player know about it
				SendClientMessage(playerid, 0x00FF00FF, "Aracýnýzýn benzini dolduruldu");
			}
			else
				SendClientMessage(playerid, 0x00FF00FF, "Araçta deðilsiniz");
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Let the player use a jetpack
COMMAND:jetpack(playerid, params[])
{
	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/jetpack", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 3
		if (APlayerData[playerid][PlayerLevel] >= 6)
		{
			// Equip the player with a jetpack
			SetPlayerSpecialAction(playerid, 2);
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Paints a car with a paintjob
COMMAND:paintjob(playerid, params[])
{
    // Setup local variables
	new paintjobid, vid;

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/paintjob", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player is the driver of the vehicle
		if (GetPlayerVehicleSeat(playerid) == 0)
		{
			if (sscanf(params, "i", paintjobid)) SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/paint <PaintjobID (0-2)>\"");
			else
			{
			    // Check if the player entered a correct paintjob-id
			    if ((paintjobid >= 0) && (paintjobid <= 3))
				{
					// Get the vehicle-id
					vid = GetPlayerVehicleID(playerid);
					// Check if the player is the owner of the vehicle
					if (AVehicleData[vid][Owned] == true)
					{
						// Change the paintjob of the player's vehicle
						ChangeVehiclePaintjob(vid, paintjobid);
						// Also save the paintjob for the vehicle
						AVehicleData[vid][PaintJob] = paintjobid + 1;

						// Also set the vehiclecolor to 1 (white), so the paintjob has it's full color
						ChangeVehicleColor(vid, 1, 1);
						// Also save the colors for the vehicle
						AVehicleData[vid][Color1] = 1;
						AVehicleData[vid][Color2] = 1;

						// Let the player pay for the paintjob
						RewardPlayer(playerid, -500, 0);
						// Inform the player about it
						SendClientMessage(playerid, 0x00FF00FF, "Aracýnýza $500'a paintjob taktýrdýnýz");
						// Save the player-file (along with the houses and businesses)
						PlayerFile_Save(playerid);
					}
					else
					    SendClientMessage(playerid, 0xFFFFFFFF, "Bu aracýn sahibi deðilsiniz");
				}
				else
				    SendClientMessage(playerid, 0xFF0000AA, "0 ile 3 arasýnda paintjob ID girebilirsiniz!");
			}
		}
		else
			SendClientMessage(playerid, 0xFF0000FF, "Paintjob yapabilmek için arabada olmalýsýnýz");
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Re-colors the given vehicle (lets you choose the first color)
COMMAND:renk1(playerid, params[])
{
	// Setup local variables
	new ColorList[1000];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/renk1", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player is the driver of the vehicle
		if (GetPlayerVehicleSeat(playerid) == 0)
		{
			// Check if the player is the owner of the vehicle
			if (AVehicleData[GetPlayerVehicleID(playerid)][Owned] == true)
			{
				// Construct the colorlist
				format(ColorList, sizeof(ColorList), "%s{FFFFFF}%s\n", ColorList, "Black (Paintjob'u Kaldýrýr)"); // Color 0
				format(ColorList, sizeof(ColorList), "%s{FFFFFF}%s\n", ColorList, "White"); // Color 1

				for (new i = 2; i < sizeof(AVehicleColors); i++)
					format(ColorList, sizeof(ColorList), "%s%s%s\n", ColorList, AVehicleColors[i], "CarColor");

				// Show the dialog with all the colors
				ShowPlayerDialog(playerid, DialogPrimaryCarColor, DIALOG_STYLE_LIST, "Birinci Rengi Seç:", ColorList, "Seç", "Ýptal");
			}
			else
			    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Aracýn sahibi deðilsiniz");
		}
		else
			SendClientMessage(playerid, 0xFF0000FF, "Aracýn rengini deðiþtirebilmek için içinde olmalýsýnýz");
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Re-colors the given vehicle (lets you choose the first color)
COMMAND:renk2(playerid, params[])
{
	// Setup local variables
	new ColorList[1000];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/renk2", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player is the driver of the vehicle
		if (GetPlayerVehicleSeat(playerid) == 0)
		{
			// Check if the player is the owner of the vehicle
			if (AVehicleData[GetPlayerVehicleID(playerid)][Owned] == true)
			{
				// Construct the colorlist
				format(ColorList, sizeof(ColorList), "%s{FFFFFF}%s\n", ColorList, "Black"); // Color 0
				format(ColorList, sizeof(ColorList), "%s{FFFFFF}%s\n", ColorList, "White"); // Color 1

				for (new i = 2; i < sizeof(AVehicleColors); i++)
					format(ColorList, sizeof(ColorList), "%s%s%s\n", ColorList, AVehicleColors[i], "CarColor");

				// Show the dialog with all the colors
				ShowPlayerDialog(playerid, DialogSedundaryCarColor, DIALOG_STYLE_LIST, "Ýkinci Renk Seç:", ColorList, "Select", "Cancel");
			}
			else
			    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Aracýn sahibi deðilsiniz");
		}
		else
			SendClientMessage(playerid, 0x00FF00FF, "Aracýn rengini deðiþtirebilmek için içinde olmalýsýnýz.");
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Starts or stops the engine of your vehicle
COMMAND:engine(playerid, params[])
{
    // Setup local variables
	new vehicleid, engine,lights,alarm,doors,bonnet,boot,objective;

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/engine", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 1
		if (APlayerData[playerid][PlayerLevel] >= 0)
		{
			// Get the player's vehicle
			vehicleid = GetPlayerVehicleID(playerid);

			// Get the current status of the vehicle
			GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);

			// Check if the player is inside a vehicle
			if (vehicleid != 0)
			{
				if (sscanf(params, "i", engine)) SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/engine <Motor Durum (0/1)>\"");
				else
				{
					// Set the engine to the value that was passed by the player and leave all other parameters alone
					SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
				}
			}
			else
				SendClientMessage(playerid, 0x00FF00FF, "Motorun durumunu ayarlayabilmek için arabada olmalýsýnýz.");
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Sets your numberplate
COMMAND:plaka(playerid, params[])
{
    // Setup local variables
	new vehicleid, engine, lights, alarm, doors, bonnet, boot, objective, Plate[32];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/plaka", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 3
		if (APlayerData[playerid][PlayerLevel] >= 0)
		{
			// Get the player's vehicle
			vehicleid = GetPlayerVehicleID(playerid);

			if (vehicleid != 0)
			{
				if (sscanf(params, "s[32]", Plate)) SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/plaka <Plaka>\"");
				else
				{
				    new Float:oX, Float:oY, Float:oZ, Float:oRot;
				    new panels2, doors2, lights2, tires2, Float:oHealth;
				    
				    GetVehiclePos(vehicleid, oX, oY, oZ);
				    GetVehicleZAngle(vehicleid, oRot);
				    GetVehicleDamageStatus(vehicleid, panels2, doors2, lights2, tires2);
				    GetVehicleHealth(vehicleid, oHealth);
				    
					// Set the numberplate
					SetVehicleNumberPlate(vehicleid, Plate);
					// Remove the player from the vehicle
					RemovePlayerFromVehicle(playerid);
					// Respawn the vehicle
					SetVehicleToRespawn(vehicleid);
					SetVehiclePos(vehicleid, oX, oY, oZ);
					SetVehicleZAngle(vehicleid, oRot);
					UpdateVehicleDamageStatus(vehicleid, panels2, doors2, lights2, tires2);
					SetVehicleHealth(vehicleid, oHealth);
					
					// Put the player back in the vehicle
					PutPlayerInVehicle(playerid, vehicleid, 0);
					// Turn on the engine and lights the current status of the vehicle
					GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
					SetVehicleParamsEx(vehicleid, 1, 1, alarm, doors, bonnet, boot, objective);
				}
			}
			else
				SendClientMessage(playerid, 0x00FF00FF, "Plaka deðiþtirebilmek için araçta olmalýsýnýz!");
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Asks which vehicle parameter you wanna toggle
COMMAND:akontrol(playerid, params[])
{
	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/akontrol", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 3
		if (APlayerData[playerid][PlayerLevel] >= 0)
		{
			// Let the player select a weather-type
			ShowPlayerDialog(playerid, DialogCarOption, DIALOG_STYLE_LIST, "Aracýný Yönet:", "Motor\nFarlar\nAlarm\nKapý\nKaput\nBagaj\nÝþaret", "Ayarla", "Ýptal");
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Sets the global weather
COMMAND:weather(playerid, params[])
{
	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/weather", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 4
		if (APlayerData[playerid][PlayerLevel] >= 6)
		{
			// Let the player select a weather-type
			ShowPlayerDialog(playerid, DialogWeather, DIALOG_STYLE_LIST, "Hava Durumunu Ayarlayýn:", "Normal\nFýrtýnalý\nSisli\nKavurucu Sýcak\nDonuk, Bulutlu, Yaðmurlu\nKum Fýrtýnasý\nYeþil Sis\nKaranlýk, Bulutlu, Kahverengi\nAþýrý Parlark\nKoyu Zehirli Bulutlar\nSiyah Beyaz Gökyüzü", "Seç", "Ýptal");
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}



// This command lists all online admins
COMMAND:admins(playerid, params[])
{
	// Setup local variables
	new AdminList[500], Name[24];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/admins", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Scan through all players
		for (new i; i < MAX_PLAYERS; i++)
		{
			// Check if this player is connected
			if (IsPlayerConnected(i))
			{
				// Get the name of the player
				GetPlayerName(i, Name, sizeof(Name));

				// Check if this player is an RCON admin
				if (IsPlayerAdmin(i))
				{
					// Add all admin players to the list
					format(AdminList, 500, "%s%s: %s(%i), Level: %i (RCON Yönetici)\n", AdminList, AdminLevelName[APlayerData[i][PlayerLevel]], Name, i, APlayerData[i][PlayerLevel]); // Add the name of the admin-player to the list
					// Re-start the for loop (skipping the remaining code for this iteration)
					continue;
				}

				//Check if that player is an admin (using the PlayerLevel)
				if (APlayerData[i][PlayerLevel] > 0)
				{
					// Add all admin players to the list
					format(AdminList, 500, "%s%s: %s(%i), Level: %i\n", AdminList, AdminLevelName[APlayerData[i][PlayerLevel]], Name, i, APlayerData[i][PlayerLevel]); // Add the name of the admin-player to the list
				}
			}
		}

		// Check if there were admin-names added to the list
		if (strlen(AdminList) > 0)
		    ShowPlayerDialog(playerid, DialogNoResponse, DIALOG_STYLE_LIST, "Oyundaki Yöneticiler:", AdminList, "Kapat", "");
		else
			SendClientMessage(playerid, 0xFF0000FF, "Oyunda yönetici yok"); // No admins are online
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// This command lists all commands for normal players (admin-level 0)
COMMAND:komutlar(playerid, params[])
{
	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/komutlar", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		CommandList_Create(playerid); // Create a list of commands (only the first 4 commands) and show the dialog
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

COMMAND:ykomutlar(playerid, params[])
{
	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/ykomutlar", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		CommandList_Create2(playerid); // Create a list of commands (only the first 4 commands) and show the dialog
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

COMMAND:konvoy(playerid, params[])
{
	// Setup local variables
	new ConvoyList[750], Name[24], NumMembers, ConvoyStatus[10];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/konvoy", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Create the list of convoys with all their data
		for (new i; i < MAX_CONVOYS; i++)
		{
		    // Check if this is an empty convoy (not created yet by a player)
			if (AConvoys[i][Status] == CONVOY_EMPTY)
			{
				// Setup data for an empty convoy (one which hasn't been chosen yet)
				NumMembers = 0;
				format(Name, 24, "Yok");
				format(ConvoyStatus, 10, "Boþ");
			}
			else
			{
				// Get the name of the convoy-leader
				GetPlayerName(AConvoys[i][Members][0], Name, sizeof(Name));
				// Calculate the members in the convoy
				NumMembers = Convoy_CountMembers(i);
				// Set the status of the convoy
				switch (AConvoys[i][Status])
				{
					case CONVOY_OPEN: format(ConvoyStatus, 10, "Açýk");
					case CONVOY_FULL: format(ConvoyStatus, 10, "Dolu");
					case CONVOY_CLOSED: format(ConvoyStatus, 10, "Kapalý");
				}
			}

			// Put all data together to form the content of the entire dialog
			format(ConvoyList, sizeof(ConvoyList), "%sLider: {00FF00}%s{FFFFFF}, Üye Sayýsý: {FF0000}%i{FFFFFF}, Durum: {00FF00}%s{FFFFFF}\n", ConvoyList, Name, NumMembers, ConvoyStatus);
		}

		// Show the dialog
		ShowPlayerDialog(playerid, DialogSelectConvoy, DIALOG_STYLE_LIST, "Konvoy Seç:", ConvoyList, "Seç", "Ýptal");
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Allows the leader to kick a member from the convoy
COMMAND:konvoykick(playerid, params[])
{
	// Setup local variables
	new Convoy, LeaderID, OtherPlayer, LeaderName[24], MemberName[24], Msg[128];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/konvoykick", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		Convoy = APlayerData[playerid][ConvoyID]; // Get the convoy of the player
		LeaderID = AConvoys[Convoy][Members][0]; // Get the leader of his convoy

		// Check if this player is part of a convoy
		if (APlayerData[playerid][InConvoy] == true)
		{
			// Check if this player is the leader of the convoy
			if (LeaderID == playerid)
			{
				if (sscanf(params, "u", OtherPlayer)) SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/konvoykick <ID>\"");
				else
				{
					// Check if that other player is part of the convoy
					if ((APlayerData[OtherPlayer][InConvoy] == true) && (APlayerData[OtherPlayer][ConvoyID] == Convoy))
					{
					    // Kick the other player from the convoy
						Convoy_Leave(OtherPlayer);
						// Get the names of the leader and member
						GetPlayerName(playerid, LeaderName, sizeof(LeaderName));
						GetPlayerName(OtherPlayer, MemberName, sizeof(MemberName));
						// Inform the leader that he has kicked the other player
						format(Msg, 128, "%s{00FF00}'ý konvoydan attýnýz", MemberName);
						SendClientMessage(playerid, 0x00FF00FF, Msg);
						// Inform the leader that he has kicked the other player
						format(Msg, 128, "Lider {0000FF}%s{00FF00} sizi konvoydan attý", LeaderName);
						SendClientMessage(OtherPlayer, 0x00FF00FF, Msg);
					}
					else
					    SendClientMessage(playerid, 0xFF0000FF, "Bu oyuncuyu konvoydan atamazsýnýz çünkü o sizin konvoyunuzda deðil");
				}
			}
			else
			    SendClientMessage(playerid, 0xFF0000FF, "Bu komutu kullanabilmek için konvoy lideri olmalýsýnýz");
		}
		else
		    SendClientMessage(playerid, 0xFF0000FF, "Bu komutu kullanabilmek için konvoy lideri olmalýsýnýz");
	}
	else
		return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Allows a convoy-member to leave the convoy
COMMAND:konvoycik(playerid, params[])
{
	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/konvoycik", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if this player is part of a convoy
		if (APlayerData[playerid][InConvoy] == true)
		{
		    // Kick the other player from the convoy
			Convoy_Leave(playerid);
			// Inform the player that he left the convoy
			SendClientMessage(playerid, 0x00FF00FF, "Konvoydan ayrýldýnýz");
		}
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Allows the leader to cancel a convoy
COMMAND:konvoyiptal(playerid, params[])
{
	// Setup local variables
	new Convoy, LeaderID;

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/konvoyiptal", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		Convoy = APlayerData[playerid][ConvoyID]; // Get the convoy of the player
		LeaderID = AConvoys[Convoy][Members][0]; // Get the leader of his convoy

		// Check if this player is part of a convoy
		if (APlayerData[playerid][InConvoy] == true)
		{
			// Check if this player is the leader of the convoy
			if (LeaderID == playerid)
				Convoy_Cancel(Convoy); // Cancel the convoy, kicking every other member from it
			else
			    SendClientMessage(playerid, 0xFF0000FF, "Görevi iptal edebilmek için konvoy lideri olmalýsýnýz");
		}
		else
		    SendClientMessage(playerid, 0xFF0000FF, "Görevi iptal edebilmek için konvoy lideri olmalýsýnýz");
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Displays all members in the convoy
COMMAND:konvoyuye(playerid, params[])
{
	// Setup local variables
	new Name[24], MemberList[1000], Convoy;

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/konvoyuye", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the member is in a convoy
		if (APlayerData[playerid][InConvoy] == true)
		{
			// Get the convoyID of the member
			Convoy = APlayerData[playerid][ConvoyID];

			// Loop through all members
			for (new i; i < CONVOY_MAX_MEMBERS; i++)
			{
			    if (AConvoys[Convoy][Members][i] != -1) // Check if this member-spot is occupied
				{
					// Get the name of the member
					GetPlayerName(AConvoys[Convoy][Members][i], Name, sizeof(Name));
					// Add the membernames to the list
					format(MemberList, 1000, "%s%s\n", MemberList, Name);
				}
			}

			// Show the dialog
			ShowPlayerDialog(playerid, DialogConvoyMembers, DIALOG_STYLE_LIST, "Konvoy Üyeleri", MemberList, "Tamam", "Ýptal");
		}
		else
		    SendClientMessage(playerid, 0xFF0000FF, "Hiçbir konvoyda deðilsiniz");
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Displays the statictics of the player
COMMAND:karakter(playerid, params[])
{
	// Setup local variables
	new StatsMsg[1000], Name[24], TitleMsg[128];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/karakter", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Construct the stats
		format(StatsMsg, 1000, "Katedilen Yol(km): {00FF00}%f{FFFFFF}\n", (APlayerData[playerid][StatsMetersDriven] / 1000));
		format(StatsMsg, 1000, "%sTamamlanan Kamyoncu Görevleri: {00FF00}%i{FFFFFF}\n", StatsMsg, APlayerData[playerid][StatsTruckerJobs]);
		format(StatsMsg, 1000, "%sTamamlanan Konvoy Görevleri: {00FF00}%i{FFFFFF}\n", StatsMsg, APlayerData[playerid][StatsConvoyJobs]);
		format(StatsMsg, 1000, "%sTamamlanan Otobüs Turlarý: {00FF00}%i{FFFFFF}\n", StatsMsg, APlayerData[playerid][StatsBusDriverJobs]);
		format(StatsMsg, 1000, "%sTamamlanan Pilot Görevleri: {00FF00}%i{FFFFFF}\n", StatsMsg, APlayerData[playerid][StatsPilotJobs]);
		format(StatsMsg, 1000, "%sTamamlanan Yol Ýþçisi Görevleri: {00FF00}%i{FFFFFF}\n", StatsMsg, APlayerData[playerid][StatsRoadworkerJobs]);
		format(StatsMsg, 1000, "%sTamir Edilen Araçlar: {00FF00}%i{FFFFFF}\n", StatsMsg, APlayerData[playerid][StatsAssistance]);
		format(StatsMsg, 1000, "%sTamamlanan Mafya Görevleri: {00FF00}%i{FFFFFF}\n", StatsMsg, APlayerData[playerid][StatsMafiaJobs]);
		format(StatsMsg, 1000, "%sTeslim Edilen Kaçak Mallar: {00FF00}%i{FFFFFF}\n", StatsMsg, APlayerData[playerid][StatsMafiaStolen]);
		format(StatsMsg, 1000, "%sCeza Verilen Oyuncular: {00FF00}%i{FFFFFF}\n", StatsMsg, APlayerData[playerid][StatsPoliceFined]);
		format(StatsMsg, 1000, "%sHapse Atýlan Oyuncular: {00FF00}%i{FFFFFF}\n", StatsMsg, APlayerData[playerid][StatsPoliceJailed]);
		// Get the player's name
		GetPlayerName(playerid, Name, sizeof(Name));
		// Construct the title for the dialog
		format(TitleMsg, 128, "%s'ýn Ýstatistikleri", Name);

		// Show the dialog
		ShowPlayerDialog(playerid, DialogStats, DIALOG_STYLE_LIST, TitleMsg, StatsMsg, "Tamam", "Ýptal");
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Restarts the server
COMMAND:restart(playerid, params[])
{
	// Setup local variables
	new Msg[128];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/restart", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 5
		if (APlayerData[playerid][PlayerLevel] >= 10)
		{
			if (sscanf(params, "i", RestartTime)) SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/restart <Süre (Dakika)>\"");
			else
			{
				// Let everyone know that the server will be restarted in "RestartTime" minutes (provided by the admin)
			    format(Msg, 128, "Sunucuya %i dakika içinde restart atýlacak!", RestartTime);
				GameTextForAll(Msg, 5000, 3);
				SendClientMessageToAll(0xA0A0A0, Msg);
				// Start the next timer which warns the players again every minute
				SetTimer("Timer_Restart", 1000 * 60, true);
			}
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

forward Timer_Restart();
public Timer_Restart()
{
	// Setup local variables
	new Msg[128];

	// Decrease the RestartTime by one minute
	RestartTime--;

	// Let everyone know that the server will be restarted in 2 minutes
    format(Msg, 128, "Sunucuya %i dakika içinde restart atýlacak!", RestartTime);
	GameTextForAll(Msg, 5000, 3);
	SendClientMessageToAll(0xA0A0A0, Msg);

	// Do different things based on the remaining time
	switch (RestartTime)
	{
		case 1: // One minute left
		{
			// Change the hostname of the server and change the RCON-password to something weird
			SendRconCommand("hostname Sunucuya Restart Atýlýyor - Initial Gaming");
			SendRconCommand("password loafkagakggoagka");
		}
		case 0:
		{
			// Let everyone know that the server is kicking all players before restarting
			GameTextForAll("Sunucuya Restart Atiliyor~n~Tum Oyuncular Kicklendi!", 5000, 3);
			// Kick all players
			for(new i; i < MAX_PLAYERS; i++)
				SafeKick(i);

			// Start the next timer that will restart the server
			SetTimer("Timer_Restart_Reboot", 1000 * 5, false);
		}
	}
}

forward Timer_Restart_Reboot();
public Timer_Restart_Reboot()
{
	new HostCommand[128];

	// Restart the server
	SendRconCommand("gmx");
	// Change the hostname and password again
	format(HostCommand, 128, "hostname %s", HostName);
	SendRconCommand(HostCommand);
	format(HostCommand, 128, "weburl %s", Website);
	SendRconCommand(HostCommand);
	format(HostCommand, 128, "mapname %s", MapName);
	SendRconCommand(HostCommand);
	SendRconCommand("password 0");

	return 1;
}



// This command allows you to create a speedcamera
COMMAND:createcamera(playerid, params[])
{
	// Setup local variables
	new Float:x, Float:y, Float:z, Float:Angle, MaxSpeed, file[100], File:PFile, LineForFile[100], Msg[128];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/createcamera", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 5
		if (APlayerData[playerid][PlayerLevel] >= 10)
		{
			if (sscanf(params, "i", MaxSpeed)) SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/createcamera <Hýz Limiti>\"");
			else
			{
				// Get player's position and facing angle
				GetPlayerPos(playerid, x, y, z);
				GetPlayerFacingAngle(playerid, Angle);
				z = z - 1.0; // Adjust camera Z-coordinate 1m lower than normal (otherwise the camera floats in the air)

				// Move the player a bit, otherwise he could get stuck inside the camera-object
				SetPlayerPos(playerid, x, y + 1.0, z + 1.0);

				// Save the camera to a file
				for (new CamID; CamID < MAX_CAMERAS; CamID++)
				{
					// Check if this index is free
					if (ACameras[CamID][CamSpeed] == 0)
					{
					    // Setup this camera (create the objects and store the data)
                        SetupSpeedCamera(CamID, x, y, z, Angle, MaxSpeed);

					    // Save the file
						format(file, sizeof(file), CameraFile, CamID); // Construct the complete filename for this camera-file

						PFile = fopen(file, io_write); // Open the camera-file for writing

						format(LineForFile, 100, "CamX %f\r\n", x);
						fwrite(PFile, LineForFile); // And save it to the file
						format(LineForFile, 100, "CamY %f\r\n", y);
						fwrite(PFile, LineForFile); // And save it to the file
						format(LineForFile, 100, "CamZ %f\r\n", z);
						fwrite(PFile, LineForFile); // And save it to the file
						format(LineForFile, 100, "CamAngle %f\r\n", Angle);
						fwrite(PFile, LineForFile); // And save it to the file
						format(LineForFile, 100, "CamSpeed %i\r\n", MaxSpeed);
						fwrite(PFile, LineForFile); // And save it to the file

						fclose(PFile); // Close the file

						// Let the player know he created a new camera
						format(Msg, 128, "%i ID'li hýz kamerasý oluþturdunuz", CamID);
						SendClientMessage(playerid, 0x00FF00FF, Msg);

						// Exit the function
						return 1;
					}
				}

				// In case all camera-slots are occupied (100 camera's have been created already), let the player know about it
				format(Msg, 128, "{FF0000}%i hýz kamerasýndan fazla kamera oluþturamazsýnýz", MAX_CAMERAS);
				SendClientMessage(playerid, 0xFFFFFFFF, Msg);
			}
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// This command allows you to delete a speedcamera
COMMAND:delcamera(playerid, params[])
{
	// Setup local variables
	new file[100], Msg[128];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/delcamera", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 5
		if (APlayerData[playerid][PlayerLevel] >= 10)
		{
				// Loop through all camera's
			for (new CamID; CamID < MAX_CAMERAS; CamID++)
			{
				// Check if this index is used
				if (ACameras[CamID][CamSpeed] != 0)
				{
					// Check if the player is in range of the camera
					if (IsPlayerInRangeOfPoint(playerid, 5.0, ACameras[CamID][CamX], ACameras[CamID][CamY], ACameras[CamID][CamZ]))
					{
					    // Delete the file
						format(file, sizeof(file), CameraFile, CamID); // Construct the complete filename for this camera-file
						if (fexist(file)) // Make sure the file exists
							fremove(file); // Delete the file

						// Delete both camera objects
					    DestroyObject(ACameras[CamID][CamObj1]);
					    DestroyObject(ACameras[CamID][CamObj2]);
						// Also clear the data from memory
					    ACameras[CamID][CamX] = 0.0;
					    ACameras[CamID][CamY] = 0.0;
					    ACameras[CamID][CamZ] = 0.0;
					    ACameras[CamID][CamAngle] = 0.0;
					    ACameras[CamID][CamSpeed] = 0;
                        ACameras[CamID][CamObj1] = 0;
                        ACameras[CamID][CamObj2] = 0;

						// Let the player know he deleted a camera
						format(Msg, 128, "%i ID'li hýz kamerasýný sildiniz", CamID);
						SendClientMessage(playerid, 0x00FF00FF, Msg);

						// Exit the function
						return 1;
					}
				}
			}

			// In case the player wasn't near a speedcamera, inform him about it
			SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Silebilmek için bir hýz kamerasýnýn yanýnda olmalýsýnýz");
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}



// This command ports a player to the player who executed the command
COMMAND:get(playerid, params[])
{
	// Setup local variables
	new OtherPlayer, Float:x, Float:y, Float:z, PortMsg[128], IntID, WorldID, Name[24];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/get", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 1
		if (APlayerData[playerid][PlayerLevel] >= 6)
		{
			if (sscanf(params, "u", OtherPlayer)) SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/get <ID>\"");
			else
			{
				// Check if that other player is online
				if (IsPlayerConnected(OtherPlayer))
				{
					// Get the name of the other player
					GetPlayerName(OtherPlayer, Name, sizeof(Name));
					// Get the location of the player
					GetPlayerPos(playerid, x, y, z);
					IntID = GetPlayerInterior(playerid);
					WorldID = GetPlayerVirtualWorld(playerid);
					// Port the other player to this player
					SetPlayerVirtualWorld(OtherPlayer, WorldID);
					SetPlayerInterior(OtherPlayer, IntID);
					SetPlayerPos(OtherPlayer, x+5.0, y+5.0, z + 3.0);
					// Let the player know about it
					format(PortMsg, 128, "{FFFF00}%s{00FF00}'ý yanýnýza çektiniz", Name);
					SendClientMessage(playerid, 0xFFFFFFFF, PortMsg);
				}
				else
				    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Yanlýþ oyuncu ID!");
			}
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// This command deleted all vehicles that are spawned using /car, /plane, /bike, /trailer
COMMAND:cleanupcars(playerid, params[])
{
	// Setup local variables
	new CarsDeleted, Msg[128];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/cleanupcars", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 3
		if (APlayerData[playerid][PlayerLevel] >= 10)
		{
		    // Loop through all vehicles
		    for (new vid; vid < 2000; vid++)
		    {
				// Check if this vehicle exists (check the model), otherwise all empty slots are processed as well
				if (AVehicleData[vid][Model] != 0)
				{
					// Check if the vehicle is NOT a static vehicle
					if (AVehicleData[vid][StaticVehicle] == false)
					{
						// Check if the vehicle is NOT owned by anybody (this leaves all vehicles spawned with /car, /trailer, /plane)
						if (AVehicleData[vid][Owned] == false)
						{
							// Count the cars that have been deleted
							CarsDeleted++;
							// Delete the vehicle and clear the data
							DestroyVehicle(vid);
							AVehicleData[vid][Owned] = false;
							AVehicleData[vid][Owner] = 0;
							AVehicleData[vid][Model] = 0;
							AVehicleData[vid][PaintJob] = 0;
							for (new i; i < 14; i++)
							    AVehicleData[vid][Components][i] = 0;
							AVehicleData[vid][SpawnX] = 0.0;
							AVehicleData[vid][SpawnY] = 0.0;
							AVehicleData[vid][SpawnZ] = 0.0;
							AVehicleData[vid][SpawnRot] = 0.0;
							AVehicleData[vid][BelongsToHouse] = 0;
						}
					}
				}
		    }

			// Let the player know how many vehicles have been cleaned up
			format(Msg, 128, "{00FF00}Silinen araç sayýsý: {FFFF00}%i", CarsDeleted);
			SendClientMessage(playerid, 0xFFFFFFFF, Msg);
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// This command allows the player to call for assistance
COMMAND:tamir(playerid, params[])
{
	// Setup local variables
	new bool:AssistOnline = false, Msg[128], Name[24];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/tamir", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Get the player's name
		GetPlayerName(playerid, Name, sizeof(Name));
		// Preset the message that needs to be sent to assistance players
		format(Msg, 128, "{00FF00}Oyuncu {FFFF00}%s{00FF00}'nýn tamire ihtiyacý var. Gidin ve ona yardým edin!", Name);

		// Check if there is at least one assistance player online
		for (new i; i < MAX_PLAYERS; i++)
		{
			// Check if this player is connected
			if (IsPlayerConnected(i))
			{
				// Check if this player is assistance class
				if (APlayerData[i][PlayerClass] == ClassAssistance)
				{
					// Set the flag to indicate that at least one assistance player is online
				    AssistOnline = true;
				    // Send the assistance player a message to inform him who needs assistance
				    SendClientMessage(i, 0xFFFFFFFF, Msg);
				}
			}
		}

		// Check if there is at least one assistance player online
		if (AssistOnline == true)
		{
			// Set yourself as "AssistanceNeeded"
			APlayerData[playerid][AssistanceNeeded] = true;
			// Let the player know he called for assistance
			SendClientMessage(playerid, 0xFFFFFFFF, "{00FF00}Tamirci çaðýrdýnýz.");
		}
		else // No assistance is online
		{
			// Check if the player is the driver of a vehicle
			if (GetPlayerVehicleSeat(playerid) == 0)
			{
				// Fully repair the vehicle (damage value and bodywork)
				RepairVehicle(GetPlayerVehicleID(playerid));
				// Also re-fuel the vehicle
				AVehicleData[GetPlayerVehicleID(playerid)][Fuel] = MaxFuel;
				// Let the player pay for the repairs and refuel (default $2000)
				RewardPlayer(playerid, -200, 0);
				// Let the player know he spent $2000 for auto-repair because there were no assistance players online
			    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Aracýnýz $200'a tamir edildi ve benzini dolduruldu");
			    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Çünkü oyunda tamirci yok.");
			}
		}
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// This command adds nitro to the player's vehicle
COMMAND:nos(playerid, params[])
{
	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 1
		if (APlayerData[playerid][PlayerLevel] >= 8)
		{
			// Check if the player is the driver of a vehicle
			if (GetPlayerVehicleSeat(playerid) == 0)
			{
				// Check if the vehicle isn't owned (owned vehicle's need to buy nitro at mod garages)
				AddVehicleComponent(GetPlayerVehicleID(playerid), 1010); // Add nitro to the player's vehicle
			}
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// This command let's an admin spectate another player
COMMAND:spec(playerid, params[])
{
	// Setup local variables
	new OtherPlayer, Name[24], Msg[128];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/spec", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 1
		if (APlayerData[playerid][PlayerLevel] >= 1)
		{
			if (sscanf(params, "u", OtherPlayer)) SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/spec <ID>\"");
			else
			{
				// Check if that other player is online
				if (IsPlayerConnected(OtherPlayer))
				{
					// Get the player's name
					GetPlayerName(OtherPlayer, Name, sizeof(Name));

				    // Turn spectating on
				    TogglePlayerSpectating(playerid, 1);

					// Check if the other player is driving a vehicle
					if (GetPlayerVehicleSeat(OtherPlayer) == -1)
					{
						// The other player is on foot, so spectate him
						PlayerSpectatePlayer(playerid, OtherPlayer);
						SetPlayerInterior(playerid, GetPlayerInterior(OtherPlayer));
						APlayerData[playerid][SpectateID] = OtherPlayer;
						APlayerData[playerid][SpectateType] = ADMIN_SPEC_TYPE_PLAYER;
					}
					else
					{
						// The other player is in a vehicle, so spectate the vehicle
						PlayerSpectateVehicle(playerid, GetPlayerVehicleID(OtherPlayer));
						APlayerData[playerid][SpectateID] = OtherPlayer;
						APlayerData[playerid][SpectateVehicle] = GetPlayerVehicleID(OtherPlayer);
						APlayerData[playerid][SpectateType] = ADMIN_SPEC_TYPE_VEHICLE;
					}

					format(Msg, 128, "{FFFF00}%s{00FF00}'ý izliyorsunuz.", Name);
					SendClientMessage(playerid, 0xFFFFFFFF, Msg);
				}
				else
				    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Yanlýþ oyuncu ID!");
			}
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// This command ends the spectate mode
COMMAND:endspec(playerid, params[])
{
	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/endspec", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 1
		if (APlayerData[playerid][PlayerLevel] >= 1)
		{
			// Check if the player is spectating
			if (GetPlayerState(playerid) == PLAYER_STATE_SPECTATING)
			{
			    TogglePlayerSpectating(playerid, 0);
				APlayerData[playerid][SpectateID] = -1;
				APlayerData[playerid][SpectateVehicle] = -1;
				APlayerData[playerid][SpectateType] = ADMIN_SPEC_TYPE_NONE;
			}
			else
			    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Þuan birini izlemiyorsunuz!");
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}



// Lets the player add new businesses
COMMAND:createbusiness(playerid, params[])
{
	// Setup local variables
	new BusinessList[2000];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/createbusiness", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 5
		if (APlayerData[playerid][PlayerLevel] >= 10)
		{
			// Check if the player isn't inside a vehicle
			if (GetPlayerVehicleSeat(playerid) == -1)
			{
				// Construct the list of businesses
				for (new BusType = 1; BusType < sizeof(ABusinessInteriors); BusType++)
				{
				    format(BusinessList, sizeof(BusinessList), "%s%s\n", BusinessList, ABusinessInteriors[BusType][InteriorName]);
				}

				// Let the player choose a business-type via a dialog
				ShowPlayerDialog(playerid, DialogCreateBusSelType, DIALOG_STYLE_LIST, "Ýþyeri Tipi Seçin:", BusinessList, "Seç", "Ýptal");
			}
			else
			    SendClientMessage(playerid, 0xFF0000FF, "Araçtayken iþyeri ekleyemezsiniz!");
		}
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// This command lets the player delete a business
COMMAND:delbusiness(playerid, params[])
{
	// Setup local variables
	new file[100], Msg[128];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/delbusiness", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 5
		if (APlayerData[playerid][PlayerLevel] >= 10)
		{
			// Make sure the player isn't inside a vehicle
			if (GetPlayerVehicleID(playerid) == 0)
			{
				// Loop through all player-owned businesses
				for (new BusID = 1; BusID < MAX_BUSINESS; BusID++)
				{
					// Check if the business exists
					if (ABusinessData[BusID][PickupID] != 0)
					{
						// Check if the business has no owner
						if (ABusinessData[BusID][Owned] == false)
						{
							// Check if the player is in range of the business-pickup
							if (IsPlayerInRangeOfPoint(playerid, 2.5, ABusinessData[BusID][BusinessX], ABusinessData[BusID][BusinessY], ABusinessData[BusID][BusinessZ]))
							{
								// Clear all data of the business
	                            ABusinessData[BusID][BusinessName] = 0;
	                            ABusinessData[BusID][BusinessX] = 0.0;
	                            ABusinessData[BusID][BusinessY] = 0.0;
	                            ABusinessData[BusID][BusinessZ] = 0.0;
	                            ABusinessData[BusID][BusinessType] = 0;
	                            ABusinessData[BusID][BusinessLevel] = 0;
	                            ABusinessData[BusID][LastTransaction] = 0;
	                            ABusinessData[BusID][Owned] = false;
	                            ABusinessData[BusID][Owner] = 0;
								// Destroy the mapicon, 3DText and pickup for the house
								DestroyDynamicPickup(ABusinessData[BusID][PickupID]);
								DestroyDynamicMapIcon(ABusinessData[BusID][MapIconID]);
								DestroyDynamic3DTextLabel(ABusinessData[BusID][DoorText]);
	                            ABusinessData[BusID][PickupID] = 0;
	                            ABusinessData[BusID][MapIconID] = 0;

								// Delete the business-file
								format(file, sizeof(file), BusinessFile, BusID); // Construct the complete filename for this business-file
								if (fexist(file)) // Make sure the file exists
									fremove(file); // Delete the file

								// Also let the player know he deleted the business
								format(Msg, 128, "{00FF00}Yanýnýzdaki iþyerinizi sildiniz. ID: {FFFF00}%i", BusID);
								SendClientMessage(playerid, 0xFFFFFFFF, Msg);

								// Exit the function
								return 1;
							}
						}
					}
				}

				// There was no house in range, so let the player know about it
				SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Yakýnlarda iþyeri yok");
			}
			else
			    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Araçtayken iþyeri silemezsiniz");
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// This command lets the player buy a business when he's standing in range of a business that isn't owned yet
COMMAND:isyerial(playerid, params[])
{
	// Setup local variables
	new Msg[128], BusType;

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/isyerial", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Make sure the player isn't inside a vehicle
		if (GetPlayerVehicleID(playerid) == 0)
		{
			// Check if the player is near a business-pickup
			for (new i = 1; i < sizeof(ABusinessData); i++)
			{
				// Check if this business is created (it would have a valid pickup in front of the door)
				if (ABusinessData[i][PickupID] != 0)
				{
					// Check if the player is in range of the business-pickup
					if (IsPlayerInRangeOfPoint(playerid, 2.5, ABusinessData[i][BusinessX], ABusinessData[i][BusinessY], ABusinessData[i][BusinessZ]))
					{
					    // Check if the business isn't owned yet
					    if (ABusinessData[i][Owned] == false)
					    {
							// Get the type of business
							BusType = ABusinessData[i][BusinessType];
					        // Check if the player can afford this type of business business
					        if (APlayerData[playerid][PlayerMoney] >= ABusinessInteriors[BusType][BusPrice])
					            Business_SetOwner(playerid, i); // Give ownership of the business to the player
					        else
					            SendClientMessage(playerid, 0xFF0000FF, "Bu iþyerini alacak paranýz yok"); // The player cannot afford this business
					    }
					    else
					    {
					        // Let the player know that this business is already owned by a player
							format(Msg, 128, "{FF0000}Bu iþyerinin zaten sahibi var! Sahibi: {00FF00}%s{FFFFFF}", ABusinessData[i][Owner]);
							SendClientMessage(playerid, 0xFFFFFFFF, Msg);
					    }

						// The player was in range of a business-pickup, so stop searching for the other business pickups
					    return 1;
					}
				}
				else
				    return 1; // If there are no more houses (no more pickup-id's found), stop searching
			}

			// All businesses have been processed, but the player wasn't in range of any business-pickup, let him know about it
			SendClientMessage(playerid, 0xFF0000FF, "Ýþyeri almak için iþyeri ikonunun yanýnda olmalýsýnýz!");
		}
		else
		    SendClientMessage(playerid, 0xFF0000FF, "Araçtayken iþyeri alamazsýnýz!");
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// This command opens a menu when you're inside your business to allow to access the options of your business
COMMAND:isyeri(playerid, params[])
{
	// Setup local variables
	new OptionsList[200], DialogTitle[200];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/isyeri", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player is inside a business
		if (APlayerData[playerid][CurrentBusiness] != 0)
		{
			format(DialogTitle, sizeof(DialogTitle), "Ýþyeri %s", ABusinessData[APlayerData[playerid][CurrentBusiness]][BusinessName]);

			format(OptionsList, sizeof(OptionsList), "%sÝþyerinin Ýsmini Deðiþtir\n", OptionsList);
			format(OptionsList, sizeof(OptionsList), "%sÝþyerini Geliþtir\n", OptionsList);
			format(OptionsList, sizeof(OptionsList), "%sÝþyeri Kasasýndan Para Çek\n", OptionsList);
			format(OptionsList, sizeof(OptionsList), "%sÝþyeri Sat\n", OptionsList);
			format(OptionsList, sizeof(OptionsList), "%sÝþyerinden Çýk\n", OptionsList);
			// Show the businessmenu
			ShowPlayerDialog(playerid, DialogBusinessMenu, DIALOG_STYLE_LIST, DialogTitle, OptionsList, "Seç", "Ýptal");
		}
		else
		    SendClientMessage(playerid, 0xFF0000FF, "Ýþyerinin içinde deðilsiniz!");
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// This command teleports you to your selected business
COMMAND:isyerinegit(playerid, params[])
{
	// Setup local variables
	new BusinessList[1000], BusID, BusType, Earnings;

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/isyerinegit", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player is not jailed
		if (APlayerData[playerid][PlayerJailed] == 0)
		{
			// Check if the player has a wanted level of less than 3
			if (GetPlayerWantedLevel(playerid) < 3)
			{
				// Check if the player is not inside a vehicle
				if (GetPlayerVehicleID(playerid) == 0)
				{
					// Ask to which business the player wants to port
					for (new i; i < MAX_BUSINESSPERPLAYER; i++)
					{
						// Get the business-id
					    BusID = APlayerData[playerid][Business][i];

						// Check if this businessindex is occupied
						if (BusID != 0)
						{
							// Get the business-type
							BusType = ABusinessData[BusID][BusinessType];
							Earnings = (BusinessTransactionTime - ABusinessData[BusID][LastTransaction]) * ABusinessInteriors[BusType][BusEarnings] * ABusinessData[BusID][BusinessLevel];
							format(BusinessList, 1000, "%s{00FF00}%s{FFFFFF} (Gelir: $%i)\n", BusinessList, ABusinessData[BusID][BusinessName], Earnings);
						}
						else
							format(BusinessList, 1000, "%s{FFFFFF}%s{FFFFFF}\n", BusinessList, "Boþ Ýþyeri Slotu");
					}
					ShowPlayerDialog(playerid, DialogGoBusiness, DIALOG_STYLE_LIST, "Iþýnlanacak Ýþyeri Seç:", BusinessList, "Seç", "Ýptal");
				}
				else
					SendClientMessage(playerid, 0xFF0000FF, "Sadece ayaktayken iþyerinize ýþýnlanabilirsiniz");
			}
			else
			    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Aranýyorken iþyerine ýþýnlanamazsýnýz");
		}
		else
		    SendClientMessage(playerid, 0xFF0000FF, "Hapisteyken iþyerine ýþýnlanamazsýnýz");
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Mutes a player (he cannot talk anymore)
COMMAND:mute(playerid, params[])
{
	// Setup local variables
	new Msg[128], Name[24], AdminName[24], Reason[128], OtherPlayer;

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/mute", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 1
		if (APlayerData[playerid][PlayerLevel] >= 1)
		{
			if (sscanf(params, "us[128]", OtherPlayer, Reason)) SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/mute <ID> <Sebep>\"");
			else
			{
				// Check if the otherplayer is online
				if (IsPlayerConnected(OtherPlayer))
				{
					// Get the player-names
					GetPlayerName(playerid, AdminName, sizeof(AdminName));
					GetPlayerName(OtherPlayer, Name, sizeof(Name));
					// Mute the other player
					APlayerData[OtherPlayer][Muted] = true;
					// Let the other player know that he has been muted
					format(Msg, 128, "{FFFF00}%s {FF0000}tarafýndan susturuldunuz. Sebep: {FFFF00}%s", AdminName, Reason);
					SendClientMessage(OtherPlayer, 0xFFFFFFFF, Msg);
					// Let the admin know who he has muted
					format(Msg, 128, "{FFFF00}%s{00FF00}'ý susturdunuz", Name);
					SendClientMessage(playerid, 0xFFFFFFFF, Msg);
					// Save the player-stats
					PlayerFile_Save(OtherPlayer);
				}
				else
				    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Yanlýþ oyuncu ID!");
			}
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Un-mutes a player (he cannot talk anymore)
COMMAND:unmute(playerid, params[])
{
	// Setup local variables
	new Msg[128], Name[24], AdminName[24], OtherPlayer;

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/unmute", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 1
		if (APlayerData[playerid][PlayerLevel] >= 1)
		{
			if (sscanf(params, "u", OtherPlayer)) SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/unmute <ID>\"");
			else
			{
				// Check if the otherplayer is online
				if (IsPlayerConnected(OtherPlayer))
				{
					// Get the player-names
					GetPlayerName(playerid, AdminName, sizeof(AdminName));
					GetPlayerName(OtherPlayer, Name, sizeof(Name));
					// Un-mute the other player
					APlayerData[OtherPlayer][Muted] = false;
					// Let the other player know that he has been un-muted
					format(Msg, 128, "{FFFF00}%s {FF0000}tarafýndan susturma cezanýz kaldýrýldý", AdminName);
					SendClientMessage(OtherPlayer, 0xFFFFFFFF, Msg);
					// Let the admin know who he has un-muted
					format(Msg, 128, "{FFFF00}%s{00FF00}'nýn susturma cezasýný kaldýrdýnýz", Name);
					SendClientMessage(playerid, 0xFFFFFFFF, Msg);
					// Save the player-stats
					PlayerFile_Save(OtherPlayer);
				}
				else
				    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Yanlýþ oyuncu ID!");
			}
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Let's the admins see which players are still muted
COMMAND:mutes(playerid, params[])
{
	// Setup local variables
	new PlayerList[1000], Name[24];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/mutes", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 1
		if (APlayerData[playerid][PlayerLevel] >= 1)
		{
			// Loop through all players
			for (new i; i < MAX_PLAYERS; i++)
			{
				// Check if that player is online
				if (IsPlayerConnected(i))
				{
				    if (APlayerData[i][Muted] == true)
					{
						// Get the player's name
						GetPlayerName(i, Name, sizeof(Name));
						// Add his name and ID to the list
						format(PlayerList, sizeof(PlayerList), "%s%s (ID: %i)\n", PlayerList, Name, i);
					}
				}
			}

			// Show the list of muted players to the admin
			if (strlen(PlayerList) != 0)
				ShowPlayerDialog(playerid, DialogNoResponse, DIALOG_STYLE_LIST, "Susturulan oyuncular:", PlayerList, "Kapat", "");
			else
			    SendClientMessage(playerid, 0xFFFFFFFF, "{00FF00}Þuan susturulan oyuncu yok");
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Freeze a player (he cannot move anymore)
COMMAND:freeze(playerid, params[])
{
	// Setup local variables
	new Msg[128], Name[24], AdminName[24], Reason[128], OtherPlayer, Duration;

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/freeze", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 1
		if (APlayerData[playerid][PlayerLevel] >= 3)
		{
			if (sscanf(params, "uis[128]", OtherPlayer, Duration, Reason)) SendClientMessage(playerid, 0xFF0000AA, "Usage: \"/freeze <ID> <Süre> <Sebep>\"");
			else
			{
				// Check if the otherplayer is online
				if (IsPlayerConnected(OtherPlayer))
				{
					// Get the player-names
					GetPlayerName(playerid, AdminName, sizeof(AdminName));
					GetPlayerName(OtherPlayer, Name, sizeof(Name));
					// Store the duration for the freeze, freeze him and start the frozentimer
					APlayerData[OtherPlayer][PlayerFrozen] = Duration;
					TogglePlayerControllable(OtherPlayer, 0);
					APlayerData[OtherPlayer][PlayerFrozenTimer] = SetTimerEx("Player_FreezeTimer", 1000, true, "i", OtherPlayer);
					// Let the other player know that he has been muted
					format(Msg, 128, "{FFFF00}%s {FF0000}tarafýndan donduruldunuz. Sebep: {FFFF00}%s", AdminName, Reason);
					SendClientMessage(OtherPlayer, 0xFFFFFFFF, Msg);
					// Let the admin know who he has muted
					format(Msg, 128, "{FFFF00}%s{00FF00}'ý dondurdunuz.", Name);
					SendClientMessage(playerid, 0xFFFFFFFF, Msg);
					// Save the player-stats
					PlayerFile_Save(OtherPlayer);
				}
				else
				    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Yanlýþ oyuncu ID!");
			}
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

COMMAND:unfreeze(playerid, params[])
{
	// Setup local variables
	new Msg[128], Name[24], AdminName[24], OtherPlayer;

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/unfreeze", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 1
		if (APlayerData[playerid][PlayerLevel] >= 3)
		{
			if (sscanf(params, "u", OtherPlayer)) SendClientMessage(playerid, 0xFF0000AA, "Usage: \"/unfreeze <ID>\"");
			else
			{
				// Check if the otherplayer is online
				if (IsPlayerConnected(OtherPlayer))
				{
					// Get the player-names
					GetPlayerName(playerid, AdminName, sizeof(AdminName));
					GetPlayerName(OtherPlayer, Name, sizeof(Name));
					// Store the duration for the freeze, freeze him and start the frozentimer
					APlayerData[OtherPlayer][PlayerFrozen] = 2;
					TogglePlayerControllable(OtherPlayer, 1);
					// Let the other player know that he has been muted
					format(Msg, 128, "{FFFF00}%s {FF0000}tarafýndan donma cezanýz kaldýrýldý.", AdminName);
					SendClientMessage(OtherPlayer, 0xFFFFFFFF, Msg);
					// Let the admin know who he has muted
					format(Msg, 128, "{FFFF00}%s{00FF00}'ýn donma cezasýný kaldýrdýnýz.", Name);
					SendClientMessage(playerid, 0xFFFFFFFF, Msg);
					// Save the player-stats
					PlayerFile_Save(OtherPlayer);
				}
				else
				    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Yanlýþ oyuncu ID!");
			}
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Transfer money to another player
COMMAND:paraver(playerid, params[])
{
	// Setup local variables
	new Msg[128], Name[24], OtherName[24], OtherPlayer, Money;

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/paraver", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		if (sscanf(params, "ui", OtherPlayer, Money)) SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/paraver <ID> <Para>\"");
		else
		{
			// Check if the otherplayer is online
			if (IsPlayerConnected(OtherPlayer))
			{
			    if(OtherPlayer == playerid) return SendClientMessage(playerid, -1, "{FF0000}Kendinize para veremezsiniz!");
				// Get the player-names
				GetPlayerName(playerid, Name, sizeof(Name));
				GetPlayerName(OtherPlayer, OtherName, sizeof(OtherName));

				// Check if the money has a positive value (to prevent stealing money using negative values)
				if (Money > 0)
				{
					// Check if the player has enough money
					if (APlayerData[playerid][PlayerMoney] >= Money)
					{
						// Transfer the money
						RewardPlayer(playerid, -Money, 0);
						RewardPlayer(OtherPlayer, Money, 0);
						// Let the other player know that he has received money
						format(Msg, 128, "{FFFF00}$%i{00FF00} aldýnýz. Gönderen: {FFFF00}%s", Money, Name);
						SendClientMessage(OtherPlayer, 0xFFFFFFFF, Msg);
						// Let the player know he gave money to somebody else
						format(Msg, 128, "{FFFF00}$%i{00FF00} gönderdiniz. Gönderdiðiniz Oyuncu: {FFFF00}%s", Money, OtherName);
						SendClientMessage(playerid, 0xFFFFFFFF, Msg);
						// Save the player-stats
						PlayerFile_Save(playerid);
						PlayerFile_Save(OtherPlayer);
					}
					else
					    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Bu kadar paranýz yok");
				}
				else
				    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Lütfen 0 dan büyük deðer girin");
			}
			else
			    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Yanlýþ oyuncu ID!");
		}
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Respawns the given vehicle
COMMAND:respawn(playerid, params[])
{
	// Setup local variables
	new vid, Msg[128];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/respawn", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 1
		if (APlayerData[playerid][PlayerLevel] >= 8)
		{
			if (sscanf(params, "i", vid)) SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/respawn <Araç ID>\"");
			else
			{
				// Check if the vehicle-id is valid
				if ((vid > 0) && (vid < 2000))
				{
					// Check if the vehicle exists
					if (AVehicleData[vid][Model] != 0)
					{
					    // Force the vehicle to respawn
						SetVehicleToRespawn(vid);
						// Let the player know he respawned the vehicle
						format(Msg, 128, "{FFFF00}%i{00FF00} ID'li aracý respawn ettiniz.", vid);
						SendClientMessage(playerid, 0xFFFFFFFF, Msg);
					}
				}
				else
				    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}1999 ile 1 arasý bir deðer girmelisiniz!");
			}
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Creates a spikestrip (can only be used by police players)
COMMAND:kapan(playerid, params[])
{
	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/kapan", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player if a police player
		if (APlayerData[playerid][PlayerClass] == ClassPolice)
		{
			// Check if the player is on foot
			if (GetPlayerVehicleSeat(playerid) == -1)
			{
				// Try to create a spikestrip
				SpikeStrip_Create(playerid);
			}
			else
			    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Kapan kurabilmek için ayakta olmalýsýnýz");
		}
		else
			return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// This command ejects a player from his vehicle
COMMAND:eject(playerid, params[])
{
	// Setup local variables
	new Name[24], AdminName[24], Msg[128], OtherPlayer;

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/eject", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 2
		if (APlayerData[playerid][PlayerLevel] >= 3)
		{
			if (sscanf(params, "u", OtherPlayer)) SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/eject <ID>\"");
			else
			{
			    // Check if the player is logged in
				if (APlayerData[OtherPlayer][LoggedIn] == true)
				{
					// Check if the other player is driving a vehicle
					if (GetPlayerVehicleSeat(OtherPlayer) != -1)
					{
						// Get the names of the players
						GetPlayerName(playerid, AdminName, sizeof(AdminName));
						GetPlayerName(OtherPlayer, Name, sizeof(Name));
						// Eject the player from the vehicle
						RemovePlayerFromVehicle(OtherPlayer);
						// Let the player know he's been ejected from his vehicle
						format(Msg, 128, "{FFFF00}%s {FF0000}tarafýndan araçtan atýldýnýz", AdminName);
						SendClientMessage(OtherPlayer, 0xFFFFFFFF, Msg);
						// Inform the admin that he ejected the player
						format(Msg, 128, "{FFFF00}%s{00FF00}'ý aracýndan attýnýz.", Name);
						SendClientMessage(playerid, 0xFFFFFFFF, Msg);
					}
					else
					    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Bu oyuncu araçta deðil");
				}
				else
				    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Yanlýþ oyuncu ID!");
			}
		}
		else
			return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// This command lets you talk only to players of the same class
COMMAND:say(playerid, params[])
{
	// Setup local variables
	new Name[24], Msg[128], Message[128];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/say", params);

	// Get the player's name
	GetPlayerName(playerid, Name, sizeof(Name));

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		if (sscanf(params, "s[128]", Message)) SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/say <Mesajýnýz>\"");
		else
		{
			// Loop through all players
			for (new i; i < MAX_PLAYERS; i++)
			{
			    // Check if the player is logged in
				if (APlayerData[i][LoggedIn] == true)
				{
				    // Check if the other player has the same class
				    if (APlayerData[i][PlayerClass] == APlayerData[playerid][PlayerClass])
				    {
						format(Msg, 128, "{B0B0B0}%s: {FFFFFF}%s", Name, Message);
						SendClientMessage(i, 0xFFFFFFFF, Msg);
				    }
				}
			}
		}
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

COMMAND:announce(playerid, params[])
{
	// Setup local variables
	new Message[128];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/announce", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player is an admin
		if (APlayerData[playerid][PlayerLevel] >= 1)
		{
			if (sscanf(params, "s[128]", Message)) SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/announce <Mesajýnýz>\"");
			else
			{
				GameTextForAll(Message, 5000, 5);
			}
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// This command lets you talk only to admin players
COMMAND:asay(playerid, params[])
{
	SendClientMessage(playerid, -1, "{FF0000}Adminler arasý konuþma için yazýnýn baþýna # koyun.");
	return 1;
}

// Clamp an owned vehicle (remove it completely)
COMMAND:clamp(playerid, params[])
{
	// Setup local variables
	new vid, Reason[128], HouseID, HouseOwner, Name[24], AdminName[24], Msg[128];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/clamp", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 5
		if (APlayerData[playerid][PlayerLevel] >= 10)
		{
			if (sscanf(params, "is[128]", vid, Reason)) SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/clamp <Araç ID> <Sebep>\"");
			else
			{
			    // Get the HouseID to which this vehicle belongs
				HouseID = AVehicleData[vid][BelongsToHouse];

				// Check if the vehicle belongs to a house
				if (HouseID != 0)
				{
					//Also set the new location of the vehicle inside the KACC Military fuels hangar
					AVehicleData[vid][SpawnX] = 2585.0;
					AVehicleData[vid][SpawnY] = 2829.0;
					AVehicleData[vid][SpawnZ] = 10.9;
					AVehicleData[vid][SpawnRot] = 0.0;

					// Search all the players to see who owns the house
					for (new i; i < MAX_PLAYERS; i++)
					{
						// Loop through all the houses this player owns
						for(new j; j < MAX_HOUSESPERPLAYER; j++)
						{
						    // Check if the player owns this house
							if (APlayerData[i][Houses][j] == HouseID)
							{
							    // Store the houseowner
							    HouseOwner = i;

								// Find the CarSlot where this vehicle exists
								for (new CarSlot; CarSlot < 10; CarSlot++)
								{
									// Check if the vehicle is stored in this carslot
									if (AHouseData[HouseID][VehicleIDs][CarSlot] == vid)
									{
										vid = House_ReplaceVehicle(HouseID, CarSlot); // Re-create the vehicle at the KACC Military fuels hangar
										// Set the vehicle as clamped (clamping needs to be done after re-creating the vehice, otherwise the wrong id can be clamped)
										AVehicleData[vid][Clamped] = true;
									}
								}

								break;
							}
						}
					}

					// Get the name of the admin and owner of the house
					GetPlayerName(playerid, AdminName, sizeof(AdminName));
					GetPlayerName(HouseOwner, Name, sizeof(Name));

					// Let the admin know who's vehicle he deleted
					format(Msg, 128, "{FFFF00}%s{00FF00}'ýn aracýný kelepçelediniz", Name);
					SendClientMessage(playerid, 0xFFFFFFFF, Msg);
					// Let the player know who deleted his vehicle
					format(Msg, 128, "{FF0000}Bir aracýnýz admin {FFFF00}%s {FF0000}tarafýndan kelepçelendi", AdminName);
					SendClientMessage(HouseOwner, 0xFFFFFFFF, Msg);
					format(Msg, 128, "{FF0000}Bu aracýnýzýn bulunduðu ev: {FFFF00}%s", AHouseData[HouseID][HouseName]);
					SendClientMessage(HouseOwner, 0xFFFFFFFF, Msg);
					format(Msg, 128, "{FF0000}Sebep: {FFFF00}%s", Reason);
					SendClientMessage(HouseOwner, 0xFFFFFFFF, Msg);
					// Save the player's datafile (and his houses/businesses/vehicles)
					PlayerFile_Save(HouseOwner);
				}
				else
				    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Bu aracýn sahibi yok. Kelepçeleyemezsiniz!");
			}
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// This command can be used to unclamp all your vehicles at once
COMMAND:unclamp(playerid, params[])
{
	// Setup local variables
	new HouseID, vid, ClampedVehicles, UnclampPrice, Msg[128];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/unclamp", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Loop through all vehicles owned by this player
		for (new HouseSlot; HouseSlot < MAX_HOUSESPERPLAYER; HouseSlot++)
		{
			// Get the HouseID that exists on this index
			HouseID = APlayerData[playerid][Houses][HouseSlot];

			// check if this house-slot is used
			if (HouseID != 0)
			{
				// Loop through all vehicles assigned to this house
				for (new CarSlot; CarSlot < 10; CarSlot++)
				{
					// Get the vehicle-id of the vehicle in this carslot
					vid = AHouseData[HouseID][VehicleIDs][CarSlot];

					// Check if this carslot is used
					if (vid != 0)
					{
						// Check if this vehicle is clamped
						if (AVehicleData[vid][Clamped] == true)
						    ClampedVehicles++; // Count the clamped vehicles
					}
				}
			}
		}

		// Check if there were any clamped vehicles
		if (ClampedVehicles > 0)
		{
			// Calculate the price to unclamp all the player's vehicles
			UnclampPrice = ClampedVehicles * UnclampPricePerVehicle;

			// Construct the message to inform the player how many vehicles have been clamped and how much it costs to un-clamp them
			format(Msg, 128, "%i kelepçeli aracýnýz vardý, onlarý kelepçeden kullanmak size $%i'a patlayacak.", ClampedVehicles, UnclampPrice);
		    // Show a dialog that informs the player how many vehicles have been clamped and how much it costs to un-clamp them
			ShowPlayerDialog(playerid, DialogUnclampVehicles, DIALOG_STYLE_MSGBOX, TXT_AreYouSure, Msg, "Kelepçeden Kurtar", TXT_DialogButtonCancel);
		}
		else
		    SendClientMessage(playerid, 0xFFFFFFFF, "{00FF00}Kelepçelenmiþ aracýnýz yok!");
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// This command displays the rules of the server
COMMAND:kurallar(playerid, params[])
{
	// Setup local variables
	new Msg[2000];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/kurallar", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Construct the rules
		format(Msg, 2000, "%s1. Hile ve cleo kullanýmý yasaktýr\n", Msg);
		format(Msg, 2000, "%s2. Küfür ve hakaret içerikli mesajlar yasaktýr\n", Msg);
		format(Msg, 2000, "%s3. Dini, milli ve ýrki deðerlere saygýsýzlýk yasaktýr\n", Msg);
		format(Msg, 2000, "%s4. Siyasi söylemlerde bulunmak yasaktýr\n", Msg);
		format(Msg, 2000, "%s5. Flood yapýp chati kirletmek yasaktur\n", Msg);
		format(Msg, 2000, "%s6. Görevdeki oyuncularý rahatsýz etmek yasaktýr ( Mafya Harici )\n", Msg);
 		format(Msg, 2000, "%s7. Polislerin suçsuz oyuncularý saldýrmasý yasaktýr\n", Msg);
  		format(Msg, 2000, "%s8. Yapýlan etkinlikleri bozmak yasaktýr\n", Msg);
  		
	    // Show a dialog that shows the rules
		ShowPlayerDialog(playerid, DialogRules, DIALOG_STYLE_MSGBOX, "Oyun Kurallarý:", Msg, "Kabul Et", TXT_DialogButtonCancel);
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}


// Report a player for breaking the rules
COMMAND:rapor(playerid, params[])
{
	// Setup local variables
	new OtherPlayer, Name[24], Reason[128], Msg[128];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/rapor", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		if (sscanf(params, "us[128]", OtherPlayer, Reason)) SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/rapor <ID> <Raporunuz>\"");
		else
		{
		    // Check if that other player is logged in
		    if (APlayerData[OtherPlayer][LoggedIn] == true)
		    {
				// Send the report to all admins and add the report to the report-list so admins can review it
				SendReportToAdmins(OtherPlayer, Reason);

				// Get the name of the offender
				GetPlayerName(OtherPlayer, Name, sizeof(Name));
				// Let the player know he reported the other player
				format(Msg, 128, "{FFFF00}%s{00FF00}'ý rapor ettiniz. Yöneticiler en yakýn zamanda ilgileneceklerdir.", Name);
				SendClientMessage(playerid, 0xFFFFFFFF, Msg);
			}
			else
			    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Yanlýþ oyuncu ID.");
		}
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Lets the admins see the list of reports
COMMAND:raporlar(playerid, params[])
{
	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/raporlar", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 1
		if (APlayerData[playerid][PlayerLevel] >= 1)
		{
			// Add the first report to the list (if it exists)
			if (AReports[0][ReportUsed] == true)
			    format(ReportList, 5000, "%s: %s\n", AReports[0][ReportName], AReports[0][ReportReason]);

			// Construct the report-dialog
			for (new i = 1; i < 50; i++)
			{
				// Check if the ReportID has been used already
				if (AReports[i][ReportUsed] == true)
				{
				    format(ReportList, 5000, "%s%s: %s\n", ReportList, AReports[i][ReportName], AReports[i][ReportReason]);
				}
			}

			// Show all the reports
			ShowPlayerDialog(playerid, DialogReports, DIALOG_STYLE_LIST, "Rapor Listesi:", ReportList, "Tamam", "Kapat");
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}


COMMAND:cc(playerid, params[])
{
	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/cc", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 1
		if (APlayerData[playerid][PlayerLevel] >= 1)
		{
			SendClientMessageToAll(-1, " ");
 			SendClientMessageToAll(-1, " ");
 			SendClientMessageToAll(-1, " ");
 			SendClientMessageToAll(-1, " ");
 			SendClientMessageToAll(-1, " ");
 			SendClientMessageToAll(-1, " ");
 			SendClientMessageToAll(-1, " ");
 			SendClientMessageToAll(-1, " ");
 			SendClientMessageToAll(-1, " ");
 			SendClientMessageToAll(-1, " ");
 			SendClientMessageToAll(-1, " ");
 			SendClientMessageToAll(-1, " ");
 			SendClientMessageToAll(-1, " ");
 			SendClientMessageToAll(-1, " ");
 			SendClientMessageToAll(-1, " ");
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Enables the trucker to overload himself
COMMAND:overload(playerid, params[])
{
	// Setup local variables
	new vModel, bool:ValidOverLoad = false, Float:x, Float:y, Float:z, Name[24], Msg[128];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/overload", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the playeris a trucker
		if (APlayerData[playerid][PlayerClass] == ClassTruckDriver)
		{
			// Check if he has already started a job
			if (APlayerData[playerid][JobStarted] == true)
			{
				// Check if the player has already loaded his load
				if (APlayerData[playerid][JobStep] == 2)
				{
					// Check if the player isn't overloaded already
					if (APlayerData[playerid][Overloaded] == false)
					{
						// Get the coordinates of the loading point
						x = ALocations[APlayerData[playerid][JobLoc1]][LocX];
						y = ALocations[APlayerData[playerid][JobLoc1]][LocY];
						z = ALocations[APlayerData[playerid][JobLoc1]][LocZ];

					    // Check if the player is still near the loading point
					    if (IsPlayerInRangeOfPoint(playerid, 25.0, x, y, z))
					    {
							// Get the vehicle-model of the player's vehicle
							vModel = GetVehicleModel(APlayerData[playerid][VehicleID]);

							// Check if the trucker is driving a trucking vehicle that can be overloaded
							switch (vModel)
							{
								case VehicleFlatbed, VehicleDFT30: ValidOverLoad = true; // Flatbed and DFT-30 can be overloaded
								case VehicleLineRunner, VehicleTanker, VehicleRoadTrain:
								{
									switch (GetVehicleModel(APlayerData[playerid][TrailerID]))
									{
										case VehicleTrailerCargo, VehicleTrailerCargo2, VehicleTrailerOre: ValidOverLoad = true; // Cargo and ore trailer can be overloaded
									}
								}
							}

							// Check if the vehicle is valid for overloading
							if (ValidOverLoad == true)
							{
								// Set overloaded for this player to True
							    APlayerData[playerid][Overloaded] = true;
							    // Add 2 to the player's wanted level
							    SetPlayerWantedLevel(playerid, GetPlayerWantedLevel(playerid) + 2);
							    // Let the player know he has been overloaded now
							    SendClientMessage(playerid, 0xFFFFFFFF, "{00FF00}Týrýnýza aþýrý yükleme yaptýnýz, polislerden kaçýnýn.");
								// Inform the police this trucker is overloaded
								GetPlayerName(playerid, Name, sizeof(Name));
								format(Msg, 128, "{00FF00}Kamyoncu {FFFF00}%s{00FF00} aþýrý yükleme yaptý, onu yakalayýn ve cezalandýrýn.", Name);
								Police_SendMessage(Msg);
							}
							else
							    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Aracýnýza aþýrý yükleme yapýlamaz.");
						}
						else
						    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Aþýrý yükleme yapabilmek için yükleme noktasýnýn yakýnýnda olmalýsýnýz");
					}
					else
					    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Zaten aþýrý yükleme yaptýnýz");
				}
				else
				    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Önce týrýnýzý yükleyin");
			}
			else
			    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Þuan görevde deðilsiniz!");
		}
		else
			return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// This command resets a player's money, score and stats to 0 (if chosen)
COMMAND:resetplayer(playerid, params[])
{
	// Setup local variables
	new Name[24], AdminName[24], Reason[128], Msg[128], OtherPlayer, ClearMoney, ClearScore, ClearStats;

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/resetplayer", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 5
		if (APlayerData[playerid][PlayerLevel] >= 9)
		{
			if (sscanf(params, "uiiis[128]", OtherPlayer, ClearMoney, ClearScore, ClearStats, Reason)) SendClientMessage(playerid, 0xFF0000AA, "Usage: \"/resetplayer <OtherPlayer> <Money (0/1)> <Score (0/1)> <Stats (0/1)> <Reason>\"");
			else
			{
			    // Check if the other player is logged in
				if (APlayerData[OtherPlayer][LoggedIn] == true)
				{
					// Check if there is at least one parameter given to be cleared, otherwise exit the command
					if ((ClearMoney + ClearScore + ClearStats) == 0)
						return 1;

					// Get the names of both players
					GetPlayerName(playerid, AdminName, sizeof(AdminName));
					GetPlayerName(OtherPlayer, Name, sizeof(Name));

					// Reset the other player's money to 0
					if (ClearMoney == 1)
					{
						APlayerData[OtherPlayer][PlayerMoney] = 0;
						format(Msg, 128, "{FF0000}Paranýz {FFFF00}%s {FF0000}tarafýndan sýfýrlandý", AdminName);
						SendClientMessage(OtherPlayer, 0xFFFFFFFF, Msg);
						format(Msg, 128, "{FFFF00}%s{00FF00}'ýn parasýný sýfýrladýnýz", Name);
						SendClientMessage(playerid, 0xFFFFFFFF, Msg);
					}

					// Reset the other player's score to 0
					if (ClearScore == 1)
					{
						APlayerData[OtherPlayer][PlayerScore] = 0;
						format(Msg, 128, "{FF0000}Skorunuz {FFFF00}%s {FF0000}tarafýndan sýfýrlandý", AdminName);
						SendClientMessage(OtherPlayer, 0xFFFFFFFF, Msg);
						format(Msg, 128, "{FFFF00}%s{00FF00}'ýn skorunu sýfýrladýnýz", Name);
						SendClientMessage(playerid, 0xFFFFFFFF, Msg);
					}

					// Reset the other player's stats to 0
					if (ClearStats == 1)
					{
						APlayerData[OtherPlayer][StatsTruckerJobs] = 0;
						APlayerData[OtherPlayer][StatsConvoyJobs] = 0;
						APlayerData[OtherPlayer][StatsBusDriverJobs] = 0;
						APlayerData[OtherPlayer][StatsPilotJobs] = 0;
						APlayerData[OtherPlayer][StatsMafiaJobs] = 0;
						APlayerData[OtherPlayer][StatsMafiaStolen] = 0;
						APlayerData[OtherPlayer][StatsPoliceFined] = 0;
						APlayerData[OtherPlayer][StatsPoliceJailed] = 0;
						APlayerData[OtherPlayer][StatsCourierJobs] = 0;
						APlayerData[OtherPlayer][StatsAssistance] = 0;
						APlayerData[OtherPlayer][StatsRoadworkerJobs] = 0;
						APlayerData[OtherPlayer][StatsMetersDriven] = 0.0;
						format(Msg, 128, "{FF0000}Ýstatistikleriniz {FFFF00}%s {FF0000}tarafýndan sýfýrlandý", AdminName);
						SendClientMessage(OtherPlayer, 0xFFFFFFFF, Msg);
						format(Msg, 128, "{FFFF00}%s{00FF00}'ýn istatistiklerini sýfýrladýnýz", Name);
						SendClientMessage(playerid, 0xFFFFFFFF, Msg);
					}

					// Let the other player know the reason too
					format(Msg, 128, "{FF0000}Sebep: {FFFF00}%s", Reason);
					SendClientMessage(OtherPlayer, 0xFFFFFFFF, Msg);

					// Save the other player's account
					PlayerFile_Save(OtherPlayer);
				}
				else
				    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Yanlýþ oyuncu ID!");
			}
		}
		else
			return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// This command searches every house and business that the player owns and restores the data for it in the player's account
COMMAND:fixplayer(playerid, params[])
{
	// Setup local variables
	new Name[24], AdminName[24], Msg[128], OtherPlayer;

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/fixplayer", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 5
		if (APlayerData[playerid][PlayerLevel] >= 10)
		{
			if (sscanf(params, "u", OtherPlayer)) SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/fixplayer <ID>\"");
			else
			{
			    // Check if the other player is logged in
				if (APlayerData[OtherPlayer][LoggedIn] == true)
				{
					// Get the names of both players
					GetPlayerName(playerid, AdminName, sizeof(AdminName));
					GetPlayerName(OtherPlayer, Name, sizeof(Name));

					// Clear the houses and businesses that the player owns right now
					for (new i; i < MAX_HOUSESPERPLAYER; i++)
					    APlayerData[OtherPlayer][Houses][i] = 0;

					for (new i; i < MAX_BUSINESSPERPLAYER; i++)
					    APlayerData[OtherPlayer][Business][i] = 0;

					// Now search through all houses and re-add them to the player
					for (new HouseID = 1; HouseID < MAX_HOUSES; HouseID++)
						if (AHouseData[HouseID][Owned] == true) // Check if the house is owned by somebody
							if (strcmp(AHouseData[HouseID][Owner], Name, false) == 0) // Check if the player is the owner of the house
							{
								for (new i; i < MAX_HOUSESPERPLAYER; i++) // Loop through all houses the player owns
								    if (APlayerData[OtherPlayer][Houses][i] == 0) // Check if the houseslot is free
								    {
										APlayerData[OtherPlayer][Houses][i] = HouseID; // Store the HouseID
										break; // Stop searching for more free slots
								    }
							}

					// Now search through all businesses and re-add them to the player
					for (new BusID = 1; BusID < MAX_BUSINESS; BusID++)
						if (ABusinessData[BusID][Owned] == true) // Check if the business is owner by someone
							if (strcmp(ABusinessData[BusID][Owner], Name, false) == 0) // Check if the player is the owner of the business
							{
								for (new i; i < MAX_BUSINESSPERPLAYER; i++) // Loop through all businesses the player owns
								    if (APlayerData[OtherPlayer][Business][i] == 0) // Check if the businessslot is free
								    {
										APlayerData[OtherPlayer][Business][i] = BusID; // Store the BusID
										break; // Stop searching for more free slots
								    }
							}

					// Let the other player know his property has been restored
					format(Msg, 128, "{00FF00}Mülkleriniz yönetici {FFFF00}%s {00FF00}tarafýndan restore edildi", AdminName);
					SendClientMessage(OtherPlayer, 0xFFFFFFFF, Msg);

					// Save the other player's account
					PlayerFile_Save(OtherPlayer);
				}
				else
				    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Yanlýþ oyuncu ID!");
			}
		}
		else
			return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// This command sets a skin for the player
COMMAND:setskin(playerid, params[])
{
	// Setup local variables
	new Msg[128], Skin;

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/setskin", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 4
		if (APlayerData[playerid][PlayerLevel] >= 7)
		{
			if (sscanf(params, "i", Skin)) SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/setskin <Skin ID (0-299)>\"");
			else
			{
				// Check if the player entered a valid skin-id
				if ((Skin >= 0) && (Skin <= 299))
				{
				    // Set the skin for the player
				    SetPlayerSkin(playerid, Skin);
					// Let the other player know the reason too
					format(Msg, 128, "{FFFF00}%i {00FF00}ID'li skini seçtiniz", Skin);
					SendClientMessage(playerid, 0xFFFFFFFF, Msg);
				}
				else
					SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Hatalý skin ID! 0-299 arasý skin ID'leri seçebilirsiniz!");
			}
		}
		else
			return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Bans a player by his ip
COMMAND:ipban(playerid, params[])
{
	// Setup local variables
	new PlayerToBan, Reason[128], Msg[128], Name[24], AdminName[24];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/ipban", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 3
		if (APlayerData[playerid][PlayerLevel] >= 5)
		{
			if (sscanf(params, "us[128]", PlayerToBan, Reason))
				SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/ipban <ID> <Sebep>\"");
			else
			{
				if (IsPlayerConnected(PlayerToBan))
				{
				    if(APlayerData[playerid][PlayerLevel] < APlayerData[PlayerToBan][PlayerLevel]) return SendClientMessage(playerid, -1, "{FF0000}Sizden daha yüksek levelli yöneticiye bu komutu uygulayamazsýnýz!");
					// Get the names of the player and the admin who executed the ban
					GetPlayerName(playerid, AdminName, sizeof(AdminName));
					GetPlayerName(PlayerToBan, Name, sizeof(Name));

					// Inform the player about his ban
					format(Msg, 128, "{FF0000}IP adresiniz {FFFF00}%s {FF0000}tarafýndan sýnýrsýz olarak banlandý.", AdminName);
					SendClientMessage(PlayerToBan, 0xFFFFFFFF, Msg);
					format(Msg, 128, "{FF0000}Sebep: {FFFF00}%s", Reason);
					SendClientMessage(PlayerToBan, 0xFFFFFFFF, Msg);

					// Ban the player with a reason
					SafeBan(PlayerToBan);

					// Inform everybody else which player was ip-banned
					format(Msg, 128, "{808080}%s %s, {FFFF00}%s{808080}'a IP-Ban attý.", AdminLevelName[APlayerData[playerid][PlayerLevel]], AdminName, Name);
					SendClientMessageToAll(0xFFFFFFFF, Msg);
				}
			}
		}
		else
		    return 0;
	}
	else
	    return 0;

	return 1;
}

// Bans a player's entire range of IP addresses (the last part of the IP-address will be from 0 to 255)
COMMAND:rangeban(playerid, params[])
{
	// Setup local variables
	new PlayerToBan, PlayerIP[16], FirstPartsOfIP[16], BanCmd[24], Reason[128], Msg[128], Name[24], AdminName[24];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/rangeban", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 3
		if (APlayerData[playerid][PlayerLevel] >= 9)
		{
			if (sscanf(params, "us[128]", PlayerToBan, Reason))
				SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/rangeban <ID> <Sebep>\"");
			else
			{
				if (IsPlayerConnected(PlayerToBan))
				{
                    if(APlayerData[playerid][PlayerLevel] < APlayerData[PlayerToBan][PlayerLevel]) return SendClientMessage(playerid, -1, "{FF0000}Sizden daha yüksek levelli yöneticiye bu komutu uygulayamazsýnýz!");
                    
					// Get the names of the player and the admin who executed the ban
					GetPlayerName(playerid, AdminName, sizeof(AdminName));
					GetPlayerName(PlayerToBan, Name, sizeof(Name));

					// Get the player's IP-address
					GetPlayerIp(PlayerToBan, PlayerIP, 16);

					// Inform the player about his ban
					format(Msg, 128, "{FFFF00}%s {FF0000}tarafýndan Range-Ban yediniz.", AdminName);
					SendClientMessage(PlayerToBan, 0xFFFFFFFF, Msg);
					format(Msg, 128, "{FF0000}Sebep: {FFFF00}%s", Reason);
					SendClientMessage(PlayerToBan, 0xFFFFFFFF, Msg);

					// Get the first three digits from the player's ip, so the fourth part can be added from 0 to 255
					FirstPartsOfIP = GetFirstThreeDigitsFromIP(PlayerIP);
					// Ban the entire range of IP-addresses of the player
					for (new i; i < 256; i++)
					{
					    format(BanCmd, 24, "banip %s%i", FirstPartsOfIP, i); // Construct the RCon command to ban every IP
                        SendRconCommand(BanCmd); // Execute the command
					}
					// Finally kick the player (the RCon command doesn't kick you out automatically)
					SafeKick(PlayerToBan);

					// Inform everybody else which player was ip-range-banned
					format(Msg, 128, "{808080}%s %s, {FFFF00}%s{808080}'a Range-Ban attý.", AdminLevelName[APlayerData[playerid][PlayerLevel]], AdminName, Name);
					SendClientMessageToAll(0xFFFFFFFF, Msg);
				}
			}
		}
		else
		    return 0;
	}
	else
	    return 0;

	return 1;
}

// Sets the score of another player
COMMAND:setscore(playerid, params[])
{
	// Setup local variables
	new Msg[128], Name[24], OtherName[24], OtherPlayer, pScore;

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/setscore", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player's admin-level is at least 3
		if (APlayerData[playerid][PlayerLevel] >= 9)
		{
			if (sscanf(params, "ui", OtherPlayer, pScore)) SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/setscore <ID> <Skor>\"");
			else
			{
				// Check if the otherplayer is online
				if (IsPlayerConnected(OtherPlayer))
				{
					// Get the player-names
					GetPlayerName(playerid, Name, sizeof(Name));
					GetPlayerName(OtherPlayer, OtherName, sizeof(OtherName));

					// Set the other player's score
					APlayerData[OtherPlayer][PlayerScore] = pScore;
					// Let the other player know that his score has been changed
					format(Msg, 128, "{00FF00}Skorunuz {FFFF00}%i{00FF00} olarak deðiþtirildi. Deðiþtiren: {FFFF00}%s", pScore, Name);
					SendClientMessage(OtherPlayer, 0xFFFFFFFF, Msg);
					// Let the player know he has set the score of the other player
					format(Msg, 128, "{FFFF00}%s{00FF00}ýn skorunu {FFFF00}%i {00FF00}olarak deðiþtirdiniz.", OtherName, pScore);
					SendClientMessage(playerid, 0xFFFFFFFF, Msg);
					// Save the other player's account
					PlayerFile_Save(OtherPlayer);
				}
				else
				    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Yanlýþ oyuncu ID!");
			}
		}
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// Allows the player to setup a bank account, login to his bank account, or use his bank account after he logged in to his bank account
COMMAND:banka(playerid, params[])
{
	// Setup local variables
	new file[100], Name[24];

	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/banka", params);

    // Get the playername
	format(Name, sizeof(Name), APlayerData[playerid][PlayerName]);
	// Construct the complete filename for this player's bank-account
	format(file, sizeof(file), BankFile, Name);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player doesn't have a bank account
		if (!fexist(file))
		{
			// Ask for a password to setup his bank account
			ShowPlayerDialog(playerid, DialogBankPasswordRegister, DIALOG_STYLE_INPUT, "Banka Hesabý Aç", "Banka hesabý açmak için þifre girin:", TXT_DialogButtonSelect, TXT_DialogButtonCancel);
		}
		else // The player has a bank account
		{
			// If the player hasn't logged in to his bank account yet
			if (APlayerData[playerid][BankLoggedIn] == false)
			{
				// Ask for the password to login to his bank account
				ShowPlayerDialog(playerid, DialogBankPasswordLogin, DIALOG_STYLE_INPUT, "Banka Hesabýna Giriþ Yap", "Banka hesabýnýza giriþ yapmak için þifre girin:", TXT_DialogButtonSelect, TXT_DialogButtonCancel);
			}
			else // The player has logged in to his bank account already
			{
			    // Show the main bank menu dialog
				ShowBankMenu(playerid);
			}
		}
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// This command lists all help-items for which the player can get information about it
COMMAND:yardim(playerid, params[])
{
	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/yardim", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Create the dialog that lists all help-items
        HelpList_Create(playerid);
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// This command allows you to change your password for logging in
COMMAND:sifredegistir(playerid, params[])
{
	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/sifredegistir", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Show the dialog where the player must enter his old password
		ShowPlayerDialog(playerid, DialogOldPassword, DIALOG_STYLE_INPUT, "Eski Þifrenizi Girin:", "Eski þifrenizi girin:", "Tamam", "Ýptal");
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// This command shows the current bonus mission
COMMAND:bonus(playerid, params[])
{
	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/bonus", params);

	// Check if the player has logged in
	if (APlayerData[playerid][LoggedIn] == true)
	{
		// Check if the player is a trucker
		if (APlayerData[playerid][PlayerClass] == ClassTruckDriver)
			ShowRandomBonusMission(); // Show the bonus mission again for all truckers (and perhaps generate a new one)
		else
		    return 0;
	}
	else
	    return 0;

	// Let the server know that this was a valid command
	return 1;
}

// ************************************************************************************************************************************************************
// PPC_Toll
// ************************************************************************************************************************************************************

// This file holds all functions for the toll-system

forward Toll();
public Toll()
{
	// Loop through all players
    for(new playerid; playerid < MAX_PLAYERS; playerid++)
	{
		// If the player isn't connected, skip to the next player
        if(APlayerData[playerid][LoggedIn] == false) continue;

		// Check if the player is the driver of a vehicle
		if (GetPlayerVehicleSeat(playerid) == 0)
		{
			// Loop through all toll-gates
			for (new TollGate; TollGate < MAX_TOLLGATES; TollGate++)
			{
				// Check if this toll-gate exists
				if (ATollGates[TollGate][GateID] != 0)
				{
				    // Check if the player is in range of the tollgate
			        if(IsPlayerInRangeOfPoint(playerid, 7.5, ATollGates[TollGate][CloseX], ATollGates[TollGate][CloseY], ATollGates[TollGate][CloseZ]))
			        {
						// Check if the toll-gate is closed
			            if(ATollGates[TollGate][GateStatus] == 0)
						{
						    // Open the gate
			                MoveObject(ATollGates[TollGate][GateID], ATollGates[TollGate][OpenX], ATollGates[TollGate][OpenY], ATollGates[TollGate][OpenZ], 3.0);
							// Set status to OPEN
			                ATollGates[TollGate][GateStatus] = 1;
			                // Let the player pay the toll
			                RewardPlayer(playerid, -ATollGates[TollGate][TollPrice], 0);
			                new string[50];
			                format(string, sizeof(string), TXT_PlayerPaysToll, ATollGates[TollGate][TollPrice]);
			                GameTextForPlayer(playerid, string, 3000, 4);
			                // Start a timer that closes the gate after 5 seconds
			                SetTimerEx("CloseGate", 5000, false, "i", TollGate);
						}
			        }
				}
			}
		}
    }
}

forward CloseGate(TollGate);
public CloseGate(TollGate)
{
    // Close the gate
	MoveObject(ATollGates[TollGate][GateID], ATollGates[TollGate][CloseX], ATollGates[TollGate][CloseY], ATollGates[TollGate][CloseZ], 3.0);
	// Set status to CLOSED
	ATollGates[TollGate][GateStatus] = 0;
}

// ************************************************************************************************************************************************************
// PPC_Extras
// ************************************************************************************************************************************************************

// Setup a global array to be used for loading player-file data
new FileContent[100][100];
new PropertyList[5000];


// This command lets the player teleport to a house
COMMAND:porthouse(playerid, params[])
{
	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/porthouse", params);

	// Exit the command if the player hasn't logged in using his password
	if (APlayerData[playerid][LoggedIn] == false) return 0;
	// Exit the command if the player has an admin-level lower than 5
	if (APlayerData[playerid][PlayerLevel] < 5) return 0;
	// Exit the command if the player is inside a vehicle
	if (GetPlayerVehicleSeat(playerid) != -1) return SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Araçtayken bu komutu kullanamazsýnýz");

	// Setup local variables
	new Msg[128], HouseID;

	// Get the HouseID from the parameters
	if (sscanf(params, "i", HouseID)) return SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/porthouse <Ev ID>\"");

	// Check if the player entered a valid HouseID
	if ((HouseID < 0) || (HouseID >= MAX_HOUSES)) return SendClientMessage(playerid, 0xFF0000AA, "Yanlýþ ev ID'i girdiniz!");

	// Check if the house exists (it must have a valid pickup)
	if (IsValidDynamicPickup(AHouseData[HouseID][PickupID]))
	{
		// Port the player to the given location
		SetPlayerPos(playerid, AHouseData[HouseID][HouseX], AHouseData[HouseID][HouseY], AHouseData[HouseID][HouseZ]);

		// Let the player know he ported to the given house
		format(Msg, 128, "{FFFF00}%i {00FF00}ID'li eve ýþýnlandýnýz", HouseID);
		SendClientMessage(playerid, 0xFFFFFFFF, Msg);
	}
	else
		SendClientMessage(playerid, 0xFF0000AA, "Yanlýþ ev ID!");

	// Let the server know that this was a valid command
	return 1;
}

// This command lets the player teleport to a business
COMMAND:portbus(playerid, params[])
{
	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/portbus", params);

	// Exit the command if the player hasn't logged in using his password
	if (APlayerData[playerid][LoggedIn] == false) return 0;
	// Exit the command if the player has an admin-level lower than 5
	if (APlayerData[playerid][PlayerLevel] < 5) return 0;
	// Exit the command if the player is inside a vehicle
	if (GetPlayerVehicleSeat(playerid) != -1) return SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Araçtayken bu komutu kullanamazsýnýz");

	// Setup local variables
	new Msg[128], BusID;

	// Get the BusID from the parameters
	if (sscanf(params, "i", BusID)) return SendClientMessage(playerid, 0xFF0000AA, "Kullaným: \"/portbus <Ýþyeri ID>\"");

	// Check if the player entered a valid BusID
	if ((BusID < 0) || (BusID >= MAX_BUSINESS)) return SendClientMessage(playerid, 0xFF0000AA, "Yanlýþ iþyeri ID'i!");

	// Check if the business exists (it must have a valid pickup)
	if (IsValidDynamicPickup(ABusinessData[BusID][PickupID]))
	{
		// Port the player to the given location
		SetPlayerPos(playerid, ABusinessData[BusID][BusinessX], ABusinessData[BusID][BusinessY], ABusinessData[BusID][BusinessZ]);

		// Let the player know he ported to the given business
		format(Msg, 128, "{FFFF00}%i {00FF00}ID'li iþyerine ýþýnlandýnýz", BusID);
		SendClientMessage(playerid, 0xFFFFFFFF, Msg);
	}
	else
		SendClientMessage(playerid, 0xFF0000AA, "Yanlýþ iþyeri ID'i!");

	// Let the server know that this was a valid command
	return 1;
}



// This command lets the player see all other properties of the same player
COMMAND:properties(playerid, params[])
{
	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/properties", params);

	// Exit the command if the player hasn't logged in using his password
	if (APlayerData[playerid][LoggedIn] == false) return 0;
	// Exit the command if the player has an admin-level lower than 5
	if (APlayerData[playerid][PlayerLevel] < 5) return 0;
	// Exit the command if the player is inside a vehicle
	if (GetPlayerVehicleSeat(playerid) != -1) return SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Araçtayken bu komutu kullanamazsýnýz!");

	// Setup local variables
	new Name[24], DialogTitle[128];

	// Loop through all player-owned houses
	for (new HouseID = 1; HouseID < MAX_HOUSES; HouseID++)
	{
		// Check if the house exists (it must have a valid pickup)
		if (IsValidDynamicPickup(AHouseData[HouseID][PickupID]))
		{
			// Check if the player is in range of the house-pickup
			if (IsPlayerInRangeOfPoint(playerid, 2.5, AHouseData[HouseID][HouseX], AHouseData[HouseID][HouseY], AHouseData[HouseID][HouseZ]))
			{
			    // Check if this house is owned
			    if (AHouseData[HouseID][Owned] == true)
			    {
					// Store the ownername
					format(Name, 24, AHouseData[HouseID][Owner]);

					// End the search
					break;
				}
			}
		}
	}

	// In case no house was found in range (Name is empty), try to find a business
	if (Name[0] == 0)
	{
		// Loop through all businesses
		for (new BusID = 1; BusID < MAX_BUSINESS; BusID++)
		{
			// Check if the business exists (it must have a valid pickup)
			if (IsValidDynamicPickup(ABusinessData[BusID][PickupID]))
			{
				// Check if the player is in range of the house-pickup
				if (IsPlayerInRangeOfPoint(playerid, 2.5, ABusinessData[BusID][BusinessX], ABusinessData[BusID][BusinessY], ABusinessData[BusID][BusinessZ]))
				{
				    // Check if this business is owned
				    if (ABusinessData[BusID][Owned] == true)
					{
						// Store the ownername
						format(Name, 24, ABusinessData[BusID][Owner]);

						// End the search
						break;
					}
				}
			}
		}
	}

	// Check if a name has been found
	if (Name[0] == 0) return SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Yakýnlarda eviniz veya iþyeriniz bulunmamakta!");

	// Clear the array
	for (new i; i < sizeof(PropertyList); i++)
	    PropertyList[i] = 0;

	// Loop through all player-owned houses
	for (new HouseID = 1; HouseID < MAX_HOUSES; HouseID++)
	{
		// Check if the house exists (it must have a valid pickup)
		if (IsValidDynamicPickup(AHouseData[HouseID][PickupID]))
		{
		    // Check if this house is owned
		    if (AHouseData[HouseID][Owned] == true)
		    {
				// Check if the owner-name is the same
				if (strcmp(AHouseData[HouseID][Owner], Name, false) == 0)
				{
					// Add the property to the list
					format(PropertyList, sizeof(PropertyList), "%sEv %i: %s\n", PropertyList, HouseID, AHouseData[HouseID][HouseName]);
				}
			}
		}
	}
	// Loop through all businesses
	for (new BusID = 1; BusID < MAX_BUSINESS; BusID++)
	{
		// Check if the business exists (it must have a valid pickup)
		if (IsValidDynamicPickup(ABusinessData[BusID][PickupID]))
		{
		    // Check if this business is owned
		    if (ABusinessData[BusID][Owned] == true)
			{
				// Check if the owner-name is the same
				if (strcmp(ABusinessData[BusID][Owner], Name, false) == 0)
				{
					// Add the property to the list
					format(PropertyList, sizeof(PropertyList), "%sÝþyeri %i: %s\n", PropertyList, BusID, ABusinessData[BusID][BusinessName]);
				}
			}
		}
	}

	// Setup the dialog title
	format(DialogTitle, 128, "\"%s\"nýn Gayrimenkulleri", Name);

	// List all properties in a dialog
	ShowPlayerDialog(playerid, DialogNoResponse, DIALOG_STYLE_LIST, DialogTitle, PropertyList, "Tamam", "Ýptal");

	// Let the server know that this was a valid command
	return 1;
}



// This command lets the player ID a house or business
COMMAND:propertyid(playerid, params[])
{
	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/propertyid", params);

	// Exit the command if the player hasn't logged in using his password
	if (APlayerData[playerid][LoggedIn] == false) return 0;
	// Exit the command if the player has an admin-level lower than 5
	if (APlayerData[playerid][PlayerLevel] < 5) return 0;
	// Exit the command if the player is inside a vehicle
	if (GetPlayerVehicleSeat(playerid) != -1) return SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Araçtayken bu komutu kullanamazsýnýz!");

	// Setup local variables
	new Msg[128];

	// Loop through all player-owned houses
	for (new HouseID = 1; HouseID < MAX_HOUSES; HouseID++)
	{
		// Check if the house exists (it must have a valid pickup)
		if (IsValidDynamicPickup(AHouseData[HouseID][PickupID]))
		{
			// Check if the player is in range of the house-pickup
			if (IsPlayerInRangeOfPoint(playerid, 2.5, AHouseData[HouseID][HouseX], AHouseData[HouseID][HouseY], AHouseData[HouseID][HouseZ]))
			{
				// Let the player know the HouseID of this house
				format(Msg, 128, "{00FF00}Yanýnýzdaki evin ID'i: {FFFF00}%i", HouseID);
				SendClientMessage(playerid, 0xFFFFFFFF, Msg);

				// Exit the function
				return 1;
			}
		}
	}

	// In case no house was found in range, try to find a business

	// Loop through all businesses
	for (new BusID = 1; BusID < MAX_BUSINESS; BusID++)
	{
		// Check if the business exists (it must have a valid pickup)
		if (IsValidDynamicPickup(ABusinessData[BusID][PickupID]))
		{
			// Check if the player is in range of the house-pickup
			if (IsPlayerInRangeOfPoint(playerid, 2.5, ABusinessData[BusID][BusinessX], ABusinessData[BusID][BusinessY], ABusinessData[BusID][BusinessZ]))
			{
				// Let the player know the BusinessID of this business
				format(Msg, 128, "{00FF00}Yanýnýzdaki iþyerinin ID'i: {FFFF00}%i", BusID);
				SendClientMessage(playerid, 0xFFFFFFFF, Msg);

				// Exit the function
				return 1;
			}
		}
	}

	// There was no house or business in range, so let the player know about it
	SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Yakýnlarda ev veya iþyeri yok!");

	// Let the server know that this was a valid command
	return 1;
}



// This command lets the player delete a house or business
COMMAND:delproperty(playerid, params[])
{
	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/delproperty", params);

	// Exit the command if the player hasn't logged in using his password
	if (APlayerData[playerid][LoggedIn] == false) return 0;
	// Exit the command if the player has an admin-level lower than 5
	if (APlayerData[playerid][PlayerLevel] < 5) return 0;
	// Exit the command if the player is inside a vehicle
	if (GetPlayerVehicleSeat(playerid) != -1) return SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Araçtayken bu komutu kullanamazsýnýz!");

	// Setup local variables
	new Msg[128];

	// Loop through all player-owned houses
	for (new HouseID = 1; HouseID < MAX_HOUSES; HouseID++)
	{
		// Check if the house exists (it must have a valid pickup)
		if (IsValidDynamicPickup(AHouseData[HouseID][PickupID]))
		{
			// Check if the player is in range of the house-pickup
			if (IsPlayerInRangeOfPoint(playerid, 2.5, AHouseData[HouseID][HouseX], AHouseData[HouseID][HouseY], AHouseData[HouseID][HouseZ]))
			{
				// Delete the house, inform the owner if he's online and remove the house from the owner's account
				House_Delete(HouseID);

				// Also let the player know he deleted the house
				format(Msg, 128, "{FFFF00}%i {00FF00}ID'li evi sildiniz", HouseID);
				SendClientMessage(playerid, 0xFFFFFFFF, Msg);

				// Exit the function
				return 1;
			}
		}
	}

	// In case no house was found in range, try to find a business to delete

	// Loop through all businesses
	for (new BusID = 1; BusID < MAX_BUSINESS; BusID++)
	{
		// Check if the business exists (it must have a valid pickup)
		if (IsValidDynamicPickup(ABusinessData[BusID][PickupID]))
		{
			// Check if the player is in range of the house-pickup
			if (IsPlayerInRangeOfPoint(playerid, 2.5, ABusinessData[BusID][BusinessX], ABusinessData[BusID][BusinessY], ABusinessData[BusID][BusinessZ]))
			{
				// Delete the business, inform the owner if he's online and remove the business from the owner's account
				Business_Delete(BusID);

				// Also let the player know he deleted the business
				format(Msg, 128, "{FFFF00}%i {00FF00}ID'li iþyerini sildiniz", BusID);
				SendClientMessage(playerid, 0xFFFFFFFF, Msg);

				// Exit the function
				return 1;
			}
		}
	}

	// There was no house or business in range, so let the player know about it
	SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Yakýnlarda silecek ev veya iþyeri yok!");

	// Let the server know that this was a valid command
	return 1;
}

// This command lets the player evict a house or business (remove ownership of the house or business to make it available for sale again)
COMMAND:evict(playerid, params[])
{
	// Send the command to all admins so they can see it
	SendAdminText(playerid, "/evict", params);

	// Exit the command if the player hasn't logged in using his password
	if (APlayerData[playerid][LoggedIn] == false) return 0;
	// Exit the command if the player has an admin-level lower than 5
	if (APlayerData[playerid][PlayerLevel] < 5) return 0;
	// Exit the command if the player is inside a vehicle
	if (GetPlayerVehicleSeat(playerid) != -1) return SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Araçtayken bu komutu kullanamazsýnýz!");

	// Setup local variables
	new Msg[128];

	// Loop through all player-owned houses
	for (new HouseID = 1; HouseID < MAX_HOUSES; HouseID++)
	{
		// Check if the house exists (it must have a valid pickup)
		if (IsValidDynamicPickup(AHouseData[HouseID][PickupID]))
		{
			// Check if the player is in range of the house-pickup
			if (IsPlayerInRangeOfPoint(playerid, 2.5, AHouseData[HouseID][HouseX], AHouseData[HouseID][HouseY], AHouseData[HouseID][HouseZ]))
			{
				// Check if the house is owned
				if (AHouseData[HouseID][Owned] == true)
				{
					// Evict the house, inform the owner if he's online and remove the house from the owner's account
					House_Evict(HouseID);

					// Also let the player know he evicted the house
					format(Msg, 128, "{FFFF00}%i {00FF00}ID'li eve el koydunuz", HouseID);
					SendClientMessage(playerid, 0xFFFFFFFF, Msg);

					// Exit the function
					return 1;
				}
				else
					return SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Bu evin sahibi olmadýðý için el koyamazsýnýz");
			}
		}
	}

	// In case no house was found in range, try to find a business to delete

	// Loop through all businesses
	for (new BusID = 1; BusID < MAX_BUSINESS; BusID++)
	{
		// Check if the business exists (it must have a valid pickup)
		if (IsValidDynamicPickup(ABusinessData[BusID][PickupID]))
		{
			// Check if the player is in range of the house-pickup
			if (IsPlayerInRangeOfPoint(playerid, 2.5, ABusinessData[BusID][BusinessX], ABusinessData[BusID][BusinessY], ABusinessData[BusID][BusinessZ]))
			{
				// Check if the business is owned
				if (ABusinessData[BusID][Owned] == true)
				{
					// Evict the business, inform the owner if he's online and remove the business from the owner's account
					Business_Evict(BusID);

					// Also let the player know he evicted the business
					format(Msg, 128, "{FFFF00}%i {00FF00}ID'li iþyerine el koydunuz", BusID);
					SendClientMessage(playerid, 0xFFFFFFFF, Msg);

					// Exit the function
					return 1;
				}
				else
					return SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Bu iþyerinin sahibi olmadýðý için el koyamazsýnýz");
			}
		}
	}

	// There was no house or business in range, so let the player know about it
	SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Yakýnlarda el koyacak iþyeri yok");

	// Let the server know that this was a valid command
	return 1;
}



// This function will delete the given house from the server and from the owner's account (if it has an owner)
House_Delete(HouseID)
{
	// Setup local variables
	new file[100], Msg[128], Name[24], bool:PlayerOnline = false;

	// Check if the house is owned
	if (AHouseData[HouseID][Owned] == true)
	{
		// Loop through all players to find the owner (if he's online)
		for (new pid; pid < MAX_PLAYERS; pid++)
		{
			// Check if this player is online
		    if (IsPlayerConnected(pid))
		    {
		        // Get that player's name
		        GetPlayerName(pid, Name, sizeof(Name));
		        // Compare if this player has the same name as the owner of the house
				if (strcmp(AHouseData[HouseID][Owner], Name, false) == 0)
				{
				    // Set PlayerOnline to "true"
				    PlayerOnline = true;

					// Inform the player that his house is being deleted
					format(Msg, 128, "{FF0000}Eviniz {FFFF00}\"%s\"{FF0000} silindi", AHouseData[HouseID][HouseName]);
					SendClientMessage(pid, 0xFFFFFFFF, Msg);

					// Also remove the HouseID from his list of houses
					for (new HouseSlot; HouseSlot < MAX_HOUSESPERPLAYER; HouseSlot++)
					    // Check if the house is stored in this houseslot
					    if (APlayerData[pid][Houses][HouseSlot] == HouseID)
					        // If the house is stored in this slot, clear the slot
					        APlayerData[pid][Houses][HouseSlot] = 0;

					// Save the player's account again
					PlayerFile_Save(pid);

					// Stop this For-loop, as the owner was already found and informed
					break;
				}
		    }
		}

		// Check if the player was not online
		if (PlayerOnline == false)
			// Remove the house from the player's account (open the account, remove the data and re-save it)
			PlayerFile_RemoveProperty(AHouseData[HouseID][Owner], HouseID, 0);
	}

	// First remove all vehicles from the house
	House_RemoveVehicles(HouseID);

	// Clear all data of the house
	AHouseData[HouseID][HouseName] = 0;
	AHouseData[HouseID][Insurance] = 0;
	AHouseData[HouseID][HouseX] = 0.0;
	AHouseData[HouseID][HouseY] = 0.0;
	AHouseData[HouseID][HouseZ] = 0.0;
	AHouseData[HouseID][HouseLevel] = 0;
	AHouseData[HouseID][HouseMaxLevel] = 0;
	AHouseData[HouseID][HousePrice] = 0;
	AHouseData[HouseID][Owned] = false;
	AHouseData[HouseID][Owner] = 0;
	// Destroy the mapicon, 3DText and pickup for the house
	DestroyDynamicPickup(AHouseData[HouseID][PickupID]);
	DestroyDynamicMapIcon(AHouseData[HouseID][MapIconID]);
	DestroyDynamic3DTextLabel(AHouseData[HouseID][DoorText]);
	AHouseData[HouseID][PickupID] = 0;
	AHouseData[HouseID][MapIconID] = 0;

	// Delete the House-file
	format(file, sizeof(file), HouseFile, HouseID); // Construct the complete filename for this house-file
	if (fexist(file)) // Make sure the file exists
		fremove(file); // Delete the file
}

// This function will evict the given house from the server and from the owner's account (if it has an owner)
House_Evict(HouseID)
{
	// Setup local variables
	new Msg[128], Name[24], bool:PlayerOnline = false;

	// Check if the house is owned
	if (AHouseData[HouseID][Owned] == true)
	{
		// Loop through all players to find the owner (if he's online)
		for (new pid; pid < MAX_PLAYERS; pid++)
		{
			// Check if this player is online
		    if (IsPlayerConnected(pid))
		    {
		        // Get that player's name
		        GetPlayerName(pid, Name, sizeof(Name));
		        // Compare if this player has the same name as the owner of the house
				if (strcmp(AHouseData[HouseID][Owner], Name, false) == 0)
				{
				    // Set PlayerOnline to "true"
				    PlayerOnline = true;

					// Inform the player that his house is being deleted
					format(Msg, 128, "{FF0000}Eviniz {FFFF00}\"%s\"{FF0000}e el koyuldu.", AHouseData[HouseID][HouseName]);
					SendClientMessage(pid, 0xFFFFFFFF, Msg);

					// Also remove the HouseID from his list of houses
					for (new HouseSlot; HouseSlot < MAX_HOUSESPERPLAYER; HouseSlot++)
					    // Check if the house is stored in this houseslot
					    if (APlayerData[pid][Houses][HouseSlot] == HouseID)
					        // If the house is stored in this slot, clear the slot
					        APlayerData[pid][Houses][HouseSlot] = 0;

					// Save the player's account again
					PlayerFile_Save(pid);

					// Stop this For-loop, as the owner was already found and informed
					break;
				}
		    }
		}

		// Check if the player was not online
		if (PlayerOnline == false)
			// Remove the house from the player's account (open the account, remove the data and re-save it)
			PlayerFile_RemoveProperty(AHouseData[HouseID][Owner], HouseID, 0);
	}

	// First remove all vehicles from the house
	House_RemoveVehicles(HouseID);

	// Clear ownership of the house
	AHouseData[HouseID][Owned] = false;
	AHouseData[HouseID][Owner] = 0;

	// Update the entrance of the house
	House_UpdateEntrance(HouseID);

	// Save the housefile
	HouseFile_Save(HouseID);
}

// This function will delete the given business from the server and from the owner's account (if it has an owner)
Business_Delete(BusID)
{
	// Setup local variables
	new file[100], Msg[128], Name[24], bool:PlayerOnline = false;

	// Check if the business is owned
	if (ABusinessData[BusID][Owned] == true)
	{
		// Loop through all players to find the owner (if he's online)
		for (new pid; pid < MAX_PLAYERS; pid++)
		{
			// Check if this player is online
		    if (IsPlayerConnected(pid))
		    {
		        // Get that player's name
		        GetPlayerName(pid, Name, sizeof(Name));
		        // Compare if this player has the same name as the owner of the business
				if (strcmp(ABusinessData[BusID][Owner], Name, false) == 0)
				{
				    // Set PlayerOnline to "true"
				    PlayerOnline = true;

					// Inform the player that his business is being deleted
					format(Msg, 128, "{FF0000}Ýþyeriniz {FFFF00}\"%s\"{FF0000} silindi.", ABusinessData[BusID][BusinessName]);
					SendClientMessage(pid, 0xFFFFFFFF, Msg);

					// Also remove the BusID from his list of businesses
					for (new BusSlot; BusSlot < MAX_BUSINESSPERPLAYER; BusSlot++)
					    // Check if the business is stored in this business-slot
					    if (APlayerData[pid][Business][BusSlot] == BusID)
					        // If the business is stored in this slot, clear the slot
					        APlayerData[pid][Business][BusSlot] = 0;

					// Save the player's account again
					PlayerFile_Save(pid);

					// Stop this For-loop, as the owner was already found and informed
					break;
				}
		    }
		}

		// Check if the player was not online
		if (PlayerOnline == false)
			// Remove the house from the player's account (open the account, remove the data and re-save it)
			PlayerFile_RemoveProperty(ABusinessData[BusID][Owner], 0, BusID);
	}

	// Clear all data of the business
	ABusinessData[BusID][BusinessName] = 0;
	ABusinessData[BusID][BusinessX] = 0.0;
	ABusinessData[BusID][BusinessY] = 0.0;
	ABusinessData[BusID][BusinessZ] = 0.0;
	ABusinessData[BusID][BusinessType] = 0;
	ABusinessData[BusID][BusinessLevel] = 0;
	ABusinessData[BusID][LastTransaction] = 0;
	ABusinessData[BusID][Owned] = false;
	ABusinessData[BusID][Owner] = 0;
	// Destroy the mapicon, 3DText and pickup for the business
	DestroyDynamicPickup(ABusinessData[BusID][PickupID]);
	DestroyDynamicMapIcon(ABusinessData[BusID][MapIconID]);
	DestroyDynamic3DTextLabel(ABusinessData[BusID][DoorText]);
	ABusinessData[BusID][PickupID] = 0;
	ABusinessData[BusID][MapIconID] = 0;

	// Delete the business-file
	format(file, sizeof(file), BusinessFile, BusID); // Construct the complete filename for this business-file
	if (fexist(file)) // Make sure the file exists
		fremove(file); // Delete the file
}

// This function will evict the given business from the server and from the owner's account (if it has an owner)
Business_Evict(BusID)
{
	// Setup local variables
	new Msg[128], Name[24], bool:PlayerOnline = false;

	// Check if the business is owned
	if (ABusinessData[BusID][Owned] == true)
	{
		// Loop through all players to find the owner (if he's online)
		for (new pid; pid < MAX_PLAYERS; pid++)
		{
			// Check if this player is online
		    if (IsPlayerConnected(pid))
		    {
		        // Get that player's name
		        GetPlayerName(pid, Name, sizeof(Name));
		        // Compare if this player has the same name as the owner of the business
				if (strcmp(ABusinessData[BusID][Owner], Name, false) == 0)
				{
				    // Set PlayerOnline to "true"
				    PlayerOnline = true;

					// Inform the player that his business is being deleted
					format(Msg, 128, "{FF0000}Ýþyeriniz {FFFF00}\"%s\"{FF0000}e el koyuldu", ABusinessData[BusID][BusinessName]);
					SendClientMessage(pid, 0xFFFFFFFF, Msg);

					// Also remove the BusID from his list of businesses
					for (new BusSlot; BusSlot < MAX_BUSINESSPERPLAYER; BusSlot++)
					    // Check if the business is stored in this business-slot
					    if (APlayerData[pid][Business][BusSlot] == BusID)
					        // If the business is stored in this slot, clear the slot
					        APlayerData[pid][Business][BusSlot] = 0;

					// Save the player's account again
					PlayerFile_Save(pid);

					// Stop this For-loop, as the owner was already found and informed
					break;
				}
		    }
		}

		// Check if the player was not online
		if (PlayerOnline == false)
			// Remove the house from the player's account (open the account, remove the data and re-save it)
			PlayerFile_RemoveProperty(ABusinessData[BusID][Owner], 0, BusID);
	}

	// Clear ownership of the business
	ABusinessData[BusID][Owned] = false;
	ABusinessData[BusID][Owner] = 0;

	// Update the entrance of the business
	Business_UpdateEntrance(BusID);

	// Save the businessfile
	BusinessFile_Save(BusID);
}



// This function loads the playerfile for the given player, removes the lines that contain the HouseID or BusinessID and resaves the file
PlayerFile_RemoveProperty(Name[], HouseID, BusID)
{
	// Setup local variables
	new file[100], File:PFile, LineFromFile[100], Index, SearchString[100];

	// Construct the complete filename for this player's account
	format(file, sizeof(file), PlayerFile, Name);

	// Check if the player's datafile exists
	if (fexist(file))
	{
		// First clear the array before using it to make sure it's empty
		for (Index = 0; Index < 100; Index++)
            FileContent[Index][0] = 0;

		// Open the playerfile for reading
		PFile = fopen(file, io_read);

		// Read up to 100 lines from the file (no player-account should have more than this)
		for (Index = 0; Index < 100; Index++)
		{
			// Read a line from the file
			fread(PFile, LineFromFile);
			// Strip any newline characters from the LineFromFile
			StripNewLine(LineFromFile);

			// Check if this line holds data
			if (strlen(LineFromFile) > 0)
				// Store this line into the array
				format(FileContent[Index], 100, LineFromFile);
			else // If the read line doesn't contain any more data (empty string), the end of the file has been reached
			    break;
		}

        // Close the file
		fclose(PFile);



		// Now the file has been read and stored into the array, now scan the array to search for the matching HouseID and/or BusinessID

		// Loop through the entire array
		for (Index = 0; Index < 100; Index++)
		{
			// Build the string to search for the HouseID
			format(SearchString, 100, "House %i", HouseID);
			// Check if this line holds the string we're looking for
			if (strcmp(FileContent[Index], SearchString, false) == 0)
			    // Clear the array-index
			    FileContent[Index][0] = 0;

			// Build the string to search for the BusinessID
			format(SearchString, 100, "Business %i", BusID);
			// Check if this line holds the string we're looking for
			if (strcmp(FileContent[Index], SearchString, false) == 0)
			    // Clear the array-index
			    FileContent[Index][0] = 0;
		}


		// Now all matching HouseID's and BusinessID's should be removed from the account, now re-save the playerfile

        // Open the playerfile for writing
		PFile = fopen(file, io_write);

		// Loop through the entire array
		for (Index = 0; Index < 100; Index++)
		{
			// Check if there is data in this array-slot
			if (FileContent[Index][0] != 0)
			{
			    // Construct the line for saving
				format(LineFromFile, 100, "%s\r\n", FileContent[Index]);
		        // And save it to the file
				fwrite(PFile, LineFromFile);
			}
		}

        // Close the file
		fclose(PFile);
	}
}

// ************************************************************************************************************************************************************
// End of includes
// ************************************************************************************************************************************************************




// The main function (used only once when the server loads)
main()
{
	// Print some standard lines to the server's console
	print("\n----------------------------------");
	print(GameModeName);
	print("----------------------------------\n");
}



// This callback gets called when the server initializes the gamemode
public OnGameModeInit()
{
	AntiDeAMX();
	WasteDeAMXersTime();
	
	
	new HostCommand[128];
	// Change the hostname
	format(HostCommand, 128, "hostname %s", HostName);
	SendRconCommand(HostCommand);
	format(HostCommand, 128, "weburl %s", Website);
	SendRconCommand(HostCommand);
	format(HostCommand, 128, "mapname %s", MapName);
	SendRconCommand(HostCommand);
	SetGameModeText(GameModeName); // Set the Mode of the gamemode, which appears in the list of servers

	GameModeInit_VehiclesPickups(); // Add all static vehicles and pickups when the server starts that are required (also load the houses)
	GameModeInit_Classes(); // Add character models to the class-selection (without weapons)

	Convoys_Init(); // Setup textdraws and default data for convoys

	ShowPlayerMarkers(1); // Show players on the entire map (and on the radar)
	ShowNameTags(1); // Show player names (and health) above their head
	ManualVehicleEngineAndLights(); // Let the server control the vehicle's engine and lights
	EnableStuntBonusForAll(0); // Disable stunt bonus for all players
	DisableInteriorEnterExits(); // Removes all building-entrances in the game
	UsePlayerPedAnims(); // Use CJ's walking animation

	// Start the timer that will show timed messages every 2 minutes
	SetTimer("Timer_TimedMessages", 1000 * 60 * 2, true);
	// Start the timer that will show a random bonus mission for truckers every 5 minutes
	SetTimer("ShowRandomBonusMission", 1000 * 60 * 5, true);
	// Start the timer that checks the toll-gates
	SetTimer("Toll", 1000, true);

	// Fix the bugged houses (after fixing the houses, you can remove this line, as it's not needed anymore)
	FixHouses();

	// While the gamemode starts, start the global timer, and run it every second
	SetTimer("GlobalTimer", 1000, true);

	// Load the auto-evict-time and start the auto-evict timer (it runs every minute)
//	AutoEvict_Load();
//	SetTimer("AutoEvictTimer", 60 * 1000, true);

	// Mapler
	Mapler();
	return 1;
}

public OnGameModeExit()
{
	DestroyAllDynamicObjects();

	printf("Initial Gaming LWT kapandi.");
	return 1;
}

// This callback gets called when a player connects to the server
public OnPlayerConnect(playerid)
{
	// Always allow NPC's to login without password or account
	if (IsPlayerNPC(playerid))
		return 1;

	// Setup local variables
	new Name[MAX_PLAYER_NAME], NewPlayerMsg[128], HouseID;

	// Sýfýrlamalar
	APlayerData[playerid][YakitTasarrufu] = 1;
	APlayerData[playerid][AsiriYuklemeBonusu] = 1;
	
	DinlenilenBoomBox[playerid] = -1;
	OyuncuBB[playerid] = -1;
	EditingBBObject[playerid] = -1;
	APlayerData[playerid][BoomBox] = 0;
	
	ALP[playerid] = 0;

	APlayerData[playerid][VIP]= 0;
	
	// Mapler
	RemoveBuildingMap(playerid);
	
	// Setup a PVar to allow cross-script money-transfers (only from filterscript to this mainscript) and scorepoints
	SetPVarInt(playerid, "PVarMoney", 0);
	SetPVarInt(playerid, "PVarScore", 0);

	// Get the playername
	GetPlayerName(playerid, Name, sizeof(Name));
	// Also store this name for the player
	GetPlayerName(playerid, APlayerData[playerid][PlayerName], 24);

	// Send a message to all players to let them know somebody else joined the server
	format(NewPlayerMsg, 128, TXT_PlayerJoinedServer, Name, playerid);
	SendClientMessageToAll(0xFFFFFFFF, NewPlayerMsg);

	// Try to load the player's datafile ("PlayerFile_Load" returns "1" is the file has been read, "0" when the file cannot be read)
	if (PlayerFile_Load(playerid) == 1)
	{
		// Check if the player is still banned
		if (APlayerData[playerid][BanTime] < gettime()) // Player ban-time is passed
			ShowPlayerDialog(playerid, DialogLogin, DIALOG_STYLE_INPUT, TXT_DialogLoginTitle, TXT_DialogLoginMsg, TXT_DialogLoginButton1, TXT_DialogButtonCancel);
		else // Player is still banned
		{
			ShowRemainingBanTime(playerid); // Show the remaining ban-time to the player is days, hours, minutes, seconds
			SafeKick(playerid); // Kick the player
		}
	}
	else
		ShowPlayerDialog(playerid, DialogRegister, DIALOG_STYLE_INPUT, TXT_DialogRegisterTitle, TXT_DialogRegisterMsg, TXT_DialogRegisterButton1, TXT_DialogButtonCancel);

	// The houses have been loaded but not the cars, so load all vehicles assigned to the player's houses
	for (new HouseSlot; HouseSlot < MAX_HOUSESPERPLAYER; HouseSlot++)
	{
	    // Get the HouseID from this slot
	    HouseID = APlayerData[playerid][Houses][HouseSlot];
	    // Check if there is a house in this slot
		if (HouseID != 0)
		    HouseFile_Load(HouseID, true); // Load the cars of the house
	}

	// Speedometer setup
	Speedometer_Setup(playerid);

	// MissionText TextDraw setup
	APlayerData[playerid][MissionText] = TextDrawCreate(320.0, 430.0, " "); // Setup the missiontext at the bottom of the screen
	TextDrawAlignment(APlayerData[playerid][MissionText], 2); // Align the missiontext to the center
	TextDrawUseBox(APlayerData[playerid][MissionText], 1); // Set the missiontext to display inside a box
	TextDrawBoxColor(APlayerData[playerid][MissionText], 0x00000066); // Set the box color of the missiontext

	// Display a message if the player hasn't accepted the rules yet
	if (APlayerData[playerid][RulesRead] == false)
	    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Daha kurallarý {FFFF00}/kurallar{FF0000} yazarak kabul etmemiþsiniz!");

	// Setup local variables
	new BusID;

	// Update the AutoEvict-time for this player's houses and businesses
	for (new HouseSlot; HouseSlot < MAX_HOUSESPERPLAYER; HouseSlot++)
	{
	    // Get the HouseID from this slot
	    HouseID = APlayerData[playerid][Houses][HouseSlot];
	    // Check if there is a house in this slot
		if (HouseID != 0)
			AHouseData[HouseID][AutoEvictDays] = AutoEvict[AEDays];
	}
	for (new BusSlot; BusSlot < MAX_BUSINESSPERPLAYER; BusSlot++)
	{
	    // Get the BusID from this slot
	    BusID = APlayerData[playerid][Business][BusSlot];
	    // Check if there is a business in this slot
		if (BusID != 0)
			ABusinessData[BusID][AutoEvictDays] = AutoEvict[AEDays];
	}

	return 1;
}



// This function shows the player how long his ban still is when he tries to login (in days, hours, minutes, seconds)
ShowRemainingBanTime(playerid)
{
	// Setup local variables
	new TotalBanTime, Days, Hours, Minutes, Seconds, Msg[128];

	// Get the total ban-time
	TotalBanTime = APlayerData[playerid][BanTime] - gettime();

	// Calculate days
	if (TotalBanTime >= 86400)
	{
		Days = TotalBanTime / 86400;
		TotalBanTime = TotalBanTime - (Days * 86400);
	}
	// Calculate hours
	if (TotalBanTime >= 3600)
	{
		Hours = TotalBanTime / 3600;
		TotalBanTime = TotalBanTime - (Hours * 3600);
	}
	// Calculate minutes
	if (TotalBanTime >= 60)
	{
		Minutes = TotalBanTime / 60;
		TotalBanTime = TotalBanTime - (Minutes * 60);
	}
	// Calculate seconds
	Seconds = TotalBanTime;

	// Display the remaining ban-time for this player
	SendClientMessage(playerid, 0xFFFFFFFF, TXT_StillBanned);
	format(Msg, 128, TXT_BannedDuration, Days, Hours, Minutes, Seconds);
	SendClientMessage(playerid, 0xFFFFFFFF, Msg);
}



// This callback gets called when a player disconnects from the server
public OnPlayerDisconnect(playerid, reason)
{
	// Always allow NPC's to logout without password or account
	if (IsPlayerNPC(playerid))
		return 1;

	// Setup local variables
	new Name[24], Msg[128], HouseID;

	// Get the playername
	GetPlayerName(playerid, Name, sizeof(Name));

	// BoomBox
	if(OyuncuBB[playerid] != -1)
	{
	    DestroyBoomBox(OyuncuBB[playerid]);
	    OyuncuBB[playerid] = -1;
	}

	if(EditingBBObject[playerid] != -1)
	{
	    DestroyObject(EditingBBObject[playerid]);
	}
	
	// Oyuncu 3D Text
	if(APlayerData[playerid][LoggedIn] == true)
	{
		Delete3DTextLabel(Oyuncu3D[playerid]);
	}
	
	// Stop spectate mode for all players who are spectating this player
	for (new i; i < MAX_PLAYERS; i++)
	    if (IsPlayerConnected(i)) // Check if the player is connected
	        if (GetPlayerState(i) == PLAYER_STATE_SPECTATING) // Check if this player is spectating somebody
	            if (APlayerData[i][SpectateID] == playerid) // Check if this player is spectating me
		   		{
					TogglePlayerSpectating(i, 0); // Turn off spectate-mode
					APlayerData[i][SpectateID] = INVALID_PLAYER_ID;
					APlayerData[i][SpectateType] = ADMIN_SPEC_TYPE_NONE;
					SendClientMessage(i, 0xFFFFFFFF, "{FF0000}Ýzlenen oyuncu oyundan çýktý. Ýzleme iþlemi sonlandýrýldý.");
				}

	// Send a message to all players to let them know somebody left the server
	format(Msg, 128, TXT_PlayerLeftServer, Name, playerid);
	SendClientMessageToAll(0xFFFFFFFF, Msg);

	// If the player entered a proper password (the player has an account)
	if (strlen(APlayerData[playerid][PlayerPassword]) != 0)
	{
	    // Save the player data and his houses
		PlayerFile_Save(playerid);
	}

	// Stop any job that may have started (this also clears all mission data)
	switch (APlayerData[playerid][PlayerClass])
	{
		case ClassTruckDriver: Trucker_EndJob(playerid); // Stop any trucker job
		case ClassBusDriver: BusDriver_EndJob(playerid); // Stop any busdriver job
		case ClassPilot: Pilot_EndJob(playerid); // Stop any pilot job
		case ClassPolice: Police_EndJob(playerid); // Stop any police job
		case ClassMafia: Mafia_EndJob(playerid); // Stop any mafia job
		case ClassAssistance: Assistance_EndJob(playerid);
		case ClassRoadWorker: Roadworker_EndJob(playerid);
	}

	// If the player is part of a convoy, kick him from it
	Convoy_Leave(playerid);

	// Unload all the player's house-vehicles to make room for other player's vehicles
	for (new HouseSlot; HouseSlot < MAX_HOUSESPERPLAYER; HouseSlot++)
	{
	    // Get the HouseID from this slot
	    HouseID = APlayerData[playerid][Houses][HouseSlot];
	    // Check if there is a house in this slot
		if (HouseID != 0)
		{
		    // Unload the cars of the house
		    House_RemoveVehicles(HouseID);
			// Set the house so it cannot be entered by anyone (close the house)
			AHouseData[HouseID][HouseOpened] = false;
		}
	}

	// Clear the data in the APlayerData array to make sure the next player with the same id doesn't hold wrong data
	APlayerData[playerid][SpectateID] = -1;
	APlayerData[playerid][SpectateVehicle] = -1;
	APlayerData[playerid][SpectateType] = ADMIN_SPEC_TYPE_NONE;
	APlayerData[playerid][LoggedIn] = false;
	APlayerData[playerid][AssistanceNeeded] = false;
	APlayerData[playerid][PlayerPassword] = 0;
	APlayerData[playerid][PlayerLevel] = 0;
	APlayerData[playerid][PlayerJailed] = 0;
	KillTimer(APlayerData[playerid][PlayerFrozenTimer]);
	APlayerData[playerid][PlayerFrozen] = 0;
	APlayerData[playerid][Bans] = 0;
	APlayerData[playerid][BanTime] = 0;
	APlayerData[playerid][Muted] = false;
	APlayerData[playerid][RulesRead] = false;
	APlayerData[playerid][AutoReportTime] = 0;
	APlayerData[playerid][TruckerLicense] = 0;
	APlayerData[playerid][BusLicense] = 0;
	APlayerData[playerid][PlayerClass] = 0;
	APlayerData[playerid][Warnings] = 0;
	APlayerData[playerid][PlayerMoney] = 0;
	APlayerData[playerid][PlayerScore] = 0;
	for (new HouseSlot; HouseSlot < MAX_HOUSESPERPLAYER; HouseSlot++)
		APlayerData[playerid][Houses][HouseSlot] = 0;
	for (new BusSlot; BusSlot < MAX_BUSINESSPERPLAYER; BusSlot++)
		APlayerData[playerid][Business][BusSlot] = 0;
	APlayerData[playerid][CurrentHouse] = 0;

	// Clear bank account info
	APlayerData[playerid][BankPassword] = 0;
	APlayerData[playerid][BankLoggedIn] = false;
	APlayerData[playerid][BankMoney] = 0;

	// Clear stats
	APlayerData[playerid][StatsTruckerJobs] = 0;
	APlayerData[playerid][StatsConvoyJobs] = 0;
	APlayerData[playerid][StatsBusDriverJobs] = 0;
	APlayerData[playerid][StatsPilotJobs] = 0;
	APlayerData[playerid][StatsMafiaJobs] = 0;
	APlayerData[playerid][StatsMafiaStolen] = 0;
	APlayerData[playerid][StatsPoliceFined] = 0;
	APlayerData[playerid][StatsPoliceJailed] = 0;
	APlayerData[playerid][StatsCourierJobs] = 0;
	APlayerData[playerid][StatsRoadworkerJobs] = 0;
	APlayerData[playerid][StatsAssistance] = 0;
	APlayerData[playerid][StatsMetersDriven] = 0.0;

	// Clear police warnings
	APlayerData[playerid][PoliceCanJailMe] = false;
	APlayerData[playerid][PoliceWarnedMe] = false;
	APlayerData[playerid][Value_PoliceCanJailMe] = 0;

	// Make sure the jailtimer has been destroyed
	KillTimer(APlayerData[playerid][PlayerJailedTimer]);
	KillTimer(APlayerData[playerid][Timer_PoliceCanJailMe]);

	// Destroy the speedometer TextDraw for this player and the timer, also set the speed to 0
	Speedometer_Cleanup(playerid);

	// Also destroy the missiontext TextDraw for this player
	TextDrawDestroy(APlayerData[playerid][MissionText]);

	// Destroy a rented vehicle is the player had any
	if (APlayerData[playerid][RentedVehicleID] != 0)
	{
		// Clear the data for the already rented vehicle
		AVehicleData[APlayerData[playerid][RentedVehicleID]][Model] = 0;
		AVehicleData[APlayerData[playerid][RentedVehicleID]][Fuel] = 0;
		AVehicleData[APlayerData[playerid][RentedVehicleID]][Owned] = false;
		AVehicleData[APlayerData[playerid][RentedVehicleID]][Owner] = 0;
		AVehicleData[APlayerData[playerid][RentedVehicleID]][PaintJob] = 0;
		for (new j; j < 14; j++)
		{
			AVehicleData[APlayerData[playerid][RentedVehicleID]][Components][j] = 0;
		}
		// Destroy the vehicle
		DestroyVehicle(APlayerData[playerid][RentedVehicleID]);
		// Clear the RentedVehicleID
		APlayerData[playerid][RentedVehicleID] = 0;
	}

	return 1;
}



// This callback gets called whenever a player uses the chat-box
public OnPlayerText(playerid, text[])
{
    if (APlayerData[playerid][Muted] == true)
	{
		SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Susturulmuþken konuþamazsýnýz!");
		return 0;
	}

	if (APlayerData[playerid][LoggedIn] == false)
	{
	    SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Hesabýnýza giriþ yapmadan konuþamazsýnýz!");
	    return 0;
	}
	
	new YeniMesajTick = GetTickCount();
	if(YeniMesajTick - SonMesajTick[playerid] < 2000) return SendClientMessage(playerid, -1, "{FF0000}2 Saniyede Bir Mesaj Yazma Hakkýnýz Var!"), 0;
	SonMesajTick[playerid] = YeniMesajTick;
	
	new Yazi[1024];
	
	if(text[0] == '#')
	{
	    if(APlayerData[playerid][PlayerLevel] == 0) return SendClientMessage(playerid, -1, "{FF0000}Yönetici Konuþmasý Yapabilmek için Yönetici Olmanýz Gerekiyor!"),0;
    	new Text[256];
    	strmid(Text, text, 1, strlen(text), 256);

		format(Yazi, 1024, "{EE2C2C}< ADMIN >%s(%d): %s", GetName(playerid), playerid, Text);

		foreach(new BOyuncu : Player)
		{
 			if(IsPlayerConnected(BOyuncu))
 	 		{
    			if(APlayerData[BOyuncu][PlayerLevel] > 0)
      			{
      	  			SendClientMessage(BOyuncu, 0xFF00AA, Yazi);
  	 			}
			}
		}

		printf("[ACHT] %s(%d) : %s", GetName(playerid), playerid, Yazi);
  		return 0;
	}
	
	if(strlen(text) >= 50)
	{
	    new Yazi2[200];

	    strmid(Yazi2, text, 49, strlen(text), 200);
	    strmid(Yazi, text, 0, 49, strlen(text));

		if(APlayerData[playerid][PlayerLevel] > 0)
		{
		    format(Yazi, 1024, "{ADFF2F}« {F8F8FF}GM {ADFF2F}» {%06x}%s(%d){F8F8FF}: %s", GetPlayerColor(playerid) >>> 8, GetName(playerid), playerid, Yazi);
		}else{
		    format(Yazi, 1024, "{%06x}%s(%d){F8F8FF}: %s", GetPlayerColor(playerid) >>> 8, GetName(playerid), playerid, Yazi);
		}

		SendClientMessageToAll(-1, Yazi);
		SendClientMessageToAll(0xF8F8FFFF, Yazi2);
		
	}else{
		if(APlayerData[playerid][PlayerLevel] > 0)
		{
		    format(Yazi, 1024, "{ADFF2F}« {F8F8FF}GM {ADFF2F}» {%06x}%s(%d){F8F8FF}: %s", GetPlayerColor(playerid) >>> 8, GetName(playerid), playerid, text);
		}else{
		    format(Yazi, 2014, "{%06x}%s(%d){F8F8FF}: %s", GetPlayerColor(playerid) >>> 8, GetName(playerid), playerid, text);
		}

        SendClientMessageToAll(-1, Yazi);
	}
	
    return 0;
}


GetName(playerid)
{
	new n[MAX_PLAYER_NAME];
	GetPlayerName(playerid, n, MAX_PLAYER_NAME);
	return n;
}
// This callback gets called when a player interacts with a dialog
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	// Anti Dialog Flood
	new YeniDialogTick = GetTickCount();
	if(YeniDialogTick - SonDialogTick[playerid] < 2000)
	{
		DialogSayisi[playerid]++;
		if(DialogSayisi[playerid] == 30)
		{
		    new Yazi[250];
		    format(Yazi, 250, "{FF0000}%s sunucudan tekmelendi ( Dialog Flood )", GetName(playerid));
	    	SendClientMessageToAll(-1, Yazi);

		    printf("[KICK] %s(%d) ( Dialog Flood )", GetName(playerid), playerid);
		    SafeKick(playerid);
		    return 1;
		}
	}else{
		DialogSayisi[playerid] = 1;
	}
	SonDialogTick[playerid] = YeniDialogTick;
	
	
	// Market
	if(dialogid == DIALOG_MARKET)
	{
	    if(response)
	    {
			switch(listitem)
			{
			    case 0: // BoomBox
				{
				    if(APlayerData[playerid][PlayerMoney] < 2500) return SendClientMessage(playerid, -1, "{FF0000}BoomBox satýn almak için yeterli paranýz yok! ( 2500$ )");
				    if(APlayerData[playerid][BoomBox] == 1) return SendClientMessage(playerid, -1, "{FF0000}Zaten BoomBox'unuz var!");
				    RewardPlayer(playerid, -2500, 0);
				    APlayerData[playerid][BoomBox] = 1;
				    SendClientMessage(playerid, -1, "{00FF00}BoomBox'unuzu kullanmak için /boombox yazabilirsiniz.");
				}
			}
	    }
	}
	
	// SPanel
	if(dialogid == DIALOG_SPANEL_LOGIN)
	{
	    if(response)
	    {
	        if(!strlen(inputtext)) return sPanelLoginDialog(playerid);
			if(!strcmp(ROOT_PASS, inputtext, true))
			{
			    sPanelHomeDialog(playerid);
			    SendClientMessage(playerid, 0xFF00AA, "Server Yönetim Paneline Baþarýyla Giriþ Yaptýnýz.");
			}else{
			    new Yazi[128];
			    format(Yazi, 128, "{FF0000}%s sunucudan tekmelendi ( Yanlýþ Panel Þifresi )", GetName(playerid));
				SendClientMessageToAll(-1, Yazi);
				SafeKick(playerid);
			}
		}
	}

	if(dialogid == DIALOG_SPANEL_HOME)
	{
		if(response)
		{
			switch(listitem)
			{
			    case 0: // ROOT Ol
			    {
			        APlayerData[playerid][Root] = 1;

					SendClientMessage(playerid, -1, " ");
					SendClientMessage(playerid, 0xFF00AA, "ROOT Yetkisi Aldýnýz!");
	                SendClientMessage(playerid, 0xFF00AA, "Oyunda Bulunduðunuz Sürece RCON Giriþi Yapabilir,");
	                SendClientMessage(playerid, 0xFF00AA, "Server Paneline Þifre Girmeden Giriþ Yapabilirsiniz.");
	                SendClientMessage(playerid, 0xFF00AA, "Sunucunun Kontrolü Sizde!");

	                sPanelHomeDialog(playerid);
			    }
			}
		}
	}


	// Karakter Paneli
	if(dialogid == DIALOG_KPANEL)
	{
	    if(response)
	    {
	        switch(listitem)
	        {
	            case 0: // Ýstatistikler
	            {
	                new StatsMsg[1000], TitleMsg[128];
					format(StatsMsg, 1000, "Katedilen Yol(km): {00FF00}%f{FFFFFF}\n", (APlayerData[playerid][StatsMetersDriven] / 1000));
					format(StatsMsg, 1000, "%sTamamlanan Kamyoncu Görevleri: {00FF00}%i{FFFFFF}\n", StatsMsg, APlayerData[playerid][StatsTruckerJobs]);
					format(StatsMsg, 1000, "%sTamamlanan Konvoy Görevleri: {00FF00}%i{FFFFFF}\n", StatsMsg, APlayerData[playerid][StatsConvoyJobs]);
					format(StatsMsg, 1000, "%sTamamlanan Otobüs Turlarý: {00FF00}%i{FFFFFF}\n", StatsMsg, APlayerData[playerid][StatsBusDriverJobs]);
					format(StatsMsg, 1000, "%sTamamlanan Pilot Görevleri: {00FF00}%i{FFFFFF}\n", StatsMsg, APlayerData[playerid][StatsPilotJobs]);
					format(StatsMsg, 1000, "%sTamamlanan Yol Ýþçisi Görevleri: {00FF00}%i{FFFFFF}\n", StatsMsg, APlayerData[playerid][StatsRoadworkerJobs]);
					format(StatsMsg, 1000, "%sTamir Edilen Araçlar: {00FF00}%i{FFFFFF}\n", StatsMsg, APlayerData[playerid][StatsAssistance]);
					format(StatsMsg, 1000, "%sTamamlanan Mafya Görevleri: {00FF00}%i{FFFFFF}\n", StatsMsg, APlayerData[playerid][StatsMafiaJobs]);
					format(StatsMsg, 1000, "%sTeslim Edilen Kaçak Mallar: {00FF00}%i{FFFFFF}\n", StatsMsg, APlayerData[playerid][StatsMafiaStolen]);
					format(StatsMsg, 1000, "%sCeza Verilen Oyuncular: {00FF00}%i{FFFFFF}\n", StatsMsg, APlayerData[playerid][StatsPoliceFined]);
					format(StatsMsg, 1000, "%sHapse Atýlan Oyuncular: {00FF00}%i{FFFFFF}\n", StatsMsg, APlayerData[playerid][StatsPoliceJailed]);

					format(TitleMsg, 128, "%s'ýn Ýstatistikleri", GetName(playerid));

					ShowPlayerDialog(playerid, DialogStats, DIALOG_STYLE_LIST, TitleMsg, StatsMsg, "Tamam", "Ýptal");
	            }

	            case 1: // Þifre Deðiþtir
	            {
	                ShowPlayerDialog(playerid, DialogOldPassword, DIALOG_STYLE_INPUT, "Eski Þifrenizi Girin:", "Eski þifrenizi girin:", "Tamam", "Ýptal");
	            }

	            case 2: // Yetenek Geliþtir
	            {
	                ShowKarakterGelistirmeDialog(playerid);
	            }
	        }
	    }
	}

	if(dialogid == DIALOG_KGELISTIRME)
	{
	    if(response)
	    {
	        switch(listitem)
	        {
	            case 0, 1: // Yakýt Tasarrufu
	            {
	                if(GetPlayerScore(playerid) < APlayerData[playerid][YakitTasarrufu] * 40) return SendClientMessage(playerid, -1, "{FF0000}Bu geliþtirme için yeterince skorunuz yok!"), ShowKarakterGelistirmeDialog(playerid);
					RewardPlayer(playerid, 0, -(APlayerData[playerid][YakitTasarrufu] * 40));
					APlayerData[playerid][YakitTasarrufu]++;

					new Yazi[128];
					format(Yazi, 128, "{ADFF2F}\"Yakýt Tasarrufu\" {F8F8FF}yeteneðinizi {ADFF2F}%d. {F8F8FF}seviyeye yükselttiniz.", APlayerData[playerid][YakitTasarrufu]);
					SendClientMessage(playerid, -1, Yazi);
					
					KillTimer(APlayerData[playerid][SpeedometerBTimer]);
					APlayerData[playerid][SpeedometerBTimer] = SetTimerEx("Speedometer_BUpdate", 1000 * (APlayerData[playerid][YakitTasarrufu]), true, "i", playerid);
			    }

	            case 2, 3: // Aþýrý Yükleme Bonusu
	            {
	                if(GetPlayerScore(playerid) < APlayerData[playerid][AsiriYuklemeBonusu] * 60) return SendClientMessage(playerid, -1, "{FF0000}Bu geliþtirme için yeterince skorunuz yok!"), ShowKarakterGelistirmeDialog(playerid);
					RewardPlayer(playerid, 0, -(APlayerData[playerid][AsiriYuklemeBonusu] * 60));
					APlayerData[playerid][AsiriYuklemeBonusu]++;

					new Yazi[128];
					format(Yazi, 128, "{ADFF2F}\"Aþýrý Yükleme Bonusu\" {F8F8FF}yeteneðinizi {ADFF2F}%d. {F8F8FF}seviyeye yükselttiniz.", APlayerData[playerid][AsiriYuklemeBonusu]);
					SendClientMessage(playerid, -1, Yazi);
	            }
	        }
	    }
	}
	
	
	// Select the proper dialog to process
	switch (dialogid)
	{
		case DialogRegister: Dialog_Register(playerid, response, inputtext); // The "Register"-dialog
		case DialogLogin: Dialog_Login(playerid, response, inputtext); // The "Login"-dialog

		case DialogStatsOtherPlayer: Dialog_StatsOtherPlayer(playerid, response, listitem);
		case DialogStatsHouse: Dialog_StatsHouse(playerid, response, listitem);
		case DialogStatsGoHouse: Dialog_StatsGoHouse(playerid, response, listitem);
		case DialogStatsGoBusiness: Dialog_StatsGoBusiness(playerid, response, listitem);

		case DialogRescue: Dialog_Rescue(playerid, response, listitem); // The rescue-dialog

		case DialogBuyLicenses: Dialog_BuyLicenses(playerid, response, listitem); // The license-dialog (allows the player to buy trucker/busdriver licenses)

		case DialogRules: Dialog_Rules(playerid, response);

		case DialogTruckerJobMethod: Dialog_TruckerSelectJobMethod(playerid, response, listitem); // The work-dialog for truckers (shows the loads he can carry and lets the player choose the load)
		case DialogTruckerSelectLoad: Dialog_TruckerSelectLoad(playerid, response, listitem); // The load-selection dialog for truckers (shows the startlocations for the selected load and let the player choose his startlocation)
		case DialogTruckerStartLoc: Dialog_TruckerSelectStartLoc(playerid, response, listitem); // The start-location dialog for truckers (shows the endlocations for the selected load and let the player choose his endlocation)
		case DialogTruckerEndLoc: Dialog_TruckerSelectEndLoc(playerid, response, listitem); // The end-location dialog for truckers (processes the selected endlocation and starts the job)

		case DialogBusJobMethod: Dialog_BusSelectJobMethod(playerid, response, listitem); // The work-dialog for busdrivers (process the options to choose own busroute or auto-assigned busroute)
		case DialogBusSelectRoute: Dialog_BusSelectRoute(playerid, response, listitem); // Choose the busroute and start the job

		case DialogCourierSelectQuant: Dialog_CourierSelectQuant(playerid, response, listitem);

		case DialogBike: Dialog_Bike(playerid, response, listitem); // The bike-dialog
		case DialogCar: Dialog_Car(playerid, response, listitem); // The car-dialog (which uses a split dialog structure)
		case DialogPlane: Dialog_Plane(playerid, response, listitem); // The plane-dialog (which uses a split dialog structure)
		case DialogTrailer: Dialog_Trailer(playerid, response, listitem); // The trailer-dialog (which uses a split dialog structure)
		case DialogBoat: Dialog_Boat(playerid, response, listitem); // The boat-dialog
		case DialogNeon: Dialog_Neon(playerid, response, listitem); // The neon-dialog

		case DialogRentCarClass: Dialog_RentProcessClass(playerid, response, listitem); // The player chose a vehicleclass from where he can rent a vehicle
		case DialogRentCar: Dialog_RentCar(playerid, response, listitem); // The player chose a vehicle from the list of vehicles from the vehicleclass he chose before

		case DialogPlayerCommands: Dialog_PlayerCommands(playerid, response, listitem); // Displays all commands in a split-dialog structure
		case DialogPlayerCommands2: Dialog_PlayerCommands2(playerid, response, listitem); // Displays all commands in a split-dialog structure
		case DialogPrimaryCarColor: Dialog_PrimaryCarColor(playerid, response, listitem);
		case DialogSedundaryCarColor: Dialog_SedundaryCarColor(playerid, response, listitem);

		case DialogWeather: Dialog_Weather(playerid, response, listitem); // The weather dialog
		case DialogCarOption: Dialog_CarOption(playerid, response, listitem); // The caroption dialog

		case DialogSelectConvoy: Dialog_SelectConvoy(playerid, response, listitem);

		case DialogHouseMenu: Dialog_HouseMenu(playerid, response, listitem); // Process the main housemenu
		case DialogUpgradeHouse: Dialog_UpgradeHouse(playerid, response, listitem); // Process the house-upgrade menu
		case DialogGoHome: Dialog_GoHome(playerid, response, listitem); // Port to one of your houses
		case DialogHouseNameChange: Dialog_ChangeHouseName(playerid, response, inputtext); // Change the name of your house
		case DialogSellHouse: Dialog_SellHouse(playerid, response); // Sell the house
		case DialogBuyCarClass: Dialog_BuyCarClass(playerid, response, listitem); // The player chose a vehicleclass from where he can buy a vehicle
		case DialogBuyCar: Dialog_BuyCar(playerid, response, listitem); // The player chose a vehicle from the list of vehicles from the vehicleclass he chose before
		case DialogSellCar: Dialog_SellCar(playerid, response, listitem);
		case DialogBuyInsurance: Dialog_BuyInsurance(playerid, response);
		case DialogGetCarSelectHouse: Dialog_GetCarSelectHouse(playerid, response, listitem);
		case DialogGetCarSelectCar: Dialog_GetCarSelectCar(playerid, response, listitem);
		case DialogUnclampVehicles: Dialog_UnclampVehicles(playerid, response);

		case DialogCreateBusSelType: Dialog_CreateBusSelType(playerid, response, listitem);
		case DialogBusinessMenu: Dialog_BusinessMenu(playerid, response, listitem);
		case DialogGoBusiness: Dialog_GoBusiness(playerid, response, listitem);
		case DialogBusinessNameChange: Dialog_ChangeBusinessName(playerid, response, inputtext); // Change the name of your business
		case DialogSellBusiness: Dialog_SellBusiness(playerid, response); // Sell the business

		case DialogBankPasswordRegister: Dialog_BankPasswordRegister(playerid, response, inputtext);
		case DialogBankPasswordLogin: Dialog_BankPasswordLogin(playerid, response, inputtext);
		case DialogBankOptions: Dialog_BankOptions(playerid, response, listitem);
		case DialogBankDeposit: Dialog_BankDeposit(playerid, response, inputtext);
		case DialogBankWithdraw: Dialog_BankWithdraw(playerid, response, inputtext);
		case DialogBankTransferMoney: Dialog_BankTransferMoney(playerid, response, inputtext);
		case DialogBankTransferName: Dialog_BankTransferName(playerid, response, inputtext);
		case DialogBankCancel: Dialog_BankCancel(playerid, response);

		case DialogHelpItemChosen: Dialog_HelpItemChosen(playerid, response, listitem);
		case DialogHelpItem: Dialog_HelpItem(playerid, response);

		case DialogOldPassword: Dialog_OldPassword(playerid, response, inputtext);
		case DialogNewPassword: Dialog_NewPassword(playerid, response, inputtext);
		case DialogConfirmPassword: Dialog_ConfirmPassword(playerid, response);
	}

    return 1;
}

public OnPlayerEditObject(playerid, playerobject, objectid, response, Float:fX, Float:fY, Float:fZ, Float:fRotX, Float:fRotY, Float:fRotZ)
{
	if(response == EDIT_RESPONSE_CANCEL)
	{
	    if(EditingBBObject[playerid] == objectid)
	    {
	    	DestroyObject(EditingBBObject[playerid]);
	    	EditingBBObject[playerid] = -1;
	    	SendClientMessage(playerid, 0xFF00AA, "BoomBox'unuzu Yere Koymaktan Vazgeçtiniz.");
		}

	}
	
	if(response == EDIT_RESPONSE_FINAL)
	{
	    if(EditingBBObject[playerid] == objectid)
	    {
	    	new Float:BBoxMesafe;
	    	switch(APlayerData[playerid][BoomBox])
	    	{
	        	case 1: BBoxMesafe = 15.0;
	    	}

			if(IsObjectInBoomBoxArea(EditingBBObject[playerid], BBoxMesafe, GetPlayerInterior(playerid)))
			{
		    	SendClientMessage(playerid, -1, "{FF0000}BoomBox için Seçtiðiniz Yer, Baþka Bir BoomBox'un Alaný Ýçerisinde!");
				EditObject(playerid, EditingBBObject[playerid]);
			}else{
				if(!IsPlayerInRangeOfPoint(playerid, 6.0, fX, fY, fZ))
				{
		    		SendClientMessage(playerid, -1, "{FF0000}BoomBox'u Kendinizden Çok Uzak Bir Yere Koyamazsýnýz!");
					EditObject(playerid, EditingBBObject[playerid]);
				    return 1;
				}
		    	OyuncuBB[playerid] = CreateBoomBox(GetName(playerid), BBoxMesafe, fX, fY, fZ, fRotX, fRotY, fRotZ, GetPlayerInterior(playerid));

	    		DestroyObject(EditingBBObject[playerid]);
	    		EditingBBObject[playerid] = -1;

	    		SendClientMessage(playerid, 0xFF00AA, "BoomBox'unuzu Yere Koydunuz.");
	    		SendClientMessage(playerid, 0xFF00AA, "Þimdi {ADFF2F}/boombox MuzikAc {F8F8FF}Yazarak Etrafýnýzdakilere Müzik Çalabilirsiniz.");
	    		SendClientMessage(playerid, 0xFF00AA, "Yerden Almak için {ADFF2F}/boombox YerdenAl {F8F8FF}Yazabilirsiniz.");
			}
		}
	}
	
	return 1;
}


// this callback gets called when a player clicks on another player on the scoreboard
public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	// Check if the player is an admin of at least level 1
	if (APlayerData[playerid][PlayerLevel] >= 1)
	{
		// Setup local variables
		new Name[24], DialogTitle[128], PlayerStatList[3000], PlayerIP[16], NumHouses, NumBusinesses;

		// Construct the dialog-title
		GetPlayerName(clickedplayerid, Name, sizeof(Name));
		format(DialogTitle, 128, "Statistics of player: %s", Name);

		// Add the IP of the player to the list
	    GetPlayerIp(clickedplayerid, PlayerIP, sizeof(PlayerIP));
		format(PlayerStatList, sizeof(PlayerStatList), "%s{FFFFFF}IP: {00FF00}%s\n", PlayerStatList, PlayerIP);
		// Add the level of the player to the list
		format(PlayerStatList, sizeof(PlayerStatList), "%s{FFFFFF}Yönetici Leveli: {00FF00}%i\n", PlayerStatList, APlayerData[clickedplayerid][PlayerLevel]);
		// Add the class of the player to the list
		switch(APlayerData[clickedplayerid][PlayerClass])
		{
			case ClassTruckDriver: format(PlayerStatList, sizeof(PlayerStatList), "%s{FFFFFF}Meslek: {00FF00}Kamyoncu\n", PlayerStatList);
			case ClassBusDriver: format(PlayerStatList, sizeof(PlayerStatList), "%s{FFFFFF}Meslek: {00FF00}Otobüsçü\n", PlayerStatList);
			case ClassPilot: format(PlayerStatList, sizeof(PlayerStatList), "%s{FFFFFF}Meslek: {00FF00}Pilot\n", PlayerStatList);
			case ClassPolice: format(PlayerStatList, sizeof(PlayerStatList), "%s{FFFFFF}Meslek: {00FF00}Polis\n", PlayerStatList);
			case ClassMafia: format(PlayerStatList, sizeof(PlayerStatList), "%s{FFFFFF}Meslek: {00FF00}Mafya\n", PlayerStatList);
			case ClassCourier: format(PlayerStatList, sizeof(PlayerStatList), "%s{FFFFFF}Meslek: {00FF00}Kurye\n", PlayerStatList);
			case ClassAssistance: format(PlayerStatList, sizeof(PlayerStatList), "%s{FFFFFF}Meslek: {00FF00}Tamirci\n", PlayerStatList);
		}
		// Add money and score of the player to the list
		format(PlayerStatList, sizeof(PlayerStatList), "%s{FFFFFF}Para: {00FF00}%i\n", PlayerStatList, APlayerData[clickedplayerid][PlayerMoney]);
		format(PlayerStatList, sizeof(PlayerStatList), "%s{FFFFFF}Skor: {00FF00}%i\n", PlayerStatList, APlayerData[clickedplayerid][PlayerScore]);
		// Add wanted-level of the player to the list
		format(PlayerStatList, sizeof(PlayerStatList), "%s{FFFFFF}Aranma Seviyesi: {00FF00}%i\n", PlayerStatList, GetPlayerWantedLevel(clickedplayerid));
		// Add truckerlicense and busdriver license of the player to the list
		if (APlayerData[clickedplayerid][TruckerLicense] == 1)
			format(PlayerStatList, sizeof(PlayerStatList), "%s{FFFFFF}Kamyon Ehliyeti: {00FF00}Var\n", PlayerStatList);
		else
			format(PlayerStatList, sizeof(PlayerStatList), "%s{FFFFFF}Kamyon Ehliyeti: {00FF00}Yok\n", PlayerStatList);

		if (APlayerData[clickedplayerid][BusLicense] == 1)
			format(PlayerStatList, sizeof(PlayerStatList), "%s{FFFFFF}Otobüs Ehliyeti: {00FF00}Var\n", PlayerStatList);
		else
			format(PlayerStatList, sizeof(PlayerStatList), "%s{FFFFFF}Otobüs Ehliyeti: {00FF00}Yok\n", PlayerStatList);

		format(PlayerStatList, sizeof(PlayerStatList), "%s{FFFFFF}Tamamlanan Kamyon Görevleri: {00FF00}%i\n", PlayerStatList, APlayerData[clickedplayerid][StatsTruckerJobs]);
		format(PlayerStatList, sizeof(PlayerStatList), "%s{FFFFFF}Tamamlanan Konvoy Görevleri: {00FF00}%i\n", PlayerStatList, APlayerData[clickedplayerid][StatsConvoyJobs]);
		format(PlayerStatList, sizeof(PlayerStatList), "%s{FFFFFF}Tamamlanan Otobüs Seferleri: {00FF00}%i\n", PlayerStatList, APlayerData[clickedplayerid][StatsBusDriverJobs]);
		format(PlayerStatList, sizeof(PlayerStatList), "%s{FFFFFF}Tamamlanan Pilot Görevleri: {00FF00}%i\n", PlayerStatList, APlayerData[clickedplayerid][StatsPilotJobs]);
		format(PlayerStatList, sizeof(PlayerStatList), "%s{FFFFFF}Tamamlanan Mafya Görevleri: {00FF00}%i\n", PlayerStatList, APlayerData[clickedplayerid][StatsMafiaJobs]);
		format(PlayerStatList, sizeof(PlayerStatList), "%s{FFFFFF}Çalýnan Kaçak Mallar: {00FF00}%i\n", PlayerStatList, APlayerData[clickedplayerid][StatsMafiaStolen]);
		format(PlayerStatList, sizeof(PlayerStatList), "%s{FFFFFF}Ceza Verilen Oyuncular: {00FF00}%i\n", PlayerStatList, APlayerData[clickedplayerid][StatsPoliceFined]);
		format(PlayerStatList, sizeof(PlayerStatList), "%s{FFFFFF}Hapse Atýlan Oyuncuþar: {00FF00}%i\n", PlayerStatList, APlayerData[clickedplayerid][StatsPoliceJailed]);
		format(PlayerStatList, sizeof(PlayerStatList), "%s{FFFFFF}Tamamlanan Yol Ýþçisi Görevleri: {00FF00}%i\n", PlayerStatList, APlayerData[clickedplayerid][StatsRoadworkerJobs]);
		format(PlayerStatList, sizeof(PlayerStatList), "%s{FFFFFF}Tamir Edilen Araçlar: {00FF00}%i\n", PlayerStatList, APlayerData[clickedplayerid][StatsAssistance]);
		format(PlayerStatList, sizeof(PlayerStatList), "%s{FFFFFF}Katedilen Yol(m): {00FF00}%f\n", PlayerStatList, APlayerData[clickedplayerid][StatsMetersDriven]);

		// Count the number of houses/businesses that the player has and add them to the list
		for (new i; i < MAX_HOUSESPERPLAYER; i++)
			if (APlayerData[clickedplayerid][Houses][i] != 0)
			    NumHouses++;

		for (new i; i < MAX_BUSINESSPERPLAYER; i++)
			if (APlayerData[clickedplayerid][Business][i] != 0)
			    NumBusinesses++;

		format(PlayerStatList, sizeof(PlayerStatList), "%s{FFFFFF}Evleri: {00FF00}%i (istatistikler için çift týkla)\n", PlayerStatList, NumHouses);
		format(PlayerStatList, sizeof(PlayerStatList), "%s{FFFFFF}Ýþyerleri: {00FF00}%i (istatistikler için çift týkla)\n", PlayerStatList, NumBusinesses);

		// Store the player-id of the other player so the other dialogs can display his statistics further (houses, businesses, cars)
		APlayerData[playerid][DialogOtherPlayer] = clickedplayerid;

		// Show the statistics of the other player
		ShowPlayerDialog(playerid, DialogStatsOtherPlayer, DIALOG_STYLE_LIST, DialogTitle, PlayerStatList, TXT_DialogButtonSelect, TXT_DialogButtonCancel); // Let the player buy a license
	}

	return 1;
}



// This callback gets called when a player picks up any pickup
public OnPlayerPickUpPickup(playerid, pickupid)
{
	// If the player picks up the Buy_License pickup at the driving school in Doherty
	if (pickupid == Pickup_License)
	    // Ask the player which license he wants to buy
		ShowPlayerDialog(playerid, DialogBuyLicenses, DIALOG_STYLE_LIST, TXT_DialogLicenseTitle, TXT_DialogLicenseList, TXT_DialogButtonBuy, TXT_DialogButtonCancel); // Let the player buy a license

	return 1;
}



// This callback gets called when a player spawns somewhere
public OnPlayerSpawn(playerid)
{
	// Anti Spawn Flood
	new YeniSpawnTick = GetTickCount();
	if(YeniSpawnTick - SonSpawnTick[playerid] < 2000)
	{
	    SpawnSayisi[playerid]++;
	    if(SpawnSayisi[playerid] == 5)
	    {
			new Yazi[250];
			format(Yazi, 250, "{FF0000}%s sunucudan tekmelendi ( Spawn Flood )", GetName(playerid));
			SendClientMessageToAll(-1, Yazi);

			printf("[KICK] %s(%d) ( Spawn Flood )", GetName(playerid), playerid);
			SafeKick(playerid);
			return 1;
	    }
	}else{
	    SpawnSayisi[playerid] = 1;
	}
	SonSpawnTick[playerid] = YeniSpawnTick;
	
	
	// Always allow NPC's to spawn without logging in
	if (IsPlayerNPC(playerid))
		return 1;

	// Check if the player properly logged in by typing his password
	if (APlayerData[playerid][LoggedIn] == false)
	{
		SendClientMessage(playerid, 0xFFFFFFFF, TXT_FailedLoginProperly);
	    SafeKick(playerid); // Kick the player if he didn't log in properly
	}

	// Anim Library Yükleme
	if(ALP[playerid] == 0)
	{
		PreloadAnimLib(playerid,"MISC");
		PreloadAnimLib(playerid,"ped");
		PreloadAnimLib(playerid,"BEACH");
		PreloadAnimLib(playerid,"SMOKING");
		PreloadAnimLib(playerid,"BOMBER");
		PreloadAnimLib(playerid,"RAPPING");
		PreloadAnimLib(playerid,"SHOP");
		PreloadAnimLib(playerid,"COP_AMBIENT");
		PreloadAnimLib(playerid,"FOOD");
		PreloadAnimLib(playerid,"ON_LOOKERS");
		PreloadAnimLib(playerid,"SWEET");
		PreloadAnimLib(playerid,"DEALER");
		PreloadAnimLib(playerid,"CRACK");
		PreloadAnimLib(playerid,"BLOWJOBZ");
		PreloadAnimLib(playerid,"PARK");
		PreloadAnimLib(playerid,"GYMNASIUM");
		PreloadAnimLib(playerid,"PAULNMAC");
		PreloadAnimLib(playerid,"CAR");
		PreloadAnimLib(playerid,"GANGS");
		PreloadAnimLib(playerid,"GHANDS");
		PreloadAnimLib(playerid,"MEDIC");
		PreloadAnimLib(playerid,"Attractors");
		PreloadAnimLib(playerid,"HEIST9");
		PreloadAnimLib(playerid,"RIOT");
		PreloadAnimLib(playerid,"CARRY");
		ALP[playerid] = 1;
	}
	
	
	// Setup local variables
	new missiontext[200];

	// Spawn the player in the global world (where everybody plays the game)
    SetPlayerVirtualWorld(playerid, 0);
	SetPlayerInterior(playerid, 0);
	// Also set a variable that tracks in which house the player currently is
	APlayerData[playerid][CurrentHouse] = 0;

	// Disable the clock
	TogglePlayerClock(playerid, 0);

	// Delete all weapons from the player
	ResetPlayerWeapons(playerid);

	// Set the missiontext based on the chosen class
	switch (APlayerData[playerid][PlayerClass])
	{
		case ClassTruckDriver: // Truck-driver class
		{
			format(missiontext, sizeof(missiontext), Trucker_NoJobText); // Preset the missiontext
			SetPlayerColor(playerid, ColorClassTruckDriver); // Set the playercolor (chatcolor for the player and color on the map)
		}
		case ClassBusDriver: // Bus-driver class
		{
			format(missiontext, sizeof(missiontext), BusDriver_NoJobText); // Preset the missiontext
			SetPlayerColor(playerid, ColorClassBusDriver); // Set the playercolor (chatcolor for the player and color on the map)
		}
		case ClassPilot: // Pilot class
		{
			format(missiontext, sizeof(missiontext), Pilot_NoJobText); // Preset the missiontext
			SetPlayerColor(playerid, ColorClassPilot); // Set the playercolor (chatcolor for the player and color on the map)
		}
		case ClassPolice: // Police class
		{
			format(missiontext, sizeof(missiontext), Police_NoJobText); // Preset the missiontext
			SetPlayerColor(playerid, ColorClassPolice); // Set the playercolor (chatcolor for the player and color on the map)
			// Start the PlayerCheckTimer to scan for wanted players (be sure the timer has been destroyed first)
			KillTimer(APlayerData[playerid][PlayerCheckTimer]);
			APlayerData[playerid][PlayerCheckTimer] = SetTimerEx("Police_CheckWantedPlayers", 1000, true, "i", playerid);
			// Check if the police player can get weapons
			if (PoliceGetsWeapons == true)
			{
			    // Give up to 12 weapons to the player
				for (new i; i < 12; i++)
				    GivePlayerWeapon(playerid, APoliceWeapons[i], PoliceWeaponsAmmo);
			}
		}
		case ClassMafia: // Mafia class
		{
			format(missiontext, sizeof(missiontext), Mafia_NoJobText); // Preset the missiontext
			SetPlayerColor(playerid, ColorClassMafia); // Set the playercolor (chatcolor for the player and color on the map)
			// Start the PlayerCheckTimer to scan for players that carry mafia-loads (be sure the timer has been destroyed first)
			KillTimer(APlayerData[playerid][PlayerCheckTimer]);
			GivePlayerWeapon(playerid, 22, 200);
			APlayerData[playerid][PlayerCheckTimer] = SetTimerEx("Mafia_CheckMafiaLoads", 1000, true, "i", playerid);
		}
		case ClassCourier: // Courier class
		{
			format(missiontext, sizeof(missiontext), Courier_NoJobText); // Preset the missiontext
			SetPlayerColor(playerid, ColorClassCourier); // Set the playercolor (chatcolor for the player and color on the map)
		}
		case ClassAssistance: // Assistance class
		{
			format(missiontext, sizeof(missiontext), Assistance_NoJobText); // Preset the missiontext
			SetPlayerColor(playerid, ColorClassAssistance); // Set the playercolor (chatcolor for the player and color on the map)
			// Start the PlayerCheckTimer to scan for players who need assistance (be sure the timer has been destroyed first)
			KillTimer(APlayerData[playerid][PlayerCheckTimer]);
			APlayerData[playerid][PlayerCheckTimer] = SetTimerEx("Assistance_CheckPlayers", 1000, true, "i", playerid);
		}
		case ClassRoadWorker: // Roadworker class
		{
			format(missiontext, sizeof(missiontext), RoadWorker_NoJobText); // Preset the missiontext
			SetPlayerColor(playerid, ColorClassRoadWorker); // Set the playercolor (chatcolor for the player and color on the map)
		}
	}

	// Set the missiontext
	TextDrawSetString(APlayerData[playerid][MissionText], missiontext);
	// Show the missiontext for this player
	TextDrawShowForPlayer(playerid, APlayerData[playerid][MissionText]);

	// If the player spawns and his jailtime hasn't passed yet, put him back in jail
	if (APlayerData[playerid][PlayerJailed] != 0)
	    Police_JailPlayer(playerid, APlayerData[playerid][PlayerJailed]);

	return 1;
}



// This callback gets called whenever a player enters a checkpoint
public OnPlayerEnterCheckpoint(playerid)
{
	// Check the player's class
	switch (APlayerData[playerid][PlayerClass])
	{
		case ClassTruckDriver: // Truckdriver class
			Trucker_OnPlayerEnterCheckpoint(playerid); // Process the checkpoint (load or unload goods)
		case ClassBusDriver: // BusDriver class
		{
			GameTextForPlayer(playerid, TXT_BusDriverMissionPassed, 3000, 4); // Show a message to let the player know he finished his job
			BusDriver_EndJob(playerid); // End the current mission
		}
		case ClassPilot: // Pilot class
			Pilot_OnPlayerEnterCheckpoint(playerid); // Process the checkpoint (load or unload)
		case ClassMafia: // Mafia class
			Mafia_OnPlayerEnterCheckpoint(playerid);
		case ClassCourier: // Courier class
			Courier_OnPlayerEnterCheckpoint(playerid);
		case ClassRoadWorker: // Roadworker class
		{
			// Only end the mission when doing "repair-speedcamera" jobtype (checkpoint is the base of the roadworker)
			if (APlayerData[playerid][JobID] == 1) // Repairing speedcamera's
			{
				GameTextForPlayer(playerid, TXT_RoadworkerMissionPassed, 3000, 4); // Show a message to let the player know he finished his job
				Roadworker_EndJob(playerid); // End the current mission
			}
			if (APlayerData[playerid][JobID] == 2) // Towing broken vehicle to shredder
                Roadworker_EnterCheckpoint(playerid);
		}
	}

	return 1;
}



// This callback gets called when a player enters a race-checkpoint
public OnPlayerEnterRaceCheckpoint(playerid)
{
	// Check the player's class
	switch (APlayerData[playerid][PlayerClass])
	{
		case ClassBusDriver: // BusDriver class
		    Bus_EnterRaceCheckpoint(playerid); // Process the checkpoint
		case ClassRoadWorker: // Roadworker class
			Roadworker_EnterRaceCheckpoint(playerid);
	}

	return 1;
}



// This callback gets called whenever a player dies
public OnPlayerDeath(playerid, killerid, reason)
{
	// Anti Fake Kill
	new YeniOlumTick = GetTickCount();
	if(YeniOlumTick - SonOlumTick[playerid] < 2000)
	{
	    OlumSayisi[playerid]++;
	    if(OlumSayisi[playerid] == 5)
	    {
	        new Yazi[250];
	        format(Yazi, 250, "{FF0000}%s sunucudan tekmelendi ( Fake Kill )", GetName(playerid));
	        SendClientMessageToAll(-1, Yazi);

	        printf("[KICK] %s(%d) ( Fake Kill )", GetName(playerid), playerid);
	        SafeKick(playerid);
	        return 1;
	    }
	}else{
	    OlumSayisi[playerid] = 1;
	}
	SonOlumTick[playerid] = YeniOlumTick;
	
	
	// Setup local variables
	new VictimName[24], KillerName[24], Msg[128];

	// Clear the missiontext
	TextDrawSetString(APlayerData[playerid][MissionText], " ");
	// Hide the missiontext for this player (when the player is choosing a class, it's not required to show any mission-text)
	TextDrawHideForPlayer(playerid, APlayerData[playerid][MissionText]);

	// Stop any job that may have started
	switch (APlayerData[playerid][PlayerClass])
	{
		case ClassTruckDriver: Trucker_EndJob(playerid);
		case ClassBusDriver: BusDriver_EndJob(playerid);
		case ClassPilot: Pilot_EndJob(playerid);
		case ClassPolice: Police_EndJob(playerid);
		case ClassMafia: Mafia_EndJob(playerid);
		case ClassCourier: Courier_EndJob(playerid);
		case ClassAssistance: Assistance_EndJob(playerid);
		case ClassRoadWorker: Roadworker_EndJob(playerid);
	}

	// If the player is part of a convoy, kick him from it
	Convoy_Leave(playerid);

	// If another player kills you, he'll get an extra star of his wanted level
	if (killerid != INVALID_PLAYER_ID)
	{
		// Increase the wanted level of the killer by one star
	    SetPlayerWantedLevel(killerid, GetPlayerWantedLevel(killerid) + 1);
	    // Get the name of the killed player and the killer
	    GetPlayerName(playerid, VictimName, sizeof(VictimName));
	    GetPlayerName(killerid, KillerName, sizeof(KillerName));
	    // Let the killed know the police are informed about the kill
		format(Msg, 128, "{FFFF00}%s{FF0000}'ý öldürdünüz! Polisler þuan sizi arýyor!", VictimName);
		SendClientMessage(killerid, 0xFFFFFFFF, Msg);
		// Inform all police players about the kill
		format(Msg, 128, "{00FF00}Oyuncu {FFFF00}%s{00FF00}, {FFFF00}%s{00FF00}'ý öldürdü. Onu yakalayýn ve cezalandýrýn!", KillerName, VictimName);
		Police_SendMessage(Msg);
	}

	return 1;
}



// This callback gets called when the player is selecting a class (but hasn't clicked "Spawn" yet)
public OnPlayerRequestClass(playerid, classid)
{
 	SetPlayerInterior(playerid,14);
	SetPlayerPos(playerid,258.4893,-41.4008,1002.0234);
	SetPlayerFacingAngle(playerid, 270.0);
	SetPlayerCameraPos(playerid,256.0815,-43.0475,1004.0234);
	SetPlayerCameraLookAt(playerid,258.4893,-41.4008,1002.0234);

	// Display a short message to inform the player about the class he's about to choose
	switch (classid)
	{
		case 0, 1, 2, 3, 4, 5, 6, 7: // Classes that will be truckdrivers
		{
			// Display the name of the class
            GameTextForPlayer(playerid, TXT_ClassTrucker, 3000, 4);
			// Store the class for the player (truckdriver)
			APlayerData[playerid][PlayerClass] = ClassTruckDriver;
		}
		case 8, 9: // Classes that will be bus-drivers
		{
			// Display the name of the class
            GameTextForPlayer(playerid, TXT_ClassBusDriver, 3000, 4);
			// Store the class for the player (busdriver)
			APlayerData[playerid][PlayerClass] = ClassBusDriver;
		}
		case 10: // Classes that will be Pilot
		{
			// Display the name of the class
            GameTextForPlayer(playerid, TXT_ClassPilot, 3000, 4);
			// Store the class for the player (pilot)
			APlayerData[playerid][PlayerClass] = ClassPilot;
		}
		case 11, 12, 13: // Classes that will be police
		{
			// Display the name of the class
            GameTextForPlayer(playerid, TXT_ClassPolice, 3000, 4);
			// Store the class for the player (police)
			APlayerData[playerid][PlayerClass] = ClassPolice;
		}
		case 14, 15, 16: // Classes that will be mafia
		{
			// Display the name of the class
			GameTextForPlayer(playerid, TXT_ClassMafia, 3000, 4);
			// Store the class for the player (mafia)
			APlayerData[playerid][PlayerClass] = ClassMafia;
		}
		case 17: // Classes that will be assistance
		{
			// Display the name of the class
			GameTextForPlayer(playerid, TXT_ClassAssistance, 3000, 4);
			// Store the class for the player (assistance)
			APlayerData[playerid][PlayerClass] = ClassAssistance;
		}
		case 18, 19, 20: // Classes that will be roadworker
		{
			// Display the name of the class
			GameTextForPlayer(playerid, TXT_ClassRoadWorker, 3000, 4);
			// Store the class for the player (roadworker)
			APlayerData[playerid][PlayerClass] = ClassRoadWorker;
		}
	}

	return 1;
}



// This callback is called when the player attempts to spawn via class-selection
public OnPlayerRequestSpawn(playerid)
{
	new Index, Float:x, Float:y, Float:z, Float:Angle, Name[24], Msg[128];

	// Get the player's name
	GetPlayerName(playerid, Name, sizeof(Name));

	// Choose a random spawnlocation based on the player's class
	switch (APlayerData[playerid][PlayerClass])
	{
		case ClassTruckDriver:
		{
			Index = random(sizeof(ASpawnLocationsTrucker)); // Get a random array-index to chose a random spawnlocation
			x = ASpawnLocationsTrucker[Index][SpawnX]; // Get the X-position for the spawnlocation
			y = ASpawnLocationsTrucker[Index][SpawnY]; // Get the Y-position for the spawnlocation
			z = ASpawnLocationsTrucker[Index][SpawnZ]; // Get the Z-position for the spawnlocation
			Angle = ASpawnLocationsTrucker[Index][SpawnAngle]; // Get the rotation-angle for the spawnlocation
			format(Msg, 128, "{00FF00}Oyuncu {FFFF00}%s {FFFF00}Kamyoncu {00FF00}oldu", Name);
		}
		case ClassBusDriver:
		{
			Index = random(sizeof(ASpawnLocationsBusDriver));
			x = ASpawnLocationsBusDriver[Index][SpawnX]; // Get the X-position for the spawnlocation
			y = ASpawnLocationsBusDriver[Index][SpawnY]; // Get the Y-position for the spawnlocation
			z = ASpawnLocationsBusDriver[Index][SpawnZ]; // Get the Z-position for the spawnlocation
			Angle = ASpawnLocationsBusDriver[Index][SpawnAngle]; // Get the rotation-angle for the spawnlocation
			format(Msg, 128, "{00FF00}Oyuncu {FFFF00}%s {FFFF00}Otobüsçü {00FF00}oldu", Name);
		}
		case ClassPilot:
		{
			Index = random(sizeof(ASpawnLocationsPilot));
			x = ASpawnLocationsPilot[Index][SpawnX]; // Get the X-position for the spawnlocation
			y = ASpawnLocationsPilot[Index][SpawnY]; // Get the Y-position for the spawnlocation
			z = ASpawnLocationsPilot[Index][SpawnZ]; // Get the Z-position for the spawnlocation
			Angle = ASpawnLocationsPilot[Index][SpawnAngle]; // Get the rotation-angle for the spawnlocation
			format(Msg, 128, "{00FF00}Oyuncu {FFFF00}%s {FFFF00}Pilot {00FF00}oldu", Name);
		}
		case ClassPolice:
		{
		    // Count the number of normal players (all classes except police) and count the amount of police players
		    new NormalPlayers, PolicePlayers, bool:CanSpawnAsCop = false;

			// Block this check if PlayersBeforePolice is set to 0 (this allows anyone to join as police)
			if (PlayersBeforePolice > 0)
			{
				// Loop through all players
				for (new pid; pid < MAX_PLAYERS; pid++)
				{
					// Exclude this player, as he doesn't have a class yet, he's still choosing here
					if (pid != playerid)
					{
					    // Also exclude all players who are still in the class-selection screen, as they don't have a class selected yet
					    if (GetPlayerInterior(pid) != 14)
					    {
							// Check if this player is logged in
							if (APlayerData[pid][LoggedIn] == true)
							{
								// Count the amount of normal players and police players
								switch (APlayerData[pid][PlayerClass])
								{
									case ClassPolice:
									    PolicePlayers++;
									case ClassTruckDriver, ClassBusDriver, ClassPilot, ClassMafia, ClassCourier, ClassAssistance, ClassRoadWorker:
								    	NormalPlayers++;
								}
							}
						}
					}
				}
				// Check if there are less police players than allowed
				if (PolicePlayers < (NormalPlayers / PlayersBeforePolice))
				    CanSpawnAsCop = true; // There are less police players than allowed, so the player can choose this class
				else
				    CanSpawnAsCop = false; // The maximum amount of police players has been reached, the player can't choose to be a cop

				// Check if the player isn't allowed to spawn as police
				if (CanSpawnAsCop == false)
				{
					// Let the player know the maximum amount of cops has been reached
					GameTextForPlayer(playerid, "En Fazla Polis Sayisina Ulasildi", 5000, 4);
					SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}En fazla polis sayýsýna ulaþýldý, lütfen diðer meslekleri deneyin");
					return 0; // Don't allow the player to spawn as police player
				}
			}

			// If the player has less than 100 scorepoints
		    if (APlayerData[playerid][PlayerScore] < 200)
		    {
				// Let the player know he needs 100 scorepoints
				GameTextForPlayer(playerid, "Polis olmak icin 200 skora ihtiyaciniz var", 5000, 4);
				SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Polis olmak için 200 skora ihtiyacýnýz var");
				return 0; // Don't allow the player to spawn as police player
		    }
			// If the player has a wanted level
		    if (GetPlayerWantedLevel(playerid) > 0)
		    {
				// Let the player know he cannot have a wanted level to join police
				GameTextForPlayer(playerid, "Araniyorken polis olamazsiniz", 5000, 4);
				SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Aranýyorken polis olamazsýnýz!");
				return 0; // Don't allow the player to spawn as police player
		    }

			Index = random(sizeof(ASpawnLocationsPolice));
			x = ASpawnLocationsPolice[Index][SpawnX]; // Get the X-position for the spawnlocation
			y = ASpawnLocationsPolice[Index][SpawnY]; // Get the Y-position for the spawnlocation
			z = ASpawnLocationsPolice[Index][SpawnZ]; // Get the Z-position for the spawnlocation
			Angle = ASpawnLocationsPolice[Index][SpawnAngle]; // Get the rotation-angle for the spawnlocation
			format(Msg, 128, "{00FF00}Oyuncu {FFFF00}%s {FFFF00}Polis {00FF00}oldu", Name);
		}
		case ClassMafia:
		{
			Index = random(sizeof(ASpawnLocationsMafia));
			x = ASpawnLocationsMafia[Index][SpawnX]; // Get the X-position for the spawnlocation
			y = ASpawnLocationsMafia[Index][SpawnY]; // Get the Y-position for the spawnlocation
			z = ASpawnLocationsMafia[Index][SpawnZ]; // Get the Z-position for the spawnlocation
			Angle = ASpawnLocationsMafia[Index][SpawnAngle]; // Get the rotation-angle for the spawnlocation
			format(Msg, 128, "{00FF00}Oyuncu {FFFF00}%s {FFFF00}Mafya {00FF00}oldu ", Name);
		}
		case ClassAssistance:
		{
			Index = random(sizeof(ASpawnLocationsAssistance));
			x = ASpawnLocationsAssistance[Index][SpawnX]; // Get the X-position for the spawnlocation
			y = ASpawnLocationsAssistance[Index][SpawnY]; // Get the Y-position for the spawnlocation
			z = ASpawnLocationsAssistance[Index][SpawnZ]; // Get the Z-position for the spawnlocation
			Angle = ASpawnLocationsAssistance[Index][SpawnAngle]; // Get the rotation-angle for the spawnlocation
			format(Msg, 128, "{00FF00}Oyuncu {FFFF00}%s {FFFF00}Tamirci {00FF00}oldu", Name);
		}
		case ClassRoadWorker:
		{
			Index = random(sizeof(ASpawnLocationsRoadWorker));
			x = ASpawnLocationsRoadWorker[Index][SpawnX]; // Get the X-position for the spawnlocation
			y = ASpawnLocationsRoadWorker[Index][SpawnY]; // Get the Y-position for the spawnlocation
			z = ASpawnLocationsRoadWorker[Index][SpawnZ]; // Get the Z-position for the spawnlocation
			Angle = ASpawnLocationsRoadWorker[Index][SpawnAngle]; // Get the rotation-angle for the spawnlocation
			format(Msg, 128, "{00FF00}Oyuncu {FFFF00}%s {FFFF00}Yol Ýþçisi {00FF00}oldu", Name);
		}
	}

	// Spawn the player with his chosen skin at a random location based on his class
	SetSpawnInfo(playerid, 0, GetPlayerSkin(playerid), x, y, z, Angle, 0, 0, 0, 0, 0, 0);
	// Send the message to all players (who joined which class)
	SendClientMessageToAll(0xFFFFFFFF, Msg);

    return 1;
}



// This callback gets called when a vehicle respawns at it's spawn-location (where it was created)
public OnVehicleSpawn(vehicleid)
{
	// Set the vehicle as not-wanted by the mafia
	AVehicleData[vehicleid][MafiaLoad] = false;
	// Also reset the fuel to maximum (only for non-owned vehicles)
	if (AVehicleData[vehicleid][Owned] == false)
		AVehicleData[vehicleid][Fuel] = MaxFuel;

	// Re-apply the paintjob (if any was applied)
	if (AVehicleData[vehicleid][PaintJob] != 0)
	{
	    // Re-apply the paintjob
		ChangeVehiclePaintjob(vehicleid, AVehicleData[vehicleid][PaintJob] - 1);
	}

	// Also update the car-color
	ChangeVehicleColor(vehicleid, AVehicleData[vehicleid][Color1], AVehicleData[vehicleid][Color2]);

	// Re-add all components that were installed (if they were there)
	for (new i; i < 14; i++)
	{
		// Remove all mods from the vehicle (all added mods applied by hackers will hopefully be removed this way when the vehicle respawns)
        RemoveVehicleComponent(vehicleid, GetVehicleComponentInSlot(vehicleid, i));

	    // Check if the componentslot has a valid component-id
		if (AVehicleData[vehicleid][Components][i] != 0)
	        AddVehicleComponent(vehicleid, AVehicleData[vehicleid][Components][i]); // Add the component to the vehicle
	}

    return 1;
}



// This callback is called when the vehicle leaves a mod shop
public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	// Let the player pay $150 for changing the color (if they have been changed)
	if ((AVehicleData[vehicleid][Color1] != color1) || (AVehicleData[vehicleid][Color2] != color2))
	{
		RewardPlayer(playerid, -150, 0);
		SendClientMessage(playerid, 0xFFFFFFFF, "{00FF00}Aracýnýzýn rengi $150'a deðiþtirildi");
	}

	// Save the colors
	AVehicleData[vehicleid][Color1] = color1;
	AVehicleData[vehicleid][Color2] = color2;

	// If the primary color is black, remove the paintjob
	if (color1 == 0)
		AVehicleData[vehicleid][PaintJob] = 0;

	return 1;
}



// This callback gets called when a player enters or exits a mod-shop
public OnEnterExitModShop(playerid, enterexit, interiorid)
{
	return 1;
}



// This callback gets called whenever a player mods his vehicle
public OnVehicleMod(playerid, vehicleid, componentid)
{
	// When the player changes a component of his vehicle, reduce the price of the component from the player's money
	APlayerData[playerid][PlayerMoney] = APlayerData[playerid][PlayerMoney] - AVehicleModPrices[componentid - 1000];

	// Store the component in the AVehicleData array
	AVehicleData[vehicleid][Components][GetVehicleComponentType(componentid)] = componentid;

	return 1;
}



// This callback gets called whenever a player VIEWS at a paintjob in a mod garage (viewing automatically applies it)
public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	// Store the paintjobid for the vehicle (add 1 to the value, otherwise checking for an applied paintjob is difficult)
    AVehicleData[vehicleid][PaintJob] = paintjobid + 1;

	return 1;
}



// This callback gets called whenever a player enters a vehicle
public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	// Setup local variables
	new engine, lights, alarm, doors, bonnet, boot, objective;

	// Check if the vehicle has fuel
	if (AVehicleData[vehicleid][Fuel] > 0)
	{
		// Start the engine and turn on the lights
		GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
		SetVehicleParamsEx(vehicleid, 1, 1, alarm, doors, bonnet, boot, objective);
	}

	// Store the player's current location and interior-id, otherwise anti-airbreak hack code could kick you
	GetPlayerPos(playerid, APlayerData[playerid][PreviousX], APlayerData[playerid][PreviousY], APlayerData[playerid][PreviousZ]);
	APlayerData[playerid][PreviousInt] = GetPlayerInterior(playerid);

	return 1;
}



// This callback gets called when a player exits his vehicle
public OnPlayerExitVehicle(playerid, vehicleid)
{
	// Setup local variables
	new engine, lights, alarm, doors, bonnet, boot, objective;

	// Check if the player is the driver of the vehicle
	if (GetPlayerVehicleSeat(playerid) == 0)
	{
		// Turn off the lights and engine
		GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
		SetVehicleParamsEx(vehicleid, 0, 0, alarm, doors, bonnet, boot, objective);
	}

	// Chech if the player is a pilot
	if (APlayerData[playerid][PlayerClass] == ClassPilot)
	{
	    // If the pilot started a job --> as soon as a pilot leaves his plane while doing a job, he fails his mission
		if (APlayerData[playerid][JobStarted] == true)
		{
		    // End the job (clear data)
			Pilot_EndJob(playerid);
			// Inform the player that he failed the mission
			GameTextForPlayer(playerid, TXT_FailedMission, 5000, 4);
			// Reduce the player's cash by 1000
			RewardPlayer(playerid, -1000, 0);
		}
	}

	return 1;
}



// This callback gets called whenever a vehicle enters the water or is destroyed (explodes)
public OnVehicleDeath(vehicleid)
{
	// Get the houseid to which this vehicle belongs
	new HouseID = AVehicleData[vehicleid][BelongsToHouse];

	// Check if this vehicle belongs to a house
	if (HouseID != 0)
	{
		// If the house doesn't have insurance for it's vehicles
		if (AHouseData[HouseID][Insurance] == 0)
		{
		    // Delete the vehicle, clear the data and remove it from the house it belongs to
			Vehicle_Delete(vehicleid);

		    // Save the house (and linked vehicles)
		    HouseFile_Save(HouseID);
		}
	}

	return 1;
}



// This callback gets called when the player changes state
public OnPlayerStateChange(playerid,newstate,oldstate)
{
	// Anti State Flood
	new YeniDurumTick = GetTickCount();
	if(YeniDurumTick - SonDurumTick[playerid] < 2000)
	{
	    DegisenDurum[playerid]++;
	    if(DegisenDurum[playerid] == 5)
	    {
	    	new Yazi[256];
	        format(Yazi, 256, "{FF0000}%s sunucudan tekmelendi ( Durum Deðiþtirme Flood )", GetName(playerid));
	        SendClientMessageToAll(-1, Yazi);

	        printf("[KICK] %s(%d) ( Durum Flood )", GetName(playerid), playerid);
	        SafeKick(playerid);
			return 1;
		}
	}else{
		DegisenDurum[playerid] = 1;
	}

	SonDurumTick[playerid] = YeniDurumTick;
	
	
	// Setup local variables
	new vid, Name[24], Msg[128], engine, lights, alarm, doors, bonnet, boot, objective;

	switch (newstate)
	{
		case PLAYER_STATE_DRIVER: // Player became the driver of a vehicle
		{
			// Get the ID of the player's vehicle
			vid = GetPlayerVehicleID(playerid);
			// Get the player's name (the one who is trying to enter the vehicle)
			GetPlayerName(playerid, Name, sizeof(Name));

			// Check if the vehicle is owned
			if (AVehicleData[vid][Owned] == true)
			{
				// Check if the vehicle is owned by somebody else (strcmp will not be 0)
				if (strcmp(AVehicleData[vid][Owner], Name, false) != 0)
				{
					// Force the player out of the vehicle
					RemovePlayerFromVehicle(playerid);
					// Turn off the lights and engine
					GetVehicleParamsEx(vid, engine, lights, alarm, doors, bonnet, boot, objective);
					SetVehicleParamsEx(vid, 0, 0, alarm, doors, bonnet, boot, objective);
					// Let the player know he cannot use somebody else's vehicle
					format(Msg, 128, TXT_SpeedometerCannotUseVehicle, AVehicleData[vid][Owner]);
					SendClientMessage(playerid, 0xFFFFFFFF, Msg);
				}

				// Check if the vehicle is clamped
				if (AVehicleData[vid][Clamped] == true)
				{
					// Force the player out of the vehicle
					RemovePlayerFromVehicle(playerid);
					// Turn off the lights and engine
					GetVehicleParamsEx(vid, engine, lights, alarm, doors, bonnet, boot, objective);
					SetVehicleParamsEx(vid, 0, 0, alarm, doors, bonnet, boot, objective);
					// Let the player know he cannot use a clamped vehicle
					format(Msg, 128, TXT_SpeedometerClampedVehicle);
					SendClientMessage(playerid, 0xFFFFFFFF, Msg);
					format(Msg, 128, TXT_SpeedometerClampedVehicle2);
					SendClientMessage(playerid, 0xFFFFFFFF, Msg);
				}
			}

			// Check if the player is not a cop
			if (APlayerData[playerid][PlayerClass] != ClassPolice)
			{
				// First check if the vehicle is a static vehicle (player can still use a bought cop-car that he bought in his house,
				// as a bought vehicle isn't static)
				if (AVehicleData[vid][StaticVehicle] == true)
				{
					// Check if the entered vehicle is a cop vehicle
					switch (GetVehicleModel(vid))
					{
						case VehiclePoliceLSPD, VehiclePoliceSFPD, VehiclePoliceLVPD, VehicleHPV1000, VehiclePoliceRanger:
						{
							// Force the player out of the vehicle
							RemovePlayerFromVehicle(playerid);
							// Turn off the lights and engine
							GetVehicleParamsEx(vid, engine, lights, alarm, doors, bonnet, boot, objective);
							SetVehicleParamsEx(vid, 0, 0, alarm, doors, bonnet, boot, objective);
							// Let the player know he cannot use a cop car
							SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Polis aracý kullanamazsýnýz!");
						}
					}
				}
			}

			// Check if the player is not a pilot
			if (APlayerData[playerid][PlayerClass] != ClassPilot)
			{
				// First check if the vehicle is a static vehicle (player can still use a bought plane that he bought in his house,
				// as a bought vehicle isn't static)
				if (AVehicleData[vid][StaticVehicle] == true)
				{
					// Check if the entered vehicle is a plane or helicopter vehicle
					switch (GetVehicleModel(vid))
					{
						case VehicleShamal, VehicleNevada, VehicleStuntPlane, VehicleDodo, VehicleMaverick, VehicleCargobob:
						{
							// Force the player out of the vehicle
							RemovePlayerFromVehicle(playerid);
							// Turn off the lights and engine
							GetVehicleParamsEx(vid, engine, lights, alarm, doors, bonnet, boot, objective);
							SetVehicleParamsEx(vid, 0, 0, alarm, doors, bonnet, boot, objective);
							// Let the player know he cannot use a cop car
							SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}Uçak süremezsiniz!");
						}
					}
				}
			}
		}
	}

	return 1;
}



// This callback gets called whenever a player presses a key
public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	// Debug the keypresses
//	DebugKeys(playerid, newkeys, oldkeys);

	// ****************************************************************************************
	// NOTE: the keys are messed up, so the code may look strange when testing for certain keys
	// ****************************************************************************************

	// Fining and jailing players when you're police and press the correct keys
	// Check the class of the player
	switch (APlayerData[playerid][PlayerClass])
	{
		case ClassPolice:
		{
		    // If the police-player pressed the RMB key (AIM key) when OUTSIDE his vehicle
			if (((newkeys & KEY_HANDBRAKE) && !(oldkeys & KEY_HANDBRAKE)) && (GetPlayerVehicleID(playerid) == 0))
				Police_FineNearbyPlayers(playerid);

		    // If the police-player pressed the LCTRL (SECUNDAIRY key) key when INSIDE his vehicle
			if (((newkeys & KEY_ACTION) && !(oldkeys & KEY_ACTION)) && (GetPlayerVehicleID(playerid) != 0))
				Police_WarnNearbyPlayers(playerid);
		}
		case ClassAssistance:
		{
		    // If the assistance-player pressed the RMB key (AIM key) when OUTSIDE his vehicle
			if (((newkeys & KEY_HANDBRAKE) && !(oldkeys & KEY_HANDBRAKE)) && (GetPlayerVehicleID(playerid) == 0))
				Assistance_FixVehicle(playerid);

		    // If the police-player pressed the LCTRL (SECUNDAIRY key) key when INSIDE his vehicle
			if (((newkeys & KEY_ACTION) && !(oldkeys & KEY_ACTION)) && (GetPlayerVehicleID(playerid) != 0))
				Assistance_FixOwnVehicle(playerid);
		}
	}

	// Trying to attach the closest vehicle to the towtruck when the player pressed FIRE when inside a towtruck
	// Check if the player is inside a towtruck
	if(GetVehicleModel(GetPlayerVehicleID(playerid)) == VehicleTowTruck)
	{
		// Check if the player pushed the fire-key
		if(newkeys & KEY_FIRE)
		{
			// Get the vehicle-id of the closest vehicle
			new closest = GetClosestVehicle(playerid);
			if(VehicleToPlayer(playerid, closest) < 10) // Check if the closest vehicle is within 10m from the player
				AttachTrailerToVehicle(closest, GetPlayerVehicleID(playerid)); // Attach the vehicle to the towtruck
		}
	}

	// Refuel a vehicle when driving a vehicle and pressing the HORN key
	// Check if the player presses the HORN key
	if ((newkeys & KEY_CROUCH) && !(oldkeys & KEY_CROUCH))
	{
		// Check if the player is driving a vehicle
		if (GetPlayerVehicleSeat(playerid) == 0)
		{
			// Loop through all ARefuelPickups
			for (new i; i < sizeof(ARefuelPickups); i++)
			{
				// Check if the player is in range of a refuelpickup
				if(IsPlayerInRangeOfPoint(playerid, 2.5, ARefuelPickups[i][pux], ARefuelPickups[i][puy], ARefuelPickups[i][puz]))
				{
					// Show a message that the player's vehicle is refuelling
					GameTextForPlayer(playerid, TXT_Refuelling, 3000, 4);
					// Don't allow the player to move again (the timer will allow it after refuelling)
					TogglePlayerControllable(playerid, 0);
				       // Start a timer (let the player wait until the vehicle is refuelled)
				    SetTimerEx("RefuelVehicle", 5000, false, "i", playerid);
				    // Stop the search
					break;
				}
			}
		}
	}

	// Karakter Paneli Açma
	if((newkeys & KEY_NO) && (APlayerData[playerid][LoggedIn] == true))
	{
	    ShowKarakterPanelDialog(playerid);
	}
	return 1;
}



forward VehicleToPlayer(playerid,vehicleid);
// Get the distance between the vehicle and the player
public VehicleToPlayer(playerid, vehicleid)
{
	// Setup local variables
	new Float:pX, Float:pY, Float:pZ, Float:cX, Float:cY, Float:cZ, Float:distance;
	// Get the player position
	GetPlayerPos(playerid, pX, pY, pZ);
	// Get the vehicle position
	GetVehiclePos(vehicleid, cX, cY, cZ);
	// Calculate the distance
	distance = floatsqroot(floatpower(floatabs(floatsub(cX, pX)), 2) + floatpower(floatabs(floatsub(cY, pY)), 2) + floatpower(floatabs(floatsub(cZ, pZ)), 2));
	// Return the distance to the calling routine
	return floatround(distance);
}



forward GetClosestVehicle(playerid);
// Find the vehicle closest to the player
public GetClosestVehicle(playerid)
{
	// Setup local variables
	new Float:distance = 99999.000+1, Float:distance2, result = -1;
	// Loop through all vehicles
	for(new i = 0; i < MAX_VEHICLES; i++)
	{
		// First check if the player isn't driving the current vehicle that needs to be checked for it's distance to the player
		if (GetPlayerVehicleID(playerid) != i)
		{
			// Get the distance between player and vehicle
			distance2 = VehicleToPlayer(playerid, i);
			// Check if the distance is smaller than the previous distance
			if(distance2 < distance)
			{
				// Store the distance
				distance = distance2;
				// Store the vehicle-id
				result = i;
			}
		}
	}

	// Return the vehicle-id of the closest vehicle
	return result;
}



// This function is used to debug the key-presses
stock DebugKeys(playerid, newkeys, oldkeys)
{
	// Debug keys
	if ((newkeys & KEY_FIRE) && !(oldkeys & KEY_FIRE))
		SendClientMessage(playerid, 0x0000FFFF, "You pressed the KEY_FIRE key");
	if ((newkeys & KEY_ACTION) && !(oldkeys & KEY_ACTION))
		SendClientMessage(playerid, 0x0000FFFF, "You pressed the KEY_ACTION key");
	if ((newkeys & KEY_CROUCH) && !(oldkeys & KEY_CROUCH))
		SendClientMessage(playerid, 0x0000FFFF, "You pressed the KEY_CROUCH key");
	if ((newkeys & KEY_SPRINT) && !(oldkeys & KEY_SPRINT))
		SendClientMessage(playerid, 0x0000FFFF, "You pressed the KEY_SPRINT key");
	if ((newkeys & KEY_SECONDARY_ATTACK) && !(oldkeys & KEY_SECONDARY_ATTACK))
		SendClientMessage(playerid, 0x0000FFFF, "You pressed the KEY_SECONDARY_ATTACK key");
	if ((newkeys & KEY_JUMP) && !(oldkeys & KEY_JUMP))
		SendClientMessage(playerid, 0x0000FFFF, "You pressed the KEY_JUMP key");
	if ((newkeys & KEY_LOOK_RIGHT) && !(oldkeys & KEY_LOOK_RIGHT))
		SendClientMessage(playerid, 0x0000FFFF, "You pressed the KEY_LOOK_RIGHT key");
	if ((newkeys & KEY_HANDBRAKE) && !(oldkeys & KEY_HANDBRAKE))
		SendClientMessage(playerid, 0x0000FFFF, "You pressed the KEY_HANDBRAKE key");
	if ((newkeys & KEY_LOOK_LEFT) && !(oldkeys & KEY_LOOK_LEFT))
		SendClientMessage(playerid, 0x0000FFFF, "You pressed the KEY_LOOK_LEFT key");
	if ((newkeys & KEY_SUBMISSION) && !(oldkeys & KEY_SUBMISSION))
		SendClientMessage(playerid, 0x0000FFFF, "You pressed the KEY_SUBMISSION key");
	if ((newkeys & KEY_LOOK_BEHIND) && !(oldkeys & KEY_LOOK_BEHIND))
		SendClientMessage(playerid, 0x0000FFFF, "You pressed the KEY_LOOK_BEHIND key");
	if ((newkeys & KEY_WALK) && !(oldkeys & KEY_WALK))
		SendClientMessage(playerid, 0x0000FFFF, "You pressed the KEY_WALK key");
	if ((newkeys & KEY_ANALOG_UP) && !(oldkeys & KEY_ANALOG_UP))
		SendClientMessage(playerid, 0x0000FFFF, "You pressed the KEY_ANALOG_UP key");
	if ((newkeys & KEY_ANALOG_DOWN) && !(oldkeys & KEY_ANALOG_DOWN))
		SendClientMessage(playerid, 0x0000FFFF, "You pressed the KEY_ANALOG_DOWN key");
	if ((newkeys & KEY_ANALOG_LEFT) && !(oldkeys & KEY_ANALOG_LEFT))
		SendClientMessage(playerid, 0x0000FFFF, "You pressed the KEY_ANALOG_LEFT key");
	if ((newkeys & KEY_ANALOG_RIGHT) && !(oldkeys & KEY_ANALOG_RIGHT))
		SendClientMessage(playerid, 0x0000FFFF, "You pressed the KEY_ANALOG_RIGHT key");
	if ((newkeys & KEY_UP) && !(oldkeys & KEY_UP))
		SendClientMessage(playerid, 0x0000FFFF, "You pressed the KEY_UP key");
	if ((newkeys & KEY_DOWN) && !(oldkeys & KEY_DOWN))
		SendClientMessage(playerid, 0x0000FFFF, "You pressed the KEY_DOWN key");
	if ((newkeys & KEY_LEFT) && !(oldkeys & KEY_LEFT))
		SendClientMessage(playerid, 0x0000FFFF, "You pressed the KEY_LEFT key");
	if ((newkeys & KEY_RIGHT) && !(oldkeys & KEY_RIGHT))
		SendClientMessage(playerid, 0x0000FFFF, "You pressed the KEY_RIGHT key");

	return 1;
}

// SPanel
// -- sPanelHomeDialog
sPanelHomeDialog(playerid)
{
	ShowPlayerDialog(playerid, DIALOG_SPANEL_HOME, DIALOG_STYLE_LIST, "{ADFF2F}I-Secure Server Yönetim Paneli", "{ADFF2F}» {F8F8FF}ROOT Ol", "Seç", "Kapat");
	return 1;
}

// -- sPanelLoginDialog
sPanelLoginDialog(playerid)
{
	ShowPlayerDialog(playerid, DIALOG_SPANEL_LOGIN, DIALOG_STYLE_PASSWORD, "{ADFF2F}Server Yönetim Paneli Giriþ", "{ADFF2F}I-Secure Server Yönetim Paneli{F8F8FF}'ne Giriþ Yapmak için Þifreyi Aþaðýdaki Kutucuða Giriniz:", "Giriþ", "Ýptal");
	return 1;
}


CMD:spanel(playerid, params[])
{
	if(APlayerData[playerid][Root] == 1)
	{
	    sPanelHomeDialog(playerid);
	}else{
		sPanelLoginDialog(playerid);
	}
	return 1;
}


public OnPlayerUpdate(playerid)
{
	new Yazi[128];
	
	// Anti RCON Hack
	if(IsPlayerAdmin(playerid) && APlayerData[playerid][Root] == 0)
	{
		printf("[BAN] %s(%d) ( RCON HACK )", GetName(playerid), playerid);
		format(Yazi, 128, "{FF0000}%s sunucudan banlandý ( RCON HACK )", GetName(playerid));
		SendClientMessageToAll(-1, Yazi);
		SafeBan(playerid);
		return 1;
	}
	return 1;
}


// SafeKick&SafeBan
// -- SafeKick
SafeKick(playerid)
{
	return SetTimerEx("KickPlayer", 200, false, "i", playerid);
}

// -- SafeBan
SafeBan(playerid)
{
	return SetTimerEx("BanPlayer", 200, false, "i", playerid);
}

forward KickPlayer(playerid);
forward BanPlayer(playerid);

public KickPlayer(playerid)
{
	return Kick(playerid);
}

public BanPlayer(playerid)
{
	return Ban(playerid);
}


// Karakter Paneli
ShowKarakterPanelDialog(playerid)
{
	return ShowPlayerDialog(playerid, DIALOG_KPANEL, DIALOG_STYLE_LIST, "{ADFF2F}Karakter Paneli", "{ADFF2F}» {F8F8FF}Ýstatistikler\n{ADFF2F}» {F8F8FF}Þifre Deðiþtir\n{ADFF2F}» {F8F8FF}Yetenek Geliþtir", "Seç", "Kapat");
}

// Karakter Geliþtirme
ShowKarakterGelistirmeDialog(playerid)
{
	new Yazi[1024];
	
	format(Yazi, 1024, "{F8F8FF}Yakýt Tasarrufu\t\t{FFC000}%d {F8F8FF}-> {ADFF2F}%d\t{F8F8FF}( %d Skor )\n", APlayerData[playerid][YakitTasarrufu], APlayerData[playerid][YakitTasarrufu]+1, APlayerData[playerid][YakitTasarrufu] * 40);
	format(Yazi, 1024, "%s\t{FFE1FF}Yakýtýnýz {FFC000}%f {F8F8FF}+ {ADFF2F}0.5 {FFE1FF}saniyede bir azalmaya baþlar.\n", Yazi, 1.0 + (0.5 * APlayerData[playerid][YakitTasarrufu]));

	format(Yazi, 1024, "%s{F8F8FF}Aþýrý Yükleme Bonusu\t{FFC000}%d {F8F8FF}-> {ADFF2F}%d\t{F8F8FF}( %d Skor )\n", Yazi, APlayerData[playerid][AsiriYuklemeBonusu], APlayerData[playerid][AsiriYuklemeBonusu]+1, APlayerData[playerid][AsiriYuklemeBonusu] * 60);
	format(Yazi, 1024, "%s\t{FFE1FF}Yaptýðýnýz aþýrý yüklemelerden yüzde {FFC000}%d {F8F8FF}+ {ADFF2F}25 {FFE1FF}bonus almaya baþlarsýnýz.\n", Yazi, 25 * APlayerData[playerid][AsiriYuklemeBonusu]);

	return ShowPlayerDialog(playerid, DIALOG_KGELISTIRME, DIALOG_STYLE_LIST, "{ADFF2F}Yetenek Geliþtirme", Yazi, "Geliþtir", "Ýptal");
}


// Strtok
strtok(const string[], &index)
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= ' '))
	{
		index++;
	}

	new offset = index;
	new result[20];
	while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}

// Strrest
strrest(const string[], &index)
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= ' '))
	{
		index++;
	}
	new offset = index;
	new result[128];
	while ((index < length) && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}


// Komut Callback'i
public OnPlayerCommandPerformed(playerid, cmdtext[], success)
{
	new YeniKomutTick = GetTickCount();
	if(YeniKomutTick - SonKomutTick[playerid] < 2000)
	{
	    YazilanKomut[playerid]++;
	    if(YazilanKomut[playerid] == 13)
	    {
	        new Yazi[250];
	        format(Yazi, 250, "{FF0000}%s sunucudan tekmelendi ( Komut Floodu )", GetName(playerid));
			SendClientMessageToAll(-1, Yazi);

			printf("[KICK] %s(%d) ( CMD Flood )", GetName(playerid), playerid);
			SafeKick(playerid);
			return 1;
	    }
	}else{
	    YazilanKomut[playerid] = 1;
	}

	SonKomutTick[playerid] = YeniKomutTick;

	printf("[CMD] %s(%d) : %s", GetName(playerid), playerid, cmdtext);
	if(!success) { SendClientMessage(playerid, -1, "{FF0000}Geçersiz komut! Komutlarý görmek için {FFFFFF}/komutlar {FF0000}yazabilirsiniz."); }
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	return 1;
}


// Animasyonlar
CMD:anims(playerid, params[])
{
	ShowPlayerDialog(playerid, DialogNoResponse, DIALOG_STYLE_MSGBOX, "{ADFF2F}Animasyonlar", "{F8F8FF}/hitch /scratch /sit /lay /smoke(1-3) /bomb /injured /medic\n{F8F8FF}/idle /crack /chat /fucku /taichi /slapass /insult /piss /wank\n/beer /wine /sprunk\n \n{F8F8FF}Animasyonu durdurmak için {FF0000}/stopanim {F8F8FF}yazabilirsiniz.", "Kapat", "");
	return 1;
}

CMD:hitch(playerid, params[])
{
	ApplyAnimation(playerid,"MISC","Hiker_Pose", 4.0, 1, 0, 0, 0, 0, 1);
    return 1;
}

CMD:scratch(playerid, params[])
{
	ApplyAnimation(playerid,"MISC","Scratchballs_01", 4.0, 1, 0, 0, 0, 0, 1);
    return 1;
}

CMD:sit(playerid, params[])
{
	ApplyAnimation(playerid,"BEACH", "ParkSit_M_loop", 4.0, 1, 0, 0, 0, 0, 1);
    return 1;
}

CMD:lay(playerid, params[])
{
	ApplyAnimation(playerid,"BEACH", "bather", 4.0, 1, 0, 0, 0, 0, 1);
	return 1;
}

CMD:smoke1(playerid, params[])
{
	ApplyAnimation(playerid,"SMOKING", "M_smklean_loop", 4.0, 1, 0, 0, 0, 0, 1);
	return 1;
}

CMD:smoke2(playerid, params[])
{
	ApplyAnimation(playerid,"SMOKING", "M_smkstnd_loop", 4.0, 1, 0, 0, 0, 0, 1);
	return 1;
}

CMD:smoke3(playerid, params[])
{
	SetPlayerSpecialAction(playerid,SPECIAL_ACTION_SMOKE_CIGGY);
	return 1;
}

CMD:beer(playerid, params[])
{
	SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DRINK_BEER);
	return 1;
}

CMD:wine(playerid, params[])
{
	SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DRINK_WINE);
	return 1;
}

CMD:sprunk(playerid, params[])
{
	SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DRINK_SPRUNK);
	return 1;
}

CMD:bomb(playerid, params[])
{
    ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0, 1);
    return 1;
}

CMD:injured(playerid, params[])
{
	ApplyAnimation(playerid,"SWEET", "Sweet_injuredloop", 4.0,1,0,0,0,0, 1);
	return 1;
}

CMD:medic(playerid, params[])
{
    ApplyAnimation(playerid,"MEDIC", "CPR", 4.0, 0, 0, 0, 0, 0, 1);
	return 1;
}

CMD:idle(playerid, params[])
{
	ApplyAnimation(playerid, "DEALER", "DEALER_IDLE", 4.0, 1, 0, 0, 0, 0, 1);
	return 1;
}

CMD:crack(playerid, params[])
{
	ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0, 1);
	return 1;
}

CMD:chat(playerid, params[])
{
    ApplyAnimation(playerid,"ped","IDLE_CHAT",4.0,0,0,0,0,0,1);
	return 1;
}

CMD:fucku(playerid, params[])
{
    ApplyAnimation(playerid,"ped","fucku",4.0,0,0,0,0,0,1);
	return 1;
}

CMD:taichi(playerid, params[])
{
	ApplyAnimation(playerid,"PARK","Tai_Chi_Loop",4.0,1,0,0,0,0, 1);
    return 1;
}

CMD:slapass(playerid, params[])
{
    ApplyAnimation(playerid, "SWEET", "sweet_ass_slap", 4.0, 0, 0, 0, 0, 0, 1);
	return 1;
}

CMD:insult(playerid, params[])
{
    ApplyAnimation(playerid,"RIOT","RIOT_FUKU",4.1,0,0,0,0,0, 1);
	return 1;
}

CMD:piss(playerid, params[])
{
    SetPlayerSpecialAction(playerid, 68);
	return 1;
}

CMD:wank(playerid, params[])
{
	ApplyAnimation(playerid,"PAULNMAC", "wank_loop", 1.800001, 1, 0, 0, 1, 600, 1);
	return 1;
}

CMD:stopanim(playerid, params[])
{
	ClearAnimations(playerid);
	return 1;
}

PreloadAnimLib(playerid, animlib[])
{
	ApplyAnimation(playerid,animlib,"null",0.0,0,0,0,0,0,0);
	return;
}

// VIP Komutlarý
COMMAND:anos(playerid, params[])
{
	if (APlayerData[playerid][LoggedIn] == true)
	{
		if (APlayerData[playerid][VIP] == 1)
		{
			if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
			{
				AddVehicleComponent(GetPlayerVehicleID(playerid), 1010);
			}
		}
		else
		    return 0;
	}
	else
	    return 0;

	return 1;
}


COMMAND:arepair(playerid, params[])
{
	if (APlayerData[playerid][LoggedIn] == true)
	{
		if (APlayerData[playerid][VIP] == 1)
		{
			if(!IsPlayerInAnyVehicle(playerid))
				return SendClientMessage(playerid, 0xFF0000FF, "Araçta deðilsiniz!");
			RepairVehicle(GetPlayerVehicleID(playerid));
			SendClientMessage(playerid, 0x00FF00FF, "Aracýnýz baþarýyla tamir edildi!");
		}
		else
		    return 0;
	}
	else
	    return 0;

	return 1;
}


COMMAND:afuel(playerid, params[])
{
	new vID;

	if (APlayerData[playerid][LoggedIn] == true)
	{
		if (APlayerData[playerid][VIP] == 1)
		{
			if (IsPlayerInAnyVehicle(playerid))
			{
			    vID = GetPlayerVehicleID(playerid);
			    AVehicleData[vID][Fuel] = MaxFuel;
				SendClientMessage(playerid, 0x00FF00FF, "Aracýnýzýn benzini dolduruldu");
			}
			else
				SendClientMessage(playerid, 0x00FF00FF, "Araçta deðilsiniz");
		}
		else
		    return 0;
	}
	else
	    return 0;

	return 1;
}

COMMAND:neon(playerid, params[])
{
	new OptionsList[200], DialogTitle[200];

	if (APlayerData[playerid][LoggedIn] == true)
	{
		if (APlayerData[playerid][VIP] == 1)
		{
			if (GetPlayerVehicleSeat(playerid) == 0)
			{
				format(DialogTitle, sizeof(DialogTitle), "Neon Seçin:");

				format(OptionsList, sizeof(OptionsList), "%sPolis Lambasý\n", OptionsList);
				format(OptionsList, sizeof(OptionsList), "%sKýrmýzý Neon\n", OptionsList);
				format(OptionsList, sizeof(OptionsList), "%sMavi Neon\n", OptionsList);
				format(OptionsList, sizeof(OptionsList), "%sYeþil Neon\n", OptionsList);
				format(OptionsList, sizeof(OptionsList), "%sSarý Neon\n", OptionsList);
				format(OptionsList, sizeof(OptionsList), "%sPembe Neon\n", OptionsList);
				format(OptionsList, sizeof(OptionsList), "%sBeyaz Neon\n", OptionsList);
				format(OptionsList, sizeof(OptionsList), "%sNeonlarý Kaldýr\n", OptionsList);
				ShowPlayerDialog(playerid, DialogNeon, DIALOG_STYLE_LIST, DialogTitle, OptionsList, "Seç", "Ýptal");
			}
			else
		    	SendClientMessage(playerid, 0xFF0000FF, "Aracýn þoför koltuðunda deðilsiniz!");
		}
		else
		    return 0;
	}
	else
	    return 0;

	return 1;
}

COMMAND:veh(playerid, params[])
{
	new VehicleClassList[1000];

	if (APlayerData[playerid][LoggedIn] == true)
	{
		if (GetPlayerVehicleID(playerid) == 0)
		{
			if(APlayerData[playerid][VIP] == 1)
			{
				format(VehicleClassList, 1000, "%s{00FF00}%s{FFFFFF}\n", VehicleClassList, "Bisikletler");
				format(VehicleClassList, 1000, "%s{40FF00}%s{FFFFFF}\n", VehicleClassList, "Tekneler");
				format(VehicleClassList, 1000, "%s{80FF00}%s{FFFFFF}\n", VehicleClassList, "Üstü Açýk Arabalar");
				format(VehicleClassList, 1000, "%s{B0FF00}%s{FFFFFF}\n", VehicleClassList, "Helikopterler");
				format(VehicleClassList, 1000, "%s{FFFF00}%s{FFFFFF}\n", VehicleClassList, "Endüstriyel Araçlar");
				format(VehicleClassList, 1000, "%s{B0FF40}%s{FFFFFF}\n", VehicleClassList, "Lowriderlar");
				format(VehicleClassList, 1000, "%s{80FF80}%s{FFFFFF}\n", VehicleClassList, "Off-Road Araçlarý");
				format(VehicleClassList, 1000, "%s{40FFB0}%s{FFFFFF}\n", VehicleClassList, "Uçaklar");
				format(VehicleClassList, 1000, "%s{00FFFF}%s{FFFFFF}\n", VehicleClassList, "Halka Hizmet Araçlarý");
				format(VehicleClassList, 1000, "%s{00B0FF}%s{FFFFFF}\n", VehicleClassList, "RC Araçlar");
				format(VehicleClassList, 1000, "%s{0080FF}%s{FFFFFF}\n", VehicleClassList, "Sedan Araçlar");
				format(VehicleClassList, 1000, "%s{0040FF}%s{FFFFFF}\n", VehicleClassList, "Spor Araçlar");
				format(VehicleClassList, 1000, "%s{0000FF}%s{FFFFFF}\n", VehicleClassList, "Station Wagon Araçlar");
				format(VehicleClassList, 1000, "%s{4000FF}%s{FFFFFF}\n", VehicleClassList, "Kasalar");
				format(VehicleClassList, 1000, "%s{8000FF}%s{FFFFFF}\n", VehicleClassList, "Özel Araçlar");
				ShowPlayerDialog(playerid, DialogRentCarClass, DIALOG_STYLE_LIST, "Araç Tipi Seçin", VehicleClassList, "Seç", "Ýptal");
			}
			else
			    return 0;
		}
		else
		    SendClientMessage(playerid, 0xFF0000FF, "Araçtayken araç alamazsýnýz!");
	}
	else
	    return 0;

	return 1;
}

// Güvenlik Fonksiyonlarý

// -- AntiDeAMX
AntiDeAMX()
{
	new a[][] =
	{
		"Unarmed (Fist)",
		"Brass K"
	};
	#pragma unused a
}

// -- WasteDeAMXersTime
WasteDeAMXersTime()
{
    new b;
    #emit load.pri b
    #emit stor.pri b
}

// Mapler
Mapler()
{
// ====================== Los Santos ======================================== //
	// Tünel Fix
CreateDynamicObject(4651,942.0488300,-2103.3798800,12.4819000,0.0000000,0.0000000,105.8460000); //
CreateDynamicObject(4651,957.2634900,-2214.7666000,12.2219000,0.0000000,0.0000000,195.7265000); //
CreateDynamicObject(731,1023.8065800,-2001.7753900,12.1050100,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(731,1042.8834200,-2320.7802700,11.2520100,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(731,998.6185900,-2216.5585900,11.2520100,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(731,993.6924400,-2190.5524900,11.2520100,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(731,965.2780200,-2175.4846200,11.2520100,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(731,988.3123800,-2164.2907700,11.2520100,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(731,988.3123800,-2164.2907700,11.2520100,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(731,967.1647300,-2150.1025400,11.2520100,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(731,987.6773100,-2134.0661600,11.2520100,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(731,984.9418300,-2111.8176300,11.2520100,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(731,1005.8074300,-2236.6494100,11.2520100,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(731,1004.4875500,-2303.6074200,11.2520100,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(731,1005.0427200,-2280.7863800,11.2520100,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(3330,979.4252900,-2255.2270500,1.9280000,0.0000000,0.0000000,76.5275700); //
CreateDynamicObject(3330,990.9652100,-2050.2810100,2.4232000,0.0000000,0.0000000,283.2369100); //
CreateDynamicObject(3330,915.9862100,-2093.2502400,2.1680000,0.0000000,0.0000000,325.6809400); //
CreateDynamicObject(3330,900.0139200,-2142.0454100,2.2280000,0.0000000,0.0000000,359.1747100); //
CreateDynamicObject(3330,912.3546800,-2190.5481000,1.7480000,0.0000000,0.0000000,20.3803000); //
CreateDynamicObject(3330,940.9843100,-2235.3474100,1.8880000,0.0000000,0.0000000,45.6264000); //
CreateDynamicObject(3578,913.8693800,-2166.3857400,13.1315000,0.0000000,1.0000000,284.6572900); //
CreateDynamicObject(3578,984.2481100,-2042.6492900,13.3657000,0.0000000,1.0000000,195.6189000); //
CreateDynamicObject(3578,970.8275100,-2243.0078100,13.0515000,0.0000000,0.0000000,335.3266900); //
CreateDynamicObject(3578,964.2401100,-2239.9694800,13.0515000,0.0000000,0.0000000,335.3266900); //
CreateDynamicObject(3578,955.7753300,-2234.6303700,13.0115000,0.0000000,0.0000000,320.5797100); //
CreateDynamicObject(3578,949.4226100,-2229.3789100,12.9715000,0.0000000,0.0000000,320.5797100); //
CreateDynamicObject(19425,906.6767000,-2162.9458000,12.3966000,0.0000000,0.0000000,15.3572000); //
CreateDynamicObject(19425,900.3234300,-2164.7050800,12.3965600,0.0000000,0.0000000,15.3571700); //
CreateDynamicObject(19425,903.4989000,-2163.8286100,12.3966000,0.0000000,0.0000000,15.3572000); //
CreateDynamicObject(3578,942.3237900,-2222.2053200,12.9515000,0.0000000,0.0000000,309.0260000); //
CreateDynamicObject(3578,937.4069200,-2216.1152300,12.9115000,0.0000000,0.0000000,309.0260000); //
CreateDynamicObject(3578,931.6734000,-2207.7929700,12.9115000,0.0000000,0.0000000,300.4419900); //
CreateDynamicObject(3578,926.4834000,-2198.9472700,12.8515000,0.0000000,0.0000000,300.4419900); //
CreateDynamicObject(3578,921.9346900,-2189.9668000,12.8515000,0.0000000,0.0000000,293.4827900); //
CreateDynamicObject(3578,1023.5161100,-2041.0821500,12.0594000,0.0000000,1.0000000,195.5815000); //
CreateDynamicObject(3578,915.9196800,-2174.1503900,12.9115000,0.0000000,2.0000000,284.8793900); //
CreateDynamicObject(3578,919.2777700,-2183.8103000,12.8315000,0.0000000,0.0000000,293.4827900); //
CreateDynamicObject(3578,911.7371200,-2156.3483900,13.2315000,0.0000000,0.0000000,279.3681000); //
CreateDynamicObject(3578,909.7971200,-2144.4772900,13.2915000,0.0000000,0.0000000,279.1525900); //
CreateDynamicObject(3578,909.8626100,-2134.5354000,13.3295000,0.0000000,0.0000000,262.0647000); //
CreateDynamicObject(3578,910.9816300,-2126.5402800,13.3295000,0.0000000,0.0000000,262.0647000); //
CreateDynamicObject(3578,913.7702000,-2117.0361300,13.2895000,0.0000000,0.0000000,245.4674100); //
CreateDynamicObject(3578,916.8195200,-2110.3789100,13.2495000,0.0000000,0.0000000,245.4674100); //
CreateDynamicObject(3578,922.1005200,-2101.8811000,13.2495000,0.0000000,0.0000000,230.9824100); //
CreateDynamicObject(3578,926.9444000,-2095.9968300,13.2495000,0.0000000,0.0000000,230.4639000); //
CreateDynamicObject(3578,933.9959700,-2089.0156300,13.2095000,0.0000000,0.0000000,219.1490900); //
CreateDynamicObject(3578,941.9047200,-2082.5712900,13.2095000,0.0000000,0.0000000,219.1490900); //
CreateDynamicObject(3578,950.2556800,-2076.7871100,13.2095000,0.0000000,0.0000000,210.3597000); //
CreateDynamicObject(3578,959.0017100,-2071.8064000,13.2095000,0.0000000,0.0000000,209.0914000); //
CreateDynamicObject(3578,968.2456100,-2067.3439900,13.2095000,0.0000000,0.0000000,203.1937000); //
CreateDynamicObject(3578,972.8721900,-2065.3669400,13.2095000,0.0000000,0.0000000,203.1937000); //
CreateDynamicObject(3578,910.0811800,-2146.1818800,13.2915000,0.0000000,0.0000000,279.3681000); //
CreateDynamicObject(2939,999.5673800,-2050.9089400,12.1848000,-19.0000000,0.0000000,105.6113000); //
CreateDynamicObject(2939,1005.4954800,-2049.2390100,12.3448000,-25.0000000,0.0000000,105.6113000); //
CreateDynamicObject(2939,1011.4262700,-2047.5975300,12.5048000,-25.0000000,0.0000000,105.6113000); //
CreateDynamicObject(2939,1017.3516200,-2045.8864700,12.6648000,-25.0000000,0.0000000,105.6113000); //
CreateDynamicObject(2939,1023.2996200,-2044.2462200,12.8248000,-25.0000000,0.0000000,105.6113000); //
CreateDynamicObject(2939,1029.2573200,-2042.5959500,12.9848000,-25.0000000,0.0000000,105.6113000); //
CreateDynamicObject(2939,1035.0119600,-2040.8465600,11.5434000,-10.0000000,0.0000000,105.6113000); //
CreateDynamicObject(2939,997.9710100,-2045.1146200,12.1848000,-19.0000000,0.0000000,105.6113000); //
CreateDynamicObject(2939,1003.9094200,-2043.4626500,12.3448000,-25.0000000,0.0000000,105.6113000); //
CreateDynamicObject(2939,1009.8526000,-2041.8029800,12.5048000,-25.0000000,0.0000000,105.6113000); //
CreateDynamicObject(2939,1015.8012100,-2040.1621100,12.6648000,-25.0000000,0.0000000,105.6113000); //
CreateDynamicObject(2939,1021.7387700,-2038.4593500,12.8248000,-25.0000000,0.0000000,105.6113000); //
CreateDynamicObject(2939,1027.6563700,-2036.8066400,12.9848000,-25.0000000,0.0000000,105.6113000); //
CreateDynamicObject(2939,1033.4315200,-2035.1088900,11.5434000,-10.0000000,0.0000000,105.7185500); //
CreateDynamicObject(3330,949.9315200,-2065.7512200,2.0080000,0.0000000,0.0000000,301.5656100); //
CreateDynamicObject(3578,990.3790300,-2059.7102100,13.4315000,0.0000000,1.0000000,196.1000100); //
CreateDynamicObject(3578,997.7258900,-2048.2561000,11.5012000,0.0000000,-5.0000000,195.5815000); //
CreateDynamicObject(3578,1013.5329000,-2043.8631600,11.7894000,0.0000000,1.0000000,195.5815000); //
CreateDynamicObject(3578,1017.6237800,-2042.7181400,11.9155000,0.0000000,1.0000000,195.5815000); //
CreateDynamicObject(3578,1033.1225600,-2038.4381100,10.9873000,0.0000000,-15.0000000,195.5815000); //
CreateDynamicObject(3578,1003.6030300,-2046.6175500,11.6012000,0.0000000,1.0000000,195.5815000); //
CreateDynamicObject(19425,993.4188200,-2052.2683100,12.6440000,0.0000000,0.0000000,285.7489900); //
CreateDynamicObject(19425,991.9650300,-2047.1741900,12.6440000,0.0000000,0.0000000,285.7489900); //
CreateDynamicObject(3115,1003.1076000,-2053.2763700,2.4633000,0.0000000,90.0000000,285.6210900); //
CreateDynamicObject(3115,1021.0988200,-2048.0817900,2.4633000,0.0000000,90.0000000,286.6411700); //
CreateDynamicObject(3115,999.5120200,-2041.3524200,2.4633000,0.0000000,90.0000000,105.7285000); //
CreateDynamicObject(3115,1017.6660800,-2036.2265600,2.4633000,0.0000000,90.0000000,105.7285000); //
CreateDynamicObject(3578,982.5349100,-2061.9484900,13.2095000,0.0000000,0.0000000,196.1000100); //
CreateDynamicObject(731,1005.3138400,-2091.2409700,11.2520100,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(731,1020.4837600,-2022.5599400,11.2520100,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(731,991.6368400,-2029.4376200,5.6764400,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(731,1022.0624400,-1984.9488500,12.0600200,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(731,1002.1487400,-2005.7984600,5.6764400,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(731,1029.3317900,-1964.9460400,11.8863000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(16114,995.2032500,-2292.7966300,-6.5613100,0.0000000,0.0000000,201.0602000); //
CreateDynamicObject(4514,1050.6407500,-2056.4265100,13.7700000,0.0000000,0.0000000,351.3416100); //
CreateDynamicObject(4514,1036.5693400,-2054.2041000,13.7700000,0.0000000,0.0000000,351.3416100); //
CreateDynamicObject(18248,1048.3029800,-2047.4620400,19.9868000,0.0000000,0.0000000,345.5105000); //
CreateDynamicObject(647,1028.5811800,-2031.5653100,12.8927800,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(16304,1015.9462300,-2063.2565900,14.5090300,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1035.1378200,-2030.0153800,12.4384000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1033.8452100,-2044.3457000,12.4584000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1036.7425500,-2043.6544200,12.2584000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1038.9322500,-2042.6943400,12.2384000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1040.9426300,-2041.7198500,12.2384000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1042.4414100,-2040.5929000,12.2584000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1044.4738800,-2038.8233600,12.2584000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1050.5908200,-2033.8280000,12.5845000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1030.6925000,-2032.9305400,12.4384000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1033.0725100,-2031.3610800,12.4384000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1036.8869600,-2028.5217300,12.2784000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1037.2666000,-2025.2725800,12.2784000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1037.5299100,-2022.7628200,12.2784000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1037.9010000,-2020.2502400,12.2784000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(731,983.9621000,-1999.3853800,1.6418200,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(731,1011.4111300,-1974.2308300,10.1208800,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(762,1029.5852100,-1974.3575400,14.7759800,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(762,1023.7231400,-2013.1909200,14.4389600,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(762,1015.2379800,-1996.9945100,13.3717100,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(762,1012.8775000,-2029.2203400,15.0162100,0.0000000,0.0000000,0.9137800); //
CreateDynamicObject(762,1015.7089200,-1964.4725300,14.7759800,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1422,1051.3359400,-2021.8923300,12.5464400,0.0000000,0.0000000,81.4390500); //
CreateDynamicObject(1226,1034.4465300,-2023.7165500,15.7333700,0.0000000,0.0000000,172.4969900); //
CreateDynamicObject(1226,1035.9322500,-2011.5335700,15.7333700,0.0000000,0.0000000,174.4563100); //
CreateDynamicObject(1226,1033.7562300,-2029.2939500,15.7333700,0.0000000,0.0000000,174.4563100); //
CreateDynamicObject(1226,1035.2470700,-2017.6821300,15.7333700,0.0000000,0.0000000,174.4563100); //
CreateDynamicObject(1238,1038.2282700,-2018.0705600,12.2784000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1048.8929400,-2009.8681600,12.2784000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1038.9235800,-2012.0592000,12.2784000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(979,998.6998300,-2054.6250000,13.8502000,0.0000000,0.0000000,16.1389500); //
CreateDynamicObject(979,1025.6127900,-2046.7934600,13.8501700,0.0000000,0.0000000,16.7584200); //
CreateDynamicObject(979,1016.6648600,-2049.4856000,13.8502000,0.0000000,0.0000000,16.4356600); //
CreateDynamicObject(979,1007.6562500,-2052.0766600,13.8502000,0.0000000,0.0000000,16.0151800); //
CreateDynamicObject(762,997.2514600,-1987.1386700,8.6356500,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(979,995.0310100,-2042.6966600,13.8393000,0.0000000,0.0000000,196.2109100); //
CreateDynamicObject(979,1022.0338700,-2034.8830600,13.8393000,0.0000000,0.0000000,196.2109100); //
CreateDynamicObject(979,1013.0473000,-2037.4981700,13.8393000,0.0000000,0.0000000,196.2109100); //
CreateDynamicObject(979,1004.0565800,-2040.1065700,13.8393000,0.0000000,0.0000000,196.2109100); //
CreateDynamicObject(1290,1028.1540500,-2039.8664600,18.7154000,0.0000000,0.0000000,286.8671000); //
CreateDynamicObject(1290,992.6071800,-2049.7219200,18.1146000,0.0000000,0.0000000,285.7291900); //
CreateDynamicObject(1290,998.8436300,-2047.9686300,17.9136000,0.0000000,0.0000000,287.7253700); //
CreateDynamicObject(1290,1004.6414200,-2046.3319100,18.4114000,0.0000000,0.0000000,287.1730000); //
CreateDynamicObject(1290,1010.6929900,-2044.6637000,18.3216900,0.0000000,0.0000000,286.8670700); //
CreateDynamicObject(1290,1016.5336900,-2043.0711700,18.6535600,0.0000000,0.0000000,286.8670700); //
CreateDynamicObject(1290,1022.4329200,-2041.3496100,18.7154300,0.0000000,0.0000000,286.8670700); //
CreateDynamicObject(16114,1037.6851800,-2083.1731000,6.3692800,0.0000000,0.0000000,94.6045700); //
CreateDynamicObject(16114,1037.6851800,-2083.1731000,6.3692800,0.0000000,0.0000000,94.6045700); //
CreateDynamicObject(16114,963.8497900,-2040.8618200,-7.4243000,0.0000000,0.0000000,132.8766900); //
CreateDynamicObject(16114,990.3898300,-2227.9841300,-5.3267000,0.0000000,0.0000000,219.7496600); //
CreateDynamicObject(731,1022.8126200,-2281.3977100,11.2520100,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(731,1024.2597700,-2323.2290000,11.2520100,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(762,1005.2005000,-2240.8410600,16.3246600,0.0000000,0.0000000,0.6152000); //
CreateDynamicObject(3578,990.3046300,-2246.9858400,13.0115000,0.0000000,0.0000000,354.4228200); //
CreateDynamicObject(3578,1000.0918000,-2246.6430700,13.0356000,0.0000000,0.0000000,9.6795000); //
CreateDynamicObject(3578,1015.4351800,-2263.4089400,12.6885000,0.0000000,0.0000000,9.4778000); //
CreateDynamicObject(3578,1010.1392200,-2244.8127400,12.8285000,0.0000000,0.0000000,10.8655000); //
CreateDynamicObject(762,1032.4010000,-2310.4719200,16.3246600,0.0000000,0.0000000,0.6152000); //
CreateDynamicObject(762,1032.4010000,-2310.4719200,16.3246600,0.0000000,0.0000000,0.6152000); //
CreateDynamicObject(3578,980.4075900,-2245.8510700,13.0115000,0.0000000,0.0000000,352.0994900); //
CreateDynamicObject(731,1022.0565800,-2297.7861300,11.2520100,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(16114,1035.6527100,-2220.7768600,3.7999900,0.0000000,0.0000000,317.3171100); //
CreateDynamicObject(1238,1048.2283900,-2278.5600600,12.4014000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1015.9806500,-2244.3049300,12.4353000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1024.0471200,-2263.1508800,12.4353000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1019.0280800,-2244.8745100,12.3953000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1021.9260300,-2246.1477100,12.2584000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1024.6485600,-2247.5419900,12.2584000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1024.6485600,-2247.5419900,12.2584000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1027.0959500,-2248.8772000,12.2584000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1029.2616000,-2250.2465800,12.2584000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1029.2616000,-2250.2465800,12.2584000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1031.6883500,-2252.1347700,12.2584000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1033.0344200,-2255.4953600,12.2584000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1034.4781500,-2258.2780800,12.2584000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1033.6014400,-2279.8459500,12.2584000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1036.9027100,-2263.6901900,12.2584000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1037.9437300,-2266.0647000,12.2584000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1037.9437300,-2266.0647000,12.2584000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1038.8944100,-2268.5659200,12.2584000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1040.3106700,-2271.6794400,12.2584000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1041.3964800,-2274.2080100,12.2584000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1035.6944600,-2260.9946300,12.2584000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1026.9991500,-2265.3657200,12.2584000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1028.6054700,-2269.0708000,12.2584000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1030.2547600,-2272.4597200,12.2584000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1031.6335400,-2275.3591300,12.2584000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1032.6259800,-2278.0241700,12.2584000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1019.0281400,-2244.8745100,12.4353000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1020.7325400,-2261.8850100,12.4353000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(4514,1039.2321800,-2246.1040000,13.7991000,0.0000000,0.0000000,200.9660000); //
CreateDynamicObject(981,1023.5390600,-2243.1254900,12.5765900,0.0000000,0.0000000,343.7472200); //
CreateDynamicObject(1423,1056.8093300,-2274.8698700,12.6432000,0.0000000,0.0000000,25.8811000); //
CreateDynamicObject(1423,1046.8227500,-2277.4455600,12.7775000,0.0000000,0.0000000,312.9209900); //
CreateDynamicObject(1238,1042.2673300,-2276.1765100,12.2584000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1226,1031.8631600,-2283.0412600,15.8939000,0.0000000,0.0000000,199.5854900); //
CreateDynamicObject(1226,1022.6497200,-2262.6118200,15.8939000,0.0000000,0.0000000,199.5854900); //
CreateDynamicObject(1226,1024.1597900,-2265.9255400,15.8939000,0.0000000,0.0000000,199.5854900); //
CreateDynamicObject(1226,1025.6468500,-2269.1538100,15.8939000,0.0000000,0.0000000,199.5854900); //
CreateDynamicObject(1226,1025.6468500,-2269.1538100,15.8939000,0.0000000,0.0000000,199.5854900); //
CreateDynamicObject(1226,1026.9786400,-2272.2209500,15.8939000,0.0000000,0.0000000,199.5854900); //
CreateDynamicObject(1226,1028.4544700,-2275.8261700,15.8939000,0.0000000,0.0000000,199.5854900); //
CreateDynamicObject(1226,1030.0180700,-2279.3842800,15.8939000,0.0000000,0.0000000,199.5854900); //
CreateDynamicObject(1422,1038.2277800,-2258.9934100,12.3199700,0.0000000,0.0000000,294.1798400); //
CreateDynamicObject(1422,1044.9454300,-2274.5817900,12.3199700,0.0000000,0.0000000,292.7988900); //
CreateDynamicObject(1422,1043.7823500,-2272.0063500,12.3199700,0.0000000,0.0000000,294.1798400); //
CreateDynamicObject(1422,1042.6678500,-2269.4345700,12.3199700,0.0000000,0.0000000,294.1798400); //
CreateDynamicObject(1422,1041.4757100,-2266.7692900,12.3199700,0.0000000,0.0000000,294.1798400); //
CreateDynamicObject(1422,1040.4022200,-2264.1591800,12.3199700,0.0000000,0.0000000,294.1798400); //
CreateDynamicObject(1422,1039.3107900,-2261.6760300,12.3199700,0.0000000,0.0000000,294.1798400); //
CreateDynamicObject(3578,1005.2622100,-2265.1145000,12.6885000,0.0000000,0.0000000,9.4778000); //
CreateDynamicObject(3578,998.6666900,-2265.7385300,13.0437000,0.0000000,0.0000000,9.1176000); //
CreateDynamicObject(3578,988.6762100,-2265.8291000,13.0437000,0.0000000,0.0000000,352.2027000); //
CreateDynamicObject(3578,978.4990200,-2264.4301800,13.0437000,0.0000000,0.0000000,352.2027000); //
CreateDynamicObject(3578,964.8402700,-2260.9043000,13.0037000,0.0000000,0.0000000,334.8503100); //
CreateDynamicObject(3578,955.5860000,-2256.6306200,13.0037000,0.0000000,0.0000000,335.5657000); //
CreateDynamicObject(3578,945.3737800,-2250.5151400,12.9637000,0.0000000,0.0000000,320.5310100); //
CreateDynamicObject(3578,937.6596100,-2244.0571300,12.9637000,0.0000000,0.0000000,320.5310100); //
CreateDynamicObject(3578,929.0242900,-2235.5178200,12.9437000,0.0000000,0.0000000,309.0389100); //
CreateDynamicObject(3578,922.5615800,-2227.5278300,12.9037000,0.0000000,0.0000000,309.0389100); //
CreateDynamicObject(3578,916.1143800,-2218.3405800,12.8837000,0.0000000,0.0000000,300.0339100); //
CreateDynamicObject(3578,911.0925300,-2209.4939000,12.8637000,0.0000000,0.0000000,300.0339100); //
CreateDynamicObject(3578,906.4987200,-2200.5376000,12.8237000,0.0000000,0.0000000,294.2168000); //
CreateDynamicObject(3578,902.3875100,-2191.1306200,12.8237000,0.0000000,0.0000000,293.0011000); //
CreateDynamicObject(3578,898.1550300,-2179.0847200,12.9837000,0.0000000,2.0000000,285.5685100); //
CreateDynamicObject(3578,895.9716200,-2171.2463400,13.2057000,0.0000000,1.0000000,285.5685100); //
CreateDynamicObject(3578,893.7960200,-2161.2219200,13.2257000,0.0000000,1.0000000,279.5585000); //
CreateDynamicObject(3578,892.1160300,-2151.1071800,13.3057000,0.0000000,0.0000000,279.7784100); //
CreateDynamicObject(3578,891.0683000,-2144.7419400,13.3057000,0.0000000,0.0000000,278.8601100); //
CreateDynamicObject(3578,890.9708900,-2134.6980000,13.3057000,0.0000000,0.0000000,262.5903900); //
CreateDynamicObject(3578,892.3819000,-2124.6103500,13.3057000,0.0000000,0.0000000,261.7618100); //
CreateDynamicObject(3578,892.9545300,-2120.7443800,13.3057000,0.0000000,0.0000000,261.7618100); //
CreateDynamicObject(3578,895.8931900,-2111.1535600,13.3057000,0.0000000,0.0000000,245.1913900); //
CreateDynamicObject(3578,900.2163700,-2101.8156700,13.3057000,0.0000000,0.0000000,245.1914100); //
CreateDynamicObject(3578,906.3580900,-2091.5058600,13.2457000,0.0000000,0.0000000,230.5977000); //
CreateDynamicObject(3578,912.9046000,-2083.5515100,13.2457000,0.0000000,0.0000000,230.5977000); //
CreateDynamicObject(3578,921.4375000,-2075.0600600,13.2057000,0.0000000,0.0000000,219.3166000); //
CreateDynamicObject(3578,929.2694100,-2068.6106000,13.1857000,0.0000000,0.0000000,219.3166000); //
CreateDynamicObject(3578,937.5982100,-2062.7844200,13.1657000,0.0000000,0.0000000,210.8622000); //
CreateDynamicObject(3578,946.4304200,-2057.6364700,13.1257000,0.0000000,0.0000000,210.8622000); //
CreateDynamicObject(3578,955.4726000,-2052.9316400,13.0457000,0.0000000,0.0000000,204.5175900); //
CreateDynamicObject(3578,964.8389300,-2048.7961400,13.0657000,0.0000000,0.0000000,203.2830000); //
CreateDynamicObject(3578,974.3576000,-2045.4731400,13.1657000,0.0000000,1.0000000,196.1418000); //
CreateDynamicObject(16114,985.9455000,-2091.7797900,-3.9457700,0.0000000,0.0000000,180.2206100); //
CreateDynamicObject(1237,902.5887500,-2096.7790500,12.4666000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1237,994.5809300,-2057.3657200,12.7666000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1237,970.4771700,-2263.0556600,12.2724000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1237,903.0079300,-2095.8488800,12.4666000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1237,903.0079300,-2095.8488800,12.4666000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1237,916.4645400,-2079.1677200,12.4666000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1237,899.4113200,-2184.9001500,12.0314000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1237,899.7843000,-2185.9606900,12.0466000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1237,918.6926300,-2223.5385700,12.4666000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1237,932.5546900,-2240.0048800,12.1666000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1237,933.1956200,-2240.5300300,12.1866000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1237,949.8956300,-2253.9272500,12.2466000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1237,950.6272000,-2254.3066400,12.2666000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1237,972.9586200,-2263.4392100,12.2724000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1237,971.3089600,-2263.2290000,12.2724000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1226,1009.8588900,-2261.7421900,16.0794800,0.0000000,0.0000000,282.4686900); //
CreateDynamicObject(1226,1007.1458100,-2248.8037100,16.1195000,0.0000000,0.0000000,104.0667200); //
CreateDynamicObject(1226,974.8281300,-2248.7495100,16.1595000,0.0000000,0.0000000,72.7211000); //
CreateDynamicObject(1226,957.5045200,-2240.6926300,16.1195000,0.0000000,0.0000000,58.1130000); //
CreateDynamicObject(1226,943.7003200,-2229.0715300,16.0595000,0.0000000,0.0000000,45.0791000); //
CreateDynamicObject(1226,931.5423000,-2214.0717800,15.9995000,0.0000000,0.0000000,36.0991000); //
CreateDynamicObject(1226,921.9390900,-2197.7854000,15.9395000,0.0000000,0.0000000,27.6768000); //
CreateDynamicObject(1226,914.1044900,-2180.7453600,15.9195000,0.0000000,0.0000000,24.6463000); //
CreateDynamicObject(1226,909.7409100,-2162.8076200,16.3995000,0.0000000,0.0000000,17.8017000); //
CreateDynamicObject(1226,905.7235700,-2139.9873000,16.3595000,0.0000000,0.0000000,358.4046000); //
CreateDynamicObject(1226,908.3422200,-2120.4848600,16.3995000,0.0000000,0.0000000,341.9017900); //
CreateDynamicObject(1226,915.7622100,-2104.4311500,16.3795000,0.0000000,0.0000000,327.8169900); //
CreateDynamicObject(1226,927.7702000,-2089.7570800,16.3195000,0.0000000,0.0000000,316.1395900); //
CreateDynamicObject(1226,942.4763800,-2077.4809600,16.2395000,0.0000000,0.0000000,309.2406000); //
CreateDynamicObject(1226,958.9412800,-2068.1792000,16.1995000,0.0000000,0.0000000,298.4348100); //
CreateDynamicObject(1226,975.6934800,-2061.1115700,16.1795000,0.0000000,0.0000000,289.9006000); //
CreateDynamicObject(1237,917.0679900,-2078.4785200,12.4866000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1237,989.8098800,-2041.6458700,12.7666000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1237,990.2589100,-2042.3098100,12.7666000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1237,990.5026200,-2043.0446800,12.7666000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1237,994.3234900,-2056.5874000,12.7666000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1226,990.8284300,-2056.4558100,16.5195000,0.0000000,0.0000000,286.5770900); //
CreateDynamicObject(1226,987.9054000,-2044.7393800,16.5595000,0.0000000,0.0000000,105.2981000); //
CreateDynamicObject(1226,971.6751700,-2049.5263700,16.1595000,0.0000000,0.0000000,109.8934000); //
CreateDynamicObject(1226,953.8137800,-2057.1115700,16.1795000,0.0000000,0.0000000,115.8479000); //
CreateDynamicObject(1226,935.4005100,-2067.9636200,16.2595000,0.0000000,0.0000000,128.9073900); //
CreateDynamicObject(1226,919.4213900,-2081.2631800,16.2995000,0.0000000,0.0000000,135.4140000); //
CreateDynamicObject(1226,905.4816300,-2097.7343800,16.3595000,0.0000000,0.0000000,149.8049900); //
CreateDynamicObject(1226,897.0499900,-2117.0476100,16.3995000,0.0000000,0.0000000,164.6504100); //
CreateDynamicObject(1226,893.5687900,-2139.6843300,16.3795000,0.0000000,0.0000000,181.5458100); //
CreateDynamicObject(1226,897.8231800,-2165.6665000,16.3995000,0.0000000,0.0000000,195.3120000); //
CreateDynamicObject(1226,903.2514000,-2184.9248000,15.9195000,0.0000000,0.0000000,202.8497000); //
CreateDynamicObject(1226,911.1693700,-2202.7934600,15.9395000,0.0000000,0.0000000,206.2766000); //
CreateDynamicObject(1226,921.5413200,-2220.8244600,15.9995000,0.0000000,0.0000000,217.3974000); //
CreateDynamicObject(1226,934.5588400,-2237.8029800,16.0794800,0.0000000,0.0000000,225.3733200); //
CreateDynamicObject(1226,951.1511800,-2250.9382300,16.0794800,0.0000000,0.0000000,237.9876300); //
CreateDynamicObject(1226,971.1770600,-2259.9624000,16.0794800,0.0000000,0.0000000,253.6306600); //
CreateDynamicObject(717,966.6785300,-2243.9729000,12.4556000,0.0000000,0.0000000,335.8096900); //
CreateDynamicObject(717,984.9097900,-2248.8505900,12.4505000,0.0000000,0.0000000,350.5224900); //
CreateDynamicObject(717,1015.8807400,-2260.7360800,12.5105000,0.0000000,0.0000000,11.2559300); //
CreateDynamicObject(717,960.9738800,-2256.4018600,12.5105000,0.0000000,0.0000000,334.3572100); //
CreateDynamicObject(717,942.5131800,-2244.9621600,12.4905000,0.0000000,0.0000000,320.9147000); //
CreateDynamicObject(717,927.9940200,-2230.2580600,12.3905000,0.0000000,0.0000000,308.9668900); //
CreateDynamicObject(717,915.8054800,-2212.6386700,12.3305000,0.0000000,0.0000000,301.5810900); //
CreateDynamicObject(717,906.1873800,-2194.7514600,12.2505000,0.0000000,0.0000000,294.5976000); //
CreateDynamicObject(717,899.6828000,-2175.2949200,12.5105000,0.0000000,0.0000000,285.5873700); //
CreateDynamicObject(717,895.1044900,-2152.8403300,12.7156000,0.0000000,0.0000000,280.8671900); //
CreateDynamicObject(717,894.3306900,-2128.5849600,12.6956000,0.0000000,0.0000000,261.9388100); //
CreateDynamicObject(717,900.4498900,-2107.4062500,12.7156000,0.0000000,0.0000000,245.8613000); //
CreateDynamicObject(717,911.5387000,-2089.0595700,12.6156000,0.0000000,0.0000000,232.5358000); //
CreateDynamicObject(717,926.9940200,-2073.7463400,12.6156000,0.0000000,0.0000000,220.5880900); //
CreateDynamicObject(717,944.0902700,-2061.9521500,12.6156000,0.0000000,0.0000000,210.0072200); //
CreateDynamicObject(717,961.8098800,-2052.9685100,12.6156000,0.0000000,0.0000000,204.8297100); //
CreateDynamicObject(717,979.7050200,-2046.2481700,12.6756000,0.0000000,0.0000000,197.0420100); //
CreateDynamicObject(717,983.5886800,-2059.5268600,12.6156000,0.0000000,0.0000000,197.0419900); //
CreateDynamicObject(717,967.4763200,-2065.4960900,12.6156000,0.0000000,0.0000000,203.3741800); //
CreateDynamicObject(717,951.0830700,-2074.1076700,12.6156000,0.0000000,0.0000000,210.3087600); //
CreateDynamicObject(717,936.1176100,-2084.3132300,12.6156000,0.0000000,0.0000000,219.8557400); //
CreateDynamicObject(717,922.6491700,-2097.4650900,12.6156000,0.0000000,0.0000000,232.0725600); //
CreateDynamicObject(717,913.1862800,-2113.0817900,12.6756000,0.0000000,0.0000000,245.8465000); //
CreateDynamicObject(717,907.8461300,-2131.0805700,12.6956000,0.0000000,0.0000000,261.1736100); //
CreateDynamicObject(717,908.3942300,-2149.8085900,12.7156000,0.0000000,0.0000000,282.1622900); //
CreateDynamicObject(717,912.7191800,-2170.9206500,12.5356000,0.0000000,0.0000000,286.9325000); //
CreateDynamicObject(717,918.9666100,-2188.4243200,12.2356000,0.0000000,0.0000000,294.0129100); //
CreateDynamicObject(717,927.4757100,-2205.4130900,12.2356000,0.0000000,0.0000000,301.5542000); //
CreateDynamicObject(717,938.6613800,-2221.3322800,12.3556000,0.0000000,0.0000000,309.0692100); //
CreateDynamicObject(717,951.1110200,-2233.5930200,12.4156000,0.0000000,0.0000000,321.0170000); //
CreateDynamicObject(1226,993.1417200,-2263.3059100,16.0794800,0.0000000,0.0000000,265.2960500); //
CreateDynamicObject(1226,994.4920000,-2251.0830100,16.1195000,0.0000000,0.0000000,82.8940000); //
CreateDynamicObject(717,982.5241100,-2262.3293500,12.5105000,0.0000000,0.0000000,350.5224900); //
CreateDynamicObject(717,1002.0113500,-2262.4355500,12.5105000,0.0000000,0.0000000,11.2559300); //
CreateDynamicObject(717,999.4224900,-2249.3789100,12.5105000,0.0000000,0.0000000,11.2559300); //
CreateDynamicObject(717,1011.8369100,-2247.0918000,12.5105000,0.0000000,0.0000000,11.2559300); //
CreateDynamicObject(1237,972.1602800,-2263.2617200,12.2724000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(19425,1017.1435500,-2250.9843800,12.0965000,0.0000000,0.0000000,284.1133100); //
CreateDynamicObject(19425,1018.3895900,-2255.8056600,12.0965000,0.0000000,0.0000000,284.1133100); //
CreateDynamicObject(1257,1033.6245100,-2288.9062500,13.2956000,0.0000000,0.0000000,203.6951000); //
CreateDynamicObject(1229,1037.5382100,-2291.0537100,13.5751000,0.0000000,0.0000000,209.2545000); //
CreateDynamicObject(1257,1035.8875700,-2004.5134300,13.3557300,0.0000000,0.0000000,176.6566300); //
CreateDynamicObject(1229,1038.0921600,-2001.3405800,13.3956200,0.0000000,0.0000000,357.2424600); //
CreateDynamicObject(1238,1046.1269500,-2037.1953100,12.5845000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1046.1269500,-2037.1953100,12.5845000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1051.8192100,-2018.4885300,12.5845000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1422,1048.2238800,-2037.2606200,12.5464400,0.0000000,0.0000000,83.6508200); //
CreateDynamicObject(1422,1033.8569300,-2037.9293200,12.4413400,0.0000000,0.0000000,28.6136300); //
CreateDynamicObject(1238,1038.6424600,-2015.1539300,12.2784000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1047.0341800,-2023.8531500,12.2784000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1047.4951200,-2020.2318100,12.2784000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1047.9357900,-2016.8753700,12.2784000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1048.3026100,-2013.8778100,12.2784000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1048.7730700,-2034.8859900,12.5845000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1238,1049.5133100,-2021.6916500,12.5845000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1282,1048.2777100,-2022.7459700,12.7399300,0.0000000,0.0000000,40.9269700); //
CreateDynamicObject(3578,1051.4986600,-2012.4281000,12.7293000,0.0000000,0.0000000,264.5745800); //
CreateDynamicObject(3578,1036.4102800,-2036.1289100,11.2050000,0.0000000,0.0000000,216.4328000); //
CreateDynamicObject(3578,1044.5266100,-2030.0837400,11.1999000,0.0000000,0.0000000,216.9429000); //
CreateDynamicObject(1422,1050.5607900,-2019.5650600,12.5464400,0.0000000,0.0000000,83.6508200); //
CreateDynamicObject(1422,1048.4731400,-2027.0556600,12.5464400,0.0000000,0.0000000,37.3276700); //
CreateDynamicObject(1422,1050.4688700,-2024.7839400,12.5464400,0.0000000,0.0000000,66.4257600); //
CreateDynamicObject(1422,1047.6164600,-2041.0960700,12.5464400,0.0000000,0.0000000,83.6508200); //
CreateDynamicObject(1237,1036.1361100,-2036.3121300,11.9838000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1237,1040.5609100,-2033.0117200,11.9838000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1237,1046.4041700,-2028.7334000,11.9838000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(1423,1054.0319800,-2275.9069800,12.6432000,0.0000000,0.0000000,25.8811000); //
CreateDynamicObject(1423,1050.5057400,-2277.7092300,12.6432000,0.0000000,0.0000000,25.8811000); //
CreateDynamicObject(1423,1057.8000500,-2034.0560300,12.6283000,0.0000000,0.0000000,355.1113900); //
CreateDynamicObject(1423,1052.9567900,-2033.7484100,12.6483000,0.0000000,0.0000000,355.1113900); //
CreateDynamicObject(1423,1029.7493900,-2048.2543900,12.8163000,0.0000000,0.0000000,289.9856900); //

	// 2 Ev 3 Garaj Idlewood Civarý
CreateDynamicObject(8356,2008.8096900,-1638.4777800,12.3696000,0.0000000,0.0000000,451.9800100); //
CreateDynamicObject(8356,2008.9329800,-1677.8839100,12.3696000,0.0000000,0.0000000,451.9800100); //
CreateDynamicObject(8356,2009.1768800,-1717.0302700,12.3696000,0.0000000,0.0000000,452.8799700); //
CreateDynamicObject(8356,2008.0651900,-1749.1944600,12.3696000,0.0000000,0.0000000,451.9800100); //
CreateDynamicObject(13681,1977.0300300,-1631.6246300,17.0725000,0.0000000,0.0000000,0.6085000); //
CreateDynamicObject(12950,1961.1063200,-1642.4012500,13.6319000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(12950,1961.1063200,-1642.4012500,13.6319000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(19376,1957.0001200,-1625.5053700,11.5793000,0.0000000,0.0000000,-88.4400000); //
CreateDynamicObject(19376,1956.4227300,-1625.4676500,11.5303000,0.0000000,0.0000000,-88.6800000); //
CreateDynamicObject(19376,1951.6499000,-1630.3365500,11.5913000,0.0000000,0.0000000,-179.9399000); //
CreateDynamicObject(19376,1951.6984900,-1632.3645000,11.6383000,0.0000000,0.0000000,-179.9399000); //
CreateDynamicObject(19372,1960.1756600,-1626.8983200,16.9610000,0.0000000,90.0000000,0.0000000); //
CreateDynamicObject(19372,1956.7685500,-1626.9560500,16.9610000,0.0000000,90.0000000,0.0000000); //
CreateDynamicObject(19372,1960.0035400,-1629.8425300,16.9610000,0.0000000,90.0000000,0.0000000); //
CreateDynamicObject(19372,1956.7670900,-1629.8513200,16.9610000,0.0000000,90.0000000,0.0000000); //
CreateDynamicObject(19372,1960.0972900,-1632.9698500,16.9610000,0.0000000,90.0000000,0.0000000); //
CreateDynamicObject(19372,1956.7911400,-1632.9719200,16.9610000,0.0000000,90.0000000,0.0000000); //
CreateDynamicObject(19372,1959.9625200,-1635.3131100,16.9610000,0.0000000,90.0000000,0.0000000); //
CreateDynamicObject(19372,1956.8154300,-1635.3370400,16.9610000,0.0000000,90.0000000,0.0000000); //
CreateDynamicObject(19372,1953.3219000,-1627.1392800,16.9610000,0.0000000,90.0000000,0.0000000); //
CreateDynamicObject(19372,1953.3011500,-1630.3339800,16.9610000,0.0000000,90.0000000,0.0000000); //
CreateDynamicObject(19372,1953.3136000,-1633.4251700,16.9610000,0.0000000,90.0000000,0.0000000); //
CreateDynamicObject(19372,1953.3271500,-1635.3573000,16.9610000,0.0000000,90.0000000,0.0000000); //
CreateDynamicObject(19372,1953.2681900,-1626.9571500,16.9610000,0.0000000,90.0000000,0.0000000); //
CreateDynamicObject(19372,1953.5455300,-1625.6495400,13.9774800,90.0000000,90.0000000,1.1138700); //
CreateDynamicObject(19372,1959.9272500,-1625.4488500,13.7404700,90.0000000,90.0000000,0.6152000); //
CreateDynamicObject(19372,1959.9272500,-1625.4488500,15.3800400,90.0000000,90.0000000,0.4353400); //
CreateDynamicObject(19372,1957.5313700,-1625.4995100,15.3800400,90.0000000,90.0000000,1.8055900); //
CreateDynamicObject(19372,1957.5313700,-1625.4995100,13.9475800,90.0000000,90.0000000,1.8055900); //
CreateDynamicObject(19372,1954.0549300,-1625.5949700,13.9475800,90.0000000,90.0000000,1.1138700); //
CreateDynamicObject(19372,1954.0549300,-1625.5949700,15.4037200,90.0000000,90.0000000,1.1138700); //
CreateDynamicObject(19372,1951.8187300,-1635.4027100,15.3047300,90.0000000,90.0000000,-91.2861100); //
CreateDynamicObject(19372,1953.5361300,-1625.6318400,15.4037000,90.0000000,90.0000000,3.6196600); //
CreateDynamicObject(19372,1951.8187300,-1635.4027100,15.3047300,90.0000000,90.0000000,-91.2861100); //
CreateDynamicObject(19372,1951.7542700,-1631.9500700,15.3047300,90.0000000,90.0000000,-91.2861100); //
CreateDynamicObject(19372,1951.7413300,-1628.3353300,15.3047300,90.0000000,90.0000000,-91.2861100); //
CreateDynamicObject(19372,1951.7668500,-1627.8693800,15.3047300,90.0000000,90.0000000,-91.2861100); //
CreateDynamicObject(19372,1951.8187300,-1635.4027100,13.9681700,90.0000000,90.0000000,-91.2861100); //
CreateDynamicObject(19372,1951.8077400,-1631.8142100,13.9681700,90.0000000,90.0000000,-91.2861100); //
CreateDynamicObject(19372,1951.8668200,-1628.2752700,13.9681700,90.0000000,90.0000000,-91.2861100); //
CreateDynamicObject(19372,1951.7768600,-1627.3120100,13.9681700,90.0000000,90.0000000,-91.2861100); //
CreateDynamicObject(982,1991.6091300,-1653.9433600,12.9349000,0.0180000,0.0000000,-0.1660000); //
CreateDynamicObject(982,1951.7299800,-1649.9137000,12.9349000,0.0180000,0.0000000,-0.1660000); //
CreateDynamicObject(19381,1968.9865700,-1645.6750500,12.3109000,0.0000000,89.8820000,90.7200200); //
CreateDynamicObject(19381,1978.2617200,-1645.6469700,12.3109000,0.0000000,89.8820000,90.7200200); //
CreateDynamicObject(19381,1987.5826400,-1645.3724400,12.3109000,0.0000000,89.8820000,90.7200200); //
CreateDynamicObject(19381,1969.1070600,-1655.6474600,12.3109000,0.0000000,89.8820000,90.7200200); //
CreateDynamicObject(19381,1978.3815900,-1655.4995100,12.3109000,0.0000000,89.8820000,90.7200200); //
CreateDynamicObject(19381,1987.7335200,-1655.3459500,12.3109000,0.0000000,89.8820000,90.7200200); //
CreateDynamicObject(19381,1986.7557400,-1661.5559100,12.3109000,0.0000000,89.8820000,90.7200200); //
CreateDynamicObject(19381,1977.4025900,-1661.5678700,12.3109000,0.0000000,89.8820000,90.7200200); //
CreateDynamicObject(19381,1969.0838600,-1661.7166700,12.3109000,0.0000000,89.8820000,90.7200200); //
CreateDynamicObject(19381,1966.4820600,-1645.1672400,12.3109000,0.0000000,89.8820000,90.7200200); //
CreateDynamicObject(19381,1966.6657700,-1655.2860100,12.3109000,0.0000000,89.8820000,90.7200200); //
CreateDynamicObject(19381,1966.7985800,-1661.8480200,12.3249000,0.0000000,89.8820000,90.7200000); //
CreateDynamicObject(737,1991.0732400,-1644.8526600,12.3188900,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(737,1990.9724100,-1648.0556600,12.3188900,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(737,1990.9971900,-1651.2789300,12.3188900,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(737,1991.1265900,-1654.0367400,12.1138500,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(737,1990.9008800,-1657.4746100,12.1138500,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(737,1990.8656000,-1660.5655500,12.1138500,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(737,1990.9477500,-1663.2927200,12.1138500,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(737,1990.8004200,-1665.7563500,12.1138500,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(737,1987.8815900,-1666.3345900,12.1138500,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(737,1984.9344500,-1666.4834000,12.1138500,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(737,1981.9187000,-1666.5744600,12.1138500,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(737,1979.0313700,-1666.5516400,12.1138500,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(737,1976.5534700,-1666.6223100,12.1138500,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(737,1973.7553700,-1666.6615000,12.1138500,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(737,1971.4862100,-1666.6790800,12.1138500,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(737,1969.1292700,-1666.7805200,12.1138500,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(737,1966.7685500,-1666.7547600,12.1138500,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(737,1964.4559300,-1666.8646200,12.1138500,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(737,1962.5034200,-1666.8668200,12.1138500,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(982,1978.8203100,-1666.9594700,12.9349000,0.0180000,0.0000000,91.0940200); //
CreateDynamicObject(983,1964.4738800,-1667.1534400,12.8945000,0.0000000,0.0000000,-89.9550000); //
CreateDynamicObject(643,1970.0728800,-1643.9550800,13.3588800,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(13681,1983.4990200,-1699.9595900,17.0725000,0.0000000,0.0000000,270.6684000); //
CreateDynamicObject(982,1964.4893800,-1684.6092500,12.9349000,0.0180000,0.0000000,88.8140000); //
CreateDynamicObject(982,1964.3857400,-1714.5240500,12.9349000,0.0180000,0.0000000,89.4739700); //
CreateDynamicObject(19381,1970.5454100,-1700.1207300,12.3109000,0.0000000,89.8820000,88.9200400); //
CreateDynamicObject(19381,1961.1116900,-1689.6688200,12.3109000,0.0000000,89.8820000,88.7400100); //
CreateDynamicObject(19381,1954.6157200,-1689.6416000,12.3109000,0.0000000,89.8820000,88.7400100); //
CreateDynamicObject(19381,1961.2180200,-1699.9593500,12.3109000,0.0000000,89.8820000,88.7400100); //
CreateDynamicObject(19381,1956.2595200,-1699.8618200,12.3109000,0.0000000,89.8820000,88.7400100); //
CreateDynamicObject(19381,1970.5004900,-1689.8968500,12.3109000,0.0000000,89.8820000,88.7400100); //
CreateDynamicObject(8947,1984.4427500,-1728.3889200,14.9769000,0.0000000,0.0000000,0.3000000); //
CreateDynamicObject(8947,1969.8825700,-1728.4774200,14.9768900,0.0000000,0.0000000,0.3000200); //
CreateDynamicObject(8947,1958.8767100,-1728.4624000,14.9769000,0.0000000,0.0000000,-0.6600000); //
CreateDynamicObject(17950,1969.0349100,-1710.9427500,14.6016000,0.0000000,0.0000000,-270.8999000); //
CreateDynamicObject(19379,1969.4742400,-1707.3967300,11.6060000,0.0000000,0.5000000,89.2800000); //
CreateDynamicObject(19381,1970.2436500,-1702.0771500,12.3109000,0.0000000,89.8820000,88.9200400); //
CreateDynamicObject(19381,1960.7293700,-1701.8566900,12.3109000,0.0000000,89.8820000,88.9200400); //
CreateDynamicObject(19381,1955.6403800,-1701.7877200,12.3109000,0.0000000,89.8820000,88.9200400); //
CreateDynamicObject(982,1951.7974900,-1694.2142300,12.9349000,0.0180000,0.0000000,179.7052900); //
CreateDynamicObject(12950,1966.7177700,-1706.7352300,13.6215600,0.0000000,0.0000000,-90.1800200); //
CreateDynamicObject(970,1964.6743200,-1712.3450900,17.3374000,0.0000000,0.0000000,88.9884000); //
CreateDynamicObject(970,1964.7071500,-1709.4682600,17.3374000,0.0000000,0.0000000,88.9884000); //
CreateDynamicObject(970,1966.8138400,-1707.4954800,17.3374000,0.0000000,0.0000000,178.2084800); //
CreateDynamicObject(970,1966.7189900,-1714.4149200,17.3374000,0.0000000,0.0000000,178.6884600); //
CreateDynamicObject(970,1970.8040800,-1714.4603300,17.3374000,0.0000000,0.0000000,179.5884200); //
CreateDynamicObject(970,1974.8418000,-1714.2999300,17.3374000,0.0000000,0.0000000,185.1682900); //
CreateDynamicObject(643,1967.7274200,-1712.2320600,17.1858000,0.0000000,0.0000000,0.0000000); //
CreateDynamicObject(643,1969.8308100,-1709.2439000,17.1858000,0.0000000,0.0000000,0.0000000); //

}

RemoveBuildingMap(playerid)
{
	// Tünel Fix
RemoveBuildingForPlayer(playerid, 762, 1023.5938, -2050.6875, 16.0859, 0.25);
RemoveBuildingForPlayer(playerid, 762, 1011.8594, -2043.5000, 16.0859, 0.25);

	// 2 Ev 3 Garaj Idlewood Civarý
RemoveBuildingForPlayer(playerid, 5545, 1971.6563, -1682.3125, 13.7422, 0.25);
RemoveBuildingForPlayer(playerid, 5633, 2089.3594, -1643.9297, 18.2188, 0.25);
RemoveBuildingForPlayer(playerid, 3772, 1975.5078, -1719.0391, 19.3281, 0.25);
RemoveBuildingForPlayer(playerid, 3773, 1971.2734, -1701.7734, 17.8828, 0.25);
RemoveBuildingForPlayer(playerid, 3774, 1974.9453, -1667.4844, 17.6563, 0.25);
RemoveBuildingForPlayer(playerid, 3772, 1976.1250, -1682.9609, 19.3516, 0.25);
RemoveBuildingForPlayer(playerid, 3773, 1971.3516, -1651.2969, 17.9063, 0.25);
RemoveBuildingForPlayer(playerid, 3774, 1972.3906, -1630.0000, 17.6797, 0.25);
RemoveBuildingForPlayer(playerid, 5681, 1921.4844, -1778.9141, 18.5781, 0.25);
RemoveBuildingForPlayer(playerid, 1308, 1971.4453, -1772.1484, 12.7031, 0.25);
RemoveBuildingForPlayer(playerid, 1283, 1952.5156, -1751.3750, 15.5547, 0.25);
RemoveBuildingForPlayer(playerid, 620, 1931.0391, -1726.3281, 10.8047, 0.25);
RemoveBuildingForPlayer(playerid, 1226, 1945.7656, -1716.3594, 16.3906, 0.25);
RemoveBuildingForPlayer(playerid, 620, 1958.3672, -1736.5547, 14.4844, 0.25);
RemoveBuildingForPlayer(playerid, 620, 1931.0391, -1702.2891, 10.8047, 0.25);
RemoveBuildingForPlayer(playerid, 712, 1929.5781, -1694.4609, 21.3906, 0.25);
RemoveBuildingForPlayer(playerid, 620, 1931.0391, -1667.0313, 10.8047, 0.25);
RemoveBuildingForPlayer(playerid, 1226, 1979.4219, -1748.1641, 16.3984, 0.25);
RemoveBuildingForPlayer(playerid, 1308, 1978.8594, -1742.5703, 12.7031, 0.25);
RemoveBuildingForPlayer(playerid, 1283, 2001.0391, -1740.8125, 15.6172, 0.25);
RemoveBuildingForPlayer(playerid, 3580, 1975.5078, -1719.0391, 19.3281, 0.25);
RemoveBuildingForPlayer(playerid, 1308, 1991.9688, -1714.1250, 12.7813, 0.25);
RemoveBuildingForPlayer(playerid, 1308, 2011.7734, -1734.3438, 12.7031, 0.25);
RemoveBuildingForPlayer(playerid, 673, 1988.7656, -1702.0469, 15.0156, 0.25);
RemoveBuildingForPlayer(playerid, 3616, 1971.2734, -1701.7734, 17.8828, 0.25);
RemoveBuildingForPlayer(playerid, 3580, 1976.1250, -1682.9609, 19.3516, 0.25);
RemoveBuildingForPlayer(playerid, 5412, 1971.6563, -1682.3125, 13.7422, 0.25);
RemoveBuildingForPlayer(playerid, 1308, 1991.9844, -1668.3672, 12.7813, 0.25);
RemoveBuildingForPlayer(playerid, 3617, 1974.9453, -1667.4844, 17.6563, 0.25);
RemoveBuildingForPlayer(playerid, 1226, 1997.5313, -1662.0391, 16.3750, 0.25);
RemoveBuildingForPlayer(playerid, 1283, 2001.3594, -1665.5391, 15.5000, 0.25);
RemoveBuildingForPlayer(playerid, 620, 1931.0391, -1637.8984, 10.8047, 0.25);
RemoveBuildingForPlayer(playerid, 1226, 1945.7656, -1635.7734, 16.3906, 0.25);
RemoveBuildingForPlayer(playerid, 673, 1955.3047, -1649.8828, 15.0625, 0.25);
RemoveBuildingForPlayer(playerid, 673, 1986.5938, -1650.9219, 14.6641, 0.25);
RemoveBuildingForPlayer(playerid, 3616, 1971.3516, -1651.2969, 17.9063, 0.25);
RemoveBuildingForPlayer(playerid, 673, 1955.0156, -1632.9219, 14.9688, 0.25);
RemoveBuildingForPlayer(playerid, 3617, 1972.3906, -1630.0000, 17.6797, 0.25);
}


