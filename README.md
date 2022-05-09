# zykem_kasetki
 1. Skrypt na napady na Kasetki
 2. Skrypt zabiera 0.01ms w bezruchu a 0.05ms podczas napadu
 3. Kod nie jest najlepszy wygladowo, ale jest prosta konfiguracja w config.lua


# Instalacja
1. Pobierz pliki
2. Wrzuc do folderu resources twojego Serwera
3. Otworz config.lua i skonfiguruj tak jak chcesz
4. Otworz sql.sql i odpal.
5. Wpisz ensure zykem_odbierz w server.cfg

# UWAGA
 Mozliwe ze twoj es_extended nie ma funkcji ESX.ShowFloatingHelpNotification. Jezeli tak jest, to wklej to w es_extended/client/functions.lua

 ```
 ESX.ShowFloatingHelpNotification = function(msg, coords)
	AddTextEntry('esxFloatingHelpNotification', msg)
	SetFloatingHelpTextWorldPosition(1, coords)
	SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
	BeginTextCommandDisplayHelp('esxFloatingHelpNotification')
	EndTextCommandDisplayHelp(2, false, false, -1)
end
```

