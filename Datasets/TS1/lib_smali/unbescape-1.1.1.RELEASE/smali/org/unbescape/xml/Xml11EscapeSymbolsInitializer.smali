.class final Lorg/unbescape/xml/Xml11EscapeSymbolsInitializer;
.super Ljava/lang/Object;
.source "Xml11EscapeSymbolsInitializer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/unbescape/xml/Xml11EscapeSymbolsInitializer$Xml11CodepointValidator;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 131
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 132
    return-void
.end method

.method static initializeXml11()Lorg/unbescape/xml/XmlEscapeSymbols;
    .registers 10

    .prologue
    const/16 v9, 0x27

    const/16 v8, 0x26

    const/16 v7, 0x22

    const/4 v6, 0x4

    const/4 v5, 0x1

    .line 39
    new-instance v2, Lorg/unbescape/xml/XmlEscapeSymbols$References;

    invoke-direct {v2}, Lorg/unbescape/xml/XmlEscapeSymbols$References;-><init>()V

    .line 47
    .local v2, "xml11References":Lorg/unbescape/xml/XmlEscapeSymbols$References;
    const-string v3, "&quot;"

    invoke-virtual {v2, v7, v3}, Lorg/unbescape/xml/XmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 48
    const-string v3, "&amp;"

    invoke-virtual {v2, v8, v3}, Lorg/unbescape/xml/XmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 49
    const-string v3, "&apos;"

    invoke-virtual {v2, v9, v3}, Lorg/unbescape/xml/XmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 50
    const/16 v3, 0x3c

    const-string v4, "&lt;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/xml/XmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 51
    const/16 v3, 0x3e

    const-string v4, "&gt;"

    invoke-virtual {v2, v3, v4}, Lorg/unbescape/xml/XmlEscapeSymbols$References;->addReference(ILjava/lang/String;)V

    .line 66
    const/16 v3, 0xa1

    new-array v1, v3, [B

    .line 71
    .local v1, "escapeLevels":[B
    const/4 v3, 0x3

    invoke-static {v1, v3}, Ljava/util/Arrays;->fill([BB)V

    .line 76
    const/16 v0, 0x80

    .local v0, "c":C
    :goto_34
    const/16 v3, 0xa1

    if-ge v0, v3, :cond_3f

    .line 77
    const/4 v3, 0x2

    aput-byte v3, v1, v0

    .line 76
    add-int/lit8 v3, v0, 0x1

    int-to-char v0, v3

    goto :goto_34

    .line 83
    :cond_3f
    const/16 v0, 0x41

    :goto_41
    const/16 v3, 0x5a

    if-gt v0, v3, :cond_4b

    .line 84
    aput-byte v6, v1, v0

    .line 83
    add-int/lit8 v3, v0, 0x1

    int-to-char v0, v3

    goto :goto_41

    .line 86
    :cond_4b
    const/16 v0, 0x61

    :goto_4d
    const/16 v3, 0x7a

    if-gt v0, v3, :cond_57

    .line 87
    aput-byte v6, v1, v0

    .line 86
    add-int/lit8 v3, v0, 0x1

    int-to-char v0, v3

    goto :goto_4d

    .line 89
    :cond_57
    const/16 v0, 0x30

    :goto_59
    const/16 v3, 0x39

    if-gt v0, v3, :cond_63

    .line 90
    aput-byte v6, v1, v0

    .line 89
    add-int/lit8 v3, v0, 0x1

    int-to-char v0, v3

    goto :goto_59

    .line 96
    :cond_63
    aput-byte v5, v1, v9

    .line 97
    aput-byte v5, v1, v7

    .line 98
    const/16 v3, 0x3c

    aput-byte v5, v1, v3

    .line 99
    const/16 v3, 0x3e

    aput-byte v5, v1, v3

    .line 100
    aput-byte v5, v1, v8

    .line 106
    const/4 v0, 0x1

    :goto_72
    const/16 v3, 0x8

    if-gt v0, v3, :cond_7c

    .line 107
    aput-byte v5, v1, v0

    .line 106
    add-int/lit8 v3, v0, 0x1

    int-to-char v0, v3

    goto :goto_72

    .line 109
    :cond_7c
    const/16 v3, 0xb

    aput-byte v5, v1, v3

    .line 110
    const/16 v3, 0xc

    aput-byte v5, v1, v3

    .line 111
    const/16 v0, 0xe

    :goto_86
    const/16 v3, 0x1f

    if-gt v0, v3, :cond_90

    .line 112
    aput-byte v5, v1, v0

    .line 111
    add-int/lit8 v3, v0, 0x1

    int-to-char v0, v3

    goto :goto_86

    .line 114
    :cond_90
    const/16 v0, 0x7f

    :goto_92
    const/16 v3, 0x84

    if-gt v0, v3, :cond_9c

    .line 115
    aput-byte v5, v1, v0

    .line 114
    add-int/lit8 v3, v0, 0x1

    int-to-char v0, v3

    goto :goto_92

    .line 117
    :cond_9c
    const/16 v0, 0x86

    :goto_9e
    const/16 v3, 0x9f

    if-gt v0, v3, :cond_a8

    .line 118
    aput-byte v5, v1, v0

    .line 117
    add-int/lit8 v3, v0, 0x1

    int-to-char v0, v3

    goto :goto_9e

    .line 124
    :cond_a8
    new-instance v3, Lorg/unbescape/xml/XmlEscapeSymbols;

    new-instance v4, Lorg/unbescape/xml/Xml11EscapeSymbolsInitializer$Xml11CodepointValidator;

    invoke-direct {v4}, Lorg/unbescape/xml/Xml11EscapeSymbolsInitializer$Xml11CodepointValidator;-><init>()V

    invoke-direct {v3, v2, v1, v4}, Lorg/unbescape/xml/XmlEscapeSymbols;-><init>(Lorg/unbescape/xml/XmlEscapeSymbols$References;[BLorg/unbescape/xml/XmlCodepointValidator;)V

    return-object v3
.end method
