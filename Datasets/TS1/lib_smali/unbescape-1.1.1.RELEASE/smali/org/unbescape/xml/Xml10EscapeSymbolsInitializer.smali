.class final Lorg/unbescape/xml/Xml10EscapeSymbolsInitializer;
.super Ljava/lang/Object;
.source "Xml10EscapeSymbolsInitializer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/unbescape/xml/Xml10EscapeSymbolsInitializer$Xml10CodepointValidator;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 121
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 122
    return-void
.end method

.method static initializeXml10()Lorg/unbescape/xml/XmlEscapeSymbols;
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
    .local v2, "xml10References":Lorg/unbescape/xml/XmlEscapeSymbols$References;
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

    .line 64
    const/16 v3, 0xa1

    new-array v1, v3, [B

    .line 69
    .local v1, "escapeLevels":[B
    const/4 v3, 0x3

    invoke-static {v1, v3}, Ljava/util/Arrays;->fill([BB)V

    .line 74
    const/16 v0, 0x80

    .local v0, "c":C
    :goto_34
    const/16 v3, 0xa1

    if-ge v0, v3, :cond_3f

    .line 75
    const/4 v3, 0x2

    aput-byte v3, v1, v0

    .line 74
    add-int/lit8 v3, v0, 0x1

    int-to-char v0, v3

    goto :goto_34

    .line 81
    :cond_3f
    const/16 v0, 0x41

    :goto_41
    const/16 v3, 0x5a

    if-gt v0, v3, :cond_4b

    .line 82
    aput-byte v6, v1, v0

    .line 81
    add-int/lit8 v3, v0, 0x1

    int-to-char v0, v3

    goto :goto_41

    .line 84
    :cond_4b
    const/16 v0, 0x61

    :goto_4d
    const/16 v3, 0x7a

    if-gt v0, v3, :cond_57

    .line 85
    aput-byte v6, v1, v0

    .line 84
    add-int/lit8 v3, v0, 0x1

    int-to-char v0, v3

    goto :goto_4d

    .line 87
    :cond_57
    const/16 v0, 0x30

    :goto_59
    const/16 v3, 0x39

    if-gt v0, v3, :cond_63

    .line 88
    aput-byte v6, v1, v0

    .line 87
    add-int/lit8 v3, v0, 0x1

    int-to-char v0, v3

    goto :goto_59

    .line 94
    :cond_63
    aput-byte v5, v1, v9

    .line 95
    aput-byte v5, v1, v7

    .line 96
    const/16 v3, 0x3c

    aput-byte v5, v1, v3

    .line 97
    const/16 v3, 0x3e

    aput-byte v5, v1, v3

    .line 98
    aput-byte v5, v1, v8

    .line 104
    const/16 v0, 0x7f

    :goto_73
    const/16 v3, 0x84

    if-gt v0, v3, :cond_7d

    .line 105
    aput-byte v5, v1, v0

    .line 104
    add-int/lit8 v3, v0, 0x1

    int-to-char v0, v3

    goto :goto_73

    .line 107
    :cond_7d
    const/16 v0, 0x86

    :goto_7f
    const/16 v3, 0x9f

    if-gt v0, v3, :cond_89

    .line 108
    aput-byte v5, v1, v0

    .line 107
    add-int/lit8 v3, v0, 0x1

    int-to-char v0, v3

    goto :goto_7f

    .line 114
    :cond_89
    new-instance v3, Lorg/unbescape/xml/XmlEscapeSymbols;

    new-instance v4, Lorg/unbescape/xml/Xml10EscapeSymbolsInitializer$Xml10CodepointValidator;

    invoke-direct {v4}, Lorg/unbescape/xml/Xml10EscapeSymbolsInitializer$Xml10CodepointValidator;-><init>()V

    invoke-direct {v3, v2, v1, v4}, Lorg/unbescape/xml/XmlEscapeSymbols;-><init>(Lorg/unbescape/xml/XmlEscapeSymbols$References;[BLorg/unbescape/xml/XmlCodepointValidator;)V

    return-object v3
.end method
