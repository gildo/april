Class Base < Module
  BLABLBALBLBALABL
  BLBLABLABALAABLAA
end
E QUA LA GENTE CI METTE LE SUE FUNZIONI CAZZUTE? E POI LE RICHIAMA CON eval(hash["command"])?
e perchè?
cioè
una volta caricati i moduli quale è il problema?
Cioè dobbiamo gestirci meglio module.rb tipo
def initialize
 @name = name
 @version = version
 ecc
end

li gli diciamo
tipo caricami le funzioni
i patterns
fammi il caffè
e tutto quello che vuoi.
funzioni che trova definite dove? i
l cui nome si trova in un file di config?
si come avevo implementato precedentemente
nei vecchi commit che ti ho fatto vedere in un bel file YAML
ok
com'e' che in ruby carichi una funzione?
fai un modulo
tipo:
module PIRLA
 def ciao
  puts "ciao"
 end
end
poi da un altra parte
fai
include PIRLA
e hai tutte le funzioni del modulo PIRLA

require?
puoi fare
from pirla include funzione
o qualcosa del genere?
uhm non so
sto cercando
tipo python dici?
si
forse con il .
tipo require modules.funzione

come è bello chattare con un editor di testo
lol

allora ricapitoliamo
il nostro bot è connesso ad un server ok?
faccio
bottolo, che ore sono?
bottolo cerca nella lista dei suoi regex
trova tipo
/ore sono/ -> FINDTIME
e findtime vede che ore sono e scrive nel canale
opterei per qualcosa di piu' generico
tipo
tutte quelle cose in cui non ci sta il nome del bot
mv /dev/null
il resto se c'e' tipo ore
allora esegue
per quello basta anche un string.find
a meno che' non servano args
:P

si ma con string.find come dici tu, il bot è poco espandibile
cioè uno si deve modificare a mano tipo strings.rb
no dicevo che basta
poi le regex son meglio
perche' se le decide l'utonto
vabè allora iniziamo a scrivere qualcosa
si ok
pero' io tra 10 minuti vado a letto
domani alle 6.30 devo alzarmi xD

io forse a mare con friends ma il tempo fa schifo
vabbè io mi guardo CSI: MIAMI su IRIS
beato te >.>
vabbe' concludiamo
intanto una vaga idea meglio di prima ce l'abbiamo

domani continuiamo
byez
byts:_D