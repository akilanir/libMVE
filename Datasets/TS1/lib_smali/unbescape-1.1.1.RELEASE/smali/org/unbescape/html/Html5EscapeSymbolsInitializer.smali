.class final Lorg/unbescape/html/Html5EscapeSymbolsInitializer;
.super Ljava/lang/Object;
.source "Html5EscapeSymbolsInitializer.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 2316
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2317
    return-void
.end method

.method static initializeHtml5()Lorg/unbescape/html/HtmlEscapeSymbols;
    .registers 11

    .prologue
    const/16 v10, 0x3e

    const/16 v9, 0x3c

    const/16 v8, 0x20d2

    const v7, 0xfe00

    const/16 v6, 0x338

    .line 39
    new-instance v2, Lorg/unbescape/html/HtmlEscapeSymbols$References;

    invoke-direct {v2}, Lorg/unbescape/html/HtmlEscapeSymbols$References;-><init>()V

    .line 48
    .local v2, "html5References":Lorg/unbescape/html/HtmlEscapeSymbols$References;
    const/16 v3, 0x9

    const-string v4, "&Tab;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 49
    const/16 v3, 0xa

    const-string v4, "&NewLine;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 50
    const/16 v3, 0x21

    const-string v4, "&excl;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 51
    const/16 v3, 0x22

    const-string v4, "&quot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 52
    const/16 v3, 0x22

    const-string v4, "&quot"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 53
    const/16 v3, 0x22

    const-string v4, "&QUOT"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 54
    const/16 v3, 0x22

    const-string v4, "&QUOT;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 55
    const/16 v3, 0x23

    const-string v4, "&num;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 56
    const/16 v3, 0x24

    const-string v4, "&dollar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 57
    const/16 v3, 0x25

    const-string v4, "&percnt;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 58
    const/16 v3, 0x26

    const-string v4, "&amp;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 59
    const/16 v3, 0x26

    const-string v4, "&amp"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 60
    const/16 v3, 0x26

    const-string v4, "&AMP"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 61
    const/16 v3, 0x26

    const-string v4, "&AMP;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 62
    const/16 v3, 0x27

    const-string v4, "&apos;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 63
    const/16 v3, 0x28

    const-string v4, "&lpar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 64
    const/16 v3, 0x29

    const-string v4, "&rpar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 65
    const/16 v3, 0x2a

    const-string v4, "&ast;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 66
    const/16 v3, 0x2a

    const-string v4, "&midast;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 67
    const/16 v3, 0x2b

    const-string v4, "&plus;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 68
    const/16 v3, 0x2c

    const-string v4, "&comma;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 69
    const/16 v3, 0x2e

    const-string v4, "&period;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 70
    const/16 v3, 0x2f

    const-string v4, "&sol;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 71
    const/16 v3, 0x3a

    const-string v4, "&colon;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 72
    const/16 v3, 0x3b

    const-string v4, "&semi;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 73
    const-string v3, "&lt;"

    invoke-virtual {v2, v9, v3}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 74
    const-string v3, "&lt"

    invoke-virtual {v2, v9, v3}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 75
    const-string v3, "&LT"

    invoke-virtual {v2, v9, v3}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 76
    const-string v3, "&LT;"

    invoke-virtual {v2, v9, v3}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 77
    const-string v3, "&nvlt;"

    invoke-virtual {v2, v9, v8, v3}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 78
    const/16 v3, 0x3d

    const-string v4, "&equals;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 79
    const/16 v3, 0x3d

    const/16 v4, 0x20e5

    const-string v5, "&bne;"

    invoke-virtual {v2, v3, v4, v5}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 80
    const-string v3, "&gt;"

    invoke-virtual {v2, v10, v3}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 81
    const-string v3, "&gt"

    invoke-virtual {v2, v10, v3}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 82
    const-string v3, "&GT"

    invoke-virtual {v2, v10, v3}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 83
    const-string v3, "&GT;"

    invoke-virtual {v2, v10, v3}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 84
    const-string v3, "&nvgt;"

    invoke-virtual {v2, v10, v8, v3}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 85
    const/16 v3, 0x3f

    const-string v4, "&quest;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 86
    const/16 v3, 0x40

    const-string v4, "&commat;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 87
    const/16 v3, 0x5b

    const-string v4, "&lbrack;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 88
    const/16 v3, 0x5b

    const-string v4, "&lsqb;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 89
    const/16 v3, 0x5c

    const-string v4, "&bsol;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 90
    const/16 v3, 0x5d

    const-string v4, "&rbrack;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 91
    const/16 v3, 0x5d

    const-string v4, "&rsqb;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 92
    const/16 v3, 0x5e

    const-string v4, "&Hat;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 93
    const/16 v3, 0x5f

    const-string v4, "&lowbar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 94
    const/16 v3, 0x5f

    const-string v4, "&UnderBar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 95
    const/16 v3, 0x60

    const-string v4, "&grave;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 96
    const/16 v3, 0x60

    const-string v4, "&DiacriticalGrave;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 97
    const/16 v3, 0x66

    const/16 v4, 0x6a

    const-string v5, "&fjlig;"

    invoke-virtual {v2, v3, v4, v5}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 98
    const/16 v3, 0x7b

    const-string v4, "&lbrace;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 99
    const/16 v3, 0x7b

    const-string v4, "&lcub;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 100
    const/16 v3, 0x7c

    const-string v4, "&verbar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 101
    const/16 v3, 0x7c

    const-string v4, "&vert;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 102
    const/16 v3, 0x7c

    const-string v4, "&VerticalLine;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 103
    const/16 v3, 0x7d

    const-string v4, "&rbrace;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 104
    const/16 v3, 0x7d

    const-string v4, "&rcub;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 105
    const/16 v3, 0xa0

    const-string v4, "&nbsp;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 106
    const/16 v3, 0xa0

    const-string v4, "&nbsp"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 107
    const/16 v3, 0xa0

    const-string v4, "&NonBreakingSpace;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 108
    const/16 v3, 0xa1

    const-string v4, "&iexcl;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 109
    const/16 v3, 0xa1

    const-string v4, "&iexcl"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 110
    const/16 v3, 0xa2

    const-string v4, "&cent;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 111
    const/16 v3, 0xa2

    const-string v4, "&cent"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 112
    const/16 v3, 0xa3

    const-string v4, "&pound;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 113
    const/16 v3, 0xa3

    const-string v4, "&pound"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 114
    const/16 v3, 0xa4

    const-string v4, "&curren;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 115
    const/16 v3, 0xa4

    const-string v4, "&curren"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 116
    const/16 v3, 0xa5

    const-string v4, "&yen;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 117
    const/16 v3, 0xa5

    const-string v4, "&yen"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 118
    const/16 v3, 0xa6

    const-string v4, "&brvbar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 119
    const/16 v3, 0xa6

    const-string v4, "&brvbar"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 120
    const/16 v3, 0xa7

    const-string v4, "&sect;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 121
    const/16 v3, 0xa7

    const-string v4, "&sect"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 122
    const/16 v3, 0xa8

    const-string v4, "&uml;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 123
    const/16 v3, 0xa8

    const-string v4, "&die;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 124
    const/16 v3, 0xa8

    const-string v4, "&uml"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 125
    const/16 v3, 0xa8

    const-string v4, "&Dot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 126
    const/16 v3, 0xa8

    const-string v4, "&DoubleDot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 127
    const/16 v3, 0xa9

    const-string v4, "&copy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 128
    const/16 v3, 0xa9

    const-string v4, "&copy"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 129
    const/16 v3, 0xa9

    const-string v4, "&COPY"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 130
    const/16 v3, 0xa9

    const-string v4, "&COPY;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 131
    const/16 v3, 0xaa

    const-string v4, "&ordf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 132
    const/16 v3, 0xaa

    const-string v4, "&ordf"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 133
    const/16 v3, 0xab

    const-string v4, "&laquo;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 134
    const/16 v3, 0xab

    const-string v4, "&laquo"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 135
    const/16 v3, 0xac

    const-string v4, "&not;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 136
    const/16 v3, 0xac

    const-string v4, "&not"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 137
    const/16 v3, 0xad

    const-string v4, "&shy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 138
    const/16 v3, 0xad

    const-string v4, "&shy"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 139
    const/16 v3, 0xae

    const-string v4, "&reg;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 140
    const/16 v3, 0xae

    const-string v4, "&circledR;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 141
    const/16 v3, 0xae

    const-string v4, "&reg"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 142
    const/16 v3, 0xae

    const-string v4, "&REG"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 143
    const/16 v3, 0xae

    const-string v4, "&REG;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 144
    const/16 v3, 0xaf

    const-string v4, "&macr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 145
    const/16 v3, 0xaf

    const-string v4, "&macr"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 146
    const/16 v3, 0xaf

    const-string v4, "&strns;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 147
    const/16 v3, 0xb0

    const-string v4, "&deg;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 148
    const/16 v3, 0xb0

    const-string v4, "&deg"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 149
    const/16 v3, 0xb1

    const-string v4, "&plusmn;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 150
    const/16 v3, 0xb1

    const-string v4, "&plusmn"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 151
    const/16 v3, 0xb1

    const-string v4, "&pm;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 152
    const/16 v3, 0xb1

    const-string v4, "&PlusMinus;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 153
    const/16 v3, 0xb2

    const-string v4, "&sup2;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 154
    const/16 v3, 0xb2

    const-string v4, "&sup2"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 155
    const/16 v3, 0xb3

    const-string v4, "&sup3;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 156
    const/16 v3, 0xb3

    const-string v4, "&sup3"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 157
    const/16 v3, 0xb4

    const-string v4, "&acute;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 158
    const/16 v3, 0xb4

    const-string v4, "&acute"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 159
    const/16 v3, 0xb4

    const-string v4, "&DiacriticalAcute;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 160
    const/16 v3, 0xb5

    const-string v4, "&micro;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 161
    const/16 v3, 0xb5

    const-string v4, "&micro"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 162
    const/16 v3, 0xb6

    const-string v4, "&para;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 163
    const/16 v3, 0xb6

    const-string v4, "&para"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 164
    const/16 v3, 0xb7

    const-string v4, "&middot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 165
    const/16 v3, 0xb7

    const-string v4, "&centerdot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 166
    const/16 v3, 0xb7

    const-string v4, "&middot"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 167
    const/16 v3, 0xb7

    const-string v4, "&CenterDot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 168
    const/16 v3, 0xb8

    const-string v4, "&cedil;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 169
    const/16 v3, 0xb8

    const-string v4, "&cedil"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 170
    const/16 v3, 0xb8

    const-string v4, "&Cedilla;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 171
    const/16 v3, 0xb9

    const-string v4, "&sup1;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 172
    const/16 v3, 0xb9

    const-string v4, "&sup1"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 173
    const/16 v3, 0xba

    const-string v4, "&ordm;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 174
    const/16 v3, 0xba

    const-string v4, "&ordm"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 175
    const/16 v3, 0xbb

    const-string v4, "&raquo;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 176
    const/16 v3, 0xbb

    const-string v4, "&raquo"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 177
    const/16 v3, 0xbc

    const-string v4, "&frac14;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 178
    const/16 v3, 0xbc

    const-string v4, "&frac14"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 179
    const/16 v3, 0xbd

    const-string v4, "&frac12;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 180
    const/16 v3, 0xbd

    const-string v4, "&frac12"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 181
    const/16 v3, 0xbd

    const-string v4, "&half;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 182
    const/16 v3, 0xbe

    const-string v4, "&frac34;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 183
    const/16 v3, 0xbe

    const-string v4, "&frac34"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 184
    const/16 v3, 0xbf

    const-string v4, "&iquest;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 185
    const/16 v3, 0xbf

    const-string v4, "&iquest"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 186
    const/16 v3, 0xc0

    const-string v4, "&Agrave;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 187
    const/16 v3, 0xc0

    const-string v4, "&Agrave"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 188
    const/16 v3, 0xc1

    const-string v4, "&Aacute;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 189
    const/16 v3, 0xc1

    const-string v4, "&Aacute"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 190
    const/16 v3, 0xc2

    const-string v4, "&Acirc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 191
    const/16 v3, 0xc2

    const-string v4, "&Acirc"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 192
    const/16 v3, 0xc3

    const-string v4, "&Atilde;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 193
    const/16 v3, 0xc3

    const-string v4, "&Atilde"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 194
    const/16 v3, 0xc4

    const-string v4, "&Auml;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 195
    const/16 v3, 0xc4

    const-string v4, "&Auml"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 196
    const/16 v3, 0xc5

    const-string v4, "&Aring;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 197
    const/16 v3, 0xc5

    const-string v4, "&angst;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 198
    const/16 v3, 0xc5

    const-string v4, "&Aring"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 199
    const/16 v3, 0xc6

    const-string v4, "&AElig;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 200
    const/16 v3, 0xc6

    const-string v4, "&AElig"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 201
    const/16 v3, 0xc7

    const-string v4, "&Ccedil;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 202
    const/16 v3, 0xc7

    const-string v4, "&Ccedil"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 203
    const/16 v3, 0xc8

    const-string v4, "&Egrave;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 204
    const/16 v3, 0xc8

    const-string v4, "&Egrave"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 205
    const/16 v3, 0xc9

    const-string v4, "&Eacute;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 206
    const/16 v3, 0xc9

    const-string v4, "&Eacute"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 207
    const/16 v3, 0xca

    const-string v4, "&Ecirc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 208
    const/16 v3, 0xca

    const-string v4, "&Ecirc"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 209
    const/16 v3, 0xcb

    const-string v4, "&Euml;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 210
    const/16 v3, 0xcb

    const-string v4, "&Euml"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 211
    const/16 v3, 0xcc

    const-string v4, "&Igrave;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 212
    const/16 v3, 0xcc

    const-string v4, "&Igrave"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 213
    const/16 v3, 0xcd

    const-string v4, "&Iacute;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 214
    const/16 v3, 0xcd

    const-string v4, "&Iacute"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 215
    const/16 v3, 0xce

    const-string v4, "&Icirc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 216
    const/16 v3, 0xce

    const-string v4, "&Icirc"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 217
    const/16 v3, 0xcf

    const-string v4, "&Iuml;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 218
    const/16 v3, 0xcf

    const-string v4, "&Iuml"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 219
    const/16 v3, 0xd0

    const-string v4, "&ETH;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 220
    const/16 v3, 0xd0

    const-string v4, "&ETH"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 221
    const/16 v3, 0xd1

    const-string v4, "&Ntilde;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 222
    const/16 v3, 0xd1

    const-string v4, "&Ntilde"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 223
    const/16 v3, 0xd2

    const-string v4, "&Ograve;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 224
    const/16 v3, 0xd2

    const-string v4, "&Ograve"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 225
    const/16 v3, 0xd3

    const-string v4, "&Oacute;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 226
    const/16 v3, 0xd3

    const-string v4, "&Oacute"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 227
    const/16 v3, 0xd4

    const-string v4, "&Ocirc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 228
    const/16 v3, 0xd4

    const-string v4, "&Ocirc"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 229
    const/16 v3, 0xd5

    const-string v4, "&Otilde;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 230
    const/16 v3, 0xd5

    const-string v4, "&Otilde"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 231
    const/16 v3, 0xd6

    const-string v4, "&Ouml;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 232
    const/16 v3, 0xd6

    const-string v4, "&Ouml"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 233
    const/16 v3, 0xd7

    const-string v4, "&times;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 234
    const/16 v3, 0xd7

    const-string v4, "&times"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 235
    const/16 v3, 0xd8

    const-string v4, "&Oslash;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 236
    const/16 v3, 0xd8

    const-string v4, "&Oslash"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 237
    const/16 v3, 0xd9

    const-string v4, "&Ugrave;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 238
    const/16 v3, 0xd9

    const-string v4, "&Ugrave"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 239
    const/16 v3, 0xda

    const-string v4, "&Uacute;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 240
    const/16 v3, 0xda

    const-string v4, "&Uacute"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 241
    const/16 v3, 0xdb

    const-string v4, "&Ucirc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 242
    const/16 v3, 0xdb

    const-string v4, "&Ucirc"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 243
    const/16 v3, 0xdc

    const-string v4, "&Uuml;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 244
    const/16 v3, 0xdc

    const-string v4, "&Uuml"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 245
    const/16 v3, 0xdd

    const-string v4, "&Yacute;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 246
    const/16 v3, 0xdd

    const-string v4, "&Yacute"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 247
    const/16 v3, 0xde

    const-string v4, "&THORN;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 248
    const/16 v3, 0xde

    const-string v4, "&THORN"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 249
    const/16 v3, 0xdf

    const-string v4, "&szlig;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 250
    const/16 v3, 0xdf

    const-string v4, "&szlig"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 251
    const/16 v3, 0xe0

    const-string v4, "&agrave;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 252
    const/16 v3, 0xe0

    const-string v4, "&agrave"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 253
    const/16 v3, 0xe1

    const-string v4, "&aacute;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 254
    const/16 v3, 0xe1

    const-string v4, "&aacute"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 255
    const/16 v3, 0xe2

    const-string v4, "&acirc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 256
    const/16 v3, 0xe2

    const-string v4, "&acirc"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 257
    const/16 v3, 0xe3

    const-string v4, "&atilde;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 258
    const/16 v3, 0xe3

    const-string v4, "&atilde"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 259
    const/16 v3, 0xe4

    const-string v4, "&auml;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 260
    const/16 v3, 0xe4

    const-string v4, "&auml"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 261
    const/16 v3, 0xe5

    const-string v4, "&aring;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 262
    const/16 v3, 0xe5

    const-string v4, "&aring"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 263
    const/16 v3, 0xe6

    const-string v4, "&aelig;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 264
    const/16 v3, 0xe6

    const-string v4, "&aelig"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 265
    const/16 v3, 0xe7

    const-string v4, "&ccedil;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 266
    const/16 v3, 0xe7

    const-string v4, "&ccedil"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 267
    const/16 v3, 0xe8

    const-string v4, "&egrave;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 268
    const/16 v3, 0xe8

    const-string v4, "&egrave"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 269
    const/16 v3, 0xe9

    const-string v4, "&eacute;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 270
    const/16 v3, 0xe9

    const-string v4, "&eacute"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 271
    const/16 v3, 0xea

    const-string v4, "&ecirc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 272
    const/16 v3, 0xea

    const-string v4, "&ecirc"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 273
    const/16 v3, 0xeb

    const-string v4, "&euml;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 274
    const/16 v3, 0xeb

    const-string v4, "&euml"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 275
    const/16 v3, 0xec

    const-string v4, "&igrave;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 276
    const/16 v3, 0xec

    const-string v4, "&igrave"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 277
    const/16 v3, 0xed

    const-string v4, "&iacute;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 278
    const/16 v3, 0xed

    const-string v4, "&iacute"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 279
    const/16 v3, 0xee

    const-string v4, "&icirc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 280
    const/16 v3, 0xee

    const-string v4, "&icirc"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 281
    const/16 v3, 0xef

    const-string v4, "&iuml;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 282
    const/16 v3, 0xef

    const-string v4, "&iuml"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 283
    const/16 v3, 0xf0

    const-string v4, "&eth;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 284
    const/16 v3, 0xf0

    const-string v4, "&eth"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 285
    const/16 v3, 0xf1

    const-string v4, "&ntilde;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 286
    const/16 v3, 0xf1

    const-string v4, "&ntilde"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 287
    const/16 v3, 0xf2

    const-string v4, "&ograve;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 288
    const/16 v3, 0xf2

    const-string v4, "&ograve"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 289
    const/16 v3, 0xf3

    const-string v4, "&oacute;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 290
    const/16 v3, 0xf3

    const-string v4, "&oacute"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 291
    const/16 v3, 0xf4

    const-string v4, "&ocirc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 292
    const/16 v3, 0xf4

    const-string v4, "&ocirc"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 293
    const/16 v3, 0xf5

    const-string v4, "&otilde;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 294
    const/16 v3, 0xf5

    const-string v4, "&otilde"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 295
    const/16 v3, 0xf6

    const-string v4, "&ouml;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 296
    const/16 v3, 0xf6

    const-string v4, "&ouml"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 297
    const/16 v3, 0xf7

    const-string v4, "&divide;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 298
    const/16 v3, 0xf7

    const-string v4, "&div;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 299
    const/16 v3, 0xf7

    const-string v4, "&divide"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 300
    const/16 v3, 0xf8

    const-string v4, "&oslash;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 301
    const/16 v3, 0xf8

    const-string v4, "&oslash"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 302
    const/16 v3, 0xf9

    const-string v4, "&ugrave;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 303
    const/16 v3, 0xf9

    const-string v4, "&ugrave"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 304
    const/16 v3, 0xfa

    const-string v4, "&uacute;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 305
    const/16 v3, 0xfa

    const-string v4, "&uacute"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 306
    const/16 v3, 0xfb

    const-string v4, "&ucirc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 307
    const/16 v3, 0xfb

    const-string v4, "&ucirc"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 308
    const/16 v3, 0xfc

    const-string v4, "&uuml;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 309
    const/16 v3, 0xfc

    const-string v4, "&uuml"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 310
    const/16 v3, 0xfd

    const-string v4, "&yacute;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 311
    const/16 v3, 0xfd

    const-string v4, "&yacute"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 312
    const/16 v3, 0xfe

    const-string v4, "&thorn;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 313
    const/16 v3, 0xfe

    const-string v4, "&thorn"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 314
    const/16 v3, 0xff

    const-string v4, "&yuml;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 315
    const/16 v3, 0xff

    const-string v4, "&yuml"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 316
    const/16 v3, 0x100

    const-string v4, "&Amacr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 317
    const/16 v3, 0x101

    const-string v4, "&amacr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 318
    const/16 v3, 0x102

    const-string v4, "&Abreve;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 319
    const/16 v3, 0x103

    const-string v4, "&abreve;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 320
    const/16 v3, 0x104

    const-string v4, "&Aogon;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 321
    const/16 v3, 0x105

    const-string v4, "&aogon;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 322
    const/16 v3, 0x106

    const-string v4, "&Cacute;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 323
    const/16 v3, 0x107

    const-string v4, "&cacute;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 324
    const/16 v3, 0x108

    const-string v4, "&Ccirc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 325
    const/16 v3, 0x109

    const-string v4, "&ccirc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 326
    const/16 v3, 0x10a

    const-string v4, "&Cdot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 327
    const/16 v3, 0x10b

    const-string v4, "&cdot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 328
    const/16 v3, 0x10c

    const-string v4, "&Ccaron;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 329
    const/16 v3, 0x10d

    const-string v4, "&ccaron;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 330
    const/16 v3, 0x10e

    const-string v4, "&Dcaron;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 331
    const/16 v3, 0x10f

    const-string v4, "&dcaron;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 332
    const/16 v3, 0x110

    const-string v4, "&Dstrok;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 333
    const/16 v3, 0x111

    const-string v4, "&dstrok;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 334
    const/16 v3, 0x112

    const-string v4, "&Emacr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 335
    const/16 v3, 0x113

    const-string v4, "&emacr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 336
    const/16 v3, 0x116

    const-string v4, "&Edot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 337
    const/16 v3, 0x117

    const-string v4, "&edot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 338
    const/16 v3, 0x118

    const-string v4, "&Eogon;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 339
    const/16 v3, 0x119

    const-string v4, "&eogon;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 340
    const/16 v3, 0x11a

    const-string v4, "&Ecaron;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 341
    const/16 v3, 0x11b

    const-string v4, "&ecaron;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 342
    const/16 v3, 0x11c

    const-string v4, "&Gcirc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 343
    const/16 v3, 0x11d

    const-string v4, "&gcirc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 344
    const/16 v3, 0x11e

    const-string v4, "&Gbreve;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 345
    const/16 v3, 0x11f

    const-string v4, "&gbreve;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 346
    const/16 v3, 0x120

    const-string v4, "&Gdot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 347
    const/16 v3, 0x121

    const-string v4, "&gdot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 348
    const/16 v3, 0x122

    const-string v4, "&Gcedil;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 349
    const/16 v3, 0x124

    const-string v4, "&Hcirc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 350
    const/16 v3, 0x125

    const-string v4, "&hcirc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 351
    const/16 v3, 0x126

    const-string v4, "&Hstrok;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 352
    const/16 v3, 0x127

    const-string v4, "&hstrok;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 353
    const/16 v3, 0x128

    const-string v4, "&Itilde;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 354
    const/16 v3, 0x129

    const-string v4, "&itilde;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 355
    const/16 v3, 0x12a

    const-string v4, "&Imacr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 356
    const/16 v3, 0x12b

    const-string v4, "&imacr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 357
    const/16 v3, 0x12e

    const-string v4, "&Iogon;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 358
    const/16 v3, 0x12f

    const-string v4, "&iogon;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 359
    const/16 v3, 0x130

    const-string v4, "&Idot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 360
    const/16 v3, 0x131

    const-string v4, "&imath;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 361
    const/16 v3, 0x131

    const-string v4, "&inodot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 362
    const/16 v3, 0x132

    const-string v4, "&IJlig;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 363
    const/16 v3, 0x133

    const-string v4, "&ijlig;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 364
    const/16 v3, 0x134

    const-string v4, "&Jcirc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 365
    const/16 v3, 0x135

    const-string v4, "&jcirc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 366
    const/16 v3, 0x136

    const-string v4, "&Kcedil;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 367
    const/16 v3, 0x137

    const-string v4, "&kcedil;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 368
    const/16 v3, 0x138

    const-string v4, "&kgreen;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 369
    const/16 v3, 0x139

    const-string v4, "&Lacute;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 370
    const/16 v3, 0x13a

    const-string v4, "&lacute;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 371
    const/16 v3, 0x13b

    const-string v4, "&Lcedil;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 372
    const/16 v3, 0x13c

    const-string v4, "&lcedil;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 373
    const/16 v3, 0x13d

    const-string v4, "&Lcaron;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 374
    const/16 v3, 0x13e

    const-string v4, "&lcaron;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 375
    const/16 v3, 0x13f

    const-string v4, "&Lmidot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 376
    const/16 v3, 0x140

    const-string v4, "&lmidot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 377
    const/16 v3, 0x141

    const-string v4, "&Lstrok;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 378
    const/16 v3, 0x142

    const-string v4, "&lstrok;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 379
    const/16 v3, 0x143

    const-string v4, "&Nacute;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 380
    const/16 v3, 0x144

    const-string v4, "&nacute;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 381
    const/16 v3, 0x145

    const-string v4, "&Ncedil;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 382
    const/16 v3, 0x146

    const-string v4, "&ncedil;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 383
    const/16 v3, 0x147

    const-string v4, "&Ncaron;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 384
    const/16 v3, 0x148

    const-string v4, "&ncaron;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 385
    const/16 v3, 0x149

    const-string v4, "&napos;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 386
    const/16 v3, 0x14a

    const-string v4, "&ENG;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 387
    const/16 v3, 0x14b

    const-string v4, "&eng;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 388
    const/16 v3, 0x14c

    const-string v4, "&Omacr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 389
    const/16 v3, 0x14d

    const-string v4, "&omacr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 390
    const/16 v3, 0x150

    const-string v4, "&Odblac;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 391
    const/16 v3, 0x151

    const-string v4, "&odblac;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 392
    const/16 v3, 0x152

    const-string v4, "&OElig;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 393
    const/16 v3, 0x153

    const-string v4, "&oelig;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 394
    const/16 v3, 0x154

    const-string v4, "&Racute;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 395
    const/16 v3, 0x155

    const-string v4, "&racute;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 396
    const/16 v3, 0x156

    const-string v4, "&Rcedil;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 397
    const/16 v3, 0x157

    const-string v4, "&rcedil;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 398
    const/16 v3, 0x158

    const-string v4, "&Rcaron;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 399
    const/16 v3, 0x159

    const-string v4, "&rcaron;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 400
    const/16 v3, 0x15a

    const-string v4, "&Sacute;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 401
    const/16 v3, 0x15b

    const-string v4, "&sacute;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 402
    const/16 v3, 0x15c

    const-string v4, "&Scirc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 403
    const/16 v3, 0x15d

    const-string v4, "&scirc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 404
    const/16 v3, 0x15e

    const-string v4, "&Scedil;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 405
    const/16 v3, 0x15f

    const-string v4, "&scedil;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 406
    const/16 v3, 0x160

    const-string v4, "&Scaron;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 407
    const/16 v3, 0x161

    const-string v4, "&scaron;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 408
    const/16 v3, 0x162

    const-string v4, "&Tcedil;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 409
    const/16 v3, 0x163

    const-string v4, "&tcedil;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 410
    const/16 v3, 0x164

    const-string v4, "&Tcaron;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 411
    const/16 v3, 0x165

    const-string v4, "&tcaron;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 412
    const/16 v3, 0x166

    const-string v4, "&Tstrok;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 413
    const/16 v3, 0x167

    const-string v4, "&tstrok;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 414
    const/16 v3, 0x168

    const-string v4, "&Utilde;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 415
    const/16 v3, 0x169

    const-string v4, "&utilde;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 416
    const/16 v3, 0x16a

    const-string v4, "&Umacr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 417
    const/16 v3, 0x16b

    const-string v4, "&umacr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 418
    const/16 v3, 0x16c

    const-string v4, "&Ubreve;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 419
    const/16 v3, 0x16d

    const-string v4, "&ubreve;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 420
    const/16 v3, 0x16e

    const-string v4, "&Uring;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 421
    const/16 v3, 0x16f

    const-string v4, "&uring;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 422
    const/16 v3, 0x170

    const-string v4, "&Udblac;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 423
    const/16 v3, 0x171

    const-string v4, "&udblac;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 424
    const/16 v3, 0x172

    const-string v4, "&Uogon;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 425
    const/16 v3, 0x173

    const-string v4, "&uogon;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 426
    const/16 v3, 0x174

    const-string v4, "&Wcirc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 427
    const/16 v3, 0x175

    const-string v4, "&wcirc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 428
    const/16 v3, 0x176

    const-string v4, "&Ycirc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 429
    const/16 v3, 0x177

    const-string v4, "&ycirc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 430
    const/16 v3, 0x178

    const-string v4, "&Yuml;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 431
    const/16 v3, 0x179

    const-string v4, "&Zacute;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 432
    const/16 v3, 0x17a

    const-string v4, "&zacute;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 433
    const/16 v3, 0x17b

    const-string v4, "&Zdot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 434
    const/16 v3, 0x17c

    const-string v4, "&zdot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 435
    const/16 v3, 0x17d

    const-string v4, "&Zcaron;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 436
    const/16 v3, 0x17e

    const-string v4, "&zcaron;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 437
    const/16 v3, 0x192

    const-string v4, "&fnof;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 438
    const/16 v3, 0x1b5

    const-string v4, "&imped;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 439
    const/16 v3, 0x1f5

    const-string v4, "&gacute;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 440
    const/16 v3, 0x237

    const-string v4, "&jmath;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 441
    const/16 v3, 0x2c6

    const-string v4, "&circ;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 442
    const/16 v3, 0x2c7

    const-string v4, "&caron;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 443
    const/16 v3, 0x2c7

    const-string v4, "&Hacek;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 444
    const/16 v3, 0x2d8

    const-string v4, "&breve;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 445
    const/16 v3, 0x2d8

    const-string v4, "&Breve;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 446
    const/16 v3, 0x2d9

    const-string v4, "&dot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 447
    const/16 v3, 0x2d9

    const-string v4, "&DiacriticalDot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 448
    const/16 v3, 0x2da

    const-string v4, "&ring;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 449
    const/16 v3, 0x2db

    const-string v4, "&ogon;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 450
    const/16 v3, 0x2dc

    const-string v4, "&tilde;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 451
    const/16 v3, 0x2dc

    const-string v4, "&DiacriticalTilde;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 452
    const/16 v3, 0x2dd

    const-string v4, "&dblac;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 453
    const/16 v3, 0x2dd

    const-string v4, "&DiacriticalDoubleAcute;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 454
    const/16 v3, 0x311

    const-string v4, "&DownBreve;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 455
    const/16 v3, 0x391

    const-string v4, "&Alpha;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 456
    const/16 v3, 0x392

    const-string v4, "&Beta;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 457
    const/16 v3, 0x393

    const-string v4, "&Gamma;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 458
    const/16 v3, 0x394

    const-string v4, "&Delta;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 459
    const/16 v3, 0x395

    const-string v4, "&Epsilon;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 460
    const/16 v3, 0x396

    const-string v4, "&Zeta;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 461
    const/16 v3, 0x397

    const-string v4, "&Eta;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 462
    const/16 v3, 0x398

    const-string v4, "&Theta;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 463
    const/16 v3, 0x399

    const-string v4, "&Iota;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 464
    const/16 v3, 0x39a

    const-string v4, "&Kappa;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 465
    const/16 v3, 0x39b

    const-string v4, "&Lambda;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 466
    const/16 v3, 0x39c

    const-string v4, "&Mu;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 467
    const/16 v3, 0x39d

    const-string v4, "&Nu;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 468
    const/16 v3, 0x39e

    const-string v4, "&Xi;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 469
    const/16 v3, 0x39f

    const-string v4, "&Omicron;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 470
    const/16 v3, 0x3a0

    const-string v4, "&Pi;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 471
    const/16 v3, 0x3a1

    const-string v4, "&Rho;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 472
    const/16 v3, 0x3a3

    const-string v4, "&Sigma;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 473
    const/16 v3, 0x3a4

    const-string v4, "&Tau;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 474
    const/16 v3, 0x3a5

    const-string v4, "&Upsilon;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 475
    const/16 v3, 0x3a6

    const-string v4, "&Phi;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 476
    const/16 v3, 0x3a7

    const-string v4, "&Chi;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 477
    const/16 v3, 0x3a8

    const-string v4, "&Psi;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 478
    const/16 v3, 0x3a9

    const-string v4, "&Omega;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 479
    const/16 v3, 0x3a9

    const-string v4, "&ohm;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 480
    const/16 v3, 0x3b1

    const-string v4, "&alpha;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 481
    const/16 v3, 0x3b2

    const-string v4, "&beta;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 482
    const/16 v3, 0x3b3

    const-string v4, "&gamma;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 483
    const/16 v3, 0x3b4

    const-string v4, "&delta;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 484
    const/16 v3, 0x3b5

    const-string v4, "&epsilon;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 485
    const/16 v3, 0x3b5

    const-string v4, "&epsi;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 486
    const/16 v3, 0x3b6

    const-string v4, "&zeta;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 487
    const/16 v3, 0x3b7

    const-string v4, "&eta;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 488
    const/16 v3, 0x3b8

    const-string v4, "&theta;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 489
    const/16 v3, 0x3b9

    const-string v4, "&iota;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 490
    const/16 v3, 0x3ba

    const-string v4, "&kappa;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 491
    const/16 v3, 0x3bb

    const-string v4, "&lambda;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 492
    const/16 v3, 0x3bc

    const-string v4, "&mu;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 493
    const/16 v3, 0x3bd

    const-string v4, "&nu;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 494
    const/16 v3, 0x3be

    const-string v4, "&xi;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 495
    const/16 v3, 0x3bf

    const-string v4, "&omicron;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 496
    const/16 v3, 0x3c0

    const-string v4, "&pi;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 497
    const/16 v3, 0x3c1

    const-string v4, "&rho;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 498
    const/16 v3, 0x3c2

    const-string v4, "&sigmaf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 499
    const/16 v3, 0x3c2

    const-string v4, "&sigmav;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 500
    const/16 v3, 0x3c2

    const-string v4, "&varsigma;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 501
    const/16 v3, 0x3c3

    const-string v4, "&sigma;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 502
    const/16 v3, 0x3c4

    const-string v4, "&tau;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 503
    const/16 v3, 0x3c5

    const-string v4, "&upsilon;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 504
    const/16 v3, 0x3c5

    const-string v4, "&upsi;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 505
    const/16 v3, 0x3c6

    const-string v4, "&phi;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 506
    const/16 v3, 0x3c7

    const-string v4, "&chi;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 507
    const/16 v3, 0x3c8

    const-string v4, "&psi;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 508
    const/16 v3, 0x3c9

    const-string v4, "&omega;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 509
    const/16 v3, 0x3d1

    const-string v4, "&thetasym;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 510
    const/16 v3, 0x3d1

    const-string v4, "&thetav;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 511
    const/16 v3, 0x3d1

    const-string v4, "&vartheta;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 512
    const/16 v3, 0x3d2

    const-string v4, "&upsih;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 513
    const/16 v3, 0x3d2

    const-string v4, "&Upsi;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 514
    const/16 v3, 0x3d5

    const-string v4, "&phiv;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 515
    const/16 v3, 0x3d5

    const-string v4, "&straightphi;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 516
    const/16 v3, 0x3d5

    const-string v4, "&varphi;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 517
    const/16 v3, 0x3d6

    const-string v4, "&piv;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 518
    const/16 v3, 0x3d6

    const-string v4, "&varpi;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 519
    const/16 v3, 0x3dc

    const-string v4, "&Gammad;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 520
    const/16 v3, 0x3dd

    const-string v4, "&digamma;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 521
    const/16 v3, 0x3dd

    const-string v4, "&gammad;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 522
    const/16 v3, 0x3f0

    const-string v4, "&kappav;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 523
    const/16 v3, 0x3f0

    const-string v4, "&varkappa;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 524
    const/16 v3, 0x3f1

    const-string v4, "&rhov;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 525
    const/16 v3, 0x3f1

    const-string v4, "&varrho;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 526
    const/16 v3, 0x3f5

    const-string v4, "&epsiv;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 527
    const/16 v3, 0x3f5

    const-string v4, "&straightepsilon;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 528
    const/16 v3, 0x3f5

    const-string v4, "&varepsilon;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 529
    const/16 v3, 0x3f6

    const-string v4, "&backepsilon;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 530
    const/16 v3, 0x3f6

    const-string v4, "&bepsi;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 531
    const/16 v3, 0x401

    const-string v4, "&IOcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 532
    const/16 v3, 0x402

    const-string v4, "&DJcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 533
    const/16 v3, 0x403

    const-string v4, "&GJcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 534
    const/16 v3, 0x404

    const-string v4, "&Jukcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 535
    const/16 v3, 0x405

    const-string v4, "&DScy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 536
    const/16 v3, 0x406

    const-string v4, "&Iukcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 537
    const/16 v3, 0x407

    const-string v4, "&YIcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 538
    const/16 v3, 0x408

    const-string v4, "&Jsercy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 539
    const/16 v3, 0x409

    const-string v4, "&LJcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 540
    const/16 v3, 0x40a

    const-string v4, "&NJcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 541
    const/16 v3, 0x40b

    const-string v4, "&TSHcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 542
    const/16 v3, 0x40c

    const-string v4, "&KJcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 543
    const/16 v3, 0x40e

    const-string v4, "&Ubrcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 544
    const/16 v3, 0x40f

    const-string v4, "&DZcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 545
    const/16 v3, 0x410

    const-string v4, "&Acy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 546
    const/16 v3, 0x411

    const-string v4, "&Bcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 547
    const/16 v3, 0x412

    const-string v4, "&Vcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 548
    const/16 v3, 0x413

    const-string v4, "&Gcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 549
    const/16 v3, 0x414

    const-string v4, "&Dcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 550
    const/16 v3, 0x415

    const-string v4, "&IEcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 551
    const/16 v3, 0x416

    const-string v4, "&ZHcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 552
    const/16 v3, 0x417

    const-string v4, "&Zcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 553
    const/16 v3, 0x418

    const-string v4, "&Icy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 554
    const/16 v3, 0x419

    const-string v4, "&Jcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 555
    const/16 v3, 0x41a

    const-string v4, "&Kcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 556
    const/16 v3, 0x41b

    const-string v4, "&Lcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 557
    const/16 v3, 0x41c

    const-string v4, "&Mcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 558
    const/16 v3, 0x41d

    const-string v4, "&Ncy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 559
    const/16 v3, 0x41e

    const-string v4, "&Ocy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 560
    const/16 v3, 0x41f

    const-string v4, "&Pcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 561
    const/16 v3, 0x420

    const-string v4, "&Rcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 562
    const/16 v3, 0x421

    const-string v4, "&Scy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 563
    const/16 v3, 0x422

    const-string v4, "&Tcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 564
    const/16 v3, 0x423

    const-string v4, "&Ucy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 565
    const/16 v3, 0x424

    const-string v4, "&Fcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 566
    const/16 v3, 0x425

    const-string v4, "&KHcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 567
    const/16 v3, 0x426

    const-string v4, "&TScy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 568
    const/16 v3, 0x427

    const-string v4, "&CHcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 569
    const/16 v3, 0x428

    const-string v4, "&SHcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 570
    const/16 v3, 0x429

    const-string v4, "&SHCHcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 571
    const/16 v3, 0x42a

    const-string v4, "&HARDcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 572
    const/16 v3, 0x42b

    const-string v4, "&Ycy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 573
    const/16 v3, 0x42c

    const-string v4, "&SOFTcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 574
    const/16 v3, 0x42d

    const-string v4, "&Ecy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 575
    const/16 v3, 0x42e

    const-string v4, "&YUcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 576
    const/16 v3, 0x42f

    const-string v4, "&YAcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 577
    const/16 v3, 0x430

    const-string v4, "&acy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 578
    const/16 v3, 0x431

    const-string v4, "&bcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 579
    const/16 v3, 0x432

    const-string v4, "&vcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 580
    const/16 v3, 0x433

    const-string v4, "&gcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 581
    const/16 v3, 0x434

    const-string v4, "&dcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 582
    const/16 v3, 0x435

    const-string v4, "&iecy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 583
    const/16 v3, 0x436

    const-string v4, "&zhcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 584
    const/16 v3, 0x437

    const-string v4, "&zcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 585
    const/16 v3, 0x438

    const-string v4, "&icy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 586
    const/16 v3, 0x439

    const-string v4, "&jcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 587
    const/16 v3, 0x43a

    const-string v4, "&kcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 588
    const/16 v3, 0x43b

    const-string v4, "&lcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 589
    const/16 v3, 0x43c

    const-string v4, "&mcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 590
    const/16 v3, 0x43d

    const-string v4, "&ncy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 591
    const/16 v3, 0x43e

    const-string v4, "&ocy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 592
    const/16 v3, 0x43f

    const-string v4, "&pcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 593
    const/16 v3, 0x440

    const-string v4, "&rcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 594
    const/16 v3, 0x441

    const-string v4, "&scy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 595
    const/16 v3, 0x442

    const-string v4, "&tcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 596
    const/16 v3, 0x443

    const-string v4, "&ucy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 597
    const/16 v3, 0x444

    const-string v4, "&fcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 598
    const/16 v3, 0x445

    const-string v4, "&khcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 599
    const/16 v3, 0x446

    const-string v4, "&tscy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 600
    const/16 v3, 0x447

    const-string v4, "&chcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 601
    const/16 v3, 0x448

    const-string v4, "&shcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 602
    const/16 v3, 0x449

    const-string v4, "&shchcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 603
    const/16 v3, 0x44a

    const-string v4, "&hardcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 604
    const/16 v3, 0x44b

    const-string v4, "&ycy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 605
    const/16 v3, 0x44c

    const-string v4, "&softcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 606
    const/16 v3, 0x44d

    const-string v4, "&ecy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 607
    const/16 v3, 0x44e

    const-string v4, "&yucy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 608
    const/16 v3, 0x44f

    const-string v4, "&yacy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 609
    const/16 v3, 0x451

    const-string v4, "&iocy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 610
    const/16 v3, 0x452

    const-string v4, "&djcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 611
    const/16 v3, 0x453

    const-string v4, "&gjcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 612
    const/16 v3, 0x454

    const-string v4, "&jukcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 613
    const/16 v3, 0x455

    const-string v4, "&dscy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 614
    const/16 v3, 0x456

    const-string v4, "&iukcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 615
    const/16 v3, 0x457

    const-string v4, "&yicy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 616
    const/16 v3, 0x458

    const-string v4, "&jsercy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 617
    const/16 v3, 0x459

    const-string v4, "&ljcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 618
    const/16 v3, 0x45a

    const-string v4, "&njcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 619
    const/16 v3, 0x45b

    const-string v4, "&tshcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 620
    const/16 v3, 0x45c

    const-string v4, "&kjcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 621
    const/16 v3, 0x45e

    const-string v4, "&ubrcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 622
    const/16 v3, 0x45f

    const-string v4, "&dzcy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 623
    const/16 v3, 0x2002

    const-string v4, "&ensp;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 624
    const/16 v3, 0x2003

    const-string v4, "&emsp;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 625
    const/16 v3, 0x2004

    const-string v4, "&emsp13;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 626
    const/16 v3, 0x2005

    const-string v4, "&emsp14;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 627
    const/16 v3, 0x2007

    const-string v4, "&numsp;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 628
    const/16 v3, 0x2008

    const-string v4, "&puncsp;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 629
    const/16 v3, 0x2009

    const-string v4, "&thinsp;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 630
    const/16 v3, 0x2009

    const-string v4, "&ThinSpace;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 631
    const/16 v3, 0x200a

    const-string v4, "&hairsp;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 632
    const/16 v3, 0x200a

    const-string v4, "&VeryThinSpace;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 633
    const/16 v3, 0x200b

    const-string v4, "&NegativeMediumSpace;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 634
    const/16 v3, 0x200b

    const-string v4, "&NegativeThickSpace;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 635
    const/16 v3, 0x200b

    const-string v4, "&NegativeThinSpace;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 636
    const/16 v3, 0x200b

    const-string v4, "&NegativeVeryThinSpace;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 637
    const/16 v3, 0x200b

    const-string v4, "&ZeroWidthSpace;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 638
    const/16 v3, 0x200c

    const-string v4, "&zwnj;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 639
    const/16 v3, 0x200d

    const-string v4, "&zwj;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 640
    const/16 v3, 0x200e

    const-string v4, "&lrm;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 641
    const/16 v3, 0x200f

    const-string v4, "&rlm;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 642
    const/16 v3, 0x2010

    const-string v4, "&dash;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 643
    const/16 v3, 0x2010

    const-string v4, "&hyphen;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 644
    const/16 v3, 0x2013

    const-string v4, "&ndash;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 645
    const/16 v3, 0x2014

    const-string v4, "&mdash;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 646
    const/16 v3, 0x2015

    const-string v4, "&horbar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 647
    const/16 v3, 0x2016

    const-string v4, "&Verbar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 648
    const/16 v3, 0x2016

    const-string v4, "&Vert;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 649
    const/16 v3, 0x2018

    const-string v4, "&lsquo;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 650
    const/16 v3, 0x2018

    const-string v4, "&OpenCurlyQuote;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 651
    const/16 v3, 0x2019

    const-string v4, "&rsquo;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 652
    const/16 v3, 0x2019

    const-string v4, "&rsquor;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 653
    const/16 v3, 0x2019

    const-string v4, "&CloseCurlyQuote;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 654
    const/16 v3, 0x201a

    const-string v4, "&sbquo;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 655
    const/16 v3, 0x201a

    const-string v4, "&lsquor;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 656
    const/16 v3, 0x201c

    const-string v4, "&ldquo;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 657
    const/16 v3, 0x201c

    const-string v4, "&OpenCurlyDoubleQuote;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 658
    const/16 v3, 0x201d

    const-string v4, "&rdquo;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 659
    const/16 v3, 0x201d

    const-string v4, "&rdquor;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 660
    const/16 v3, 0x201d

    const-string v4, "&CloseCurlyDoubleQuote;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 661
    const/16 v3, 0x201e

    const-string v4, "&bdquo;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 662
    const/16 v3, 0x201e

    const-string v4, "&ldquor;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 663
    const/16 v3, 0x2020

    const-string v4, "&dagger;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 664
    const/16 v3, 0x2021

    const-string v4, "&Dagger;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 665
    const/16 v3, 0x2021

    const-string v4, "&ddagger;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 666
    const/16 v3, 0x2022

    const-string v4, "&bull;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 667
    const/16 v3, 0x2022

    const-string v4, "&bullet;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 668
    const/16 v3, 0x2025

    const-string v4, "&nldr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 669
    const/16 v3, 0x2026

    const-string v4, "&hellip;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 670
    const/16 v3, 0x2026

    const-string v4, "&mldr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 671
    const/16 v3, 0x2030

    const-string v4, "&permil;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 672
    const/16 v3, 0x2031

    const-string v4, "&pertenk;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 673
    const/16 v3, 0x2032

    const-string v4, "&prime;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 674
    const/16 v3, 0x2033

    const-string v4, "&Prime;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 675
    const/16 v3, 0x2034

    const-string v4, "&tprime;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 676
    const/16 v3, 0x2035

    const-string v4, "&backprime;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 677
    const/16 v3, 0x2035

    const-string v4, "&bprime;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 678
    const/16 v3, 0x2039

    const-string v4, "&lsaquo;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 679
    const/16 v3, 0x203a

    const-string v4, "&rsaquo;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 680
    const/16 v3, 0x203e

    const-string v4, "&oline;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 681
    const/16 v3, 0x203e

    const-string v4, "&OverBar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 682
    const/16 v3, 0x2041

    const-string v4, "&caret;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 683
    const/16 v3, 0x2043

    const-string v4, "&hybull;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 684
    const/16 v3, 0x2044

    const-string v4, "&frasl;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 685
    const/16 v3, 0x204f

    const-string v4, "&bsemi;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 686
    const/16 v3, 0x2057

    const-string v4, "&qprime;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 687
    const/16 v3, 0x205f

    const-string v4, "&MediumSpace;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 688
    const/16 v3, 0x205f

    const/16 v4, 0x200a

    const-string v5, "&ThickSpace;"

    invoke-virtual {v2, v3, v4, v5}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 689
    const/16 v3, 0x2060

    const-string v4, "&NoBreak;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 690
    const/16 v3, 0x2061

    const-string v4, "&af;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 691
    const/16 v3, 0x2061

    const-string v4, "&ApplyFunction;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 692
    const/16 v3, 0x2062

    const-string v4, "&it;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 693
    const/16 v3, 0x2062

    const-string v4, "&InvisibleTimes;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 694
    const/16 v3, 0x2063

    const-string v4, "&ic;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 695
    const/16 v3, 0x2063

    const-string v4, "&InvisibleComma;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 696
    const/16 v3, 0x20ac

    const-string v4, "&euro;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 697
    const/16 v3, 0x20db

    const-string v4, "&tdot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 698
    const/16 v3, 0x20db

    const-string v4, "&TripleDot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 699
    const/16 v3, 0x20dc

    const-string v4, "&DotDot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 700
    const/16 v3, 0x2102

    const-string v4, "&complexes;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 701
    const/16 v3, 0x2102

    const-string v4, "&Copf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 702
    const/16 v3, 0x2105

    const-string v4, "&incare;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 703
    const/16 v3, 0x210a

    const-string v4, "&gscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 704
    const/16 v3, 0x210b

    const-string v4, "&hamilt;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 705
    const/16 v3, 0x210b

    const-string v4, "&HilbertSpace;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 706
    const/16 v3, 0x210b

    const-string v4, "&Hscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 707
    const/16 v3, 0x210c

    const-string v4, "&Hfr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 708
    const/16 v3, 0x210c

    const-string v4, "&Poincareplane;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 709
    const/16 v3, 0x210d

    const-string v4, "&quaternions;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 710
    const/16 v3, 0x210d

    const-string v4, "&Hopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 711
    const/16 v3, 0x210e

    const-string v4, "&planckh;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 712
    const/16 v3, 0x210f

    const-string v4, "&hbar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 713
    const/16 v3, 0x210f

    const-string v4, "&hslash;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 714
    const/16 v3, 0x210f

    const-string v4, "&planck;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 715
    const/16 v3, 0x210f

    const-string v4, "&plankv;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 716
    const/16 v3, 0x2110

    const-string v4, "&imagline;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 717
    const/16 v3, 0x2110

    const-string v4, "&Iscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 718
    const/16 v3, 0x2111

    const-string v4, "&image;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 719
    const/16 v3, 0x2111

    const-string v4, "&imagpart;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 720
    const/16 v3, 0x2111

    const-string v4, "&Ifr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 721
    const/16 v3, 0x2111

    const-string v4, "&Im;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 722
    const/16 v3, 0x2112

    const-string v4, "&lagran;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 723
    const/16 v3, 0x2112

    const-string v4, "&Laplacetrf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 724
    const/16 v3, 0x2112

    const-string v4, "&Lscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 725
    const/16 v3, 0x2113

    const-string v4, "&ell;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 726
    const/16 v3, 0x2115

    const-string v4, "&naturals;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 727
    const/16 v3, 0x2115

    const-string v4, "&Nopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 728
    const/16 v3, 0x2116

    const-string v4, "&numero;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 729
    const/16 v3, 0x2117

    const-string v4, "&copysr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 730
    const/16 v3, 0x2118

    const-string v4, "&weierp;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 731
    const/16 v3, 0x2118

    const-string v4, "&wp;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 732
    const/16 v3, 0x2119

    const-string v4, "&primes;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 733
    const/16 v3, 0x2119

    const-string v4, "&Popf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 734
    const/16 v3, 0x211a

    const-string v4, "&rationals;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 735
    const/16 v3, 0x211a

    const-string v4, "&Qopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 736
    const/16 v3, 0x211b

    const-string v4, "&realine;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 737
    const/16 v3, 0x211b

    const-string v4, "&Rscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 738
    const/16 v3, 0x211c

    const-string v4, "&real;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 739
    const/16 v3, 0x211c

    const-string v4, "&realpart;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 740
    const/16 v3, 0x211c

    const-string v4, "&Re;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 741
    const/16 v3, 0x211c

    const-string v4, "&Rfr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 742
    const/16 v3, 0x211d

    const-string v4, "&reals;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 743
    const/16 v3, 0x211d

    const-string v4, "&Ropf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 744
    const/16 v3, 0x211e

    const-string v4, "&rx;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 745
    const/16 v3, 0x2122

    const-string v4, "&trade;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 746
    const/16 v3, 0x2122

    const-string v4, "&TRADE;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 747
    const/16 v3, 0x2124

    const-string v4, "&integers;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 748
    const/16 v3, 0x2124

    const-string v4, "&Zopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 749
    const/16 v3, 0x2127

    const-string v4, "&mho;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 750
    const/16 v3, 0x2128

    const-string v4, "&zeetrf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 751
    const/16 v3, 0x2128

    const-string v4, "&Zfr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 752
    const/16 v3, 0x2129

    const-string v4, "&iiota;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 753
    const/16 v3, 0x212c

    const-string v4, "&bernou;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 754
    const/16 v3, 0x212c

    const-string v4, "&Bernoullis;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 755
    const/16 v3, 0x212c

    const-string v4, "&Bscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 756
    const/16 v3, 0x212d

    const-string v4, "&Cayleys;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 757
    const/16 v3, 0x212d

    const-string v4, "&Cfr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 758
    const/16 v3, 0x212f

    const-string v4, "&escr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 759
    const/16 v3, 0x2130

    const-string v4, "&expectation;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 760
    const/16 v3, 0x2130

    const-string v4, "&Escr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 761
    const/16 v3, 0x2131

    const-string v4, "&Fouriertrf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 762
    const/16 v3, 0x2131

    const-string v4, "&Fscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 763
    const/16 v3, 0x2133

    const-string v4, "&phmmat;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 764
    const/16 v3, 0x2133

    const-string v4, "&Mellintrf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 765
    const/16 v3, 0x2133

    const-string v4, "&Mscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 766
    const/16 v3, 0x2134

    const-string v4, "&order;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 767
    const/16 v3, 0x2134

    const-string v4, "&orderof;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 768
    const/16 v3, 0x2134

    const-string v4, "&oscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 769
    const/16 v3, 0x2135

    const-string v4, "&alefsym;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 770
    const/16 v3, 0x2135

    const-string v4, "&aleph;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 771
    const/16 v3, 0x2136

    const-string v4, "&beth;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 772
    const/16 v3, 0x2137

    const-string v4, "&gimel;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 773
    const/16 v3, 0x2138

    const-string v4, "&daleth;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 774
    const/16 v3, 0x2145

    const-string v4, "&CapitalDifferentialD;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 775
    const/16 v3, 0x2145

    const-string v4, "&DD;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 776
    const/16 v3, 0x2146

    const-string v4, "&dd;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 777
    const/16 v3, 0x2146

    const-string v4, "&DifferentialD;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 778
    const/16 v3, 0x2147

    const-string v4, "&ee;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 779
    const/16 v3, 0x2147

    const-string v4, "&exponentiale;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 780
    const/16 v3, 0x2147

    const-string v4, "&ExponentialE;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 781
    const/16 v3, 0x2148

    const-string v4, "&ii;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 782
    const/16 v3, 0x2148

    const-string v4, "&ImaginaryI;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 783
    const/16 v3, 0x2153

    const-string v4, "&frac13;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 784
    const/16 v3, 0x2154

    const-string v4, "&frac23;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 785
    const/16 v3, 0x2155

    const-string v4, "&frac15;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 786
    const/16 v3, 0x2156

    const-string v4, "&frac25;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 787
    const/16 v3, 0x2157

    const-string v4, "&frac35;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 788
    const/16 v3, 0x2158

    const-string v4, "&frac45;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 789
    const/16 v3, 0x2159

    const-string v4, "&frac16;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 790
    const/16 v3, 0x215a

    const-string v4, "&frac56;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 791
    const/16 v3, 0x215b

    const-string v4, "&frac18;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 792
    const/16 v3, 0x215c

    const-string v4, "&frac38;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 793
    const/16 v3, 0x215d

    const-string v4, "&frac58;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 794
    const/16 v3, 0x215e

    const-string v4, "&frac78;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 795
    const/16 v3, 0x2190

    const-string v4, "&larr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 796
    const/16 v3, 0x2190

    const-string v4, "&leftarrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 797
    const/16 v3, 0x2190

    const-string v4, "&slarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 798
    const/16 v3, 0x2190

    const-string v4, "&LeftArrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 799
    const/16 v3, 0x2190

    const-string v4, "&ShortLeftArrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 800
    const/16 v3, 0x2191

    const-string v4, "&uarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 801
    const/16 v3, 0x2191

    const-string v4, "&uparrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 802
    const/16 v3, 0x2191

    const-string v4, "&ShortUpArrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 803
    const/16 v3, 0x2191

    const-string v4, "&UpArrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 804
    const/16 v3, 0x2192

    const-string v4, "&rarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 805
    const/16 v3, 0x2192

    const-string v4, "&rightarrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 806
    const/16 v3, 0x2192

    const-string v4, "&srarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 807
    const/16 v3, 0x2192

    const-string v4, "&RightArrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 808
    const/16 v3, 0x2192

    const-string v4, "&ShortRightArrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 809
    const/16 v3, 0x2193

    const-string v4, "&darr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 810
    const/16 v3, 0x2193

    const-string v4, "&downarrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 811
    const/16 v3, 0x2193

    const-string v4, "&DownArrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 812
    const/16 v3, 0x2193

    const-string v4, "&ShortDownArrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 813
    const/16 v3, 0x2194

    const-string v4, "&harr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 814
    const/16 v3, 0x2194

    const-string v4, "&leftrightarrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 815
    const/16 v3, 0x2194

    const-string v4, "&LeftRightArrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 816
    const/16 v3, 0x2195

    const-string v4, "&updownarrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 817
    const/16 v3, 0x2195

    const-string v4, "&varr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 818
    const/16 v3, 0x2195

    const-string v4, "&UpDownArrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 819
    const/16 v3, 0x2196

    const-string v4, "&nwarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 820
    const/16 v3, 0x2196

    const-string v4, "&nwarrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 821
    const/16 v3, 0x2196

    const-string v4, "&UpperLeftArrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 822
    const/16 v3, 0x2197

    const-string v4, "&nearr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 823
    const/16 v3, 0x2197

    const-string v4, "&nearrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 824
    const/16 v3, 0x2197

    const-string v4, "&UpperRightArrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 825
    const/16 v3, 0x2198

    const-string v4, "&searr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 826
    const/16 v3, 0x2198

    const-string v4, "&searrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 827
    const/16 v3, 0x2198

    const-string v4, "&LowerRightArrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 828
    const/16 v3, 0x2199

    const-string v4, "&swarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 829
    const/16 v3, 0x2199

    const-string v4, "&swarrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 830
    const/16 v3, 0x2199

    const-string v4, "&LowerLeftArrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 831
    const/16 v3, 0x219a

    const-string v4, "&nlarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 832
    const/16 v3, 0x219a

    const-string v4, "&nleftarrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 833
    const/16 v3, 0x219b

    const-string v4, "&nrarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 834
    const/16 v3, 0x219b

    const-string v4, "&nrightarrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 835
    const/16 v3, 0x219d

    const-string v4, "&rarrw;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 836
    const/16 v3, 0x219d

    const-string v4, "&rightsquigarrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 837
    const/16 v3, 0x219d

    const-string v4, "&nrarrw;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 838
    const/16 v3, 0x219e

    const-string v4, "&twoheadleftarrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 839
    const/16 v3, 0x219e

    const-string v4, "&Larr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 840
    const/16 v3, 0x219f

    const-string v4, "&Uarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 841
    const/16 v3, 0x21a0

    const-string v4, "&twoheadrightarrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 842
    const/16 v3, 0x21a0

    const-string v4, "&Rarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 843
    const/16 v3, 0x21a1

    const-string v4, "&Darr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 844
    const/16 v3, 0x21a2

    const-string v4, "&larrtl;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 845
    const/16 v3, 0x21a2

    const-string v4, "&leftarrowtail;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 846
    const/16 v3, 0x21a3

    const-string v4, "&rarrtl;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 847
    const/16 v3, 0x21a3

    const-string v4, "&rightarrowtail;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 848
    const/16 v3, 0x21a4

    const-string v4, "&mapstoleft;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 849
    const/16 v3, 0x21a4

    const-string v4, "&LeftTeeArrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 850
    const/16 v3, 0x21a5

    const-string v4, "&mapstoup;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 851
    const/16 v3, 0x21a5

    const-string v4, "&UpTeeArrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 852
    const/16 v3, 0x21a6

    const-string v4, "&map;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 853
    const/16 v3, 0x21a6

    const-string v4, "&mapsto;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 854
    const/16 v3, 0x21a6

    const-string v4, "&RightTeeArrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 855
    const/16 v3, 0x21a7

    const-string v4, "&mapstodown;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 856
    const/16 v3, 0x21a7

    const-string v4, "&DownTeeArrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 857
    const/16 v3, 0x21a9

    const-string v4, "&hookleftarrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 858
    const/16 v3, 0x21a9

    const-string v4, "&larrhk;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 859
    const/16 v3, 0x21aa

    const-string v4, "&hookrightarrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 860
    const/16 v3, 0x21aa

    const-string v4, "&rarrhk;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 861
    const/16 v3, 0x21ab

    const-string v4, "&larrlp;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 862
    const/16 v3, 0x21ab

    const-string v4, "&looparrowleft;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 863
    const/16 v3, 0x21ac

    const-string v4, "&looparrowright;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 864
    const/16 v3, 0x21ac

    const-string v4, "&rarrlp;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 865
    const/16 v3, 0x21ad

    const-string v4, "&harrw;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 866
    const/16 v3, 0x21ad

    const-string v4, "&leftrightsquigarrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 867
    const/16 v3, 0x21ae

    const-string v4, "&nharr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 868
    const/16 v3, 0x21ae

    const-string v4, "&nleftrightarrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 869
    const/16 v3, 0x21b0

    const-string v4, "&lsh;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 870
    const/16 v3, 0x21b0

    const-string v4, "&Lsh;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 871
    const/16 v3, 0x21b1

    const-string v4, "&rsh;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 872
    const/16 v3, 0x21b1

    const-string v4, "&Rsh;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 873
    const/16 v3, 0x21b2

    const-string v4, "&ldsh;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 874
    const/16 v3, 0x21b3

    const-string v4, "&rdsh;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 875
    const/16 v3, 0x21b5

    const-string v4, "&crarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 876
    const/16 v3, 0x21b6

    const-string v4, "&cularr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 877
    const/16 v3, 0x21b6

    const-string v4, "&curvearrowleft;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 878
    const/16 v3, 0x21b7

    const-string v4, "&curarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 879
    const/16 v3, 0x21b7

    const-string v4, "&curvearrowright;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 880
    const/16 v3, 0x21ba

    const-string v4, "&circlearrowleft;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 881
    const/16 v3, 0x21ba

    const-string v4, "&olarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 882
    const/16 v3, 0x21bb

    const-string v4, "&circlearrowright;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 883
    const/16 v3, 0x21bb

    const-string v4, "&orarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 884
    const/16 v3, 0x21bc

    const-string v4, "&leftharpoonup;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 885
    const/16 v3, 0x21bc

    const-string v4, "&lharu;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 886
    const/16 v3, 0x21bc

    const-string v4, "&LeftVector;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 887
    const/16 v3, 0x21bd

    const-string v4, "&leftharpoondown;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 888
    const/16 v3, 0x21bd

    const-string v4, "&lhard;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 889
    const/16 v3, 0x21bd

    const-string v4, "&DownLeftVector;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 890
    const/16 v3, 0x21be

    const-string v4, "&uharr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 891
    const/16 v3, 0x21be

    const-string v4, "&upharpoonright;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 892
    const/16 v3, 0x21be

    const-string v4, "&RightUpVector;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 893
    const/16 v3, 0x21bf

    const-string v4, "&uharl;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 894
    const/16 v3, 0x21bf

    const-string v4, "&upharpoonleft;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 895
    const/16 v3, 0x21bf

    const-string v4, "&LeftUpVector;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 896
    const/16 v3, 0x21c0

    const-string v4, "&rharu;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 897
    const/16 v3, 0x21c0

    const-string v4, "&rightharpoonup;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 898
    const/16 v3, 0x21c0

    const-string v4, "&RightVector;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 899
    const/16 v3, 0x21c1

    const-string v4, "&rhard;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 900
    const/16 v3, 0x21c1

    const-string v4, "&rightharpoondown;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 901
    const/16 v3, 0x21c1

    const-string v4, "&DownRightVector;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 902
    const/16 v3, 0x21c2

    const-string v4, "&dharr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 903
    const/16 v3, 0x21c2

    const-string v4, "&downharpoonright;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 904
    const/16 v3, 0x21c2

    const-string v4, "&RightDownVector;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 905
    const/16 v3, 0x21c3

    const-string v4, "&dharl;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 906
    const/16 v3, 0x21c3

    const-string v4, "&downharpoonleft;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 907
    const/16 v3, 0x21c3

    const-string v4, "&LeftDownVector;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 908
    const/16 v3, 0x21c4

    const-string v4, "&rightleftarrows;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 909
    const/16 v3, 0x21c4

    const-string v4, "&rlarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 910
    const/16 v3, 0x21c4

    const-string v4, "&RightArrowLeftArrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 911
    const/16 v3, 0x21c5

    const-string v4, "&udarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 912
    const/16 v3, 0x21c5

    const-string v4, "&UpArrowDownArrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 913
    const/16 v3, 0x21c6

    const-string v4, "&leftrightarrows;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 914
    const/16 v3, 0x21c6

    const-string v4, "&lrarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 915
    const/16 v3, 0x21c6

    const-string v4, "&LeftArrowRightArrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 916
    const/16 v3, 0x21c7

    const-string v4, "&leftleftarrows;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 917
    const/16 v3, 0x21c7

    const-string v4, "&llarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 918
    const/16 v3, 0x21c8

    const-string v4, "&upuparrows;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 919
    const/16 v3, 0x21c8

    const-string v4, "&uuarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 920
    const/16 v3, 0x21c9

    const-string v4, "&rightrightarrows;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 921
    const/16 v3, 0x21c9

    const-string v4, "&rrarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 922
    const/16 v3, 0x21ca

    const-string v4, "&ddarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 923
    const/16 v3, 0x21ca

    const-string v4, "&downdownarrows;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 924
    const/16 v3, 0x21cb

    const-string v4, "&leftrightharpoons;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 925
    const/16 v3, 0x21cb

    const-string v4, "&lrhar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 926
    const/16 v3, 0x21cb

    const-string v4, "&ReverseEquilibrium;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 927
    const/16 v3, 0x21cc

    const-string v4, "&rightleftharpoons;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 928
    const/16 v3, 0x21cc

    const-string v4, "&rlhar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 929
    const/16 v3, 0x21cc

    const-string v4, "&Equilibrium;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 930
    const/16 v3, 0x21cd

    const-string v4, "&nLeftarrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 931
    const/16 v3, 0x21cd

    const-string v4, "&nlArr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 932
    const/16 v3, 0x21ce

    const-string v4, "&nLeftrightarrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 933
    const/16 v3, 0x21ce

    const-string v4, "&nhArr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 934
    const/16 v3, 0x21cf

    const-string v4, "&nRightarrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 935
    const/16 v3, 0x21cf

    const-string v4, "&nrArr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 936
    const/16 v3, 0x21d0

    const-string v4, "&lArr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 937
    const/16 v3, 0x21d0

    const-string v4, "&DoubleLeftArrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 938
    const/16 v3, 0x21d0

    const-string v4, "&Leftarrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 939
    const/16 v3, 0x21d1

    const-string v4, "&uArr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 940
    const/16 v3, 0x21d1

    const-string v4, "&DoubleUpArrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 941
    const/16 v3, 0x21d1

    const-string v4, "&Uparrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 942
    const/16 v3, 0x21d2

    const-string v4, "&rArr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 943
    const/16 v3, 0x21d2

    const-string v4, "&DoubleRightArrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 944
    const/16 v3, 0x21d2

    const-string v4, "&Implies;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 945
    const/16 v3, 0x21d2

    const-string v4, "&Rightarrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 946
    const/16 v3, 0x21d3

    const-string v4, "&dArr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 947
    const/16 v3, 0x21d3

    const-string v4, "&DoubleDownArrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 948
    const/16 v3, 0x21d3

    const-string v4, "&Downarrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 949
    const/16 v3, 0x21d4

    const-string v4, "&hArr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 950
    const/16 v3, 0x21d4

    const-string v4, "&iff;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 951
    const/16 v3, 0x21d4

    const-string v4, "&DoubleLeftRightArrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 952
    const/16 v3, 0x21d4

    const-string v4, "&Leftrightarrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 953
    const/16 v3, 0x21d5

    const-string v4, "&vArr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 954
    const/16 v3, 0x21d5

    const-string v4, "&DoubleUpDownArrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 955
    const/16 v3, 0x21d5

    const-string v4, "&Updownarrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 956
    const/16 v3, 0x21d6

    const-string v4, "&nwArr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 957
    const/16 v3, 0x21d7

    const-string v4, "&neArr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 958
    const/16 v3, 0x21d8

    const-string v4, "&seArr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 959
    const/16 v3, 0x21d9

    const-string v4, "&swArr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 960
    const/16 v3, 0x21da

    const-string v4, "&lAarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 961
    const/16 v3, 0x21da

    const-string v4, "&Lleftarrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 962
    const/16 v3, 0x21db

    const-string v4, "&rAarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 963
    const/16 v3, 0x21db

    const-string v4, "&Rrightarrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 964
    const/16 v3, 0x21dd

    const-string v4, "&zigrarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 965
    const/16 v3, 0x21e4

    const-string v4, "&larrb;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 966
    const/16 v3, 0x21e4

    const-string v4, "&LeftArrowBar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 967
    const/16 v3, 0x21e5

    const-string v4, "&rarrb;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 968
    const/16 v3, 0x21e5

    const-string v4, "&RightArrowBar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 969
    const/16 v3, 0x21f5

    const-string v4, "&duarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 970
    const/16 v3, 0x21f5

    const-string v4, "&DownArrowUpArrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 971
    const/16 v3, 0x21fd

    const-string v4, "&loarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 972
    const/16 v3, 0x21fe

    const-string v4, "&roarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 973
    const/16 v3, 0x21ff

    const-string v4, "&hoarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 974
    const/16 v3, 0x2200

    const-string v4, "&forall;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 975
    const/16 v3, 0x2200

    const-string v4, "&ForAll;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 976
    const/16 v3, 0x2201

    const-string v4, "&comp;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 977
    const/16 v3, 0x2201

    const-string v4, "&complement;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 978
    const/16 v3, 0x2202

    const-string v4, "&part;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 979
    const/16 v3, 0x2202

    const-string v4, "&PartialD;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 980
    const/16 v3, 0x2202

    const-string v4, "&npart;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 981
    const/16 v3, 0x2203

    const-string v4, "&exist;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 982
    const/16 v3, 0x2203

    const-string v4, "&Exists;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 983
    const/16 v3, 0x2204

    const-string v4, "&nexist;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 984
    const/16 v3, 0x2204

    const-string v4, "&nexists;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 985
    const/16 v3, 0x2204

    const-string v4, "&NotExists;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 986
    const/16 v3, 0x2205

    const-string v4, "&empty;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 987
    const/16 v3, 0x2205

    const-string v4, "&emptyset;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 988
    const/16 v3, 0x2205

    const-string v4, "&emptyv;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 989
    const/16 v3, 0x2205

    const-string v4, "&varnothing;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 990
    const/16 v3, 0x2207

    const-string v4, "&nabla;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 991
    const/16 v3, 0x2207

    const-string v4, "&Del;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 992
    const/16 v3, 0x2208

    const-string v4, "&isin;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 993
    const/16 v3, 0x2208

    const-string v4, "&in;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 994
    const/16 v3, 0x2208

    const-string v4, "&isinv;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 995
    const/16 v3, 0x2208

    const-string v4, "&Element;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 996
    const/16 v3, 0x2209

    const-string v4, "&notin;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 997
    const/16 v3, 0x2209

    const-string v4, "&notinva;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 998
    const/16 v3, 0x2209

    const-string v4, "&NotElement;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 999
    const/16 v3, 0x220b

    const-string v4, "&ni;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1000
    const/16 v3, 0x220b

    const-string v4, "&niv;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1001
    const/16 v3, 0x220b

    const-string v4, "&ReverseElement;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1002
    const/16 v3, 0x220b

    const-string v4, "&SuchThat;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1003
    const/16 v3, 0x220c

    const-string v4, "&notni;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1004
    const/16 v3, 0x220c

    const-string v4, "&notniva;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1005
    const/16 v3, 0x220c

    const-string v4, "&NotReverseElement;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1006
    const/16 v3, 0x220f

    const-string v4, "&prod;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1007
    const/16 v3, 0x220f

    const-string v4, "&Product;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1008
    const/16 v3, 0x2210

    const-string v4, "&coprod;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1009
    const/16 v3, 0x2210

    const-string v4, "&Coproduct;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1010
    const/16 v3, 0x2211

    const-string v4, "&sum;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1011
    const/16 v3, 0x2211

    const-string v4, "&Sum;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1012
    const/16 v3, 0x2212

    const-string v4, "&minus;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1013
    const/16 v3, 0x2213

    const-string v4, "&mnplus;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1014
    const/16 v3, 0x2213

    const-string v4, "&mp;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1015
    const/16 v3, 0x2213

    const-string v4, "&MinusPlus;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1016
    const/16 v3, 0x2214

    const-string v4, "&dotplus;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1017
    const/16 v3, 0x2214

    const-string v4, "&plusdo;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1018
    const/16 v3, 0x2216

    const-string v4, "&setminus;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1019
    const/16 v3, 0x2216

    const-string v4, "&setmn;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1020
    const/16 v3, 0x2216

    const-string v4, "&smallsetminus;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1021
    const/16 v3, 0x2216

    const-string v4, "&ssetmn;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1022
    const/16 v3, 0x2216

    const-string v4, "&Backslash;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1023
    const/16 v3, 0x2217

    const-string v4, "&lowast;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1024
    const/16 v3, 0x2218

    const-string v4, "&compfn;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1025
    const/16 v3, 0x2218

    const-string v4, "&SmallCircle;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1026
    const/16 v3, 0x221a

    const-string v4, "&radic;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1027
    const/16 v3, 0x221a

    const-string v4, "&Sqrt;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1028
    const/16 v3, 0x221d

    const-string v4, "&prop;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1029
    const/16 v3, 0x221d

    const-string v4, "&propto;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1030
    const/16 v3, 0x221d

    const-string v4, "&varpropto;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1031
    const/16 v3, 0x221d

    const-string v4, "&vprop;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1032
    const/16 v3, 0x221d

    const-string v4, "&Proportional;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1033
    const/16 v3, 0x221e

    const-string v4, "&infin;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1034
    const/16 v3, 0x221f

    const-string v4, "&angrt;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1035
    const/16 v3, 0x2220

    const-string v4, "&ang;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1036
    const/16 v3, 0x2220

    const-string v4, "&angle;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1037
    const/16 v3, 0x2220

    const-string v4, "&nang;"

    invoke-virtual {v2, v3, v8, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1038
    const/16 v3, 0x2221

    const-string v4, "&angmsd;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1039
    const/16 v3, 0x2221

    const-string v4, "&measuredangle;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1040
    const/16 v3, 0x2222

    const-string v4, "&angsph;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1041
    const/16 v3, 0x2223

    const-string v4, "&mid;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1042
    const/16 v3, 0x2223

    const-string v4, "&shortmid;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1043
    const/16 v3, 0x2223

    const-string v4, "&smid;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1044
    const/16 v3, 0x2223

    const-string v4, "&VerticalBar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1045
    const/16 v3, 0x2224

    const-string v4, "&nmid;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1046
    const/16 v3, 0x2224

    const-string v4, "&nshortmid;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1047
    const/16 v3, 0x2224

    const-string v4, "&nsmid;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1048
    const/16 v3, 0x2224

    const-string v4, "&NotVerticalBar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1049
    const/16 v3, 0x2225

    const-string v4, "&par;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1050
    const/16 v3, 0x2225

    const-string v4, "&parallel;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1051
    const/16 v3, 0x2225

    const-string v4, "&shortparallel;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1052
    const/16 v3, 0x2225

    const-string v4, "&spar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1053
    const/16 v3, 0x2225

    const-string v4, "&DoubleVerticalBar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1054
    const/16 v3, 0x2226

    const-string v4, "&npar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1055
    const/16 v3, 0x2226

    const-string v4, "&nparallel;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1056
    const/16 v3, 0x2226

    const-string v4, "&nshortparallel;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1057
    const/16 v3, 0x2226

    const-string v4, "&nspar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1058
    const/16 v3, 0x2226

    const-string v4, "&NotDoubleVerticalBar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1059
    const/16 v3, 0x2227

    const-string v4, "&and;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1060
    const/16 v3, 0x2227

    const-string v4, "&wedge;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1061
    const/16 v3, 0x2228

    const-string v4, "&or;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1062
    const/16 v3, 0x2228

    const-string v4, "&vee;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1063
    const/16 v3, 0x2229

    const-string v4, "&cap;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1064
    const/16 v3, 0x2229

    const-string v4, "&caps;"

    invoke-virtual {v2, v3, v7, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1065
    const/16 v3, 0x222a

    const-string v4, "&cup;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1066
    const/16 v3, 0x222a

    const-string v4, "&cups;"

    invoke-virtual {v2, v3, v7, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1067
    const/16 v3, 0x222b

    const-string v4, "&int;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1068
    const/16 v3, 0x222b

    const-string v4, "&Integral;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1069
    const/16 v3, 0x222c

    const-string v4, "&Int;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1070
    const/16 v3, 0x222d

    const-string v4, "&iiint;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1071
    const/16 v3, 0x222d

    const-string v4, "&tint;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1072
    const/16 v3, 0x222e

    const-string v4, "&conint;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1073
    const/16 v3, 0x222e

    const-string v4, "&oint;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1074
    const/16 v3, 0x222e

    const-string v4, "&ContourIntegral;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1075
    const/16 v3, 0x222f

    const-string v4, "&Conint;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1076
    const/16 v3, 0x222f

    const-string v4, "&DoubleContourIntegral;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1077
    const/16 v3, 0x2230

    const-string v4, "&Cconint;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1078
    const/16 v3, 0x2231

    const-string v4, "&cwint;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1079
    const/16 v3, 0x2232

    const-string v4, "&cwconint;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1080
    const/16 v3, 0x2232

    const-string v4, "&ClockwiseContourIntegral;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1081
    const/16 v3, 0x2233

    const-string v4, "&awconint;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1082
    const/16 v3, 0x2233

    const-string v4, "&CounterClockwiseContourIntegral;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1083
    const/16 v3, 0x2234

    const-string v4, "&there4;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1084
    const/16 v3, 0x2234

    const-string v4, "&therefore;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1085
    const/16 v3, 0x2234

    const-string v4, "&Therefore;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1086
    const/16 v3, 0x2235

    const-string v4, "&becaus;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1087
    const/16 v3, 0x2235

    const-string v4, "&because;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1088
    const/16 v3, 0x2235

    const-string v4, "&Because;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1089
    const/16 v3, 0x2236

    const-string v4, "&ratio;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1090
    const/16 v3, 0x2237

    const-string v4, "&Colon;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1091
    const/16 v3, 0x2237

    const-string v4, "&Proportion;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1092
    const/16 v3, 0x2238

    const-string v4, "&dotminus;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1093
    const/16 v3, 0x2238

    const-string v4, "&minusd;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1094
    const/16 v3, 0x223a

    const-string v4, "&mDDot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1095
    const/16 v3, 0x223b

    const-string v4, "&homtht;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1096
    const/16 v3, 0x223c

    const-string v4, "&sim;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1097
    const/16 v3, 0x223c

    const-string v4, "&thicksim;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1098
    const/16 v3, 0x223c

    const-string v4, "&thksim;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1099
    const/16 v3, 0x223c

    const-string v4, "&Tilde;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1100
    const/16 v3, 0x223c

    const-string v4, "&nvsim;"

    invoke-virtual {v2, v3, v8, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1101
    const/16 v3, 0x223d

    const-string v4, "&backsim;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1102
    const/16 v3, 0x223d

    const-string v4, "&bsim;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1103
    const/16 v3, 0x223d

    const/16 v4, 0x331

    const-string v5, "&race;"

    invoke-virtual {v2, v3, v4, v5}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1104
    const/16 v3, 0x223e

    const-string v4, "&ac;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1105
    const/16 v3, 0x223e

    const-string v4, "&mstpos;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1106
    const/16 v3, 0x223e

    const/16 v4, 0x333

    const-string v5, "&acE;"

    invoke-virtual {v2, v3, v4, v5}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1107
    const/16 v3, 0x223f

    const-string v4, "&acd;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1108
    const/16 v3, 0x2240

    const-string v4, "&wr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1109
    const/16 v3, 0x2240

    const-string v4, "&wreath;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1110
    const/16 v3, 0x2240

    const-string v4, "&VerticalTilde;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1111
    const/16 v3, 0x2241

    const-string v4, "&nsim;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1112
    const/16 v3, 0x2241

    const-string v4, "&NotTilde;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1113
    const/16 v3, 0x2242

    const-string v4, "&eqsim;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1114
    const/16 v3, 0x2242

    const-string v4, "&esim;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1115
    const/16 v3, 0x2242

    const-string v4, "&EqualTilde;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1116
    const/16 v3, 0x2242

    const-string v4, "&nesim;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1117
    const/16 v3, 0x2242

    const-string v4, "&NotEqualTilde;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1118
    const/16 v3, 0x2243

    const-string v4, "&sime;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1119
    const/16 v3, 0x2243

    const-string v4, "&simeq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1120
    const/16 v3, 0x2243

    const-string v4, "&TildeEqual;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1121
    const/16 v3, 0x2244

    const-string v4, "&nsime;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1122
    const/16 v3, 0x2244

    const-string v4, "&nsimeq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1123
    const/16 v3, 0x2244

    const-string v4, "&NotTildeEqual;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1124
    const/16 v3, 0x2245

    const-string v4, "&cong;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1125
    const/16 v3, 0x2245

    const-string v4, "&TildeFullEqual;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1126
    const/16 v3, 0x2246

    const-string v4, "&simne;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1127
    const/16 v3, 0x2247

    const-string v4, "&ncong;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1128
    const/16 v3, 0x2247

    const-string v4, "&NotTildeFullEqual;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1129
    const/16 v3, 0x2248

    const-string v4, "&asymp;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1130
    const/16 v3, 0x2248

    const-string v4, "&ap;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1131
    const/16 v3, 0x2248

    const-string v4, "&approx;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1132
    const/16 v3, 0x2248

    const-string v4, "&thickapprox;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1133
    const/16 v3, 0x2248

    const-string v4, "&thkap;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1134
    const/16 v3, 0x2248

    const-string v4, "&TildeTilde;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1135
    const/16 v3, 0x2249

    const-string v4, "&nap;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1136
    const/16 v3, 0x2249

    const-string v4, "&napprox;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1137
    const/16 v3, 0x2249

    const-string v4, "&NotTildeTilde;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1138
    const/16 v3, 0x224a

    const-string v4, "&ape;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1139
    const/16 v3, 0x224a

    const-string v4, "&approxeq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1140
    const/16 v3, 0x224b

    const-string v4, "&apid;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1141
    const/16 v3, 0x224b

    const-string v4, "&napid;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1142
    const/16 v3, 0x224c

    const-string v4, "&backcong;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1143
    const/16 v3, 0x224c

    const-string v4, "&bcong;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1144
    const/16 v3, 0x224d

    const-string v4, "&asympeq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1145
    const/16 v3, 0x224d

    const-string v4, "&CupCap;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1146
    const/16 v3, 0x224d

    const-string v4, "&nvap;"

    invoke-virtual {v2, v3, v8, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1147
    const/16 v3, 0x224e

    const-string v4, "&bump;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1148
    const/16 v3, 0x224e

    const-string v4, "&Bumpeq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1149
    const/16 v3, 0x224e

    const-string v4, "&HumpDownHump;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1150
    const/16 v3, 0x224e

    const-string v4, "&nbump;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1151
    const/16 v3, 0x224e

    const-string v4, "&NotHumpDownHump;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1152
    const/16 v3, 0x224f

    const-string v4, "&bumpe;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1153
    const/16 v3, 0x224f

    const-string v4, "&bumpeq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1154
    const/16 v3, 0x224f

    const-string v4, "&HumpEqual;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1155
    const/16 v3, 0x224f

    const-string v4, "&nbumpe;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1156
    const/16 v3, 0x224f

    const-string v4, "&NotHumpEqual;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1157
    const/16 v3, 0x2250

    const-string v4, "&doteq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1158
    const/16 v3, 0x2250

    const-string v4, "&esdot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1159
    const/16 v3, 0x2250

    const-string v4, "&DotEqual;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1160
    const/16 v3, 0x2250

    const-string v4, "&nedot;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1161
    const/16 v3, 0x2251

    const-string v4, "&doteqdot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1162
    const/16 v3, 0x2251

    const-string v4, "&eDot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1163
    const/16 v3, 0x2252

    const-string v4, "&efDot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1164
    const/16 v3, 0x2252

    const-string v4, "&fallingdotseq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1165
    const/16 v3, 0x2253

    const-string v4, "&erDot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1166
    const/16 v3, 0x2253

    const-string v4, "&risingdotseq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1167
    const/16 v3, 0x2254

    const-string v4, "&colone;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1168
    const/16 v3, 0x2254

    const-string v4, "&coloneq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1169
    const/16 v3, 0x2254

    const-string v4, "&Assign;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1170
    const/16 v3, 0x2255

    const-string v4, "&ecolon;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1171
    const/16 v3, 0x2255

    const-string v4, "&eqcolon;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1172
    const/16 v3, 0x2256

    const-string v4, "&ecir;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1173
    const/16 v3, 0x2256

    const-string v4, "&eqcirc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1174
    const/16 v3, 0x2257

    const-string v4, "&circeq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1175
    const/16 v3, 0x2257

    const-string v4, "&cire;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1176
    const/16 v3, 0x2259

    const-string v4, "&wedgeq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1177
    const/16 v3, 0x225a

    const-string v4, "&veeeq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1178
    const/16 v3, 0x225c

    const-string v4, "&triangleq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1179
    const/16 v3, 0x225c

    const-string v4, "&trie;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1180
    const/16 v3, 0x225f

    const-string v4, "&equest;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1181
    const/16 v3, 0x225f

    const-string v4, "&questeq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1182
    const/16 v3, 0x2260

    const-string v4, "&ne;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1183
    const/16 v3, 0x2260

    const-string v4, "&NotEqual;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1184
    const/16 v3, 0x2261

    const-string v4, "&equiv;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1185
    const/16 v3, 0x2261

    const-string v4, "&Congruent;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1186
    const/16 v3, 0x2261

    const/16 v4, 0x20e5

    const-string v5, "&bnequiv;"

    invoke-virtual {v2, v3, v4, v5}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1187
    const/16 v3, 0x2262

    const-string v4, "&nequiv;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1188
    const/16 v3, 0x2262

    const-string v4, "&NotCongruent;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1189
    const/16 v3, 0x2264

    const-string v4, "&le;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1190
    const/16 v3, 0x2264

    const-string v4, "&leq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1191
    const/16 v3, 0x2264

    const-string v4, "&nvle;"

    invoke-virtual {v2, v3, v8, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1192
    const/16 v3, 0x2265

    const-string v4, "&ge;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1193
    const/16 v3, 0x2265

    const-string v4, "&geq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1194
    const/16 v3, 0x2265

    const-string v4, "&GreaterEqual;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1195
    const/16 v3, 0x2265

    const-string v4, "&nvge;"

    invoke-virtual {v2, v3, v8, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1196
    const/16 v3, 0x2266

    const-string v4, "&lE;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1197
    const/16 v3, 0x2266

    const-string v4, "&leqq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1198
    const/16 v3, 0x2266

    const-string v4, "&LessFullEqual;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1199
    const/16 v3, 0x2266

    const-string v4, "&nlE;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1200
    const/16 v3, 0x2266

    const-string v4, "&nleqq;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1201
    const/16 v3, 0x2267

    const-string v4, "&gE;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1202
    const/16 v3, 0x2267

    const-string v4, "&geqq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1203
    const/16 v3, 0x2267

    const-string v4, "&GreaterFullEqual;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1204
    const/16 v3, 0x2267

    const-string v4, "&ngE;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1205
    const/16 v3, 0x2267

    const-string v4, "&ngeqq;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1206
    const/16 v3, 0x2267

    const-string v4, "&NotGreaterFullEqual;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1207
    const/16 v3, 0x2268

    const-string v4, "&lnE;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1208
    const/16 v3, 0x2268

    const-string v4, "&lneqq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1209
    const/16 v3, 0x2268

    const-string v4, "&lvertneqq;"

    invoke-virtual {v2, v3, v7, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1210
    const/16 v3, 0x2268

    const-string v4, "&lvnE;"

    invoke-virtual {v2, v3, v7, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1211
    const/16 v3, 0x2269

    const-string v4, "&gnE;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1212
    const/16 v3, 0x2269

    const-string v4, "&gneqq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1213
    const/16 v3, 0x2269

    const-string v4, "&gvertneqq;"

    invoke-virtual {v2, v3, v7, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1214
    const/16 v3, 0x2269

    const-string v4, "&gvnE;"

    invoke-virtual {v2, v3, v7, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1215
    const/16 v3, 0x226a

    const-string v4, "&ll;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1216
    const/16 v3, 0x226a

    const-string v4, "&Lt;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1217
    const/16 v3, 0x226a

    const-string v4, "&NestedLessLess;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1218
    const/16 v3, 0x226a

    const-string v4, "&nLtv;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1219
    const/16 v3, 0x226a

    const-string v4, "&NotLessLess;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1220
    const/16 v3, 0x226a

    const-string v4, "&nLt;"

    invoke-virtual {v2, v3, v8, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1221
    const/16 v3, 0x226b

    const-string v4, "&gg;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1222
    const/16 v3, 0x226b

    const-string v4, "&Gt;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1223
    const/16 v3, 0x226b

    const-string v4, "&NestedGreaterGreater;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1224
    const/16 v3, 0x226b

    const-string v4, "&nGtv;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1225
    const/16 v3, 0x226b

    const-string v4, "&NotGreaterGreater;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1226
    const/16 v3, 0x226b

    const-string v4, "&nGt;"

    invoke-virtual {v2, v3, v8, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1227
    const/16 v3, 0x226c

    const-string v4, "&between;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1228
    const/16 v3, 0x226c

    const-string v4, "&twixt;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1229
    const/16 v3, 0x226d

    const-string v4, "&NotCupCap;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1230
    const/16 v3, 0x226e

    const-string v4, "&nless;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1231
    const/16 v3, 0x226e

    const-string v4, "&nlt;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1232
    const/16 v3, 0x226e

    const-string v4, "&NotLess;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1233
    const/16 v3, 0x226f

    const-string v4, "&ngt;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1234
    const/16 v3, 0x226f

    const-string v4, "&ngtr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1235
    const/16 v3, 0x226f

    const-string v4, "&NotGreater;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1236
    const/16 v3, 0x2270

    const-string v4, "&nle;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1237
    const/16 v3, 0x2270

    const-string v4, "&nleq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1238
    const/16 v3, 0x2270

    const-string v4, "&NotLessEqual;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1239
    const/16 v3, 0x2271

    const-string v4, "&nge;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1240
    const/16 v3, 0x2271

    const-string v4, "&ngeq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1241
    const/16 v3, 0x2271

    const-string v4, "&NotGreaterEqual;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1242
    const/16 v3, 0x2272

    const-string v4, "&lesssim;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1243
    const/16 v3, 0x2272

    const-string v4, "&lsim;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1244
    const/16 v3, 0x2272

    const-string v4, "&LessTilde;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1245
    const/16 v3, 0x2273

    const-string v4, "&gsim;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1246
    const/16 v3, 0x2273

    const-string v4, "&gtrsim;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1247
    const/16 v3, 0x2273

    const-string v4, "&GreaterTilde;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1248
    const/16 v3, 0x2274

    const-string v4, "&nlsim;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1249
    const/16 v3, 0x2274

    const-string v4, "&NotLessTilde;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1250
    const/16 v3, 0x2275

    const-string v4, "&ngsim;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1251
    const/16 v3, 0x2275

    const-string v4, "&NotGreaterTilde;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1252
    const/16 v3, 0x2276

    const-string v4, "&lessgtr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1253
    const/16 v3, 0x2276

    const-string v4, "&lg;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1254
    const/16 v3, 0x2276

    const-string v4, "&LessGreater;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1255
    const/16 v3, 0x2277

    const-string v4, "&gl;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1256
    const/16 v3, 0x2277

    const-string v4, "&gtrless;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1257
    const/16 v3, 0x2277

    const-string v4, "&GreaterLess;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1258
    const/16 v3, 0x2278

    const-string v4, "&ntlg;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1259
    const/16 v3, 0x2278

    const-string v4, "&NotLessGreater;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1260
    const/16 v3, 0x2279

    const-string v4, "&ntgl;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1261
    const/16 v3, 0x2279

    const-string v4, "&NotGreaterLess;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1262
    const/16 v3, 0x227a

    const-string v4, "&pr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1263
    const/16 v3, 0x227a

    const-string v4, "&prec;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1264
    const/16 v3, 0x227a

    const-string v4, "&Precedes;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1265
    const/16 v3, 0x227b

    const-string v4, "&sc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1266
    const/16 v3, 0x227b

    const-string v4, "&succ;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1267
    const/16 v3, 0x227b

    const-string v4, "&Succeeds;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1268
    const/16 v3, 0x227c

    const-string v4, "&prcue;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1269
    const/16 v3, 0x227c

    const-string v4, "&preccurlyeq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1270
    const/16 v3, 0x227c

    const-string v4, "&PrecedesSlantEqual;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1271
    const/16 v3, 0x227d

    const-string v4, "&sccue;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1272
    const/16 v3, 0x227d

    const-string v4, "&succcurlyeq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1273
    const/16 v3, 0x227d

    const-string v4, "&SucceedsSlantEqual;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1274
    const/16 v3, 0x227e

    const-string v4, "&precsim;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1275
    const/16 v3, 0x227e

    const-string v4, "&prsim;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1276
    const/16 v3, 0x227e

    const-string v4, "&PrecedesTilde;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1277
    const/16 v3, 0x227f

    const-string v4, "&scsim;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1278
    const/16 v3, 0x227f

    const-string v4, "&succsim;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1279
    const/16 v3, 0x227f

    const-string v4, "&SucceedsTilde;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1280
    const/16 v3, 0x227f

    const-string v4, "&NotSucceedsTilde;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1281
    const/16 v3, 0x2280

    const-string v4, "&npr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1282
    const/16 v3, 0x2280

    const-string v4, "&nprec;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1283
    const/16 v3, 0x2280

    const-string v4, "&NotPrecedes;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1284
    const/16 v3, 0x2281

    const-string v4, "&nsc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1285
    const/16 v3, 0x2281

    const-string v4, "&nsucc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1286
    const/16 v3, 0x2281

    const-string v4, "&NotSucceeds;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1287
    const/16 v3, 0x2282

    const-string v4, "&sub;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1288
    const/16 v3, 0x2282

    const-string v4, "&subset;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1289
    const/16 v3, 0x2282

    const-string v4, "&nsubset;"

    invoke-virtual {v2, v3, v8, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1290
    const/16 v3, 0x2282

    const-string v4, "&vnsub;"

    invoke-virtual {v2, v3, v8, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1291
    const/16 v3, 0x2282

    const-string v4, "&NotSubset;"

    invoke-virtual {v2, v3, v8, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1292
    const/16 v3, 0x2283

    const-string v4, "&sup;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1293
    const/16 v3, 0x2283

    const-string v4, "&supset;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1294
    const/16 v3, 0x2283

    const-string v4, "&Superset;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1295
    const/16 v3, 0x2283

    const-string v4, "&nsupset;"

    invoke-virtual {v2, v3, v8, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1296
    const/16 v3, 0x2283

    const-string v4, "&vnsup;"

    invoke-virtual {v2, v3, v8, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1297
    const/16 v3, 0x2283

    const-string v4, "&NotSuperset;"

    invoke-virtual {v2, v3, v8, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1298
    const/16 v3, 0x2284

    const-string v4, "&nsub;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1299
    const/16 v3, 0x2285

    const-string v4, "&nsup;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1300
    const/16 v3, 0x2286

    const-string v4, "&sube;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1301
    const/16 v3, 0x2286

    const-string v4, "&subseteq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1302
    const/16 v3, 0x2286

    const-string v4, "&SubsetEqual;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1303
    const/16 v3, 0x2287

    const-string v4, "&supe;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1304
    const/16 v3, 0x2287

    const-string v4, "&supseteq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1305
    const/16 v3, 0x2287

    const-string v4, "&SupersetEqual;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1306
    const/16 v3, 0x2288

    const-string v4, "&nsube;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1307
    const/16 v3, 0x2288

    const-string v4, "&nsubseteq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1308
    const/16 v3, 0x2288

    const-string v4, "&NotSubsetEqual;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1309
    const/16 v3, 0x2289

    const-string v4, "&nsupe;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1310
    const/16 v3, 0x2289

    const-string v4, "&nsupseteq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1311
    const/16 v3, 0x2289

    const-string v4, "&NotSupersetEqual;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1312
    const/16 v3, 0x228a

    const-string v4, "&subne;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1313
    const/16 v3, 0x228a

    const-string v4, "&subsetneq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1314
    const/16 v3, 0x228a

    const-string v4, "&varsubsetneq;"

    invoke-virtual {v2, v3, v7, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1315
    const/16 v3, 0x228a

    const-string v4, "&vsubne;"

    invoke-virtual {v2, v3, v7, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1316
    const/16 v3, 0x228b

    const-string v4, "&supne;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1317
    const/16 v3, 0x228b

    const-string v4, "&supsetneq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1318
    const/16 v3, 0x228b

    const-string v4, "&varsupsetneq;"

    invoke-virtual {v2, v3, v7, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1319
    const/16 v3, 0x228b

    const-string v4, "&vsupne;"

    invoke-virtual {v2, v3, v7, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1320
    const/16 v3, 0x228d

    const-string v4, "&cupdot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1321
    const/16 v3, 0x228e

    const-string v4, "&uplus;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1322
    const/16 v3, 0x228e

    const-string v4, "&UnionPlus;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1323
    const/16 v3, 0x228f

    const-string v4, "&sqsub;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1324
    const/16 v3, 0x228f

    const-string v4, "&sqsubset;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1325
    const/16 v3, 0x228f

    const-string v4, "&SquareSubset;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1326
    const/16 v3, 0x228f

    const-string v4, "&NotSquareSubset;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1327
    const/16 v3, 0x2290

    const-string v4, "&sqsup;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1328
    const/16 v3, 0x2290

    const-string v4, "&sqsupset;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1329
    const/16 v3, 0x2290

    const-string v4, "&SquareSuperset;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1330
    const/16 v3, 0x2290

    const-string v4, "&NotSquareSuperset;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1331
    const/16 v3, 0x2291

    const-string v4, "&sqsube;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1332
    const/16 v3, 0x2291

    const-string v4, "&sqsubseteq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1333
    const/16 v3, 0x2291

    const-string v4, "&SquareSubsetEqual;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1334
    const/16 v3, 0x2292

    const-string v4, "&sqsupe;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1335
    const/16 v3, 0x2292

    const-string v4, "&sqsupseteq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1336
    const/16 v3, 0x2292

    const-string v4, "&SquareSupersetEqual;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1337
    const/16 v3, 0x2293

    const-string v4, "&sqcap;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1338
    const/16 v3, 0x2293

    const-string v4, "&SquareIntersection;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1339
    const/16 v3, 0x2293

    const-string v4, "&sqcaps;"

    invoke-virtual {v2, v3, v7, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1340
    const/16 v3, 0x2294

    const-string v4, "&sqcup;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1341
    const/16 v3, 0x2294

    const-string v4, "&SquareUnion;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1342
    const/16 v3, 0x2294

    const-string v4, "&sqcups;"

    invoke-virtual {v2, v3, v7, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1343
    const/16 v3, 0x2295

    const-string v4, "&oplus;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1344
    const/16 v3, 0x2295

    const-string v4, "&CirclePlus;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1345
    const/16 v3, 0x2296

    const-string v4, "&ominus;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1346
    const/16 v3, 0x2296

    const-string v4, "&CircleMinus;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1347
    const/16 v3, 0x2297

    const-string v4, "&otimes;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1348
    const/16 v3, 0x2297

    const-string v4, "&CircleTimes;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1349
    const/16 v3, 0x2298

    const-string v4, "&osol;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1350
    const/16 v3, 0x2299

    const-string v4, "&odot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1351
    const/16 v3, 0x2299

    const-string v4, "&CircleDot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1352
    const/16 v3, 0x229a

    const-string v4, "&circledcirc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1353
    const/16 v3, 0x229a

    const-string v4, "&ocir;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1354
    const/16 v3, 0x229b

    const-string v4, "&circledast;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1355
    const/16 v3, 0x229b

    const-string v4, "&oast;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1356
    const/16 v3, 0x229d

    const-string v4, "&circleddash;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1357
    const/16 v3, 0x229d

    const-string v4, "&odash;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1358
    const/16 v3, 0x229e

    const-string v4, "&boxplus;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1359
    const/16 v3, 0x229e

    const-string v4, "&plusb;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1360
    const/16 v3, 0x229f

    const-string v4, "&boxminus;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1361
    const/16 v3, 0x229f

    const-string v4, "&minusb;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1362
    const/16 v3, 0x22a0

    const-string v4, "&boxtimes;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1363
    const/16 v3, 0x22a0

    const-string v4, "&timesb;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1364
    const/16 v3, 0x22a1

    const-string v4, "&dotsquare;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1365
    const/16 v3, 0x22a1

    const-string v4, "&sdotb;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1366
    const/16 v3, 0x22a2

    const-string v4, "&vdash;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1367
    const/16 v3, 0x22a2

    const-string v4, "&RightTee;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1368
    const/16 v3, 0x22a3

    const-string v4, "&dashv;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1369
    const/16 v3, 0x22a3

    const-string v4, "&LeftTee;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1370
    const/16 v3, 0x22a4

    const-string v4, "&top;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1371
    const/16 v3, 0x22a4

    const-string v4, "&DownTee;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1372
    const/16 v3, 0x22a5

    const-string v4, "&perp;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1373
    const/16 v3, 0x22a5

    const-string v4, "&bot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1374
    const/16 v3, 0x22a5

    const-string v4, "&bottom;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1375
    const/16 v3, 0x22a5

    const-string v4, "&UpTee;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1376
    const/16 v3, 0x22a7

    const-string v4, "&models;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1377
    const/16 v3, 0x22a8

    const-string v4, "&vDash;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1378
    const/16 v3, 0x22a8

    const-string v4, "&DoubleRightTee;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1379
    const/16 v3, 0x22a9

    const-string v4, "&Vdash;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1380
    const/16 v3, 0x22aa

    const-string v4, "&Vvdash;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1381
    const/16 v3, 0x22ab

    const-string v4, "&VDash;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1382
    const/16 v3, 0x22ac

    const-string v4, "&nvdash;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1383
    const/16 v3, 0x22ad

    const-string v4, "&nvDash;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1384
    const/16 v3, 0x22ae

    const-string v4, "&nVdash;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1385
    const/16 v3, 0x22af

    const-string v4, "&nVDash;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1386
    const/16 v3, 0x22b0

    const-string v4, "&prurel;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1387
    const/16 v3, 0x22b2

    const-string v4, "&vartriangleleft;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1388
    const/16 v3, 0x22b2

    const-string v4, "&vltri;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1389
    const/16 v3, 0x22b2

    const-string v4, "&LeftTriangle;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1390
    const/16 v3, 0x22b3

    const-string v4, "&vartriangleright;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1391
    const/16 v3, 0x22b3

    const-string v4, "&vrtri;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1392
    const/16 v3, 0x22b3

    const-string v4, "&RightTriangle;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1393
    const/16 v3, 0x22b4

    const-string v4, "&ltrie;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1394
    const/16 v3, 0x22b4

    const-string v4, "&trianglelefteq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1395
    const/16 v3, 0x22b4

    const-string v4, "&LeftTriangleEqual;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1396
    const/16 v3, 0x22b4

    const-string v4, "&nvltrie;"

    invoke-virtual {v2, v3, v8, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1397
    const/16 v3, 0x22b5

    const-string v4, "&rtrie;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1398
    const/16 v3, 0x22b5

    const-string v4, "&trianglerighteq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1399
    const/16 v3, 0x22b5

    const-string v4, "&RightTriangleEqual;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1400
    const/16 v3, 0x22b5

    const-string v4, "&nvrtrie;"

    invoke-virtual {v2, v3, v8, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1401
    const/16 v3, 0x22b6

    const-string v4, "&origof;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1402
    const/16 v3, 0x22b7

    const-string v4, "&imof;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1403
    const/16 v3, 0x22b8

    const-string v4, "&multimap;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1404
    const/16 v3, 0x22b8

    const-string v4, "&mumap;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1405
    const/16 v3, 0x22b9

    const-string v4, "&hercon;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1406
    const/16 v3, 0x22ba

    const-string v4, "&intcal;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1407
    const/16 v3, 0x22ba

    const-string v4, "&intercal;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1408
    const/16 v3, 0x22bb

    const-string v4, "&veebar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1409
    const/16 v3, 0x22bd

    const-string v4, "&barvee;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1410
    const/16 v3, 0x22be

    const-string v4, "&angrtvb;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1411
    const/16 v3, 0x22bf

    const-string v4, "&lrtri;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1412
    const/16 v3, 0x22c0

    const-string v4, "&bigwedge;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1413
    const/16 v3, 0x22c0

    const-string v4, "&xwedge;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1414
    const/16 v3, 0x22c0

    const-string v4, "&Wedge;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1415
    const/16 v3, 0x22c1

    const-string v4, "&bigvee;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1416
    const/16 v3, 0x22c1

    const-string v4, "&xvee;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1417
    const/16 v3, 0x22c1

    const-string v4, "&Vee;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1418
    const/16 v3, 0x22c2

    const-string v4, "&bigcap;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1419
    const/16 v3, 0x22c2

    const-string v4, "&xcap;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1420
    const/16 v3, 0x22c2

    const-string v4, "&Intersection;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1421
    const/16 v3, 0x22c3

    const-string v4, "&bigcup;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1422
    const/16 v3, 0x22c3

    const-string v4, "&xcup;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1423
    const/16 v3, 0x22c3

    const-string v4, "&Union;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1424
    const/16 v3, 0x22c4

    const-string v4, "&diam;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1425
    const/16 v3, 0x22c4

    const-string v4, "&diamond;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1426
    const/16 v3, 0x22c4

    const-string v4, "&Diamond;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1427
    const/16 v3, 0x22c5

    const-string v4, "&sdot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1428
    const/16 v3, 0x22c6

    const-string v4, "&sstarf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1429
    const/16 v3, 0x22c6

    const-string v4, "&Star;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1430
    const/16 v3, 0x22c7

    const-string v4, "&divideontimes;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1431
    const/16 v3, 0x22c7

    const-string v4, "&divonx;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1432
    const/16 v3, 0x22c8

    const-string v4, "&bowtie;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1433
    const/16 v3, 0x22c9

    const-string v4, "&ltimes;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1434
    const/16 v3, 0x22ca

    const-string v4, "&rtimes;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1435
    const/16 v3, 0x22cb

    const-string v4, "&leftthreetimes;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1436
    const/16 v3, 0x22cb

    const-string v4, "&lthree;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1437
    const/16 v3, 0x22cc

    const-string v4, "&rightthreetimes;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1438
    const/16 v3, 0x22cc

    const-string v4, "&rthree;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1439
    const/16 v3, 0x22cd

    const-string v4, "&backsimeq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1440
    const/16 v3, 0x22cd

    const-string v4, "&bsime;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1441
    const/16 v3, 0x22ce

    const-string v4, "&curlyvee;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1442
    const/16 v3, 0x22ce

    const-string v4, "&cuvee;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1443
    const/16 v3, 0x22cf

    const-string v4, "&curlywedge;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1444
    const/16 v3, 0x22cf

    const-string v4, "&cuwed;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1445
    const/16 v3, 0x22d0

    const-string v4, "&Sub;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1446
    const/16 v3, 0x22d0

    const-string v4, "&Subset;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1447
    const/16 v3, 0x22d1

    const-string v4, "&Sup;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1448
    const/16 v3, 0x22d1

    const-string v4, "&Supset;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1449
    const/16 v3, 0x22d2

    const-string v4, "&Cap;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1450
    const/16 v3, 0x22d3

    const-string v4, "&Cup;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1451
    const/16 v3, 0x22d4

    const-string v4, "&fork;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1452
    const/16 v3, 0x22d4

    const-string v4, "&pitchfork;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1453
    const/16 v3, 0x22d5

    const-string v4, "&epar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1454
    const/16 v3, 0x22d6

    const-string v4, "&lessdot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1455
    const/16 v3, 0x22d6

    const-string v4, "&ltdot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1456
    const/16 v3, 0x22d7

    const-string v4, "&gtdot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1457
    const/16 v3, 0x22d7

    const-string v4, "&gtrdot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1458
    const/16 v3, 0x22d8

    const-string v4, "&Ll;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1459
    const/16 v3, 0x22d8

    const-string v4, "&nLl;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1460
    const/16 v3, 0x22d9

    const-string v4, "&ggg;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1461
    const/16 v3, 0x22d9

    const-string v4, "&Gg;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1462
    const/16 v3, 0x22d9

    const-string v4, "&nGg;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1463
    const/16 v3, 0x22da

    const-string v4, "&leg;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1464
    const/16 v3, 0x22da

    const-string v4, "&lesseqgtr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1465
    const/16 v3, 0x22da

    const-string v4, "&LessEqualGreater;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1466
    const/16 v3, 0x22da

    const-string v4, "&lesg;"

    invoke-virtual {v2, v3, v7, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1467
    const/16 v3, 0x22db

    const-string v4, "&gel;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1468
    const/16 v3, 0x22db

    const-string v4, "&gtreqless;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1469
    const/16 v3, 0x22db

    const-string v4, "&GreaterEqualLess;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1470
    const/16 v3, 0x22db

    const-string v4, "&gesl;"

    invoke-virtual {v2, v3, v7, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1471
    const/16 v3, 0x22de

    const-string v4, "&cuepr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1472
    const/16 v3, 0x22de

    const-string v4, "&curlyeqprec;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1473
    const/16 v3, 0x22df

    const-string v4, "&cuesc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1474
    const/16 v3, 0x22df

    const-string v4, "&curlyeqsucc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1475
    const/16 v3, 0x22e0

    const-string v4, "&nprcue;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1476
    const/16 v3, 0x22e0

    const-string v4, "&NotPrecedesSlantEqual;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1477
    const/16 v3, 0x22e1

    const-string v4, "&nsccue;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1478
    const/16 v3, 0x22e1

    const-string v4, "&NotSucceedsSlantEqual;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1479
    const/16 v3, 0x22e2

    const-string v4, "&nsqsube;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1480
    const/16 v3, 0x22e2

    const-string v4, "&NotSquareSubsetEqual;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1481
    const/16 v3, 0x22e3

    const-string v4, "&nsqsupe;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1482
    const/16 v3, 0x22e3

    const-string v4, "&NotSquareSupersetEqual;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1483
    const/16 v3, 0x22e6

    const-string v4, "&lnsim;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1484
    const/16 v3, 0x22e7

    const-string v4, "&gnsim;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1485
    const/16 v3, 0x22e8

    const-string v4, "&precnsim;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1486
    const/16 v3, 0x22e8

    const-string v4, "&prnsim;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1487
    const/16 v3, 0x22e9

    const-string v4, "&scnsim;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1488
    const/16 v3, 0x22e9

    const-string v4, "&succnsim;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1489
    const/16 v3, 0x22ea

    const-string v4, "&nltri;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1490
    const/16 v3, 0x22ea

    const-string v4, "&ntriangleleft;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1491
    const/16 v3, 0x22ea

    const-string v4, "&NotLeftTriangle;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1492
    const/16 v3, 0x22eb

    const-string v4, "&nrtri;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1493
    const/16 v3, 0x22eb

    const-string v4, "&ntriangleright;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1494
    const/16 v3, 0x22eb

    const-string v4, "&NotRightTriangle;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1495
    const/16 v3, 0x22ec

    const-string v4, "&nltrie;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1496
    const/16 v3, 0x22ec

    const-string v4, "&ntrianglelefteq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1497
    const/16 v3, 0x22ec

    const-string v4, "&NotLeftTriangleEqual;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1498
    const/16 v3, 0x22ed

    const-string v4, "&nrtrie;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1499
    const/16 v3, 0x22ed

    const-string v4, "&ntrianglerighteq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1500
    const/16 v3, 0x22ed

    const-string v4, "&NotRightTriangleEqual;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1501
    const/16 v3, 0x22ee

    const-string v4, "&vellip;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1502
    const/16 v3, 0x22ef

    const-string v4, "&ctdot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1503
    const/16 v3, 0x22f0

    const-string v4, "&utdot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1504
    const/16 v3, 0x22f1

    const-string v4, "&dtdot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1505
    const/16 v3, 0x22f2

    const-string v4, "&disin;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1506
    const/16 v3, 0x22f3

    const-string v4, "&isinsv;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1507
    const/16 v3, 0x22f4

    const-string v4, "&isins;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1508
    const/16 v3, 0x22f5

    const-string v4, "&isindot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1509
    const/16 v3, 0x22f5

    const-string v4, "&notindot;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1510
    const/16 v3, 0x22f6

    const-string v4, "&notinvc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1511
    const/16 v3, 0x22f7

    const-string v4, "&notinvb;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1512
    const/16 v3, 0x22f9

    const-string v4, "&isinE;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1513
    const/16 v3, 0x22f9

    const-string v4, "&notinE;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1514
    const/16 v3, 0x22fa

    const-string v4, "&nisd;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1515
    const/16 v3, 0x22fb

    const-string v4, "&xnis;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1516
    const/16 v3, 0x22fc

    const-string v4, "&nis;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1517
    const/16 v3, 0x22fd

    const-string v4, "&notnivc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1518
    const/16 v3, 0x22fe

    const-string v4, "&notnivb;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1519
    const/16 v3, 0x2305

    const-string v4, "&barwed;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1520
    const/16 v3, 0x2305

    const-string v4, "&barwedge;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1521
    const/16 v3, 0x2306

    const-string v4, "&doublebarwedge;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1522
    const/16 v3, 0x2306

    const-string v4, "&Barwed;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1523
    const/16 v3, 0x2308

    const-string v4, "&lceil;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1524
    const/16 v3, 0x2308

    const-string v4, "&LeftCeiling;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1525
    const/16 v3, 0x2309

    const-string v4, "&rceil;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1526
    const/16 v3, 0x2309

    const-string v4, "&RightCeiling;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1527
    const/16 v3, 0x230a

    const-string v4, "&lfloor;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1528
    const/16 v3, 0x230a

    const-string v4, "&LeftFloor;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1529
    const/16 v3, 0x230b

    const-string v4, "&rfloor;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1530
    const/16 v3, 0x230b

    const-string v4, "&RightFloor;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1531
    const/16 v3, 0x230c

    const-string v4, "&drcrop;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1532
    const/16 v3, 0x230d

    const-string v4, "&dlcrop;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1533
    const/16 v3, 0x230e

    const-string v4, "&urcrop;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1534
    const/16 v3, 0x230f

    const-string v4, "&ulcrop;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1535
    const/16 v3, 0x2310

    const-string v4, "&bnot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1536
    const/16 v3, 0x2312

    const-string v4, "&profline;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1537
    const/16 v3, 0x2313

    const-string v4, "&profsurf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1538
    const/16 v3, 0x2315

    const-string v4, "&telrec;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1539
    const/16 v3, 0x2316

    const-string v4, "&target;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1540
    const/16 v3, 0x231c

    const-string v4, "&ulcorn;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1541
    const/16 v3, 0x231c

    const-string v4, "&ulcorner;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1542
    const/16 v3, 0x231d

    const-string v4, "&urcorn;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1543
    const/16 v3, 0x231d

    const-string v4, "&urcorner;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1544
    const/16 v3, 0x231e

    const-string v4, "&dlcorn;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1545
    const/16 v3, 0x231e

    const-string v4, "&llcorner;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1546
    const/16 v3, 0x231f

    const-string v4, "&drcorn;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1547
    const/16 v3, 0x231f

    const-string v4, "&lrcorner;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1548
    const/16 v3, 0x2322

    const-string v4, "&frown;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1549
    const/16 v3, 0x2322

    const-string v4, "&sfrown;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1550
    const/16 v3, 0x2323

    const-string v4, "&smile;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1551
    const/16 v3, 0x2323

    const-string v4, "&ssmile;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1552
    const/16 v3, 0x232d

    const-string v4, "&cylcty;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1553
    const/16 v3, 0x232e

    const-string v4, "&profalar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1554
    const/16 v3, 0x2336

    const-string v4, "&topbot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1555
    const/16 v3, 0x233d

    const-string v4, "&ovbar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1556
    const/16 v3, 0x233f

    const-string v4, "&solbar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1557
    const/16 v3, 0x237c

    const-string v4, "&angzarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1558
    const/16 v3, 0x23b0

    const-string v4, "&lmoust;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1559
    const/16 v3, 0x23b0

    const-string v4, "&lmoustache;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1560
    const/16 v3, 0x23b1

    const-string v4, "&rmoust;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1561
    const/16 v3, 0x23b1

    const-string v4, "&rmoustache;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1562
    const/16 v3, 0x23b4

    const-string v4, "&tbrk;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1563
    const/16 v3, 0x23b4

    const-string v4, "&OverBracket;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1564
    const/16 v3, 0x23b5

    const-string v4, "&bbrk;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1565
    const/16 v3, 0x23b5

    const-string v4, "&UnderBracket;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1566
    const/16 v3, 0x23b6

    const-string v4, "&bbrktbrk;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1567
    const/16 v3, 0x23dc

    const-string v4, "&OverParenthesis;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1568
    const/16 v3, 0x23dd

    const-string v4, "&UnderParenthesis;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1569
    const/16 v3, 0x23de

    const-string v4, "&OverBrace;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1570
    const/16 v3, 0x23df

    const-string v4, "&UnderBrace;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1571
    const/16 v3, 0x23e2

    const-string v4, "&trpezium;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1572
    const/16 v3, 0x23e7

    const-string v4, "&elinters;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1573
    const/16 v3, 0x2423

    const-string v4, "&blank;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1574
    const/16 v3, 0x24c8

    const-string v4, "&circledS;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1575
    const/16 v3, 0x24c8

    const-string v4, "&oS;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1576
    const/16 v3, 0x2500

    const-string v4, "&boxh;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1577
    const/16 v3, 0x2500

    const-string v4, "&HorizontalLine;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1578
    const/16 v3, 0x2502

    const-string v4, "&boxv;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1579
    const/16 v3, 0x250c

    const-string v4, "&boxdr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1580
    const/16 v3, 0x2510

    const-string v4, "&boxdl;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1581
    const/16 v3, 0x2514

    const-string v4, "&boxur;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1582
    const/16 v3, 0x2518

    const-string v4, "&boxul;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1583
    const/16 v3, 0x251c

    const-string v4, "&boxvr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1584
    const/16 v3, 0x2524

    const-string v4, "&boxvl;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1585
    const/16 v3, 0x252c

    const-string v4, "&boxhd;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1586
    const/16 v3, 0x2534

    const-string v4, "&boxhu;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1587
    const/16 v3, 0x253c

    const-string v4, "&boxvh;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1588
    const/16 v3, 0x2550

    const-string v4, "&boxH;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1589
    const/16 v3, 0x2551

    const-string v4, "&boxV;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1590
    const/16 v3, 0x2552

    const-string v4, "&boxdR;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1591
    const/16 v3, 0x2553

    const-string v4, "&boxDr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1592
    const/16 v3, 0x2554

    const-string v4, "&boxDR;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1593
    const/16 v3, 0x2555

    const-string v4, "&boxdL;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1594
    const/16 v3, 0x2556

    const-string v4, "&boxDl;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1595
    const/16 v3, 0x2557

    const-string v4, "&boxDL;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1596
    const/16 v3, 0x2558

    const-string v4, "&boxuR;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1597
    const/16 v3, 0x2559

    const-string v4, "&boxUr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1598
    const/16 v3, 0x255a

    const-string v4, "&boxUR;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1599
    const/16 v3, 0x255b

    const-string v4, "&boxuL;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1600
    const/16 v3, 0x255c

    const-string v4, "&boxUl;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1601
    const/16 v3, 0x255d

    const-string v4, "&boxUL;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1602
    const/16 v3, 0x255e

    const-string v4, "&boxvR;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1603
    const/16 v3, 0x255f

    const-string v4, "&boxVr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1604
    const/16 v3, 0x2560

    const-string v4, "&boxVR;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1605
    const/16 v3, 0x2561

    const-string v4, "&boxvL;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1606
    const/16 v3, 0x2562

    const-string v4, "&boxVl;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1607
    const/16 v3, 0x2563

    const-string v4, "&boxVL;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1608
    const/16 v3, 0x2564

    const-string v4, "&boxHd;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1609
    const/16 v3, 0x2565

    const-string v4, "&boxhD;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1610
    const/16 v3, 0x2566

    const-string v4, "&boxHD;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1611
    const/16 v3, 0x2567

    const-string v4, "&boxHu;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1612
    const/16 v3, 0x2568

    const-string v4, "&boxhU;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1613
    const/16 v3, 0x2569

    const-string v4, "&boxHU;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1614
    const/16 v3, 0x256a

    const-string v4, "&boxvH;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1615
    const/16 v3, 0x256b

    const-string v4, "&boxVh;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1616
    const/16 v3, 0x256c

    const-string v4, "&boxVH;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1617
    const/16 v3, 0x2580

    const-string v4, "&uhblk;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1618
    const/16 v3, 0x2584

    const-string v4, "&lhblk;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1619
    const/16 v3, 0x2588

    const-string v4, "&block;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1620
    const/16 v3, 0x2591

    const-string v4, "&blk14;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1621
    const/16 v3, 0x2592

    const-string v4, "&blk12;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1622
    const/16 v3, 0x2593

    const-string v4, "&blk34;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1623
    const/16 v3, 0x25a1

    const-string v4, "&squ;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1624
    const/16 v3, 0x25a1

    const-string v4, "&square;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1625
    const/16 v3, 0x25a1

    const-string v4, "&Square;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1626
    const/16 v3, 0x25aa

    const-string v4, "&blacksquare;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1627
    const/16 v3, 0x25aa

    const-string v4, "&squarf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1628
    const/16 v3, 0x25aa

    const-string v4, "&squf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1629
    const/16 v3, 0x25aa

    const-string v4, "&FilledVerySmallSquare;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1630
    const/16 v3, 0x25ab

    const-string v4, "&EmptyVerySmallSquare;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1631
    const/16 v3, 0x25ad

    const-string v4, "&rect;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1632
    const/16 v3, 0x25ae

    const-string v4, "&marker;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1633
    const/16 v3, 0x25b1

    const-string v4, "&fltns;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1634
    const/16 v3, 0x25b3

    const-string v4, "&bigtriangleup;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1635
    const/16 v3, 0x25b3

    const-string v4, "&xutri;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1636
    const/16 v3, 0x25b4

    const-string v4, "&blacktriangle;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1637
    const/16 v3, 0x25b4

    const-string v4, "&utrif;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1638
    const/16 v3, 0x25b5

    const-string v4, "&triangle;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1639
    const/16 v3, 0x25b5

    const-string v4, "&utri;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1640
    const/16 v3, 0x25b8

    const-string v4, "&blacktriangleright;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1641
    const/16 v3, 0x25b8

    const-string v4, "&rtrif;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1642
    const/16 v3, 0x25b9

    const-string v4, "&rtri;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1643
    const/16 v3, 0x25b9

    const-string v4, "&triangleright;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1644
    const/16 v3, 0x25bd

    const-string v4, "&bigtriangledown;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1645
    const/16 v3, 0x25bd

    const-string v4, "&xdtri;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1646
    const/16 v3, 0x25be

    const-string v4, "&blacktriangledown;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1647
    const/16 v3, 0x25be

    const-string v4, "&dtrif;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1648
    const/16 v3, 0x25bf

    const-string v4, "&dtri;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1649
    const/16 v3, 0x25bf

    const-string v4, "&triangledown;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1650
    const/16 v3, 0x25c2

    const-string v4, "&blacktriangleleft;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1651
    const/16 v3, 0x25c2

    const-string v4, "&ltrif;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1652
    const/16 v3, 0x25c3

    const-string v4, "&ltri;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1653
    const/16 v3, 0x25c3

    const-string v4, "&triangleleft;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1654
    const/16 v3, 0x25ca

    const-string v4, "&loz;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1655
    const/16 v3, 0x25ca

    const-string v4, "&lozenge;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1656
    const/16 v3, 0x25cb

    const-string v4, "&cir;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1657
    const/16 v3, 0x25ec

    const-string v4, "&tridot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1658
    const/16 v3, 0x25ef

    const-string v4, "&bigcirc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1659
    const/16 v3, 0x25ef

    const-string v4, "&xcirc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1660
    const/16 v3, 0x25f8

    const-string v4, "&ultri;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1661
    const/16 v3, 0x25f9

    const-string v4, "&urtri;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1662
    const/16 v3, 0x25fa

    const-string v4, "&lltri;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1663
    const/16 v3, 0x25fb

    const-string v4, "&EmptySmallSquare;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1664
    const/16 v3, 0x25fc

    const-string v4, "&FilledSmallSquare;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1665
    const/16 v3, 0x2605

    const-string v4, "&bigstar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1666
    const/16 v3, 0x2605

    const-string v4, "&starf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1667
    const/16 v3, 0x2606

    const-string v4, "&star;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1668
    const/16 v3, 0x260e

    const-string v4, "&phone;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1669
    const/16 v3, 0x2640

    const-string v4, "&female;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1670
    const/16 v3, 0x2642

    const-string v4, "&male;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1671
    const/16 v3, 0x2660

    const-string v4, "&spades;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1672
    const/16 v3, 0x2660

    const-string v4, "&spadesuit;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1673
    const/16 v3, 0x2663

    const-string v4, "&clubs;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1674
    const/16 v3, 0x2663

    const-string v4, "&clubsuit;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1675
    const/16 v3, 0x2665

    const-string v4, "&hearts;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1676
    const/16 v3, 0x2665

    const-string v4, "&heartsuit;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1677
    const/16 v3, 0x2666

    const-string v4, "&diams;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1678
    const/16 v3, 0x2666

    const-string v4, "&diamondsuit;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1679
    const/16 v3, 0x266a

    const-string v4, "&sung;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1680
    const/16 v3, 0x266d

    const-string v4, "&flat;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1681
    const/16 v3, 0x266e

    const-string v4, "&natur;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1682
    const/16 v3, 0x266e

    const-string v4, "&natural;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1683
    const/16 v3, 0x266f

    const-string v4, "&sharp;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1684
    const/16 v3, 0x2713

    const-string v4, "&check;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1685
    const/16 v3, 0x2713

    const-string v4, "&checkmark;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1686
    const/16 v3, 0x2717

    const-string v4, "&cross;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1687
    const/16 v3, 0x2720

    const-string v4, "&malt;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1688
    const/16 v3, 0x2720

    const-string v4, "&maltese;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1689
    const/16 v3, 0x2736

    const-string v4, "&sext;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1690
    const/16 v3, 0x2758

    const-string v4, "&VerticalSeparator;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1691
    const/16 v3, 0x2772

    const-string v4, "&lbbrk;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1692
    const/16 v3, 0x2773

    const-string v4, "&rbbrk;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1693
    const/16 v3, 0x27c8

    const-string v4, "&bsolhsub;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1694
    const/16 v3, 0x27c9

    const-string v4, "&suphsol;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1695
    const/16 v3, 0x27e6

    const-string v4, "&lobrk;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1696
    const/16 v3, 0x27e6

    const-string v4, "&LeftDoubleBracket;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1697
    const/16 v3, 0x27e7

    const-string v4, "&robrk;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1698
    const/16 v3, 0x27e7

    const-string v4, "&RightDoubleBracket;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1699
    const/16 v3, 0x27e8

    const-string v4, "&lang;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1700
    const/16 v3, 0x27e8

    const-string v4, "&langle;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1701
    const/16 v3, 0x27e8

    const-string v4, "&LeftAngleBracket;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1702
    const/16 v3, 0x27e9

    const-string v4, "&rang;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1703
    const/16 v3, 0x27e9

    const-string v4, "&rangle;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1704
    const/16 v3, 0x27e9

    const-string v4, "&RightAngleBracket;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1705
    const/16 v3, 0x27ea

    const-string v4, "&Lang;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1706
    const/16 v3, 0x27eb

    const-string v4, "&Rang;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1707
    const/16 v3, 0x27ec

    const-string v4, "&loang;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1708
    const/16 v3, 0x27ed

    const-string v4, "&roang;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1709
    const/16 v3, 0x27f5

    const-string v4, "&longleftarrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1710
    const/16 v3, 0x27f5

    const-string v4, "&xlarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1711
    const/16 v3, 0x27f5

    const-string v4, "&LongLeftArrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1712
    const/16 v3, 0x27f6

    const-string v4, "&longrightarrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1713
    const/16 v3, 0x27f6

    const-string v4, "&xrarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1714
    const/16 v3, 0x27f6

    const-string v4, "&LongRightArrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1715
    const/16 v3, 0x27f7

    const-string v4, "&longleftrightarrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1716
    const/16 v3, 0x27f7

    const-string v4, "&xharr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1717
    const/16 v3, 0x27f7

    const-string v4, "&LongLeftRightArrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1718
    const/16 v3, 0x27f8

    const-string v4, "&xlArr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1719
    const/16 v3, 0x27f8

    const-string v4, "&DoubleLongLeftArrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1720
    const/16 v3, 0x27f8

    const-string v4, "&Longleftarrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1721
    const/16 v3, 0x27f9

    const-string v4, "&xrArr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1722
    const/16 v3, 0x27f9

    const-string v4, "&DoubleLongRightArrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1723
    const/16 v3, 0x27f9

    const-string v4, "&Longrightarrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1724
    const/16 v3, 0x27fa

    const-string v4, "&xhArr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1725
    const/16 v3, 0x27fa

    const-string v4, "&DoubleLongLeftRightArrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1726
    const/16 v3, 0x27fa

    const-string v4, "&Longleftrightarrow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1727
    const/16 v3, 0x27fc

    const-string v4, "&longmapsto;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1728
    const/16 v3, 0x27fc

    const-string v4, "&xmap;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1729
    const/16 v3, 0x27ff

    const-string v4, "&dzigrarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1730
    const/16 v3, 0x2902

    const-string v4, "&nvlArr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1731
    const/16 v3, 0x2903

    const-string v4, "&nvrArr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1732
    const/16 v3, 0x2904

    const-string v4, "&nvHarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1733
    const/16 v3, 0x2905

    const-string v4, "&Map;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1734
    const/16 v3, 0x290c

    const-string v4, "&lbarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1735
    const/16 v3, 0x290d

    const-string v4, "&bkarow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1736
    const/16 v3, 0x290d

    const-string v4, "&rbarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1737
    const/16 v3, 0x290e

    const-string v4, "&lBarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1738
    const/16 v3, 0x290f

    const-string v4, "&dbkarow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1739
    const/16 v3, 0x290f

    const-string v4, "&rBarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1740
    const/16 v3, 0x2910

    const-string v4, "&drbkarow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1741
    const/16 v3, 0x2910

    const-string v4, "&RBarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1742
    const/16 v3, 0x2911

    const-string v4, "&DDotrahd;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1743
    const/16 v3, 0x2912

    const-string v4, "&UpArrowBar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1744
    const/16 v3, 0x2913

    const-string v4, "&DownArrowBar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1745
    const/16 v3, 0x2916

    const-string v4, "&Rarrtl;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1746
    const/16 v3, 0x2919

    const-string v4, "&latail;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1747
    const/16 v3, 0x291a

    const-string v4, "&ratail;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1748
    const/16 v3, 0x291b

    const-string v4, "&lAtail;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1749
    const/16 v3, 0x291c

    const-string v4, "&rAtail;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1750
    const/16 v3, 0x291d

    const-string v4, "&larrfs;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1751
    const/16 v3, 0x291e

    const-string v4, "&rarrfs;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1752
    const/16 v3, 0x291f

    const-string v4, "&larrbfs;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1753
    const/16 v3, 0x2920

    const-string v4, "&rarrbfs;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1754
    const/16 v3, 0x2923

    const-string v4, "&nwarhk;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1755
    const/16 v3, 0x2924

    const-string v4, "&nearhk;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1756
    const/16 v3, 0x2925

    const-string v4, "&hksearow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1757
    const/16 v3, 0x2925

    const-string v4, "&searhk;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1758
    const/16 v3, 0x2926

    const-string v4, "&hkswarow;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1759
    const/16 v3, 0x2926

    const-string v4, "&swarhk;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1760
    const/16 v3, 0x2927

    const-string v4, "&nwnear;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1761
    const/16 v3, 0x2928

    const-string v4, "&nesear;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1762
    const/16 v3, 0x2928

    const-string v4, "&toea;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1763
    const/16 v3, 0x2929

    const-string v4, "&seswar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1764
    const/16 v3, 0x2929

    const-string v4, "&tosa;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1765
    const/16 v3, 0x292a

    const-string v4, "&swnwar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1766
    const/16 v3, 0x2933

    const-string v4, "&rarrc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1767
    const/16 v3, 0x2933

    const-string v4, "&nrarrc;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1768
    const/16 v3, 0x2935

    const-string v4, "&cudarrr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1769
    const/16 v3, 0x2936

    const-string v4, "&ldca;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1770
    const/16 v3, 0x2937

    const-string v4, "&rdca;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1771
    const/16 v3, 0x2938

    const-string v4, "&cudarrl;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1772
    const/16 v3, 0x2939

    const-string v4, "&larrpl;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1773
    const/16 v3, 0x293c

    const-string v4, "&curarrm;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1774
    const/16 v3, 0x293d

    const-string v4, "&cularrp;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1775
    const/16 v3, 0x2945

    const-string v4, "&rarrpl;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1776
    const/16 v3, 0x2948

    const-string v4, "&harrcir;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1777
    const/16 v3, 0x2949

    const-string v4, "&Uarrocir;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1778
    const/16 v3, 0x294a

    const-string v4, "&lurdshar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1779
    const/16 v3, 0x294b

    const-string v4, "&ldrushar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1780
    const/16 v3, 0x294e

    const-string v4, "&LeftRightVector;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1781
    const/16 v3, 0x294f

    const-string v4, "&RightUpDownVector;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1782
    const/16 v3, 0x2950

    const-string v4, "&DownLeftRightVector;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1783
    const/16 v3, 0x2951

    const-string v4, "&LeftUpDownVector;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1784
    const/16 v3, 0x2952

    const-string v4, "&LeftVectorBar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1785
    const/16 v3, 0x2953

    const-string v4, "&RightVectorBar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1786
    const/16 v3, 0x2954

    const-string v4, "&RightUpVectorBar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1787
    const/16 v3, 0x2955

    const-string v4, "&RightDownVectorBar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1788
    const/16 v3, 0x2956

    const-string v4, "&DownLeftVectorBar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1789
    const/16 v3, 0x2957

    const-string v4, "&DownRightVectorBar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1790
    const/16 v3, 0x2958

    const-string v4, "&LeftUpVectorBar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1791
    const/16 v3, 0x2959

    const-string v4, "&LeftDownVectorBar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1792
    const/16 v3, 0x295a

    const-string v4, "&LeftTeeVector;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1793
    const/16 v3, 0x295b

    const-string v4, "&RightTeeVector;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1794
    const/16 v3, 0x295c

    const-string v4, "&RightUpTeeVector;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1795
    const/16 v3, 0x295d

    const-string v4, "&RightDownTeeVector;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1796
    const/16 v3, 0x295e

    const-string v4, "&DownLeftTeeVector;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1797
    const/16 v3, 0x295f

    const-string v4, "&DownRightTeeVector;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1798
    const/16 v3, 0x2960

    const-string v4, "&LeftUpTeeVector;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1799
    const/16 v3, 0x2961

    const-string v4, "&LeftDownTeeVector;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1800
    const/16 v3, 0x2962

    const-string v4, "&lHar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1801
    const/16 v3, 0x2963

    const-string v4, "&uHar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1802
    const/16 v3, 0x2964

    const-string v4, "&rHar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1803
    const/16 v3, 0x2965

    const-string v4, "&dHar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1804
    const/16 v3, 0x2966

    const-string v4, "&luruhar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1805
    const/16 v3, 0x2967

    const-string v4, "&ldrdhar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1806
    const/16 v3, 0x2968

    const-string v4, "&ruluhar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1807
    const/16 v3, 0x2969

    const-string v4, "&rdldhar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1808
    const/16 v3, 0x296a

    const-string v4, "&lharul;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1809
    const/16 v3, 0x296b

    const-string v4, "&llhard;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1810
    const/16 v3, 0x296c

    const-string v4, "&rharul;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1811
    const/16 v3, 0x296d

    const-string v4, "&lrhard;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1812
    const/16 v3, 0x296e

    const-string v4, "&udhar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1813
    const/16 v3, 0x296e

    const-string v4, "&UpEquilibrium;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1814
    const/16 v3, 0x296f

    const-string v4, "&duhar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1815
    const/16 v3, 0x296f

    const-string v4, "&ReverseUpEquilibrium;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1816
    const/16 v3, 0x2970

    const-string v4, "&RoundImplies;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1817
    const/16 v3, 0x2971

    const-string v4, "&erarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1818
    const/16 v3, 0x2972

    const-string v4, "&simrarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1819
    const/16 v3, 0x2973

    const-string v4, "&larrsim;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1820
    const/16 v3, 0x2974

    const-string v4, "&rarrsim;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1821
    const/16 v3, 0x2975

    const-string v4, "&rarrap;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1822
    const/16 v3, 0x2976

    const-string v4, "&ltlarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1823
    const/16 v3, 0x2978

    const-string v4, "&gtrarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1824
    const/16 v3, 0x2979

    const-string v4, "&subrarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1825
    const/16 v3, 0x297b

    const-string v4, "&suplarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1826
    const/16 v3, 0x297c

    const-string v4, "&lfisht;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1827
    const/16 v3, 0x297d

    const-string v4, "&rfisht;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1828
    const/16 v3, 0x297e

    const-string v4, "&ufisht;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1829
    const/16 v3, 0x297f

    const-string v4, "&dfisht;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1830
    const/16 v3, 0x2985

    const-string v4, "&lopar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1831
    const/16 v3, 0x2986

    const-string v4, "&ropar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1832
    const/16 v3, 0x298b

    const-string v4, "&lbrke;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1833
    const/16 v3, 0x298c

    const-string v4, "&rbrke;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1834
    const/16 v3, 0x298d

    const-string v4, "&lbrkslu;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1835
    const/16 v3, 0x298e

    const-string v4, "&rbrksld;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1836
    const/16 v3, 0x298f

    const-string v4, "&lbrksld;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1837
    const/16 v3, 0x2990

    const-string v4, "&rbrkslu;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1838
    const/16 v3, 0x2991

    const-string v4, "&langd;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1839
    const/16 v3, 0x2992

    const-string v4, "&rangd;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1840
    const/16 v3, 0x2993

    const-string v4, "&lparlt;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1841
    const/16 v3, 0x2994

    const-string v4, "&rpargt;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1842
    const/16 v3, 0x2995

    const-string v4, "&gtlPar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1843
    const/16 v3, 0x2996

    const-string v4, "&ltrPar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1844
    const/16 v3, 0x299a

    const-string v4, "&vzigzag;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1845
    const/16 v3, 0x299c

    const-string v4, "&vangrt;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1846
    const/16 v3, 0x299d

    const-string v4, "&angrtvbd;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1847
    const/16 v3, 0x29a4

    const-string v4, "&ange;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1848
    const/16 v3, 0x29a5

    const-string v4, "&range;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1849
    const/16 v3, 0x29a6

    const-string v4, "&dwangle;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1850
    const/16 v3, 0x29a7

    const-string v4, "&uwangle;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1851
    const/16 v3, 0x29a8

    const-string v4, "&angmsdaa;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1852
    const/16 v3, 0x29a9

    const-string v4, "&angmsdab;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1853
    const/16 v3, 0x29aa

    const-string v4, "&angmsdac;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1854
    const/16 v3, 0x29ab

    const-string v4, "&angmsdad;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1855
    const/16 v3, 0x29ac

    const-string v4, "&angmsdae;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1856
    const/16 v3, 0x29ad

    const-string v4, "&angmsdaf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1857
    const/16 v3, 0x29ae

    const-string v4, "&angmsdag;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1858
    const/16 v3, 0x29af

    const-string v4, "&angmsdah;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1859
    const/16 v3, 0x29b0

    const-string v4, "&bemptyv;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1860
    const/16 v3, 0x29b1

    const-string v4, "&demptyv;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1861
    const/16 v3, 0x29b2

    const-string v4, "&cemptyv;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1862
    const/16 v3, 0x29b3

    const-string v4, "&raemptyv;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1863
    const/16 v3, 0x29b4

    const-string v4, "&laemptyv;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1864
    const/16 v3, 0x29b5

    const-string v4, "&ohbar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1865
    const/16 v3, 0x29b6

    const-string v4, "&omid;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1866
    const/16 v3, 0x29b7

    const-string v4, "&opar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1867
    const/16 v3, 0x29b9

    const-string v4, "&operp;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1868
    const/16 v3, 0x29bb

    const-string v4, "&olcross;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1869
    const/16 v3, 0x29bc

    const-string v4, "&odsold;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1870
    const/16 v3, 0x29be

    const-string v4, "&olcir;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1871
    const/16 v3, 0x29bf

    const-string v4, "&ofcir;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1872
    const/16 v3, 0x29c0

    const-string v4, "&olt;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1873
    const/16 v3, 0x29c1

    const-string v4, "&ogt;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1874
    const/16 v3, 0x29c2

    const-string v4, "&cirscir;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1875
    const/16 v3, 0x29c3

    const-string v4, "&cirE;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1876
    const/16 v3, 0x29c4

    const-string v4, "&solb;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1877
    const/16 v3, 0x29c5

    const-string v4, "&bsolb;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1878
    const/16 v3, 0x29c9

    const-string v4, "&boxbox;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1879
    const/16 v3, 0x29cd

    const-string v4, "&trisb;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1880
    const/16 v3, 0x29ce

    const-string v4, "&rtriltri;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1881
    const/16 v3, 0x29cf

    const-string v4, "&LeftTriangleBar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1882
    const/16 v3, 0x29cf

    const-string v4, "&NotLeftTriangleBar;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1883
    const/16 v3, 0x29d0    # 1.5E-41f

    const-string v4, "&RightTriangleBar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1884
    const/16 v3, 0x29d0    # 1.5E-41f

    const-string v4, "&NotRightTriangleBar;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1885
    const/16 v3, 0x29dc

    const-string v4, "&iinfin;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1886
    const/16 v3, 0x29dd

    const-string v4, "&infintie;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1887
    const/16 v3, 0x29de

    const-string v4, "&nvinfin;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1888
    const/16 v3, 0x29e3

    const-string v4, "&eparsl;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1889
    const/16 v3, 0x29e4

    const-string v4, "&smeparsl;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1890
    const/16 v3, 0x29e5

    const-string v4, "&eqvparsl;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1891
    const/16 v3, 0x29eb

    const-string v4, "&blacklozenge;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1892
    const/16 v3, 0x29eb

    const-string v4, "&lozf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1893
    const/16 v3, 0x29f4

    const-string v4, "&RuleDelayed;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1894
    const/16 v3, 0x29f6

    const-string v4, "&dsol;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1895
    const/16 v3, 0x2a00

    const-string v4, "&bigodot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1896
    const/16 v3, 0x2a00

    const-string v4, "&xodot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1897
    const/16 v3, 0x2a01

    const-string v4, "&bigoplus;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1898
    const/16 v3, 0x2a01

    const-string v4, "&xoplus;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1899
    const/16 v3, 0x2a02

    const-string v4, "&bigotimes;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1900
    const/16 v3, 0x2a02

    const-string v4, "&xotime;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1901
    const/16 v3, 0x2a04

    const-string v4, "&biguplus;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1902
    const/16 v3, 0x2a04

    const-string v4, "&xuplus;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1903
    const/16 v3, 0x2a06

    const-string v4, "&bigsqcup;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1904
    const/16 v3, 0x2a06

    const-string v4, "&xsqcup;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1905
    const/16 v3, 0x2a0c

    const-string v4, "&iiiint;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1906
    const/16 v3, 0x2a0c

    const-string v4, "&qint;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1907
    const/16 v3, 0x2a0d

    const-string v4, "&fpartint;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1908
    const/16 v3, 0x2a10

    const-string v4, "&cirfnint;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1909
    const/16 v3, 0x2a11

    const-string v4, "&awint;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1910
    const/16 v3, 0x2a12

    const-string v4, "&rppolint;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1911
    const/16 v3, 0x2a13

    const-string v4, "&scpolint;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1912
    const/16 v3, 0x2a14

    const-string v4, "&npolint;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1913
    const/16 v3, 0x2a15

    const-string v4, "&pointint;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1914
    const/16 v3, 0x2a16

    const-string v4, "&quatint;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1915
    const/16 v3, 0x2a17

    const-string v4, "&intlarhk;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1916
    const/16 v3, 0x2a22

    const-string v4, "&pluscir;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1917
    const/16 v3, 0x2a23

    const-string v4, "&plusacir;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1918
    const/16 v3, 0x2a24

    const-string v4, "&simplus;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1919
    const/16 v3, 0x2a25

    const-string v4, "&plusdu;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1920
    const/16 v3, 0x2a26

    const-string v4, "&plussim;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1921
    const/16 v3, 0x2a27

    const-string v4, "&plustwo;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1922
    const/16 v3, 0x2a29

    const-string v4, "&mcomma;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1923
    const/16 v3, 0x2a2a

    const-string v4, "&minusdu;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1924
    const/16 v3, 0x2a2d

    const-string v4, "&loplus;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1925
    const/16 v3, 0x2a2e

    const-string v4, "&roplus;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1926
    const/16 v3, 0x2a2f

    const-string v4, "&Cross;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1927
    const/16 v3, 0x2a30

    const-string v4, "&timesd;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1928
    const/16 v3, 0x2a31

    const-string v4, "&timesbar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1929
    const/16 v3, 0x2a33

    const-string v4, "&smashp;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1930
    const/16 v3, 0x2a34

    const-string v4, "&lotimes;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1931
    const/16 v3, 0x2a35

    const-string v4, "&rotimes;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1932
    const/16 v3, 0x2a36

    const-string v4, "&otimesas;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1933
    const/16 v3, 0x2a37

    const-string v4, "&Otimes;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1934
    const/16 v3, 0x2a38

    const-string v4, "&odiv;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1935
    const/16 v3, 0x2a39

    const-string v4, "&triplus;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1936
    const/16 v3, 0x2a3a

    const-string v4, "&triminus;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1937
    const/16 v3, 0x2a3b

    const-string v4, "&tritime;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1938
    const/16 v3, 0x2a3c

    const-string v4, "&intprod;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1939
    const/16 v3, 0x2a3c

    const-string v4, "&iprod;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1940
    const/16 v3, 0x2a3f

    const-string v4, "&amalg;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1941
    const/16 v3, 0x2a40

    const-string v4, "&capdot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1942
    const/16 v3, 0x2a42

    const-string v4, "&ncup;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1943
    const/16 v3, 0x2a43

    const-string v4, "&ncap;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1944
    const/16 v3, 0x2a44

    const-string v4, "&capand;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1945
    const/16 v3, 0x2a45

    const-string v4, "&cupor;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1946
    const/16 v3, 0x2a46

    const-string v4, "&cupcap;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1947
    const/16 v3, 0x2a47

    const-string v4, "&capcup;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1948
    const/16 v3, 0x2a48

    const-string v4, "&cupbrcap;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1949
    const/16 v3, 0x2a49

    const-string v4, "&capbrcup;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1950
    const/16 v3, 0x2a4a

    const-string v4, "&cupcup;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1951
    const/16 v3, 0x2a4b

    const-string v4, "&capcap;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1952
    const/16 v3, 0x2a4c

    const-string v4, "&ccups;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1953
    const/16 v3, 0x2a4d

    const-string v4, "&ccaps;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1954
    const/16 v3, 0x2a50

    const-string v4, "&ccupssm;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1955
    const/16 v3, 0x2a53

    const-string v4, "&And;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1956
    const/16 v3, 0x2a54

    const-string v4, "&Or;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1957
    const/16 v3, 0x2a55

    const-string v4, "&andand;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1958
    const/16 v3, 0x2a56

    const-string v4, "&oror;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1959
    const/16 v3, 0x2a57

    const-string v4, "&orslope;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1960
    const/16 v3, 0x2a58

    const-string v4, "&andslope;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1961
    const/16 v3, 0x2a5a

    const-string v4, "&andv;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1962
    const/16 v3, 0x2a5b

    const-string v4, "&orv;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1963
    const/16 v3, 0x2a5c

    const-string v4, "&andd;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1964
    const/16 v3, 0x2a5d

    const-string v4, "&ord;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1965
    const/16 v3, 0x2a5f

    const-string v4, "&wedbar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1966
    const/16 v3, 0x2a66

    const-string v4, "&sdote;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1967
    const/16 v3, 0x2a6a

    const-string v4, "&simdot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1968
    const/16 v3, 0x2a6d

    const-string v4, "&congdot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1969
    const/16 v3, 0x2a6d

    const-string v4, "&ncongdot;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1970
    const/16 v3, 0x2a6e

    const-string v4, "&easter;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1971
    const/16 v3, 0x2a6f

    const-string v4, "&apacir;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1972
    const/16 v3, 0x2a70

    const-string v4, "&apE;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1973
    const/16 v3, 0x2a70

    const-string v4, "&napE;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1974
    const/16 v3, 0x2a71

    const-string v4, "&eplus;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1975
    const/16 v3, 0x2a72

    const-string v4, "&pluse;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1976
    const/16 v3, 0x2a73

    const-string v4, "&Esim;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1977
    const/16 v3, 0x2a74

    const-string v4, "&Colone;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1978
    const/16 v3, 0x2a75

    const-string v4, "&Equal;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1979
    const/16 v3, 0x2a77

    const-string v4, "&ddotseq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1980
    const/16 v3, 0x2a77

    const-string v4, "&eDDot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1981
    const/16 v3, 0x2a78

    const-string v4, "&equivDD;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1982
    const/16 v3, 0x2a79

    const-string v4, "&ltcir;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1983
    const/16 v3, 0x2a7a

    const-string v4, "&gtcir;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1984
    const/16 v3, 0x2a7b

    const-string v4, "&ltquest;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1985
    const/16 v3, 0x2a7c

    const-string v4, "&gtquest;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1986
    const/16 v3, 0x2a7d

    const-string v4, "&leqslant;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1987
    const/16 v3, 0x2a7d

    const-string v4, "&les;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1988
    const/16 v3, 0x2a7d

    const-string v4, "&LessSlantEqual;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1989
    const/16 v3, 0x2a7d

    const-string v4, "&nleqslant;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1990
    const/16 v3, 0x2a7d

    const-string v4, "&nles;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1991
    const/16 v3, 0x2a7d

    const-string v4, "&NotLessSlantEqual;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1992
    const/16 v3, 0x2a7e

    const-string v4, "&geqslant;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1993
    const/16 v3, 0x2a7e

    const-string v4, "&ges;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1994
    const/16 v3, 0x2a7e

    const-string v4, "&GreaterSlantEqual;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1995
    const/16 v3, 0x2a7e

    const-string v4, "&ngeqslant;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1996
    const/16 v3, 0x2a7e

    const-string v4, "&nges;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1997
    const/16 v3, 0x2a7e

    const-string v4, "&NotGreaterSlantEqual;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 1998
    const/16 v3, 0x2a7f

    const-string v4, "&lesdot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 1999
    const/16 v3, 0x2a80

    const-string v4, "&gesdot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2000
    const/16 v3, 0x2a81

    const-string v4, "&lesdoto;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2001
    const/16 v3, 0x2a82

    const-string v4, "&gesdoto;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2002
    const/16 v3, 0x2a83

    const-string v4, "&lesdotor;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2003
    const/16 v3, 0x2a84

    const-string v4, "&gesdotol;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2004
    const/16 v3, 0x2a85

    const-string v4, "&lap;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2005
    const/16 v3, 0x2a85

    const-string v4, "&lessapprox;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2006
    const/16 v3, 0x2a86

    const-string v4, "&gap;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2007
    const/16 v3, 0x2a86

    const-string v4, "&gtrapprox;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2008
    const/16 v3, 0x2a87

    const-string v4, "&lne;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2009
    const/16 v3, 0x2a87

    const-string v4, "&lneq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2010
    const/16 v3, 0x2a88

    const-string v4, "&gne;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2011
    const/16 v3, 0x2a88

    const-string v4, "&gneq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2012
    const/16 v3, 0x2a89

    const-string v4, "&lnap;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2013
    const/16 v3, 0x2a89

    const-string v4, "&lnapprox;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2014
    const/16 v3, 0x2a8a

    const-string v4, "&gnap;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2015
    const/16 v3, 0x2a8a

    const-string v4, "&gnapprox;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2016
    const/16 v3, 0x2a8b

    const-string v4, "&lEg;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2017
    const/16 v3, 0x2a8b

    const-string v4, "&lesseqqgtr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2018
    const/16 v3, 0x2a8c

    const-string v4, "&gEl;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2019
    const/16 v3, 0x2a8c

    const-string v4, "&gtreqqless;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2020
    const/16 v3, 0x2a8d

    const-string v4, "&lsime;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2021
    const/16 v3, 0x2a8e

    const-string v4, "&gsime;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2022
    const/16 v3, 0x2a8f

    const-string v4, "&lsimg;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2023
    const/16 v3, 0x2a90

    const-string v4, "&gsiml;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2024
    const/16 v3, 0x2a91

    const-string v4, "&lgE;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2025
    const/16 v3, 0x2a92

    const-string v4, "&glE;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2026
    const/16 v3, 0x2a93

    const-string v4, "&lesges;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2027
    const/16 v3, 0x2a94

    const-string v4, "&gesles;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2028
    const/16 v3, 0x2a95

    const-string v4, "&els;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2029
    const/16 v3, 0x2a95

    const-string v4, "&eqslantless;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2030
    const/16 v3, 0x2a96

    const-string v4, "&egs;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2031
    const/16 v3, 0x2a96

    const-string v4, "&eqslantgtr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2032
    const/16 v3, 0x2a97

    const-string v4, "&elsdot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2033
    const/16 v3, 0x2a98

    const-string v4, "&egsdot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2034
    const/16 v3, 0x2a99

    const-string v4, "&el;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2035
    const/16 v3, 0x2a9a

    const-string v4, "&eg;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2036
    const/16 v3, 0x2a9d

    const-string v4, "&siml;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2037
    const/16 v3, 0x2a9e

    const-string v4, "&simg;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2038
    const/16 v3, 0x2a9f

    const-string v4, "&simlE;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2039
    const/16 v3, 0x2aa0

    const-string v4, "&simgE;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2040
    const/16 v3, 0x2aa1

    const-string v4, "&LessLess;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2041
    const/16 v3, 0x2aa1

    const-string v4, "&NotNestedLessLess;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 2042
    const/16 v3, 0x2aa2

    const-string v4, "&GreaterGreater;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2043
    const/16 v3, 0x2aa2

    const-string v4, "&NotNestedGreaterGreater;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 2044
    const/16 v3, 0x2aa4

    const-string v4, "&glj;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2045
    const/16 v3, 0x2aa5

    const-string v4, "&gla;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2046
    const/16 v3, 0x2aa6

    const-string v4, "&ltcc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2047
    const/16 v3, 0x2aa7

    const-string v4, "&gtcc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2048
    const/16 v3, 0x2aa8

    const-string v4, "&lescc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2049
    const/16 v3, 0x2aa9

    const-string v4, "&gescc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2050
    const/16 v3, 0x2aaa

    const-string v4, "&smt;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2051
    const/16 v3, 0x2aab

    const-string v4, "&lat;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2052
    const/16 v3, 0x2aac

    const-string v4, "&smte;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2053
    const/16 v3, 0x2aac

    const-string v4, "&smtes;"

    invoke-virtual {v2, v3, v7, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 2054
    const/16 v3, 0x2aad

    const-string v4, "&late;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2055
    const/16 v3, 0x2aad

    const-string v4, "&lates;"

    invoke-virtual {v2, v3, v7, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 2056
    const/16 v3, 0x2aae

    const-string v4, "&bumpE;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2057
    const/16 v3, 0x2aaf

    const-string v4, "&pre;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2058
    const/16 v3, 0x2aaf

    const-string v4, "&preceq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2059
    const/16 v3, 0x2aaf

    const-string v4, "&PrecedesEqual;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2060
    const/16 v3, 0x2aaf

    const-string v4, "&npre;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 2061
    const/16 v3, 0x2aaf

    const-string v4, "&npreceq;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 2062
    const/16 v3, 0x2aaf

    const-string v4, "&NotPrecedesEqual;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 2063
    const/16 v3, 0x2ab0

    const-string v4, "&sce;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2064
    const/16 v3, 0x2ab0

    const-string v4, "&succeq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2065
    const/16 v3, 0x2ab0

    const-string v4, "&SucceedsEqual;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2066
    const/16 v3, 0x2ab0

    const-string v4, "&nsce;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 2067
    const/16 v3, 0x2ab0

    const-string v4, "&nsucceq;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 2068
    const/16 v3, 0x2ab0

    const-string v4, "&NotSucceedsEqual;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 2069
    const/16 v3, 0x2ab3

    const-string v4, "&prE;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2070
    const/16 v3, 0x2ab4

    const-string v4, "&scE;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2071
    const/16 v3, 0x2ab5

    const-string v4, "&precneqq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2072
    const/16 v3, 0x2ab5

    const-string v4, "&prnE;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2073
    const/16 v3, 0x2ab6

    const-string v4, "&scnE;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2074
    const/16 v3, 0x2ab6

    const-string v4, "&succneqq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2075
    const/16 v3, 0x2ab7

    const-string v4, "&prap;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2076
    const/16 v3, 0x2ab7

    const-string v4, "&precapprox;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2077
    const/16 v3, 0x2ab8

    const-string v4, "&scap;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2078
    const/16 v3, 0x2ab8

    const-string v4, "&succapprox;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2079
    const/16 v3, 0x2ab9

    const-string v4, "&precnapprox;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2080
    const/16 v3, 0x2ab9

    const-string v4, "&prnap;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2081
    const/16 v3, 0x2aba

    const-string v4, "&scnap;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2082
    const/16 v3, 0x2aba

    const-string v4, "&succnapprox;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2083
    const/16 v3, 0x2abb

    const-string v4, "&Pr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2084
    const/16 v3, 0x2abc

    const-string v4, "&Sc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2085
    const/16 v3, 0x2abd

    const-string v4, "&subdot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2086
    const/16 v3, 0x2abe

    const-string v4, "&supdot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2087
    const/16 v3, 0x2abf

    const-string v4, "&subplus;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2088
    const/16 v3, 0x2ac0

    const-string v4, "&supplus;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2089
    const/16 v3, 0x2ac1

    const-string v4, "&submult;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2090
    const/16 v3, 0x2ac2

    const-string v4, "&supmult;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2091
    const/16 v3, 0x2ac3

    const-string v4, "&subedot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2092
    const/16 v3, 0x2ac4

    const-string v4, "&supedot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2093
    const/16 v3, 0x2ac5

    const-string v4, "&subE;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2094
    const/16 v3, 0x2ac5

    const-string v4, "&subseteqq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2095
    const/16 v3, 0x2ac5

    const-string v4, "&nsubE;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 2096
    const/16 v3, 0x2ac5

    const-string v4, "&nsubseteqq;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 2097
    const/16 v3, 0x2ac6

    const-string v4, "&supE;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2098
    const/16 v3, 0x2ac6

    const-string v4, "&supseteqq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2099
    const/16 v3, 0x2ac6

    const-string v4, "&nsupE;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 2100
    const/16 v3, 0x2ac6

    const-string v4, "&nsupseteqq;"

    invoke-virtual {v2, v3, v6, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 2101
    const/16 v3, 0x2ac7

    const-string v4, "&subsim;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2102
    const/16 v3, 0x2ac8

    const-string v4, "&supsim;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2103
    const/16 v3, 0x2acb

    const-string v4, "&subnE;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2104
    const/16 v3, 0x2acb

    const-string v4, "&subsetneqq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2105
    const/16 v3, 0x2acb

    const-string v4, "&varsubsetneqq;"

    invoke-virtual {v2, v3, v7, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 2106
    const/16 v3, 0x2acb

    const-string v4, "&vsubnE;"

    invoke-virtual {v2, v3, v7, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 2107
    const/16 v3, 0x2acc

    const-string v4, "&supnE;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2108
    const/16 v3, 0x2acc

    const-string v4, "&supsetneqq;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2109
    const/16 v3, 0x2acc

    const-string v4, "&varsupsetneqq;"

    invoke-virtual {v2, v3, v7, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 2110
    const/16 v3, 0x2acc

    const-string v4, "&vsupnE;"

    invoke-virtual {v2, v3, v7, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 2111
    const/16 v3, 0x2acf

    const-string v4, "&csub;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2112
    const/16 v3, 0x2ad0

    const-string v4, "&csup;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2113
    const/16 v3, 0x2ad1

    const-string v4, "&csube;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2114
    const/16 v3, 0x2ad2

    const-string v4, "&csupe;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2115
    const/16 v3, 0x2ad3

    const-string v4, "&subsup;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2116
    const/16 v3, 0x2ad4

    const-string v4, "&supsub;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2117
    const/16 v3, 0x2ad5

    const-string v4, "&subsub;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2118
    const/16 v3, 0x2ad6

    const-string v4, "&supsup;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2119
    const/16 v3, 0x2ad7

    const-string v4, "&suphsub;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2120
    const/16 v3, 0x2ad8

    const-string v4, "&supdsub;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2121
    const/16 v3, 0x2ad9

    const-string v4, "&forkv;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2122
    const/16 v3, 0x2ada

    const-string v4, "&topfork;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2123
    const/16 v3, 0x2adb

    const-string v4, "&mlcp;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2124
    const/16 v3, 0x2ae4

    const-string v4, "&Dashv;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2125
    const/16 v3, 0x2ae4

    const-string v4, "&DoubleLeftTee;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2126
    const/16 v3, 0x2ae6

    const-string v4, "&Vdashl;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2127
    const/16 v3, 0x2ae7

    const-string v4, "&Barv;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2128
    const/16 v3, 0x2ae8

    const-string v4, "&vBar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2129
    const/16 v3, 0x2ae9

    const-string v4, "&vBarv;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2130
    const/16 v3, 0x2aeb

    const-string v4, "&Vbar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2131
    const/16 v3, 0x2aec

    const-string v4, "&Not;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2132
    const/16 v3, 0x2aed

    const-string v4, "&bNot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2133
    const/16 v3, 0x2aee

    const-string v4, "&rnmid;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2134
    const/16 v3, 0x2aef

    const-string v4, "&cirmid;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2135
    const/16 v3, 0x2af0

    const-string v4, "&midcir;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2136
    const/16 v3, 0x2af1

    const-string v4, "&topcir;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2137
    const/16 v3, 0x2af2

    const-string v4, "&nhpar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2138
    const/16 v3, 0x2af3

    const-string v4, "&parsim;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2139
    const/16 v3, 0x2afd

    const-string v4, "&parsl;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2140
    const/16 v3, 0x2afd

    const/16 v4, 0x20e5

    const-string v5, "&nparsl;"

    invoke-virtual {v2, v3, v4, v5}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(IILjava/lang/String;)V

    .line 2141
    const v3, 0xfb00

    const-string v4, "&fflig;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2142
    const v3, 0xfb01

    const-string v4, "&filig;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2143
    const v3, 0xfb02

    const-string v4, "&fllig;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2144
    const v3, 0xfb03

    const-string v4, "&ffilig;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2145
    const v3, 0xfb04

    const-string v4, "&ffllig;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2146
    const v3, 0x1d49c

    const-string v4, "&Ascr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2147
    const v3, 0x1d49e

    const-string v4, "&Cscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2148
    const v3, 0x1d49f

    const-string v4, "&Dscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2149
    const v3, 0x1d4a2

    const-string v4, "&Gscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2150
    const v3, 0x1d4a5

    const-string v4, "&Jscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2151
    const v3, 0x1d4a6

    const-string v4, "&Kscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2152
    const v3, 0x1d4a9

    const-string v4, "&Nscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2153
    const v3, 0x1d4aa

    const-string v4, "&Oscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2154
    const v3, 0x1d4ab

    const-string v4, "&Pscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2155
    const v3, 0x1d4ac

    const-string v4, "&Qscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2156
    const v3, 0x1d4ae

    const-string v4, "&Sscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2157
    const v3, 0x1d4af

    const-string v4, "&Tscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2158
    const v3, 0x1d4b0

    const-string v4, "&Uscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2159
    const v3, 0x1d4b1

    const-string v4, "&Vscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2160
    const v3, 0x1d4b2

    const-string v4, "&Wscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2161
    const v3, 0x1d4b3

    const-string v4, "&Xscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2162
    const v3, 0x1d4b4

    const-string v4, "&Yscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2163
    const v3, 0x1d4b5

    const-string v4, "&Zscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2164
    const v3, 0x1d4b6

    const-string v4, "&ascr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2165
    const v3, 0x1d4b7

    const-string v4, "&bscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2166
    const v3, 0x1d4b8

    const-string v4, "&cscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2167
    const v3, 0x1d4b9

    const-string v4, "&dscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2168
    const v3, 0x1d4bb

    const-string v4, "&fscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2169
    const v3, 0x1d4bd

    const-string v4, "&hscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2170
    const v3, 0x1d4be

    const-string v4, "&iscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2171
    const v3, 0x1d4bf

    const-string v4, "&jscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2172
    const v3, 0x1d4c0

    const-string v4, "&kscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2173
    const v3, 0x1d4c1

    const-string v4, "&lscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2174
    const v3, 0x1d4c2

    const-string v4, "&mscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2175
    const v3, 0x1d4c3

    const-string v4, "&nscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2176
    const v3, 0x1d4c5

    const-string v4, "&pscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2177
    const v3, 0x1d4c6

    const-string v4, "&qscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2178
    const v3, 0x1d4c7

    const-string v4, "&rscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2179
    const v3, 0x1d4c8

    const-string v4, "&sscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2180
    const v3, 0x1d4c9

    const-string v4, "&tscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2181
    const v3, 0x1d4ca

    const-string v4, "&uscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2182
    const v3, 0x1d4cb

    const-string v4, "&vscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2183
    const v3, 0x1d4cc

    const-string v4, "&wscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2184
    const v3, 0x1d4cd

    const-string v4, "&xscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2185
    const v3, 0x1d4ce

    const-string v4, "&yscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2186
    const v3, 0x1d4cf

    const-string v4, "&zscr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2187
    const v3, 0x1d504

    const-string v4, "&Afr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2188
    const v3, 0x1d505

    const-string v4, "&Bfr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2189
    const v3, 0x1d507

    const-string v4, "&Dfr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2190
    const v3, 0x1d508

    const-string v4, "&Efr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2191
    const v3, 0x1d509

    const-string v4, "&Ffr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2192
    const v3, 0x1d50a

    const-string v4, "&Gfr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2193
    const v3, 0x1d50d

    const-string v4, "&Jfr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2194
    const v3, 0x1d50e

    const-string v4, "&Kfr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2195
    const v3, 0x1d50f

    const-string v4, "&Lfr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2196
    const v3, 0x1d510

    const-string v4, "&Mfr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2197
    const v3, 0x1d511

    const-string v4, "&Nfr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2198
    const v3, 0x1d512

    const-string v4, "&Ofr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2199
    const v3, 0x1d513

    const-string v4, "&Pfr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2200
    const v3, 0x1d514

    const-string v4, "&Qfr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2201
    const v3, 0x1d516

    const-string v4, "&Sfr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2202
    const v3, 0x1d517

    const-string v4, "&Tfr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2203
    const v3, 0x1d518

    const-string v4, "&Ufr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2204
    const v3, 0x1d519

    const-string v4, "&Vfr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2205
    const v3, 0x1d51a

    const-string v4, "&Wfr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2206
    const v3, 0x1d51b

    const-string v4, "&Xfr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2207
    const v3, 0x1d51c

    const-string v4, "&Yfr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2208
    const v3, 0x1d51e

    const-string v4, "&afr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2209
    const v3, 0x1d51f

    const-string v4, "&bfr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2210
    const v3, 0x1d520

    const-string v4, "&cfr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2211
    const v3, 0x1d521

    const-string v4, "&dfr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2212
    const v3, 0x1d522

    const-string v4, "&efr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2213
    const v3, 0x1d523

    const-string v4, "&ffr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2214
    const v3, 0x1d524

    const-string v4, "&gfr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2215
    const v3, 0x1d525

    const-string v4, "&hfr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2216
    const v3, 0x1d526

    const-string v4, "&ifr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2217
    const v3, 0x1d527

    const-string v4, "&jfr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2218
    const v3, 0x1d528

    const-string v4, "&kfr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2219
    const v3, 0x1d529

    const-string v4, "&lfr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2220
    const v3, 0x1d52a

    const-string v4, "&mfr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2221
    const v3, 0x1d52b

    const-string v4, "&nfr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2222
    const v3, 0x1d52c

    const-string v4, "&ofr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2223
    const v3, 0x1d52d

    const-string v4, "&pfr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2224
    const v3, 0x1d52e

    const-string v4, "&qfr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2225
    const v3, 0x1d52f

    const-string v4, "&rfr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2226
    const v3, 0x1d530

    const-string v4, "&sfr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2227
    const v3, 0x1d531

    const-string v4, "&tfr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2228
    const v3, 0x1d532

    const-string v4, "&ufr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2229
    const v3, 0x1d533

    const-string v4, "&vfr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2230
    const v3, 0x1d534

    const-string v4, "&wfr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2231
    const v3, 0x1d535

    const-string v4, "&xfr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2232
    const v3, 0x1d536

    const-string v4, "&yfr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2233
    const v3, 0x1d537

    const-string v4, "&zfr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2234
    const v3, 0x1d538

    const-string v4, "&Aopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2235
    const v3, 0x1d539

    const-string v4, "&Bopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2236
    const v3, 0x1d53b

    const-string v4, "&Dopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2237
    const v3, 0x1d53c

    const-string v4, "&Eopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2238
    const v3, 0x1d53d

    const-string v4, "&Fopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2239
    const v3, 0x1d53e

    const-string v4, "&Gopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2240
    const v3, 0x1d540

    const-string v4, "&Iopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2241
    const v3, 0x1d541

    const-string v4, "&Jopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2242
    const v3, 0x1d542

    const-string v4, "&Kopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2243
    const v3, 0x1d543

    const-string v4, "&Lopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2244
    const v3, 0x1d544

    const-string v4, "&Mopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2245
    const v3, 0x1d546

    const-string v4, "&Oopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2246
    const v3, 0x1d54a

    const-string v4, "&Sopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2247
    const v3, 0x1d54b

    const-string v4, "&Topf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2248
    const v3, 0x1d54c

    const-string v4, "&Uopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2249
    const v3, 0x1d54d

    const-string v4, "&Vopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2250
    const v3, 0x1d54e

    const-string v4, "&Wopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2251
    const v3, 0x1d54f

    const-string v4, "&Xopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2252
    const v3, 0x1d550

    const-string v4, "&Yopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2253
    const v3, 0x1d552

    const-string v4, "&aopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2254
    const v3, 0x1d553

    const-string v4, "&bopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2255
    const v3, 0x1d554

    const-string v4, "&copf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2256
    const v3, 0x1d555

    const-string v4, "&dopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2257
    const v3, 0x1d556

    const-string v4, "&eopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2258
    const v3, 0x1d557

    const-string v4, "&fopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2259
    const v3, 0x1d558

    const-string v4, "&gopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2260
    const v3, 0x1d559

    const-string v4, "&hopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2261
    const v3, 0x1d55a

    const-string v4, "&iopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2262
    const v3, 0x1d55b

    const-string v4, "&jopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2263
    const v3, 0x1d55c

    const-string v4, "&kopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2264
    const v3, 0x1d55d

    const-string v4, "&lopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2265
    const v3, 0x1d55e

    const-string v4, "&mopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2266
    const v3, 0x1d55f

    const-string v4, "&nopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2267
    const v3, 0x1d560

    const-string v4, "&oopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2268
    const v3, 0x1d561

    const-string v4, "&popf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2269
    const v3, 0x1d562

    const-string v4, "&qopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2270
    const v3, 0x1d563

    const-string v4, "&ropf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2271
    const v3, 0x1d564

    const-string v4, "&sopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2272
    const v3, 0x1d565

    const-string v4, "&topf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2273
    const v3, 0x1d566

    const-string v4, "&uopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2274
    const v3, 0x1d567

    const-string v4, "&vopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2275
    const v3, 0x1d568

    const-string v4, "&wopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2276
    const v3, 0x1d569

    const-string v4, "&xopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2277
    const v3, 0x1d56a

    const-string v4, "&yopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2278
    const v3, 0x1d56b

    const-string v4, "&zopf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 2290
    const/16 v3, 0x81

    new-array v1, v3, [B

    .line 2291
    .local v1, "escapeLevels":[B
    const/4 v3, 0x3

    invoke-static {v1, v3}, Ljava/util/Arrays;->fill([BB)V

    .line 2292
    const/16 v0, 0x41

    .local v0, "c":C
    :goto_3d9f
    const/16 v3, 0x5a

    if-gt v0, v3, :cond_3daa

    .line 2293
    const/4 v3, 0x4

    aput-byte v3, v1, v0

    .line 2292
    add-int/lit8 v3, v0, 0x1

    int-to-char v0, v3

    goto :goto_3d9f

    .line 2295
    :cond_3daa
    const/16 v0, 0x61

    :goto_3dac
    const/16 v3, 0x7a

    if-gt v0, v3, :cond_3db7

    .line 2296
    const/4 v3, 0x4

    aput-byte v3, v1, v0

    .line 2295
    add-int/lit8 v3, v0, 0x1

    int-to-char v0, v3

    goto :goto_3dac

    .line 2298
    :cond_3db7
    const/16 v0, 0x30

    :goto_3db9
    const/16 v3, 0x39

    if-gt v0, v3, :cond_3dc4

    .line 2299
    const/4 v3, 0x4

    aput-byte v3, v1, v0

    .line 2298
    add-int/lit8 v3, v0, 0x1

    int-to-char v0, v3

    goto :goto_3db9

    .line 2301
    :cond_3dc4
    const/16 v3, 0x27

    const/4 v4, 0x1

    aput-byte v4, v1, v3

    .line 2302
    const/16 v3, 0x22

    const/4 v4, 0x0

    aput-byte v4, v1, v3

    .line 2303
    const/4 v3, 0x0

    aput-byte v3, v1, v9

    .line 2304
    const/4 v3, 0x0

    aput-byte v3, v1, v10

    .line 2305
    const/16 v3, 0x26

    const/4 v4, 0x0

    aput-byte v4, v1, v3

    .line 2306
    const/16 v3, 0x80

    const/4 v4, 0x2

    aput-byte v4, v1, v3

    .line 2309
    new-instance v3, Lorg/unbescape/html/HtmlEscapeSymbols;

    invoke-direct {v3, v2, v1}, Lorg/unbescape/html/HtmlEscapeSymbols;-><init>(Lorg/unbescape/html/HtmlEscapeSymbols$References;[B)V

    return-object v3
.end method
