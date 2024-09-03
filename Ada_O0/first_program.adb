-- joewe275: arbetat enskilt

with Ada.Text_IO;
use Ada.Text_IO;

procedure First_Program is

begin
   Put_Line("Placera ett X inuti den/de ""[ ]"" som motsvarar korrekt(a) alternativ om inte annat");
   Put_Line("anges. Det kan finnas flera korrekta alternativ.");
   New_Line;

   Put_Line("Vad är sant av nedanstående?");
   Put_Line("  [X] Alla uppgifter som finns i kurskartan går att komma åt oavsett färg");
   Put_Line("  [X] Du behöver veta vilken ""assignment"" du skall skicka in din uppgift på i SC och");
   Put_Line("      den informationen finner du på kurshemsidan under ""SC"" i menyn");
   Put_Line("  [X] Man måste skriva in en KORREKT samarbetskommentar i minst en av sina filer när");
   Put_Line("      man skickar in i SC");
   Put_Line("  [X] Alla som samarbetar måste skicka in samma program i SC (med undantag för den s.k.");
   Put_Line("      samarbetskommentaren)");
   Put_Line("  [X] Man skall endast gå på de programmeringsstugor som hör till ens egen grupp");
   Put_Line("  [ ] Man kan skicka in O-uppgifter dygnet runt");
   Put_Line("  [X] Om någon av dina samarbetspartners inte skickar in sin uppgift rättas inte");
   Put_Line("      din uppgift av assistent förrän alla de andra skickat in uppgiften (du hamnar i");
   Put_Line("      ""väntekö"" för rättning)");
   Put_Line("  [ ] Det är helt ok att kopiera programkod från en kompis eller från annat håll");
   Put_Line("  [X] Det är bra att fixa eventuella kompletteringar man får så fort det går");
   New_Line;
   
   Put_Line("När du programmerar använder du olika kommandon i terminalen. Sätt respektive kommandos");
   Put_Line("siffra vid rätt beskrivning:");
   Put_Line("  1. ls             [7] Starta ett körbart program");
   Put_Line("  2. mkdir <NAMN>   [3] ""Går in"" i den angivna katalogen");
   Put_Line("  3. cd <KATALOG>   [6] Kompilerar ett program");
   Put_Line("  4. emacs <FIL>    [2] Skapar en ny katalog med det angivna namnet");
   Put_Line("  5. emacs <FIL> &  [5] Öppnar en fil för editering utan att låsa terminalen");
   Put_Line("  6. gnatmake <FIL> [1] Visar innehåll i nuvarande katalog");
   Put_Line("  7. ./<PROGRAM>    [4] Öppnar en fil för editering och lås terminalen");
   New_Line;
   
   Put_Line("Vad ska du göra när du får kompileringsfel?");
   Put_Line("  [ ] Skriv om den text i programmet som är fel i Emacs. Kompilera om i terminalen.");
   Put_Line("  [ ] Skriv om den text i programmet som är fel i Emacs. Spara filen i Emacs. Kompilera");
   Put_Line("      om i Emacs.");
   Put_Line("  [ ] Skriv om den text i programmet som är fel i terminalen. Spara filen i Emacs.");
   Put_Line("      Kompilera om i terminalen.");
   Put_Line("  [X] Skriv om den text i programmet som är fel i Emacs. Spara filen i Emacs. Kompilera");
   Put_Line("      om i terminalen.");
   New_Line;
   
   Put_Line("I vilken ordning gör du följande saker för att skicka in en uppgift för rättning?");
   Put_Line("Markera med 1 - 4:");
   Put_Line("  [1] Starta SC.");
   Put_Line("  [2] Välj ""Send Assignment"".");
   Put_Line("  [3] Bifoga filer som ska bedömas.");
   Put_Line("  [4] Skicka in.");
   New_Line;
   
   Put_Line("Denna uppgift är den första att skicka in för automaträttning. För att ""garanterat""");
   Put_Line("kunna ge respons med ett så kallat ""kompletteringsmeddelande"" behöver du därför");
   Put_Line("skriva in det hemliga lösenordet (som du ju inte vet just nu och därför blir det ju");
   Put_Line("""fel"" första gången).");
   New_Line;

   Put_Line("OBS! Stava rätt på lösenordet. Varje tecken är viktigt att kontrollera. Noggrannhet är");
   Put_Line("den absolut viktigaste saken som hjälper dig till att snabbare komma igenom uppgifterna");
   Put_Line("senare i kursen.");
   New_Line;

   Put_Line("Skriv in det hemliga lösenordet här: [Programmering är KUL]");
end First_Program;
