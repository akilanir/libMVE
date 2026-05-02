.class final Lorg/unbescape/html/Html4EscapeSymbolsInitializer;
.super Ljava/lang/Object;
.source "Html4EscapeSymbolsInitializer.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 352
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 353
    return-void
.end method

.method static initializeHtml4()Lorg/unbescape/html/HtmlEscapeSymbols;
    .registers 10

    .prologue
    const/16 v9, 0x3c

    const/16 v8, 0x26

    const/16 v7, 0x22

    const/4 v6, 0x4

    const/4 v5, 0x0

    .line 39
    new-instance v2, Lorg/unbescape/html/HtmlEscapeSymbols$References;

    invoke-direct {v2}, Lorg/unbescape/html/HtmlEscapeSymbols$References;-><init>()V

    .line 50
    .local v2, "html4References":Lorg/unbescape/html/HtmlEscapeSymbols$References;
    const-string v3, "&quot;"

    invoke-virtual {v2, v7, v3}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 51
    const-string v3, "&amp;"

    invoke-virtual {v2, v8, v3}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 52
    const-string v3, "&lt;"

    invoke-virtual {v2, v9, v3}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 53
    const/16 v3, 0x3e

    const-string v4, "&gt;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 55
    const/16 v3, 0xa0

    const-string v4, "&nbsp;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 56
    const/16 v3, 0xa1

    const-string v4, "&iexcl;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 57
    const/16 v3, 0xa2

    const-string v4, "&cent;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 58
    const/16 v3, 0xa3

    const-string v4, "&pound;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 59
    const/16 v3, 0xa4

    const-string v4, "&curren;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 60
    const/16 v3, 0xa5

    const-string v4, "&yen;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 61
    const/16 v3, 0xa6

    const-string v4, "&brvbar;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 62
    const/16 v3, 0xa7

    const-string v4, "&sect;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 63
    const/16 v3, 0xa8

    const-string v4, "&uml;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 64
    const/16 v3, 0xa9

    const-string v4, "&copy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 65
    const/16 v3, 0xaa

    const-string v4, "&ordf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 66
    const/16 v3, 0xab

    const-string v4, "&laquo;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 67
    const/16 v3, 0xac

    const-string v4, "&not;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 68
    const/16 v3, 0xad

    const-string v4, "&shy;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 69
    const/16 v3, 0xae

    const-string v4, "&reg;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 70
    const/16 v3, 0xaf

    const-string v4, "&macr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 71
    const/16 v3, 0xb0

    const-string v4, "&deg;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 72
    const/16 v3, 0xb1

    const-string v4, "&plusmn;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 73
    const/16 v3, 0xb2

    const-string v4, "&sup2;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 74
    const/16 v3, 0xb3

    const-string v4, "&sup3;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 75
    const/16 v3, 0xb4

    const-string v4, "&acute;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 76
    const/16 v3, 0xb5

    const-string v4, "&micro;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 77
    const/16 v3, 0xb6

    const-string v4, "&para;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 78
    const/16 v3, 0xb7

    const-string v4, "&middot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 79
    const/16 v3, 0xb8

    const-string v4, "&cedil;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 80
    const/16 v3, 0xb9

    const-string v4, "&sup1;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 81
    const/16 v3, 0xba

    const-string v4, "&ordm;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 82
    const/16 v3, 0xbb

    const-string v4, "&raquo;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 83
    const/16 v3, 0xbc

    const-string v4, "&frac14;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 84
    const/16 v3, 0xbd

    const-string v4, "&frac12;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 85
    const/16 v3, 0xbe

    const-string v4, "&frac34;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 86
    const/16 v3, 0xbf

    const-string v4, "&iquest;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 87
    const/16 v3, 0xc0

    const-string v4, "&Agrave;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 88
    const/16 v3, 0xc1

    const-string v4, "&Aacute;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 89
    const/16 v3, 0xc2

    const-string v4, "&Acirc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 90
    const/16 v3, 0xc3

    const-string v4, "&Atilde;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 91
    const/16 v3, 0xc4

    const-string v4, "&Auml;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 92
    const/16 v3, 0xc5

    const-string v4, "&Aring;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 93
    const/16 v3, 0xc6

    const-string v4, "&AElig;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 94
    const/16 v3, 0xc7

    const-string v4, "&Ccedil;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 95
    const/16 v3, 0xc8

    const-string v4, "&Egrave;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 96
    const/16 v3, 0xc9

    const-string v4, "&Eacute;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 97
    const/16 v3, 0xca

    const-string v4, "&Ecirc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 98
    const/16 v3, 0xcb

    const-string v4, "&Euml;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 99
    const/16 v3, 0xcc

    const-string v4, "&Igrave;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 100
    const/16 v3, 0xcd

    const-string v4, "&Iacute;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 101
    const/16 v3, 0xce

    const-string v4, "&Icirc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 102
    const/16 v3, 0xcf

    const-string v4, "&Iuml;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 103
    const/16 v3, 0xd0

    const-string v4, "&ETH;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 104
    const/16 v3, 0xd1

    const-string v4, "&Ntilde;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 105
    const/16 v3, 0xd2

    const-string v4, "&Ograve;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 106
    const/16 v3, 0xd3

    const-string v4, "&Oacute;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 107
    const/16 v3, 0xd4

    const-string v4, "&Ocirc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 108
    const/16 v3, 0xd5

    const-string v4, "&Otilde;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 109
    const/16 v3, 0xd6

    const-string v4, "&Ouml;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 110
    const/16 v3, 0xd7

    const-string v4, "&times;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 111
    const/16 v3, 0xd8

    const-string v4, "&Oslash;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 112
    const/16 v3, 0xd9

    const-string v4, "&Ugrave;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 113
    const/16 v3, 0xda

    const-string v4, "&Uacute;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 114
    const/16 v3, 0xdb

    const-string v4, "&Ucirc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 115
    const/16 v3, 0xdc

    const-string v4, "&Uuml;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 116
    const/16 v3, 0xdd

    const-string v4, "&Yacute;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 117
    const/16 v3, 0xde

    const-string v4, "&THORN;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 118
    const/16 v3, 0xdf

    const-string v4, "&szlig;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 119
    const/16 v3, 0xe0

    const-string v4, "&agrave;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 120
    const/16 v3, 0xe1

    const-string v4, "&aacute;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 121
    const/16 v3, 0xe2

    const-string v4, "&acirc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 122
    const/16 v3, 0xe3

    const-string v4, "&atilde;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 123
    const/16 v3, 0xe4

    const-string v4, "&auml;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 124
    const/16 v3, 0xe5

    const-string v4, "&aring;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 125
    const/16 v3, 0xe6

    const-string v4, "&aelig;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 126
    const/16 v3, 0xe7

    const-string v4, "&ccedil;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 127
    const/16 v3, 0xe8

    const-string v4, "&egrave;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 128
    const/16 v3, 0xe9

    const-string v4, "&eacute;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 129
    const/16 v3, 0xea

    const-string v4, "&ecirc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 130
    const/16 v3, 0xeb

    const-string v4, "&euml;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 131
    const/16 v3, 0xec

    const-string v4, "&igrave;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 132
    const/16 v3, 0xed

    const-string v4, "&iacute;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 133
    const/16 v3, 0xee

    const-string v4, "&icirc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 134
    const/16 v3, 0xef

    const-string v4, "&iuml;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 135
    const/16 v3, 0xf0

    const-string v4, "&eth;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 136
    const/16 v3, 0xf1

    const-string v4, "&ntilde;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 137
    const/16 v3, 0xf2

    const-string v4, "&ograve;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 138
    const/16 v3, 0xf3

    const-string v4, "&oacute;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 139
    const/16 v3, 0xf4

    const-string v4, "&ocirc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 140
    const/16 v3, 0xf5

    const-string v4, "&otilde;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 141
    const/16 v3, 0xf6

    const-string v4, "&ouml;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 142
    const/16 v3, 0xf7

    const-string v4, "&divide;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 143
    const/16 v3, 0xf8

    const-string v4, "&oslash;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 144
    const/16 v3, 0xf9

    const-string v4, "&ugrave;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 145
    const/16 v3, 0xfa

    const-string v4, "&uacute;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 146
    const/16 v3, 0xfb

    const-string v4, "&ucirc;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 147
    const/16 v3, 0xfc

    const-string v4, "&uuml;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 148
    const/16 v3, 0xfd

    const-string v4, "&yacute;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 149
    const/16 v3, 0xfe

    const-string v4, "&thorn;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 150
    const/16 v3, 0xff

    const-string v4, "&yuml;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 153
    const/16 v3, 0x192

    const-string v4, "&fnof;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 154
    const/16 v3, 0x391

    const-string v4, "&Alpha;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 155
    const/16 v3, 0x392

    const-string v4, "&Beta;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 156
    const/16 v3, 0x393

    const-string v4, "&Gamma;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 157
    const/16 v3, 0x394

    const-string v4, "&Delta;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 158
    const/16 v3, 0x395

    const-string v4, "&Epsilon;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 159
    const/16 v3, 0x396

    const-string v4, "&Zeta;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 160
    const/16 v3, 0x397

    const-string v4, "&Eta;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 161
    const/16 v3, 0x398

    const-string v4, "&Theta;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 162
    const/16 v3, 0x399

    const-string v4, "&Iota;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 163
    const/16 v3, 0x39a

    const-string v4, "&Kappa;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 164
    const/16 v3, 0x39b

    const-string v4, "&Lambda;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 165
    const/16 v3, 0x39c

    const-string v4, "&Mu;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 166
    const/16 v3, 0x39d

    const-string v4, "&Nu;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 167
    const/16 v3, 0x39e

    const-string v4, "&Xi;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 168
    const/16 v3, 0x39f

    const-string v4, "&Omicron;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 169
    const/16 v3, 0x3a0

    const-string v4, "&Pi;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 170
    const/16 v3, 0x3a1

    const-string v4, "&Rho;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 171
    const/16 v3, 0x3a3

    const-string v4, "&Sigma;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 172
    const/16 v3, 0x3a4

    const-string v4, "&Tau;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 173
    const/16 v3, 0x3a5

    const-string v4, "&Upsilon;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 174
    const/16 v3, 0x3a6

    const-string v4, "&Phi;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 175
    const/16 v3, 0x3a7

    const-string v4, "&Chi;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 176
    const/16 v3, 0x3a8

    const-string v4, "&Psi;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 177
    const/16 v3, 0x3a9

    const-string v4, "&Omega;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 178
    const/16 v3, 0x3b1

    const-string v4, "&alpha;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 179
    const/16 v3, 0x3b2

    const-string v4, "&beta;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 180
    const/16 v3, 0x3b3

    const-string v4, "&gamma;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 181
    const/16 v3, 0x3b4

    const-string v4, "&delta;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 182
    const/16 v3, 0x3b5

    const-string v4, "&epsilon;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 183
    const/16 v3, 0x3b6

    const-string v4, "&zeta;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 184
    const/16 v3, 0x3b7

    const-string v4, "&eta;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 185
    const/16 v3, 0x3b8

    const-string v4, "&theta;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 186
    const/16 v3, 0x3b9

    const-string v4, "&iota;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 187
    const/16 v3, 0x3ba

    const-string v4, "&kappa;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 188
    const/16 v3, 0x3bb

    const-string v4, "&lambda;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 189
    const/16 v3, 0x3bc

    const-string v4, "&mu;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 190
    const/16 v3, 0x3bd

    const-string v4, "&nu;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 191
    const/16 v3, 0x3be

    const-string v4, "&xi;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 192
    const/16 v3, 0x3bf

    const-string v4, "&omicron;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 193
    const/16 v3, 0x3c0

    const-string v4, "&pi;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 194
    const/16 v3, 0x3c1

    const-string v4, "&rho;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 195
    const/16 v3, 0x3c2

    const-string v4, "&sigmaf;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 196
    const/16 v3, 0x3c3

    const-string v4, "&sigma;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 197
    const/16 v3, 0x3c4

    const-string v4, "&tau;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 198
    const/16 v3, 0x3c5

    const-string v4, "&upsilon;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 199
    const/16 v3, 0x3c6

    const-string v4, "&phi;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 200
    const/16 v3, 0x3c7

    const-string v4, "&chi;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 201
    const/16 v3, 0x3c8

    const-string v4, "&psi;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 202
    const/16 v3, 0x3c9

    const-string v4, "&omega;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 203
    const/16 v3, 0x3d1

    const-string v4, "&thetasym;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 204
    const/16 v3, 0x3d2

    const-string v4, "&upsih;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 205
    const/16 v3, 0x3d6

    const-string v4, "&piv;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 207
    const/16 v3, 0x2022

    const-string v4, "&bull;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 208
    const/16 v3, 0x2026

    const-string v4, "&hellip;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 209
    const/16 v3, 0x2032

    const-string v4, "&prime;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 210
    const/16 v3, 0x2033

    const-string v4, "&Prime;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 211
    const/16 v3, 0x203e

    const-string v4, "&oline;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 212
    const/16 v3, 0x2044

    const-string v4, "&frasl;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 214
    const/16 v3, 0x2118

    const-string v4, "&weierp;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 215
    const/16 v3, 0x2111

    const-string v4, "&image;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 216
    const/16 v3, 0x211c

    const-string v4, "&real;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 217
    const/16 v3, 0x2122

    const-string v4, "&trade;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 218
    const/16 v3, 0x2135

    const-string v4, "&alefsym;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 220
    const/16 v3, 0x2190

    const-string v4, "&larr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 221
    const/16 v3, 0x2191

    const-string v4, "&uarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 222
    const/16 v3, 0x2192

    const-string v4, "&rarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 223
    const/16 v3, 0x2193

    const-string v4, "&darr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 224
    const/16 v3, 0x2194

    const-string v4, "&harr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 225
    const/16 v3, 0x21b5

    const-string v4, "&crarr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 226
    const/16 v3, 0x21d0

    const-string v4, "&lArr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 227
    const/16 v3, 0x21d1

    const-string v4, "&uArr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 228
    const/16 v3, 0x21d2

    const-string v4, "&rArr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 229
    const/16 v3, 0x21d3

    const-string v4, "&dArr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 230
    const/16 v3, 0x21d4

    const-string v4, "&hArr;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 232
    const/16 v3, 0x2200

    const-string v4, "&forall;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 233
    const/16 v3, 0x2202

    const-string v4, "&part;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 234
    const/16 v3, 0x2203

    const-string v4, "&exist;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 235
    const/16 v3, 0x2205

    const-string v4, "&empty;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 236
    const/16 v3, 0x2207

    const-string v4, "&nabla;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 237
    const/16 v3, 0x2208

    const-string v4, "&isin;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 238
    const/16 v3, 0x2209

    const-string v4, "&notin;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 239
    const/16 v3, 0x220b

    const-string v4, "&ni;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 240
    const/16 v3, 0x220f

    const-string v4, "&prod;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 241
    const/16 v3, 0x2211

    const-string v4, "&sum;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 242
    const/16 v3, 0x2212

    const-string v4, "&minus;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 243
    const/16 v3, 0x2217

    const-string v4, "&lowast;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 244
    const/16 v3, 0x221a

    const-string v4, "&radic;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 245
    const/16 v3, 0x221d

    const-string v4, "&prop;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 246
    const/16 v3, 0x221e

    const-string v4, "&infin;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 247
    const/16 v3, 0x2220

    const-string v4, "&ang;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 248
    const/16 v3, 0x2227

    const-string v4, "&and;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 249
    const/16 v3, 0x2228

    const-string v4, "&or;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 250
    const/16 v3, 0x2229

    const-string v4, "&cap;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 251
    const/16 v3, 0x222a

    const-string v4, "&cup;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 252
    const/16 v3, 0x222b

    const-string v4, "&int;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 253
    const/16 v3, 0x2234

    const-string v4, "&there4;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 254
    const/16 v3, 0x223c

    const-string v4, "&sim;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 255
    const/16 v3, 0x2245

    const-string v4, "&cong;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 256
    const/16 v3, 0x2248

    const-string v4, "&asymp;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 257
    const/16 v3, 0x2260

    const-string v4, "&ne;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 258
    const/16 v3, 0x2261

    const-string v4, "&equiv;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 259
    const/16 v3, 0x2264

    const-string v4, "&le;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 260
    const/16 v3, 0x2265

    const-string v4, "&ge;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 261
    const/16 v3, 0x2282

    const-string v4, "&sub;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 262
    const/16 v3, 0x2283

    const-string v4, "&sup;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 263
    const/16 v3, 0x2284

    const-string v4, "&nsub;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 264
    const/16 v3, 0x2286

    const-string v4, "&sube;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 265
    const/16 v3, 0x2287

    const-string v4, "&supe;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 266
    const/16 v3, 0x2295

    const-string v4, "&oplus;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 267
    const/16 v3, 0x2297

    const-string v4, "&otimes;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 268
    const/16 v3, 0x22a5

    const-string v4, "&perp;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 269
    const/16 v3, 0x22c5

    const-string v4, "&sdot;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 271
    const/16 v3, 0x2308

    const-string v4, "&lceil;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 272
    const/16 v3, 0x2309

    const-string v4, "&rceil;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 273
    const/16 v3, 0x230a

    const-string v4, "&lfloor;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 274
    const/16 v3, 0x230b

    const-string v4, "&rfloor;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 275
    const/16 v3, 0x2329

    const-string v4, "&lang;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 276
    const/16 v3, 0x232a

    const-string v4, "&rang;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 278
    const/16 v3, 0x25ca

    const-string v4, "&loz;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 279
    const/16 v3, 0x2660

    const-string v4, "&spades;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 280
    const/16 v3, 0x2663

    const-string v4, "&clubs;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 281
    const/16 v3, 0x2665

    const-string v4, "&hearts;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 282
    const/16 v3, 0x2666

    const-string v4, "&diams;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 285
    const/16 v3, 0x152

    const-string v4, "&OElig;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 286
    const/16 v3, 0x153

    const-string v4, "&oelig;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 287
    const/16 v3, 0x160

    const-string v4, "&Scaron;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 288
    const/16 v3, 0x161

    const-string v4, "&scaron;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 289
    const/16 v3, 0x178

    const-string v4, "&Yuml;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 291
    const/16 v3, 0x2c6

    const-string v4, "&circ;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 292
    const/16 v3, 0x2dc

    const-string v4, "&tilde;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 294
    const/16 v3, 0x2002

    const-string v4, "&ensp;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 295
    const/16 v3, 0x2003

    const-string v4, "&emsp;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 296
    const/16 v3, 0x2009

    const-string v4, "&thinsp;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 297
    const/16 v3, 0x200c

    const-string v4, "&zwnj;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 298
    const/16 v3, 0x200d

    const-string v4, "&zwj;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 299
    const/16 v3, 0x200e

    const-string v4, "&lrm;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 300
    const/16 v3, 0x200f

    const-string v4, "&rlm;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 301
    const/16 v3, 0x2013

    const-string v4, "&ndash;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 302
    const/16 v3, 0x2014

    const-string v4, "&mdash;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 303
    const/16 v3, 0x2018

    const-string v4, "&lsquo;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 304
    const/16 v3, 0x2019

    const-string v4, "&rsquo;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 305
    const/16 v3, 0x201a

    const-string v4, "&sbquo;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 306
    const/16 v3, 0x201c

    const-string v4, "&ldquo;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 307
    const/16 v3, 0x201d

    const-string v4, "&rdquo;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 308
    const/16 v3, 0x201e

    const-string v4, "&bdquo;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 309
    const/16 v3, 0x2020

    const-string v4, "&dagger;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 310
    const/16 v3, 0x2021

    const-string v4, "&Dagger;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 311
    const/16 v3, 0x2030

    const-string v4, "&permil;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 312
    const/16 v3, 0x2039

    const-string v4, "&lsaquo;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 313
    const/16 v3, 0x203a

    const-string v4, "&rsaquo;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 314
    const/16 v3, 0x20ac

    const-string v4, "&euro;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 327
    const/16 v3, 0x81

    new-array v1, v3, [B

    .line 328
    .local v1, "escapeLevels":[B
    const/4 v3, 0x3

    invoke-static {v1, v3}, Ljava/util/Arrays;->fill([BB)V

    .line 329
    const/16 v0, 0x41

    .local v0, "c":C
    :goto_6f5
    const/16 v3, 0x5a

    if-gt v0, v3, :cond_6ff

    .line 330
    aput-byte v6, v1, v0

    .line 329
    add-int/lit8 v3, v0, 0x1

    int-to-char v0, v3

    goto :goto_6f5

    .line 332
    :cond_6ff
    const/16 v0, 0x61

    :goto_701
    const/16 v3, 0x7a

    if-gt v0, v3, :cond_70b

    .line 333
    aput-byte v6, v1, v0

    .line 332
    add-int/lit8 v3, v0, 0x1

    int-to-char v0, v3

    goto :goto_701

    .line 335
    :cond_70b
    const/16 v0, 0x30

    :goto_70d
    const/16 v3, 0x39

    if-gt v0, v3, :cond_717

    .line 336
    aput-byte v6, v1, v0

    .line 335
    add-int/lit8 v3, v0, 0x1

    int-to-char v0, v3

    goto :goto_70d

    .line 338
    :cond_717
    const/16 v3, 0x27

    const/4 v4, 0x1

    aput-byte v4, v1, v3

    .line 339
    aput-byte v5, v1, v7

    .line 340
    aput-byte v5, v1, v9

    .line 341
    const/16 v3, 0x3e

    aput-byte v5, v1, v3

    .line 342
    aput-byte v5, v1, v8

    .line 343
    const/16 v3, 0x80

    const/4 v4, 0x2

    aput-byte v4, v1, v3

    .line 346
    new-instance v3, Lorg/unbescape/html/HtmlEscapeSymbols;

    invoke-direct {v3, v2, v1}, Lorg/unbescape/html/HtmlEscapeSymbols;-><init>(Lorg/unbescape/html/HtmlEscapeSymbols$References;[B)V

    return-object v3
.end method
