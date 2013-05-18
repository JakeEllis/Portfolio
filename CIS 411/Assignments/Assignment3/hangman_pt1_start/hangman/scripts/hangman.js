// Select random word to guess
function getWord() {
    var a = new Array('abate', 'aberrant', 'abscond', 'accolade', 'acerbic', 'acumen', 'adulation', 'adulterate',
        'aesthetic', 'aggrandize', 'alacrity', 'alchemy', 'amalgamate', 'ameliorate', 'amenable', 'anachronism',
        'anomaly', 'approbation', 'archaic', 'arduous', 'ascetic', 'assuage', 'astringent', 'audacious', 'austere',
        'avarice', 'aver', 'axiom', 'bolster', 'bombast', 'bombastic', 'bucolic', 'burgeon', 'cacophony', 'canon',
        'canonical', 'capricious', 'castigation', 'catalyst', 'caustic', 'censure', 'chary', 'chicanery', 'cogent',
        'complaisance', 'connoisseur', 'contentious', 'contrite', 'convention', 'convoluted', 'credulous', 'culpable',
        'cynicism', 'dearth', 'decorum', 'demur', 'derision', 'desiccate', 'diatribe', 'didactic', 'dilettante', 'disabuse',
        'discordant', 'discretion', 'disinterested', 'disparage', 'disparate', 'dissemble', 'divulge', 'dogmatic', 'ebullience',
        'eccentric', 'eclectic', 'effrontery', 'elegy', 'eloquent', 'emollient', 'empirical', 'endemic', 'enervate', 'enigmatic',
        'ennui', 'ephemeral', 'equivocate', 'erudite', 'esoteric', 'eulogy', 'evanescent', 'exacerbate', 'exculpate', 'exigent',
        'exonerate', 'extemporaneous', 'facetious', 'fallacy', 'fawn', 'fervent', 'filibuster', 'flout', 'fortuitous', 'fulminate',
        'furtive', 'garrulous', 'germane', 'glib', 'grandiloquence', 'gregarious', 'hackneyed', 'halcyon', 'harangue', 'hedonism',
        'hegemony', 'heretical', 'hubris', 'hyperbole', 'iconoclast', 'idolatrous', 'imminent', 'immutable', 'impassive', 'impecunious',
        'imperturbable', 'impetuous', 'implacable', 'impunity', 'inchoate', 'incipient', 'indifferent', 'inert', 'infelicitous', 'ingenuous',
        'inimical', 'innocuous', 'insipid', 'intractable', 'intransigent', 'intrepid', 'inured', 'inveigle', 'irascible', 'laconic',
        'laud', 'loquacious', 'lucid', 'luminous', 'magnanimity', 'malevolent', 'malleable', 'martial', 'maverick', 'mendacity',
        'mercurial', 'meticulous', 'misanthrope', 'mitigate', 'mollify', 'morose', 'mundane', 'nebulous', 'neologism', 'neophyte',
        'noxious', 'obdurate', 'obfuscate', 'obsequious', 'obstinate', 'obtuse', 'obviate', 'occlude', 'odious', 'onerous',
        'opaque', 'opprobrium', 'oscillation', 'ostentatious', 'paean', 'parody', 'pedagogy', 'pedantic', 'penurious', 'penury',
        'perennial', 'perfidy', 'perfunctory', 'pernicious', 'perspicacious', 'peruse', 'pervade', 'pervasive', 'phlegmatic',
        'pine', 'pious', 'pirate', 'pith', 'pithy', 'placate', 'platitude', 'plethora', 'plummet', 'polemical', 'pragmatic',
        'prattle', 'precipitate', 'precursor', 'predilection', 'preen', 'prescience', 'presumptuous', 'prevaricate', 'pristine',
        'probity', 'proclivity', 'prodigal', 'prodigious', 'profligate', 'profuse', 'proliferate', 'prolific', 'propensity',
        'prosaic', 'pungent', 'putrefy', 'quaff', 'qualm', 'querulous', 'query', 'quiescence', 'quixotic', 'quotidian', 'rancorous',
        'rarefy', 'recalcitrant', 'recant', 'recondite', 'redoubtable', 'refulgent', 'refute', 'relegate', 'renege', 'repudiate',
        'rescind', 'reticent', 'reverent', 'rhetoric', 'salubrious', 'sanction', 'satire', 'sedulous', 'shard', 'solicitous', 'solvent',
        'soporific', 'sordid', 'sparse', 'specious', 'spendthrift', 'sporadic', 'spurious', 'squalid', 'squander', 'static', 'stoic',
        'stupefy', 'stymie', 'subpoena', 'subtle', 'succinct', 'superfluous', 'supplant', 'surfeit', 'synthesis', 'tacit', 'tenacity',
        'terse', 'tirade', 'torpid', 'torque', 'tortuous', 'tout', 'transient', 'trenchant', 'truculent', 'ubiquitous', 'unfeigned',
        'untenable', 'urbane', 'vacillate', 'variegated', 'veracity', 'vexation', 'vigilant', 'vilify', 'virulent', 'viscous', 'vituperate',
        'volatile', 'voracious', 'waver', 'zealous');

  return a[parseInt(Math.random()* a.length)];
}

var canvas = document.getElementById('stage'),
    word = document.getElementById('word'), letters = document.getElementById('letters'),
    wordToGuess, wordLength, badGuesses, correctGuesses;

function init() {
    var helptext = $('#helptext'), w = screen.availWidth <= 800 ? screen.availWidth : 800; //I tried to do an if statement here instead of using the ternary operator like the example has but I guess that doesnt work how I was doing it.

    $('#loading').hide();
    $('#play').css('display', 'inline-block').click(NewGame);
    $('#clear').css('display', 'inline-block').click(resetScore);

    $('#help').click(function (e) {
        $('body').append('<div = "mask"></div>');
        helptext.show().css('margin-left', (w - 300) / 2 + 'px');
    });

    $('#close').click(function (e) {
        $('#mask').remove();
        helptext.hide();
    });

    if (screen.innerWidth >= 700) {
        canvas.getContext('2d').scale(1.5, 1.5);
    }

    if (localStorage.getItem('hangmanWin') == null) {
        localStorage.setItem('hangmanWin', '0');
    }

    if (localStorage.getItem('hangmanLose') == null) {
        localStorage.setItem('hangmanLose', '0');
    }
    showScore();
}

function NewGame() {
    var placeholders = '', frag = document.createDocumentFragment(),
        abc = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'W', 'V', 'X', 'Y', 'Z'];

    badGuesses = 0;
    correctGuesses = 0;
    wordToGuess = getWord();
    wordLength = wordToGuess.length;

    for (var i = 0; i < wordLength; i++) {
        placeholders += '_';
    }
    word.innerHTML = placeholders;

    letters.innerHTML = ' ';
    for (var i = 0; i < 26; i++) {
        var div = document.createElement('div');
        div.style.cursor = 'pointer';
        div.innerHTML = abc[i];
        div.onclick = getLetter;
        frag.appendChild(div);
    }
    letters.appendChild(frag);

    drawCanvas();
}


function getLetter() {
    checkLetter(this.innerHTML);
    this.innerHTML = '&nbsp;';
    this.style.cursor = 'default';
    this.onclick = null;
}

function checkLetter(letter) {
    var placeholders = word.innerHTML, wrongGuess = true;

    placeholders = placeholders.split('');

    for (var i = 0; i < wordLength; i++) {
        if (wordToGuess.charAt(i) == letter.toLowerCase()) {
            placeholders[i] = letter;
            wrongGuess = false;
            correctGuesses++;

            if (correctGuesses == wordLength) {
                drawCanvas()
            }
        }
    }

    if (wrongGuess) {
        badGuesses++;
        drawCanvas();
    }
    word.innerHTML = placeholders.join('');
}

function showResult() {
    var placeholders = word.innerHTML;
    placeholders = placeholders.split('');

    for (var i = 0; i < wordLength; i++) {
        if (placeholders[i] == '_') {
            placeholders[i] = '<span style="color:red">' + wordToGuess.charAt(i).toUpperCase() + '</span>';
        }
    }
    word.innerHTML = placeholders.join('');
}

function showScore() {
    var won = localStorage.getItem('hangmanWin'), lost = localStorage.getItem('hangmanLose'), c = canvas.getContext('2d');
    canvas.width = canvas.width;

    c.font = 'bold 24px Optimer, Arial, Helvetica, sans-serif';
    c.fillStyle = 'red'; c.textAlign = 'center';
    c.fillText('YOUR SCORE: ', 100, 50); c.font = 'bold 18px Optimer, Arial, Helvetica, sans-serif';
    c.fillText('Won: ' + won + ' Lost: ' + lost, 100, 80);
}

function drawCanvas() {
    var c = canvas.getContext('2d');
    
    canvas.width = canvas.width;
    c.lineWidth = 10;
    c.strokeStyle = 'red';
    c.font = 'bold 24px Optimer, Arial, Helvetica, sans-serif';
    c.fillStyle = 'teal';

    drawLine(c, [20, 190], [180, 190]);

    if (badGuesses > 0) {
        c.strokeStyle = 'black';
        drawLine(c, [30, 185], [30, 10]);
    }

    if (badGuesses > 1) {
        c.lineTo(150, 10);
        c.stroke();
    }

    if (badGuesses > 2) {
        c.strokeStyle = '00FF00';
        c.lineWidth = 3;
        drawLine(c, [145, 15], [145, 30]);
        c.beginPath();
        c.moveTo(160, 45);
        c.arc(145, 45, 15, 0, (Math.PI / 180) * 360);
        c.stroke();
    }

    if (badGuesses > 3) {
        drawLine(c, [145, 60], [145, 130]);
    }
    
    if (badGuesses > 4) {
        drawLine(c, [145, 80], [110, 90]);
    }
    
    if (badGuesses > 5) {
        drawLine(c, [145, 80], [180, 90]);
    }
    
    if (badGuesses > 6) {
        drawLine(c, [145, 130], [130, 170]);
    }
    
    if (badGuesses > 7) {
        drawLine(c, [145, 130], [160, 170]);
        c.fillText('YOU LOST!', 45, 110);
        letters.innerHTML = '';
        setTimeout(showResult, 200);

        localStorage.setItem('hangmanLose', 1 + parseInt(localStorage.getItem('hangmanLose')));
        setTimeout(showScore, 2000);
    }

    if (correctGuesses == wordLength) {
        letters.innerHTML = '';
        c.fillText('Nice, You Won!', 45, 110);

        localStorage.setItem('hangmanWin', 1 + parseInt(localStorage.getItem('hangmanWin')));
        setTimeout(showScore, 2000);
    }

}

function drawLine(context, from, to) {
    context.beginPath();
    context.moveTo(from[0], from[1]);
    context.lineTo(to[0], to[1]);
    context.stroke();
}

function resetScore() {
    localStorage.setItem('hangmanWin', '0');
    localStorage.setItem('hangmanLose', '0');
    showScore();
}

