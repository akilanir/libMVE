.class public Lcom/bea/xml/stream/MXParser;
.super Ljava/lang/Object;
.source "MXParser.java"

# interfaces
.implements Ljavax/xml/stream/XMLStreamReader;
.implements Ljavax/xml/stream/Location;


# static fields
.field protected static final CHAR_UTF8_BOM:C = '\ufeff'

.field private static final DOCDECL:I = 0x8000

.field protected static final ENCODING:[C

.field static final EOF_MSG:Ljava/lang/String; = "Unexpected end of stream"

.field protected static final FEATURE_NAMES_INTERNED:Ljava/lang/String; = "http://xmlpull.org/v1/doc/features.html#names-interned"

.field public static final FEATURE_PROCESS_DOCDECL:Ljava/lang/String; = "http://xmlpull.org/v1/doc/features.html#process-docdecl"

.field public static final FEATURE_PROCESS_NAMESPACES:Ljava/lang/String; = "http://xmlpull.org/v1/doc/features.html#process-namespaces"

.field public static final FEATURE_STAX_ENTITIES:Ljava/lang/String; = "javax.xml.stream.entities"

.field public static final FEATURE_STAX_NOTATIONS:Ljava/lang/String; = "javax.xml.stream.notations"

.field protected static final FEATURE_XML_ROUNDTRIP:Ljava/lang/String; = "http://xmlpull.org/v1/doc/features.html#xml-roundtrip"

.field protected static final LOOKUP_MAX:I = 0x400

.field protected static final LOOKUP_MAX_CHAR:C = '\u0400'

.field protected static final MAX_UNICODE_CHAR:I = 0x10ffff

.field protected static final NO:[C

.field private static final NO_CHARS:[C

.field private static final NO_INTS:[I

.field public static final NO_NAMESPACE:Ljava/lang/String;

.field private static final NO_STRINGS:[Ljava/lang/String;

.field protected static final READ_CHUNK_SIZE:I = 0x2000

.field protected static final STANDALONE:[C

.field private static final TEXT:I = 0x4000

.field private static final TRACE_SIZING:Z

.field public static final TYPES:[Ljava/lang/String;

.field protected static final VERSION:[C

.field protected static final YES:[C

.field static class$com$wutka$dtd$DTDAttlist:Ljava/lang/Class;

.field static class$com$wutka$dtd$DTDEntity:Ljava/lang/Class;

.field static class$com$wutka$dtd$DTDNotation:Ljava/lang/Class;

.field protected static lookupNameChar:[Z

.field protected static lookupNameStartChar:[Z


# instance fields
.field protected allStringsInterned:Z

.field protected attributeCount:I

.field protected attributeName:[Ljava/lang/String;

.field protected attributeNameHash:[I

.field protected attributePrefix:[Ljava/lang/String;

.field protected attributeUri:[Ljava/lang/String;

.field protected attributeValue:[Ljava/lang/String;

.field protected buf:[C

.field protected bufAbsoluteStart:I

.field protected bufEnd:I

.field protected bufLoadFactor:I

.field protected bufSoftLimit:I

.field protected bufStart:I

.field protected charEncodingScheme:Ljava/lang/String;

.field protected charRefOneCharBuf:[C

.field protected charRefTwoCharBuf:[C

.field protected columnNumber:I

.field private configurationContext:Lcom/bea/xml/stream/ConfigurationContextBase;

.field protected defaultAttributes:Ljava/util/HashMap;

.field protected depth:I

.field protected elName:[Ljava/lang/String;

.field protected elNamespaceCount:[I

.field protected elPrefix:[Ljava/lang/String;

.field protected elRawName:[[C

.field protected elRawNameEnd:[I

.field protected elUri:[Ljava/lang/String;

.field protected emptyElementTag:Z

.field protected entityEnd:I

.field protected entityName:[Ljava/lang/String;

.field protected entityNameBuf:[[C

.field protected entityNameHash:[I

.field protected entityRefName:Ljava/lang/String;

.field protected entityReplacement:[Ljava/lang/String;

.field protected entityReplacementBuf:[[C

.field protected entityValue:[C

.field protected eventType:I

.field protected inputEncoding:Ljava/lang/String;

.field protected lineNumber:I

.field protected localNamespaceEnd:I

.field protected localNamespacePrefix:[Ljava/lang/String;

.field protected localNamespacePrefixHash:[I

.field protected localNamespaceUri:[Ljava/lang/String;

.field protected mDtdIntSubset:Lcom/wutka/dtd/DTD;

.field protected namespaceEnd:I

.field protected namespacePrefix:[Ljava/lang/String;

.field protected namespacePrefixHash:[I

.field protected namespaceUri:[Ljava/lang/String;

.field protected pastEndTag:Z

.field protected pc:[C

.field protected pcEnd:I

.field protected pcStart:I

.field protected piData:Ljava/lang/String;

.field protected piTarget:Ljava/lang/String;

.field protected pos:I

.field protected posEnd:I

.field protected posStart:I

.field protected processNamespaces:Z

.field protected reachedEnd:Z

.field protected reader:Ljava/io/Reader;

.field private reportCdataEvent:Z

.field protected roundtripSupported:Z

.field protected seenAmpersand:Z

.field protected seenDocdecl:Z

.field protected seenEndTag:Z

.field protected seenMarkup:Z

.field protected seenRoot:Z

.field protected seenStartTag:Z

.field protected standalone:Z

.field protected standaloneSet:Z

.field protected text:Ljava/lang/String;

.field protected tokenize:Z

.field protected usePC:Z

.field protected xmlVersion:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .prologue
    const/4 v8, 0x7

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/16 v5, 0x400

    const/4 v4, 0x0

    .line 76
    const/16 v1, 0x10

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "[UNKNOWN]"

    aput-object v2, v1, v4

    const/4 v2, 0x1

    const-string v3, "START_ELEMENT"

    aput-object v3, v1, v2

    const-string v2, "END_ELEMENT"

    aput-object v2, v1, v6

    const-string v2, "PROCESSING_INSTRUCTION"

    aput-object v2, v1, v7

    const/4 v2, 0x4

    const-string v3, "CHARACTERS"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "COMMENT"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string v3, "SPACE"

    aput-object v3, v1, v2

    const-string v2, "START_DOCUMENT"

    aput-object v2, v1, v8

    const/16 v2, 0x8

    const-string v3, "END_DOCUMENT"

    aput-object v3, v1, v2

    const/16 v2, 0x9

    const-string v3, "ENTITY_REFERENCE"

    aput-object v3, v1, v2

    const/16 v2, 0xa

    const-string v3, "ATTRIBUTE"

    aput-object v3, v1, v2

    const/16 v2, 0xb

    const-string v3, "DTD"

    aput-object v3, v1, v2

    const/16 v2, 0xc

    const-string v3, "CDATA"

    aput-object v3, v1, v2

    const/16 v2, 0xd

    const-string v3, "NAMESPACE"

    aput-object v3, v1, v2

    const/16 v2, 0xe

    const-string v3, "NOTATION_DECLARATION"

    aput-object v3, v1, v2

    const/16 v2, 0xf

    const-string v3, "ENTITY_DECLARATION"

    aput-object v3, v1, v2

    sput-object v1, Lcom/bea/xml/stream/MXParser;->TYPES:[Ljava/lang/String;

    .line 110
    const/4 v1, 0x0

    sput-object v1, Lcom/bea/xml/stream/MXParser;->NO_NAMESPACE:Ljava/lang/String;

    .line 257
    new-array v1, v5, [Z

    sput-object v1, Lcom/bea/xml/stream/MXParser;->lookupNameStartChar:[Z

    .line 258
    new-array v1, v5, [Z

    sput-object v1, Lcom/bea/xml/stream/MXParser;->lookupNameChar:[Z

    .line 268
    const/16 v1, 0x3a

    invoke-static {v1}, Lcom/bea/xml/stream/MXParser;->setNameStart(C)V

    .line 269
    const/16 v0, 0x41

    .local v0, "ch":C
    :goto_72
    const/16 v1, 0x5a

    if-gt v0, v1, :cond_7d

    invoke-static {v0}, Lcom/bea/xml/stream/MXParser;->setNameStart(C)V

    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_72

    .line 270
    :cond_7d
    const/16 v1, 0x5f

    invoke-static {v1}, Lcom/bea/xml/stream/MXParser;->setNameStart(C)V

    .line 271
    const/16 v0, 0x61

    :goto_84
    const/16 v1, 0x7a

    if-gt v0, v1, :cond_8f

    invoke-static {v0}, Lcom/bea/xml/stream/MXParser;->setNameStart(C)V

    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_84

    .line 272
    :cond_8f
    const/16 v0, 0xc0

    :goto_91
    const/16 v1, 0x2ff

    if-gt v0, v1, :cond_9c

    invoke-static {v0}, Lcom/bea/xml/stream/MXParser;->setNameStart(C)V

    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_91

    .line 273
    :cond_9c
    const/16 v0, 0x370

    :goto_9e
    const/16 v1, 0x37d

    if-gt v0, v1, :cond_a9

    invoke-static {v0}, Lcom/bea/xml/stream/MXParser;->setNameStart(C)V

    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_9e

    .line 274
    :cond_a9
    const/16 v0, 0x37f

    :goto_ab
    if-ge v0, v5, :cond_b4

    invoke-static {v0}, Lcom/bea/xml/stream/MXParser;->setNameStart(C)V

    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_ab

    .line 276
    :cond_b4
    const/16 v1, 0x2d

    invoke-static {v1}, Lcom/bea/xml/stream/MXParser;->setName(C)V

    .line 277
    const/16 v1, 0x2e

    invoke-static {v1}, Lcom/bea/xml/stream/MXParser;->setName(C)V

    .line 278
    const/16 v0, 0x30

    :goto_c0
    const/16 v1, 0x39

    if-gt v0, v1, :cond_cb

    invoke-static {v0}, Lcom/bea/xml/stream/MXParser;->setName(C)V

    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_c0

    .line 279
    :cond_cb
    const/16 v1, 0xb7

    invoke-static {v1}, Lcom/bea/xml/stream/MXParser;->setName(C)V

    .line 280
    const/16 v0, 0x300

    :goto_d2
    const/16 v1, 0x36f

    if-gt v0, v1, :cond_dd

    invoke-static {v0}, Lcom/bea/xml/stream/MXParser;->setName(C)V

    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_d2

    .line 424
    :cond_dd
    new-array v1, v4, [Ljava/lang/String;

    sput-object v1, Lcom/bea/xml/stream/MXParser;->NO_STRINGS:[Ljava/lang/String;

    .line 425
    new-array v1, v4, [I

    sput-object v1, Lcom/bea/xml/stream/MXParser;->NO_INTS:[I

    .line 426
    new-array v1, v4, [C

    sput-object v1, Lcom/bea/xml/stream/MXParser;->NO_CHARS:[C

    .line 3165
    new-array v1, v8, [C

    fill-array-data v1, :array_112

    sput-object v1, Lcom/bea/xml/stream/MXParser;->VERSION:[C

    .line 3166
    const/16 v1, 0x8

    new-array v1, v1, [C

    fill-array-data v1, :array_11e

    sput-object v1, Lcom/bea/xml/stream/MXParser;->ENCODING:[C

    .line 3167
    const/16 v1, 0xa

    new-array v1, v1, [C

    fill-array-data v1, :array_12a

    sput-object v1, Lcom/bea/xml/stream/MXParser;->STANDALONE:[C

    .line 3168
    new-array v1, v7, [C

    fill-array-data v1, :array_138

    sput-object v1, Lcom/bea/xml/stream/MXParser;->YES:[C

    .line 3169
    new-array v1, v6, [C

    fill-array-data v1, :array_140

    sput-object v1, Lcom/bea/xml/stream/MXParser;->NO:[C

    return-void

    .line 3165
    nop

    :array_112
    .array-data 2
        0x76s
        0x65s
        0x72s
        0x73s
        0x69s
        0x6fs
        0x6es
    .end array-data

    .line 3166
    nop

    :array_11e
    .array-data 2
        0x65s
        0x6es
        0x63s
        0x6fs
        0x64s
        0x69s
        0x6es
        0x67s
    .end array-data

    .line 3167
    :array_12a
    .array-data 2
        0x73s
        0x74s
        0x61s
        0x6es
        0x64s
        0x61s
        0x6cs
        0x6fs
        0x6es
        0x65s
    .end array-data

    .line 3168
    :array_138
    .array-data 2
        0x79s
        0x65s
        0x73s
    .end array-data

    .line 3169
    nop

    :array_140
    .array-data 2
        0x6es
        0x6fs
    .end array-data
.end method

.method public constructor <init>()V
    .registers 9

    .prologue
    const-wide/32 v6, 0xf4240

    const/16 v1, 0x2000

    const/4 v5, 0x0

    const/4 v4, 0x1

    const/4 v0, 0x0

    .line 695
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    iput-boolean v0, p0, Lcom/bea/xml/stream/MXParser;->reportCdataEvent:Z

    .line 141
    iput-boolean v4, p0, Lcom/bea/xml/stream/MXParser;->processNamespaces:Z

    .line 142
    iput-boolean v4, p0, Lcom/bea/xml/stream/MXParser;->roundtripSupported:Z

    .line 165
    iput-object v5, p0, Lcom/bea/xml/stream/MXParser;->xmlVersion:Ljava/lang/String;

    .line 171
    iput-boolean v0, p0, Lcom/bea/xml/stream/MXParser;->standalone:Z

    .line 172
    iput-boolean v0, p0, Lcom/bea/xml/stream/MXParser;->standaloneSet:Z

    .line 431
    sget-object v0, Lcom/bea/xml/stream/MXParser;->NO_STRINGS:[Ljava/lang/String;

    iput-object v0, p0, Lcom/bea/xml/stream/MXParser;->namespacePrefix:[Ljava/lang/String;

    .line 433
    sget-object v0, Lcom/bea/xml/stream/MXParser;->NO_STRINGS:[Ljava/lang/String;

    iput-object v0, p0, Lcom/bea/xml/stream/MXParser;->namespaceUri:[Ljava/lang/String;

    .line 598
    const/16 v0, 0x5f

    iput v0, p0, Lcom/bea/xml/stream/MXParser;->bufLoadFactor:I

    .line 606
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Runtime;->freeMemory()J

    move-result-wide v2

    cmp-long v0, v2, v6

    if-lez v0, :cond_57

    move v0, v1

    :goto_30
    new-array v0, v0, [C

    iput-object v0, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    .line 607
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->bufLoadFactor:I

    iget-object v2, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    array-length v2, v2

    mul-int/2addr v0, v2

    div-int/lit8 v0, v0, 0x64

    iput v0, p0, Lcom/bea/xml/stream/MXParser;->bufSoftLimit:I

    .line 617
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Runtime;->freeMemory()J

    move-result-wide v2

    cmp-long v0, v2, v6

    if-lez v0, :cond_5a

    :goto_4a
    new-array v0, v1, [C

    iput-object v0, p0, Lcom/bea/xml/stream/MXParser;->pc:[C

    .line 653
    iput-object v5, p0, Lcom/bea/xml/stream/MXParser;->entityValue:[C

    .line 2750
    new-array v0, v4, [C

    iput-object v0, p0, Lcom/bea/xml/stream/MXParser;->charRefOneCharBuf:[C

    .line 2756
    iput-object v5, p0, Lcom/bea/xml/stream/MXParser;->charRefTwoCharBuf:[C

    .line 696
    return-void

    .line 606
    :cond_57
    const/16 v0, 0x100

    goto :goto_30

    .line 617
    :cond_5a
    const/16 v1, 0x40

    goto :goto_4a
.end method

.method private static final checkNull(Ljava/lang/String;)Ljava/lang/String;
    .registers 1
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 1633
    if-eqz p0, :cond_3

    .line 1634
    .end local p0    # "s":Ljava/lang/String;
    :goto_2
    return-object p0

    .restart local p0    # "s":Ljava/lang/String;
    :cond_3
    const-string p0, ""

    goto :goto_2
.end method

.method private final checkTextEvent()V
    .registers 4

    .prologue
    .line 1511
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->hasText()Z

    move-result v0

    if-nez v0, :cond_2b

    .line 1512
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Current state ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    invoke-static {v2}, Lcom/bea/xml/stream/MXParser;->eventTypeDesc(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ") does not have textual content"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1514
    :cond_2b
    return-void
.end method

.method private final checkTextEventXxx()V
    .registers 4

    .prologue
    .line 1517
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    const/4 v1, 0x4

    if-eq v0, v1, :cond_34

    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    const/16 v1, 0xc

    if-eq v0, v1, :cond_34

    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    const/4 v1, 0x5

    if-eq v0, v1, :cond_34

    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    const/4 v1, 0x6

    if-eq v0, v1, :cond_34

    .line 1521
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "getTextXxx methods cannot be called for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    invoke-static {v2}, Lcom/bea/xml/stream/MXParser;->eventTypeDesc(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1523
    :cond_34
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 3519
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    :catch_5
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private static eventTypeDesc(I)Ljava/lang/String;
    .registers 2
    .param p0, "type"    # I

    .prologue
    .line 1638
    if-ltz p0, :cond_7

    sget-object v0, Lcom/bea/xml/stream/MXParser;->TYPES:[Ljava/lang/String;

    array-length v0, v0

    if-lt p0, v0, :cond_a

    :cond_7
    const-string v0, "[UNKNOWN]"

    :goto_9
    return-object v0

    :cond_a
    sget-object v0, Lcom/bea/xml/stream/MXParser;->TYPES:[Ljava/lang/String;

    aget-object v0, v0, p0

    goto :goto_9
.end method

.method protected static final fastHash([CII)I
    .registers 6
    .param p0, "ch"    # [C
    .param p1, "off"    # I
    .param p2, "len"    # I

    .prologue
    .line 534
    if-nez p2, :cond_4

    const/4 v0, 0x0

    .line 548
    :cond_3
    :goto_3
    return v0

    .line 536
    :cond_4
    aget-char v0, p0, p1

    .line 538
    .local v0, "hash":I
    shl-int/lit8 v1, v0, 0x7

    add-int v2, p1, p2

    add-int/lit8 v2, v2, -0x1

    aget-char v2, p0, v2

    add-int v0, v1, v2

    .line 543
    const/16 v1, 0x10

    if-le p2, v1, :cond_1d

    shl-int/lit8 v1, v0, 0x7

    div-int/lit8 v2, p2, 0x4

    add-int/2addr v2, p1

    aget-char v2, p0, v2

    add-int v0, v1, v2

    .line 544
    :cond_1d
    const/16 v1, 0x8

    if-le p2, v1, :cond_3

    shl-int/lit8 v1, v0, 0x7

    div-int/lit8 v2, p2, 0x2

    add-int/2addr v2, p1

    aget-char v2, p0, v2

    add-int v0, v1, v2

    goto :goto_3
.end method

.method private static findFragment(I[CII)I
    .registers 9
    .param p0, "bufMinPos"    # I
    .param p1, "b"    # [C
    .param p2, "start"    # I
    .param p3, "end"    # I

    .prologue
    const/16 v4, 0x41

    .line 978
    if-ge p2, p0, :cond_a

    .line 979
    move p2, p0

    .line 980
    if-le p2, p3, :cond_8

    move p2, p3

    :cond_8
    move v1, p2

    .line 992
    :cond_9
    :goto_9
    return v1

    .line 983
    :cond_a
    sub-int v2, p3, p2

    if-le v2, v4, :cond_10

    .line 984
    add-int/lit8 p2, p3, -0xa

    .line 986
    :cond_10
    add-int/lit8 v1, p2, 0x1

    .line 987
    .local v1, "i":I
    :cond_12
    add-int/lit8 v1, v1, -0x1

    if-le v1, p0, :cond_9

    .line 988
    sub-int v2, p3, v1

    if-gt v2, v4, :cond_9

    .line 989
    aget-char v0, p1, v1

    .line 990
    .local v0, "c":C
    const/16 v2, 0x3c

    if-ne v0, v2, :cond_12

    sub-int v2, p2, v1

    const/16 v3, 0xa

    if-le v2, v3, :cond_12

    goto :goto_9
.end method

.method private getLocalNamespacePrefix(I)Ljava/lang/String;
    .registers 3
    .param p1, "pos"    # I

    .prologue
    .line 525
    iget-object v0, p0, Lcom/bea/xml/stream/MXParser;->namespacePrefix:[Ljava/lang/String;

    aget-object v0, v0, p1

    return-object v0
.end method

.method private getLocalNamespaceURI(I)Ljava/lang/String;
    .registers 3
    .param p1, "pos"    # I

    .prologue
    .line 515
    iget-object v0, p0, Lcom/bea/xml/stream/MXParser;->namespaceUri:[Ljava/lang/String;

    aget-object v0, v0, p1

    return-object v0
.end method

.method private static isElementEvent(I)Z
    .registers 3
    .param p0, "type"    # I

    .prologue
    const/4 v0, 0x1

    .line 1642
    if-eq p0, v0, :cond_6

    const/4 v1, 0x2

    if-ne p0, v1, :cond_7

    :cond_6
    :goto_6
    return v0

    :cond_7
    const/4 v0, 0x0

    goto :goto_6
.end method

.method private reset()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 657
    const/4 v0, 0x1

    iput v0, p0, Lcom/bea/xml/stream/MXParser;->lineNumber:I

    .line 658
    iput v1, p0, Lcom/bea/xml/stream/MXParser;->columnNumber:I

    .line 659
    iput-boolean v1, p0, Lcom/bea/xml/stream/MXParser;->seenRoot:Z

    .line 660
    iput-boolean v1, p0, Lcom/bea/xml/stream/MXParser;->reachedEnd:Z

    .line 661
    const/4 v0, 0x7

    iput v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    .line 662
    iput-boolean v1, p0, Lcom/bea/xml/stream/MXParser;->emptyElementTag:Z

    .line 664
    iput v1, p0, Lcom/bea/xml/stream/MXParser;->depth:I

    .line 666
    iput v1, p0, Lcom/bea/xml/stream/MXParser;->attributeCount:I

    .line 668
    iput v1, p0, Lcom/bea/xml/stream/MXParser;->namespaceEnd:I

    .line 669
    iput v1, p0, Lcom/bea/xml/stream/MXParser;->localNamespaceEnd:I

    .line 671
    iput v1, p0, Lcom/bea/xml/stream/MXParser;->entityEnd:I

    .line 673
    iput-object v2, p0, Lcom/bea/xml/stream/MXParser;->reader:Ljava/io/Reader;

    .line 674
    iput-object v2, p0, Lcom/bea/xml/stream/MXParser;->inputEncoding:Ljava/lang/String;

    .line 676
    iput v1, p0, Lcom/bea/xml/stream/MXParser;->bufAbsoluteStart:I

    .line 677
    iput v1, p0, Lcom/bea/xml/stream/MXParser;->bufStart:I

    iput v1, p0, Lcom/bea/xml/stream/MXParser;->bufEnd:I

    .line 678
    iput v1, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    iput v1, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    iput v1, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    .line 680
    iput v1, p0, Lcom/bea/xml/stream/MXParser;->pcStart:I

    iput v1, p0, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    .line 682
    iput-boolean v1, p0, Lcom/bea/xml/stream/MXParser;->usePC:Z

    .line 684
    iput-boolean v1, p0, Lcom/bea/xml/stream/MXParser;->seenStartTag:Z

    .line 685
    iput-boolean v1, p0, Lcom/bea/xml/stream/MXParser;->seenEndTag:Z

    .line 686
    iput-boolean v1, p0, Lcom/bea/xml/stream/MXParser;->pastEndTag:Z

    .line 687
    iput-boolean v1, p0, Lcom/bea/xml/stream/MXParser;->seenAmpersand:Z

    .line 688
    iput-boolean v1, p0, Lcom/bea/xml/stream/MXParser;->seenMarkup:Z

    .line 689
    iput-boolean v1, p0, Lcom/bea/xml/stream/MXParser;->seenDocdecl:Z

    .line 690
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->resetStringCache()V

    .line 692
    return-void
.end method

.method private static final setName(C)V
    .registers 3
    .param p0, "ch"    # C

    .prologue
    .line 262
    sget-object v0, Lcom/bea/xml/stream/MXParser;->lookupNameChar:[Z

    const/4 v1, 0x1

    aput-boolean v1, v0, p0

    return-void
.end method

.method private static final setNameStart(C)V
    .registers 3
    .param p0, "ch"    # C

    .prologue
    .line 265
    sget-object v0, Lcom/bea/xml/stream/MXParser;->lookupNameStartChar:[Z

    const/4 v1, 0x1

    aput-boolean v1, v0, p0

    invoke-static {p0}, Lcom/bea/xml/stream/MXParser;->setName(C)V

    return-void
.end method

.method private throwIllegalState(I)Ljava/lang/String;
    .registers 5
    .param p1, "expState"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    .line 3833
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Current state ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    invoke-static {v2}, Lcom/bea/xml/stream/MXParser;->eventTypeDesc(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ") not "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-static {p1}, Lcom/bea/xml/stream/MXParser;->eventTypeDesc(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private throwIllegalState([I)Ljava/lang/String;
    .registers 8
    .param p1, "expStates"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    .line 3839
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 3840
    .local v2, "sb":Ljava/lang/StringBuffer;
    const/4 v3, 0x0

    aget v3, p1, v3

    invoke-static {v3}, Lcom/bea/xml/stream/MXParser;->eventTypeDesc(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 3841
    array-length v3, p1

    add-int/lit8 v1, v3, -0x1

    .line 3842
    .local v1, "last":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_13
    if-ge v0, v1, :cond_26

    .line 3843
    const-string v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 3844
    aget v3, p1, v0

    invoke-static {v3}, Lcom/bea/xml/stream/MXParser;->eventTypeDesc(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 3842
    add-int/lit8 v0, v0, 0x1

    goto :goto_13

    .line 3846
    :cond_26
    const-string v3, " or "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 3847
    aget v3, p1, v1

    invoke-static {v3}, Lcom/bea/xml/stream/MXParser;->eventTypeDesc(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 3849
    new-instance v3, Ljava/lang/IllegalStateException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Current state ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget v5, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    invoke-static {v5}, Lcom/bea/xml/stream/MXParser;->eventTypeDesc(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, ") not "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method private throwNotNameStart(C)V
    .registers 5
    .param p1, "ch"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 3855
    new-instance v0, Ljavax/xml/stream/XMLStreamException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "expected name start character and not "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v0
.end method


# virtual methods
.method protected addDefaultAttributes(Ljava/lang/String;)V
    .registers 12
    .param p1, "elementName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 2422
    iget-object v7, p0, Lcom/bea/xml/stream/MXParser;->defaultAttributes:Ljava/util/HashMap;

    if-nez v7, :cond_5

    .line 2447
    :cond_4
    return-void

    .line 2423
    :cond_5
    iget-object v7, p0, Lcom/bea/xml/stream/MXParser;->defaultAttributes:Ljava/util/HashMap;

    invoke-virtual {v7, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/wutka/dtd/DTDAttlist;

    .line 2424
    .local v1, "attList":Lcom/wutka/dtd/DTDAttlist;
    if-eqz p1, :cond_4

    if-eqz v1, :cond_4

    .line 2425
    invoke-virtual {v1}, Lcom/wutka/dtd/DTDAttlist;->getAttribute()[Lcom/wutka/dtd/DTDAttribute;

    move-result-object v2

    .line 2426
    .local v2, "atts":[Lcom/wutka/dtd/DTDAttribute;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_16
    array-length v7, v2

    if-ge v5, v7, :cond_4

    .line 2427
    aget-object v0, v2, v5

    .line 2428
    .local v0, "att":Lcom/wutka/dtd/DTDAttribute;
    invoke-virtual {v0}, Lcom/wutka/dtd/DTDAttribute;->getDefaultValue()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_6e

    .line 2429
    const/4 v4, 0x0

    .line 2430
    .local v4, "found":Z
    iget v3, p0, Lcom/bea/xml/stream/MXParser;->attributeCount:I

    .line 2431
    .local v3, "count":I
    const/4 v6, 0x0

    .local v6, "j":I
    :goto_25
    if-ge v6, v3, :cond_36

    .line 2432
    iget-object v7, p0, Lcom/bea/xml/stream/MXParser;->attributeName:[Ljava/lang/String;

    aget-object v7, v7, v6

    invoke-virtual {v0}, Lcom/wutka/dtd/DTDAttribute;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_71

    .line 2433
    const/4 v4, 0x1

    .line 2437
    :cond_36
    if-nez v4, :cond_6e

    .line 2438
    iget v7, p0, Lcom/bea/xml/stream/MXParser;->attributeCount:I

    add-int/lit8 v7, v7, 0x1

    iput v7, p0, Lcom/bea/xml/stream/MXParser;->attributeCount:I

    .line 2439
    iget v7, p0, Lcom/bea/xml/stream/MXParser;->attributeCount:I

    invoke-virtual {p0, v7}, Lcom/bea/xml/stream/MXParser;->ensureAttributesCapacity(I)V

    .line 2440
    iget-object v7, p0, Lcom/bea/xml/stream/MXParser;->attributePrefix:[Ljava/lang/String;

    iget v8, p0, Lcom/bea/xml/stream/MXParser;->attributeCount:I

    add-int/lit8 v8, v8, -0x1

    const/4 v9, 0x0

    aput-object v9, v7, v8

    .line 2441
    iget-object v7, p0, Lcom/bea/xml/stream/MXParser;->attributeUri:[Ljava/lang/String;

    iget v8, p0, Lcom/bea/xml/stream/MXParser;->attributeCount:I

    add-int/lit8 v8, v8, -0x1

    sget-object v9, Lcom/bea/xml/stream/MXParser;->NO_NAMESPACE:Ljava/lang/String;

    aput-object v9, v7, v8

    .line 2442
    iget-object v7, p0, Lcom/bea/xml/stream/MXParser;->attributeName:[Ljava/lang/String;

    iget v8, p0, Lcom/bea/xml/stream/MXParser;->attributeCount:I

    add-int/lit8 v8, v8, -0x1

    invoke-virtual {v0}, Lcom/wutka/dtd/DTDAttribute;->getName()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    .line 2443
    iget-object v7, p0, Lcom/bea/xml/stream/MXParser;->attributeValue:[Ljava/lang/String;

    iget v8, p0, Lcom/bea/xml/stream/MXParser;->attributeCount:I

    add-int/lit8 v8, v8, -0x1

    invoke-virtual {v0}, Lcom/wutka/dtd/DTDAttribute;->getDefaultValue()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    .line 2426
    .end local v3    # "count":I
    .end local v4    # "found":Z
    .end local v6    # "j":I
    :cond_6e
    add-int/lit8 v5, v5, 0x1

    goto :goto_16

    .line 2431
    .restart local v3    # "count":I
    .restart local v4    # "found":Z
    .restart local v6    # "j":I
    :cond_71
    add-int/lit8 v6, v6, 0x1

    goto :goto_25
.end method

.method protected checkCharValidity(IZ)V
    .registers 7
    .param p1, "ch"    # I
    .param p2, "surrogatesOk"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    const v3, 0x10ffff

    .line 351
    const/16 v0, 0x20

    if-ge p1, v0, :cond_31

    .line 352
    int-to-char v0, p1

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParser;->isS(C)Z

    move-result v0

    if-nez v0, :cond_95

    .line 353
    new-instance v0, Ljavax/xml/stream/XMLStreamException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Illegal white space character (code 0x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 355
    :cond_31
    const v0, 0xd800

    if-lt p1, v0, :cond_95

    .line 356
    const v0, 0xdfff

    if-gt p1, v0, :cond_64

    .line 357
    if-nez p2, :cond_95

    .line 358
    new-instance v0, Ljavax/xml/stream/XMLStreamException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Illegal character (code 0x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "): surrogate characters are not valid XML characters"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v0

    .line 361
    :cond_64
    if-le p1, v3, :cond_95

    .line 362
    new-instance v0, Ljavax/xml/stream/XMLStreamException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Illegal character (code 0x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "), past max. Unicode character 0x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v0

    .line 366
    :cond_95
    return-void
.end method

.method public checkForXMLDecl()Z
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 775
    :try_start_0
    new-instance v0, Ljava/io/BufferedReader;

    iget-object v3, p0, Lcom/bea/xml/stream/MXParser;->reader:Ljava/io/Reader;

    const/4 v4, 0x7

    invoke-direct {v0, v3, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    .line 776
    .local v0, "breader":Ljava/io/BufferedReader;
    iput-object v0, p0, Lcom/bea/xml/stream/MXParser;->reader:Ljava/io/Reader;

    .line 777
    const/4 v3, 0x7

    invoke-virtual {v0, v3}, Ljava/io/BufferedReader;->mark(I)V

    .line 780
    invoke-virtual {v0}, Ljava/io/BufferedReader;->read()I

    move-result v1

    .line 781
    .local v1, "ch":I
    const v3, 0xfeff

    if-ne v1, v3, :cond_1f

    .line 782
    const/4 v3, 0x7

    invoke-virtual {v0, v3}, Ljava/io/BufferedReader;->mark(I)V

    .line 783
    invoke-virtual {v0}, Ljava/io/BufferedReader;->read()I

    move-result v1

    .line 786
    :cond_1f
    const/16 v3, 0x3c

    if-ne v1, v3, :cond_48

    invoke-virtual {v0}, Ljava/io/BufferedReader;->read()I

    move-result v3

    const/16 v4, 0x3f

    if-ne v3, v4, :cond_48

    invoke-virtual {v0}, Ljava/io/BufferedReader;->read()I

    move-result v3

    const/16 v4, 0x78

    if-ne v3, v4, :cond_48

    invoke-virtual {v0}, Ljava/io/BufferedReader;->read()I

    move-result v3

    const/16 v4, 0x6d

    if-ne v3, v4, :cond_48

    invoke-virtual {v0}, Ljava/io/BufferedReader;->read()I

    move-result v3

    const/16 v4, 0x6c

    if-ne v3, v4, :cond_48

    .line 791
    invoke-virtual {v0}, Ljava/io/BufferedReader;->reset()V

    .line 792
    const/4 v3, 0x1

    .line 795
    :goto_47
    return v3

    .line 794
    :cond_48
    invoke-virtual {v0}, Ljava/io/BufferedReader;->reset()V
    :try_end_4b
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_4b} :catch_4d

    .line 795
    const/4 v3, 0x0

    goto :goto_47

    .line 796
    .end local v0    # "breader":Ljava/io/BufferedReader;
    .end local v1    # "ch":I
    :catch_4d
    move-exception v2

    .line 797
    .local v2, "e":Ljava/io/IOException;
    new-instance v3, Ljavax/xml/stream/XMLStreamException;

    invoke-direct {v3, v2}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method public close()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 1355
    return-void
.end method

.method public defineEntityReplacementText(Ljava/lang/String;Ljava/lang/String;)V
    .registers 10
    .param p1, "entityName"    # Ljava/lang/String;
    .param p2, "replacementText"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 866
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->ensureEntityCapacity()V

    .line 869
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 870
    .local v0, "ch":[C
    iget-object v1, p0, Lcom/bea/xml/stream/MXParser;->entityName:[Ljava/lang/String;

    iget v2, p0, Lcom/bea/xml/stream/MXParser;->entityEnd:I

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {p0, v0, v6, v3}, Lcom/bea/xml/stream/MXParser;->newString([CII)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    .line 871
    iget-object v1, p0, Lcom/bea/xml/stream/MXParser;->entityNameBuf:[[C

    iget v2, p0, Lcom/bea/xml/stream/MXParser;->entityEnd:I

    aput-object v0, v1, v2

    .line 873
    iget-object v1, p0, Lcom/bea/xml/stream/MXParser;->entityReplacement:[Ljava/lang/String;

    iget v2, p0, Lcom/bea/xml/stream/MXParser;->entityEnd:I

    aput-object p2, v1, v2

    .line 878
    if-nez p2, :cond_4e

    sget-object v0, Lcom/bea/xml/stream/MXParser;->NO_CHARS:[C

    .line 879
    :goto_26
    iget-object v1, p0, Lcom/bea/xml/stream/MXParser;->entityReplacementBuf:[[C

    iget v2, p0, Lcom/bea/xml/stream/MXParser;->entityEnd:I

    aput-object v0, v1, v2

    .line 880
    iget-boolean v1, p0, Lcom/bea/xml/stream/MXParser;->allStringsInterned:Z

    if-nez v1, :cond_47

    .line 881
    iget-object v1, p0, Lcom/bea/xml/stream/MXParser;->entityNameHash:[I

    iget v2, p0, Lcom/bea/xml/stream/MXParser;->entityEnd:I

    iget-object v3, p0, Lcom/bea/xml/stream/MXParser;->entityNameBuf:[[C

    iget v4, p0, Lcom/bea/xml/stream/MXParser;->entityEnd:I

    aget-object v3, v3, v4

    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->entityNameBuf:[[C

    iget v5, p0, Lcom/bea/xml/stream/MXParser;->entityEnd:I

    aget-object v4, v4, v5

    array-length v4, v4

    invoke-static {v3, v6, v4}, Lcom/bea/xml/stream/MXParser;->fastHash([CII)I

    move-result v3

    aput v3, v1, v2

    .line 884
    :cond_47
    iget v1, p0, Lcom/bea/xml/stream/MXParser;->entityEnd:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/bea/xml/stream/MXParser;->entityEnd:I

    .line 887
    return-void

    .line 878
    :cond_4e
    invoke-virtual {p2}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    goto :goto_26
.end method

.method protected ensureAttributesCapacity(I)V
    .registers 9
    .param p1, "size"    # I

    .prologue
    const/4 v5, 0x0

    .line 385
    iget-object v6, p0, Lcom/bea/xml/stream/MXParser;->attributeName:[Ljava/lang/String;

    if-eqz v6, :cond_4f

    iget-object v6, p0, Lcom/bea/xml/stream/MXParser;->attributeName:[Ljava/lang/String;

    array-length v1, v6

    .line 386
    .local v1, "attrPosSize":I
    :goto_8
    if-lt p1, v1, :cond_4e

    .line 387
    const/4 v6, 0x7

    if-le p1, v6, :cond_51

    mul-int/lit8 v4, p1, 0x2

    .line 391
    .local v4, "newSize":I
    :goto_f
    if-lez v1, :cond_54

    const/4 v3, 0x1

    .line 392
    .local v3, "needsCopying":Z
    :goto_12
    const/4 v0, 0x0

    .line 394
    .local v0, "arr":[Ljava/lang/String;
    new-array v0, v4, [Ljava/lang/String;

    .line 395
    if-eqz v3, :cond_1c

    iget-object v6, p0, Lcom/bea/xml/stream/MXParser;->attributeName:[Ljava/lang/String;

    invoke-static {v6, v5, v0, v5, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 396
    :cond_1c
    iput-object v0, p0, Lcom/bea/xml/stream/MXParser;->attributeName:[Ljava/lang/String;

    .line 398
    new-array v0, v4, [Ljava/lang/String;

    .line 399
    if-eqz v3, :cond_27

    iget-object v6, p0, Lcom/bea/xml/stream/MXParser;->attributePrefix:[Ljava/lang/String;

    invoke-static {v6, v5, v0, v5, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 400
    :cond_27
    iput-object v0, p0, Lcom/bea/xml/stream/MXParser;->attributePrefix:[Ljava/lang/String;

    .line 402
    new-array v0, v4, [Ljava/lang/String;

    .line 403
    if-eqz v3, :cond_32

    iget-object v6, p0, Lcom/bea/xml/stream/MXParser;->attributeUri:[Ljava/lang/String;

    invoke-static {v6, v5, v0, v5, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 404
    :cond_32
    iput-object v0, p0, Lcom/bea/xml/stream/MXParser;->attributeUri:[Ljava/lang/String;

    .line 406
    new-array v0, v4, [Ljava/lang/String;

    .line 407
    if-eqz v3, :cond_3d

    iget-object v6, p0, Lcom/bea/xml/stream/MXParser;->attributeValue:[Ljava/lang/String;

    invoke-static {v6, v5, v0, v5, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 408
    :cond_3d
    iput-object v0, p0, Lcom/bea/xml/stream/MXParser;->attributeValue:[Ljava/lang/String;

    .line 410
    iget-boolean v6, p0, Lcom/bea/xml/stream/MXParser;->allStringsInterned:Z

    if-nez v6, :cond_4e

    .line 411
    new-array v2, v4, [I

    .line 412
    .local v2, "iarr":[I
    if-eqz v3, :cond_4c

    iget-object v6, p0, Lcom/bea/xml/stream/MXParser;->attributeNameHash:[I

    invoke-static {v6, v5, v2, v5, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 413
    :cond_4c
    iput-object v2, p0, Lcom/bea/xml/stream/MXParser;->attributeNameHash:[I

    .line 419
    .end local v0    # "arr":[Ljava/lang/String;
    .end local v2    # "iarr":[I
    .end local v3    # "needsCopying":Z
    .end local v4    # "newSize":I
    :cond_4e
    return-void

    .end local v1    # "attrPosSize":I
    :cond_4f
    move v1, v5

    .line 385
    goto :goto_8

    .line 387
    .restart local v1    # "attrPosSize":I
    :cond_51
    const/16 v4, 0x8

    goto :goto_f

    .restart local v4    # "newSize":I
    :cond_54
    move v3, v5

    .line 391
    goto :goto_12
.end method

.method protected ensureElementsCapacity()V
    .registers 10

    .prologue
    const/4 v6, 0x0

    .line 194
    iget-object v7, p0, Lcom/bea/xml/stream/MXParser;->elName:[Ljava/lang/String;

    if-eqz v7, :cond_60

    iget-object v7, p0, Lcom/bea/xml/stream/MXParser;->elName:[Ljava/lang/String;

    array-length v2, v7

    .line 195
    .local v2, "elStackSize":I
    :goto_8
    iget v7, p0, Lcom/bea/xml/stream/MXParser;->depth:I

    add-int/lit8 v7, v7, 0x1

    if-lt v7, v2, :cond_5f

    .line 197
    iget v7, p0, Lcom/bea/xml/stream/MXParser;->depth:I

    const/4 v8, 0x7

    if-lt v7, v8, :cond_62

    iget v7, p0, Lcom/bea/xml/stream/MXParser;->depth:I

    mul-int/lit8 v7, v7, 0x2

    :goto_17
    add-int/lit8 v5, v7, 0x2

    .line 201
    .local v5, "newSize":I
    if-lez v2, :cond_65

    const/4 v4, 0x1

    .line 202
    .local v4, "needsCopying":Z
    :goto_1c
    const/4 v0, 0x0

    .line 203
    .local v0, "arr":[Ljava/lang/String;
    new-array v0, v5, [Ljava/lang/String;

    .line 204
    if-eqz v4, :cond_26

    iget-object v7, p0, Lcom/bea/xml/stream/MXParser;->elName:[Ljava/lang/String;

    invoke-static {v7, v6, v0, v6, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 205
    :cond_26
    iput-object v0, p0, Lcom/bea/xml/stream/MXParser;->elName:[Ljava/lang/String;

    .line 206
    new-array v0, v5, [Ljava/lang/String;

    .line 207
    if-eqz v4, :cond_31

    iget-object v7, p0, Lcom/bea/xml/stream/MXParser;->elPrefix:[Ljava/lang/String;

    invoke-static {v7, v6, v0, v6, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 208
    :cond_31
    iput-object v0, p0, Lcom/bea/xml/stream/MXParser;->elPrefix:[Ljava/lang/String;

    .line 209
    new-array v0, v5, [Ljava/lang/String;

    .line 210
    if-eqz v4, :cond_3c

    iget-object v7, p0, Lcom/bea/xml/stream/MXParser;->elUri:[Ljava/lang/String;

    invoke-static {v7, v6, v0, v6, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 211
    :cond_3c
    iput-object v0, p0, Lcom/bea/xml/stream/MXParser;->elUri:[Ljava/lang/String;

    .line 213
    new-array v3, v5, [I

    .line 214
    .local v3, "iarr":[I
    if-eqz v4, :cond_67

    .line 215
    iget-object v7, p0, Lcom/bea/xml/stream/MXParser;->elNamespaceCount:[I

    invoke-static {v7, v6, v3, v6, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 220
    :goto_47
    iput-object v3, p0, Lcom/bea/xml/stream/MXParser;->elNamespaceCount:[I

    .line 223
    new-array v3, v5, [I

    .line 224
    if-eqz v4, :cond_52

    .line 225
    iget-object v7, p0, Lcom/bea/xml/stream/MXParser;->elRawNameEnd:[I

    invoke-static {v7, v6, v3, v6, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 227
    :cond_52
    iput-object v3, p0, Lcom/bea/xml/stream/MXParser;->elRawNameEnd:[I

    .line 229
    new-array v1, v5, [[C

    .line 230
    .local v1, "carr":[[C
    if-eqz v4, :cond_5d

    .line 231
    iget-object v7, p0, Lcom/bea/xml/stream/MXParser;->elRawName:[[C

    invoke-static {v7, v6, v1, v6, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 233
    :cond_5d
    iput-object v1, p0, Lcom/bea/xml/stream/MXParser;->elRawName:[[C

    .line 249
    .end local v0    # "arr":[Ljava/lang/String;
    .end local v1    # "carr":[[C
    .end local v3    # "iarr":[I
    .end local v4    # "needsCopying":Z
    .end local v5    # "newSize":I
    :cond_5f
    return-void

    .end local v2    # "elStackSize":I
    :cond_60
    move v2, v6

    .line 194
    goto :goto_8

    .line 197
    .restart local v2    # "elStackSize":I
    :cond_62
    const/16 v7, 0x8

    goto :goto_17

    .restart local v5    # "newSize":I
    :cond_65
    move v4, v6

    .line 201
    goto :goto_1c

    .line 218
    .restart local v0    # "arr":[Ljava/lang/String;
    .restart local v3    # "iarr":[I
    .restart local v4    # "needsCopying":Z
    :cond_67
    aput v6, v3, v6

    goto :goto_47
.end method

.method protected ensureEntityCapacity()V
    .registers 11

    .prologue
    const/4 v7, 0x0

    .line 561
    iget-object v8, p0, Lcom/bea/xml/stream/MXParser;->entityReplacementBuf:[[C

    if-eqz v8, :cond_59

    iget-object v8, p0, Lcom/bea/xml/stream/MXParser;->entityReplacementBuf:[[C

    array-length v0, v8

    .line 562
    .local v0, "entitySize":I
    :goto_8
    iget v8, p0, Lcom/bea/xml/stream/MXParser;->entityEnd:I

    if-lt v8, v0, :cond_58

    .line 563
    iget v8, p0, Lcom/bea/xml/stream/MXParser;->entityEnd:I

    const/4 v9, 0x7

    if-le v8, v9, :cond_5b

    iget v8, p0, Lcom/bea/xml/stream/MXParser;->entityEnd:I

    mul-int/lit8 v6, v8, 0x2

    .line 567
    .local v6, "newSize":I
    :goto_15
    new-array v1, v6, [Ljava/lang/String;

    .line 568
    .local v1, "newEntityName":[Ljava/lang/String;
    new-array v2, v6, [[C

    .line 569
    .local v2, "newEntityNameBuf":[[C
    new-array v4, v6, [Ljava/lang/String;

    .line 570
    .local v4, "newEntityReplacement":[Ljava/lang/String;
    new-array v5, v6, [[C

    .line 571
    .local v5, "newEntityReplacementBuf":[[C
    iget-object v8, p0, Lcom/bea/xml/stream/MXParser;->entityName:[Ljava/lang/String;

    if-eqz v8, :cond_3d

    .line 572
    iget-object v8, p0, Lcom/bea/xml/stream/MXParser;->entityName:[Ljava/lang/String;

    iget v9, p0, Lcom/bea/xml/stream/MXParser;->entityEnd:I

    invoke-static {v8, v7, v1, v7, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 573
    iget-object v8, p0, Lcom/bea/xml/stream/MXParser;->entityNameBuf:[[C

    iget v9, p0, Lcom/bea/xml/stream/MXParser;->entityEnd:I

    invoke-static {v8, v7, v2, v7, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 574
    iget-object v8, p0, Lcom/bea/xml/stream/MXParser;->entityReplacement:[Ljava/lang/String;

    iget v9, p0, Lcom/bea/xml/stream/MXParser;->entityEnd:I

    invoke-static {v8, v7, v4, v7, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 575
    iget-object v8, p0, Lcom/bea/xml/stream/MXParser;->entityReplacementBuf:[[C

    iget v9, p0, Lcom/bea/xml/stream/MXParser;->entityEnd:I

    invoke-static {v8, v7, v5, v7, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 577
    :cond_3d
    iput-object v1, p0, Lcom/bea/xml/stream/MXParser;->entityName:[Ljava/lang/String;

    .line 578
    iput-object v2, p0, Lcom/bea/xml/stream/MXParser;->entityNameBuf:[[C

    .line 579
    iput-object v4, p0, Lcom/bea/xml/stream/MXParser;->entityReplacement:[Ljava/lang/String;

    .line 580
    iput-object v5, p0, Lcom/bea/xml/stream/MXParser;->entityReplacementBuf:[[C

    .line 582
    iget-boolean v8, p0, Lcom/bea/xml/stream/MXParser;->allStringsInterned:Z

    if-nez v8, :cond_58

    .line 583
    new-array v3, v6, [I

    .line 584
    .local v3, "newEntityNameHash":[I
    iget-object v8, p0, Lcom/bea/xml/stream/MXParser;->entityNameHash:[I

    if-eqz v8, :cond_56

    .line 585
    iget-object v8, p0, Lcom/bea/xml/stream/MXParser;->entityNameHash:[I

    iget v9, p0, Lcom/bea/xml/stream/MXParser;->entityEnd:I

    invoke-static {v8, v7, v3, v7, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 587
    :cond_56
    iput-object v3, p0, Lcom/bea/xml/stream/MXParser;->entityNameHash:[I

    .line 590
    .end local v1    # "newEntityName":[Ljava/lang/String;
    .end local v2    # "newEntityNameBuf":[[C
    .end local v3    # "newEntityNameHash":[I
    .end local v4    # "newEntityReplacement":[Ljava/lang/String;
    .end local v5    # "newEntityReplacementBuf":[[C
    .end local v6    # "newSize":I
    :cond_58
    return-void

    .end local v0    # "entitySize":I
    :cond_59
    move v0, v7

    .line 561
    goto :goto_8

    .line 563
    .restart local v0    # "entitySize":I
    :cond_5b
    const/16 v6, 0x8

    goto :goto_15
.end method

.method protected ensureLocalNamespacesCapacity(I)V
    .registers 10
    .param p1, "size"    # I

    .prologue
    const/4 v5, 0x0

    .line 474
    iget-object v6, p0, Lcom/bea/xml/stream/MXParser;->localNamespacePrefix:[Ljava/lang/String;

    if-eqz v6, :cond_3d

    iget-object v6, p0, Lcom/bea/xml/stream/MXParser;->localNamespacePrefix:[Ljava/lang/String;

    array-length v0, v6

    .line 475
    .local v0, "localNamespaceSize":I
    :goto_8
    if-lt p1, v0, :cond_3c

    .line 476
    const/4 v6, 0x7

    if-le p1, v6, :cond_3f

    mul-int/lit8 v4, p1, 0x2

    .line 480
    .local v4, "newSize":I
    :goto_f
    new-array v1, v4, [Ljava/lang/String;

    .line 481
    .local v1, "newLocalNamespacePrefix":[Ljava/lang/String;
    new-array v3, v4, [Ljava/lang/String;

    .line 482
    .local v3, "newLocalNamespaceUri":[Ljava/lang/String;
    iget-object v6, p0, Lcom/bea/xml/stream/MXParser;->localNamespacePrefix:[Ljava/lang/String;

    if-eqz v6, :cond_25

    .line 483
    iget-object v6, p0, Lcom/bea/xml/stream/MXParser;->localNamespacePrefix:[Ljava/lang/String;

    iget v7, p0, Lcom/bea/xml/stream/MXParser;->localNamespaceEnd:I

    invoke-static {v6, v5, v1, v5, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 485
    iget-object v6, p0, Lcom/bea/xml/stream/MXParser;->localNamespaceUri:[Ljava/lang/String;

    iget v7, p0, Lcom/bea/xml/stream/MXParser;->localNamespaceEnd:I

    invoke-static {v6, v5, v3, v5, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 488
    :cond_25
    iput-object v1, p0, Lcom/bea/xml/stream/MXParser;->localNamespacePrefix:[Ljava/lang/String;

    .line 489
    iput-object v3, p0, Lcom/bea/xml/stream/MXParser;->localNamespaceUri:[Ljava/lang/String;

    .line 492
    iget-boolean v6, p0, Lcom/bea/xml/stream/MXParser;->allStringsInterned:Z

    if-nez v6, :cond_3c

    .line 493
    new-array v2, v4, [I

    .line 494
    .local v2, "newLocalNamespacePrefixHash":[I
    iget-object v6, p0, Lcom/bea/xml/stream/MXParser;->localNamespacePrefixHash:[I

    if-eqz v6, :cond_3a

    .line 495
    iget-object v6, p0, Lcom/bea/xml/stream/MXParser;->localNamespacePrefixHash:[I

    iget v7, p0, Lcom/bea/xml/stream/MXParser;->localNamespaceEnd:I

    invoke-static {v6, v5, v2, v5, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 498
    :cond_3a
    iput-object v2, p0, Lcom/bea/xml/stream/MXParser;->localNamespacePrefixHash:[I

    .line 503
    .end local v1    # "newLocalNamespacePrefix":[Ljava/lang/String;
    .end local v2    # "newLocalNamespacePrefixHash":[I
    .end local v3    # "newLocalNamespaceUri":[Ljava/lang/String;
    .end local v4    # "newSize":I
    :cond_3c
    return-void

    .end local v0    # "localNamespaceSize":I
    :cond_3d
    move v0, v5

    .line 474
    goto :goto_8

    .line 476
    .restart local v0    # "localNamespaceSize":I
    :cond_3f
    const/16 v4, 0x8

    goto :goto_f
.end method

.method protected ensureNamespacesCapacity(I)V
    .registers 10
    .param p1, "size"    # I

    .prologue
    const/4 v5, 0x0

    .line 436
    iget-object v6, p0, Lcom/bea/xml/stream/MXParser;->namespacePrefix:[Ljava/lang/String;

    if-eqz v6, :cond_3d

    iget-object v6, p0, Lcom/bea/xml/stream/MXParser;->namespacePrefix:[Ljava/lang/String;

    array-length v0, v6

    .line 437
    .local v0, "namespaceSize":I
    :goto_8
    if-lt p1, v0, :cond_3c

    .line 438
    const/4 v6, 0x7

    if-le p1, v6, :cond_3f

    mul-int/lit8 v4, p1, 0x2

    .line 442
    .local v4, "newSize":I
    :goto_f
    new-array v1, v4, [Ljava/lang/String;

    .line 443
    .local v1, "newNamespacePrefix":[Ljava/lang/String;
    new-array v3, v4, [Ljava/lang/String;

    .line 444
    .local v3, "newNamespaceUri":[Ljava/lang/String;
    iget-object v6, p0, Lcom/bea/xml/stream/MXParser;->namespacePrefix:[Ljava/lang/String;

    if-eqz v6, :cond_25

    .line 445
    iget-object v6, p0, Lcom/bea/xml/stream/MXParser;->namespacePrefix:[Ljava/lang/String;

    iget v7, p0, Lcom/bea/xml/stream/MXParser;->namespaceEnd:I

    invoke-static {v6, v5, v1, v5, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 447
    iget-object v6, p0, Lcom/bea/xml/stream/MXParser;->namespaceUri:[Ljava/lang/String;

    iget v7, p0, Lcom/bea/xml/stream/MXParser;->namespaceEnd:I

    invoke-static {v6, v5, v3, v5, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 450
    :cond_25
    iput-object v1, p0, Lcom/bea/xml/stream/MXParser;->namespacePrefix:[Ljava/lang/String;

    .line 451
    iput-object v3, p0, Lcom/bea/xml/stream/MXParser;->namespaceUri:[Ljava/lang/String;

    .line 454
    iget-boolean v6, p0, Lcom/bea/xml/stream/MXParser;->allStringsInterned:Z

    if-nez v6, :cond_3c

    .line 455
    new-array v2, v4, [I

    .line 456
    .local v2, "newNamespacePrefixHash":[I
    iget-object v6, p0, Lcom/bea/xml/stream/MXParser;->namespacePrefixHash:[I

    if-eqz v6, :cond_3a

    .line 457
    iget-object v6, p0, Lcom/bea/xml/stream/MXParser;->namespacePrefixHash:[I

    iget v7, p0, Lcom/bea/xml/stream/MXParser;->namespaceEnd:I

    invoke-static {v6, v5, v2, v5, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 460
    :cond_3a
    iput-object v2, p0, Lcom/bea/xml/stream/MXParser;->namespacePrefixHash:[I

    .line 465
    .end local v1    # "newNamespacePrefix":[Ljava/lang/String;
    .end local v2    # "newNamespacePrefixHash":[I
    .end local v3    # "newNamespaceUri":[Ljava/lang/String;
    .end local v4    # "newSize":I
    :cond_3c
    return-void

    .end local v0    # "namespaceSize":I
    :cond_3d
    move v0, v5

    .line 436
    goto :goto_8

    .line 438
    .restart local v0    # "namespaceSize":I
    :cond_3f
    const/16 v4, 0x8

    goto :goto_f
.end method

.method protected ensurePC(I)V
    .registers 7
    .param p1, "end"    # I

    .prologue
    const/4 v4, 0x0

    .line 3754
    const/16 v2, 0x2000

    if-le p1, v2, :cond_13

    mul-int/lit8 v1, p1, 0x2

    .line 3755
    .local v1, "newSize":I
    :goto_7
    new-array v0, v1, [C

    .line 3757
    .local v0, "newPC":[C
    iget-object v2, p0, Lcom/bea/xml/stream/MXParser;->pc:[C

    iget v3, p0, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    invoke-static {v2, v4, v0, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 3758
    iput-object v0, p0, Lcom/bea/xml/stream/MXParser;->pc:[C

    .line 3760
    return-void

    .line 3754
    .end local v0    # "newPC":[C
    .end local v1    # "newSize":I
    :cond_13
    const/16 v1, 0x4000

    goto :goto_7
.end method

.method protected fillBuf()V
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;,
            Ljava/io/EOFException;
        }
    .end annotation

    .prologue
    const/16 v3, 0x2000

    const/4 v8, 0x0

    .line 3645
    iget-object v9, p0, Lcom/bea/xml/stream/MXParser;->reader:Ljava/io/Reader;

    if-nez v9, :cond_f

    new-instance v8, Ljavax/xml/stream/XMLStreamException;

    const-string v9, "reader must be set before parsing is started"

    invoke-direct {v8, v9}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 3649
    :cond_f
    iget v9, p0, Lcom/bea/xml/stream/MXParser;->bufEnd:I

    iget v10, p0, Lcom/bea/xml/stream/MXParser;->bufSoftLimit:I

    if-le v9, v10, :cond_5e

    .line 3652
    iget v9, p0, Lcom/bea/xml/stream/MXParser;->bufStart:I

    iget v10, p0, Lcom/bea/xml/stream/MXParser;->bufSoftLimit:I

    if-le v9, v10, :cond_79

    const/4 v0, 0x1

    .line 3653
    .local v0, "compact":Z
    :goto_1c
    const/4 v1, 0x0

    .line 3654
    .local v1, "expand":Z
    if-nez v0, :cond_29

    .line 3656
    iget v9, p0, Lcom/bea/xml/stream/MXParser;->bufStart:I

    iget-object v10, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    array-length v10, v10

    div-int/lit8 v10, v10, 0x2

    if-ge v9, v10, :cond_7b

    .line 3658
    const/4 v1, 0x1

    .line 3666
    :cond_29
    :goto_29
    if-eqz v0, :cond_7d

    .line 3669
    iget-object v9, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    iget v10, p0, Lcom/bea/xml/stream/MXParser;->bufStart:I

    iget-object v11, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    iget v12, p0, Lcom/bea/xml/stream/MXParser;->bufEnd:I

    iget v13, p0, Lcom/bea/xml/stream/MXParser;->bufStart:I

    sub-int/2addr v12, v13

    invoke-static {v9, v10, v11, v8, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 3685
    :cond_39
    :goto_39
    iget v9, p0, Lcom/bea/xml/stream/MXParser;->bufEnd:I

    iget v10, p0, Lcom/bea/xml/stream/MXParser;->bufStart:I

    sub-int/2addr v9, v10

    iput v9, p0, Lcom/bea/xml/stream/MXParser;->bufEnd:I

    .line 3686
    iget v9, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    iget v10, p0, Lcom/bea/xml/stream/MXParser;->bufStart:I

    sub-int/2addr v9, v10

    iput v9, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    .line 3687
    iget v9, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    iget v10, p0, Lcom/bea/xml/stream/MXParser;->bufStart:I

    sub-int/2addr v9, v10

    iput v9, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    .line 3688
    iget v9, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    iget v10, p0, Lcom/bea/xml/stream/MXParser;->bufStart:I

    sub-int/2addr v9, v10

    iput v9, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    .line 3689
    iget v9, p0, Lcom/bea/xml/stream/MXParser;->bufAbsoluteStart:I

    iget v10, p0, Lcom/bea/xml/stream/MXParser;->bufStart:I

    add-int/2addr v9, v10

    iput v9, p0, Lcom/bea/xml/stream/MXParser;->bufAbsoluteStart:I

    .line 3690
    iput v8, p0, Lcom/bea/xml/stream/MXParser;->bufStart:I

    .line 3693
    .end local v0    # "compact":Z
    .end local v1    # "expand":Z
    :cond_5e
    iget-object v8, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    array-length v8, v8

    iget v9, p0, Lcom/bea/xml/stream/MXParser;->bufEnd:I

    sub-int v7, v8, v9

    .line 3694
    .local v7, "room":I
    if-le v7, v3, :cond_ab

    .line 3698
    .local v3, "len":I
    :goto_67
    :try_start_67
    iget-object v8, p0, Lcom/bea/xml/stream/MXParser;->reader:Ljava/io/Reader;

    iget-object v9, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    iget v10, p0, Lcom/bea/xml/stream/MXParser;->bufEnd:I

    invoke-virtual {v8, v9, v10, v3}, Ljava/io/Reader;->read([CII)I
    :try_end_70
    .catch Ljava/io/IOException; {:try_start_67 .. :try_end_70} :catch_ad

    move-result v6

    .line 3702
    .local v6, "ret":I
    if-lez v6, :cond_b4

    .line 3703
    iget v8, p0, Lcom/bea/xml/stream/MXParser;->bufEnd:I

    add-int/2addr v8, v6

    iput v8, p0, Lcom/bea/xml/stream/MXParser;->bufEnd:I

    .line 3704
    return-void

    .end local v3    # "len":I
    .end local v6    # "ret":I
    .end local v7    # "room":I
    :cond_79
    move v0, v8

    .line 3652
    goto :goto_1c

    .line 3661
    .restart local v0    # "compact":Z
    .restart local v1    # "expand":Z
    :cond_7b
    const/4 v0, 0x1

    goto :goto_29

    .line 3672
    :cond_7d
    if-eqz v1, :cond_a3

    .line 3673
    iget-object v9, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    array-length v9, v9

    mul-int/lit8 v5, v9, 0x2

    .line 3674
    .local v5, "newSize":I
    new-array v4, v5, [C

    .line 3676
    .local v4, "newBuf":[C
    iget-object v9, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    iget v10, p0, Lcom/bea/xml/stream/MXParser;->bufStart:I

    iget v11, p0, Lcom/bea/xml/stream/MXParser;->bufEnd:I

    iget v12, p0, Lcom/bea/xml/stream/MXParser;->bufStart:I

    sub-int/2addr v11, v12

    invoke-static {v9, v10, v4, v8, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 3677
    iput-object v4, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    .line 3678
    iget v9, p0, Lcom/bea/xml/stream/MXParser;->bufLoadFactor:I

    if-lez v9, :cond_39

    .line 3679
    iget v9, p0, Lcom/bea/xml/stream/MXParser;->bufLoadFactor:I

    iget-object v10, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    array-length v10, v10

    mul-int/2addr v9, v10

    div-int/lit8 v9, v9, 0x64

    iput v9, p0, Lcom/bea/xml/stream/MXParser;->bufSoftLimit:I

    goto :goto_39

    .line 3683
    .end local v4    # "newBuf":[C
    .end local v5    # "newSize":I
    :cond_a3
    new-instance v8, Ljavax/xml/stream/XMLStreamException;

    const-string v9, "internal error in fillBuffer()"

    invoke-direct {v8, v9}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;)V

    throw v8

    .end local v0    # "compact":Z
    .end local v1    # "expand":Z
    .restart local v7    # "room":I
    :cond_ab
    move v3, v7

    .line 3694
    goto :goto_67

    .line 3699
    .restart local v3    # "len":I
    :catch_ad
    move-exception v2

    .line 3700
    .local v2, "ioe":Ljava/io/IOException;
    new-instance v8, Ljavax/xml/stream/XMLStreamException;

    invoke-direct {v8, v2}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/Throwable;)V

    throw v8

    .line 3706
    .end local v2    # "ioe":Ljava/io/IOException;
    .restart local v6    # "ret":I
    :cond_b4
    const/4 v8, -0x1

    if-ne v6, v8, :cond_bf

    .line 3707
    new-instance v8, Ljava/io/EOFException;

    const-string v9, "no more data available"

    invoke-direct {v8, v9}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 3709
    :cond_bf
    new-instance v8, Ljavax/xml/stream/XMLStreamException;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string v10, "error reading input, returned "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;)V

    throw v8
.end method

.method public getAttributeCount()I
    .registers 3

    .prologue
    const/4 v1, 0x1

    .line 1108
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    if-eq v0, v1, :cond_8

    .line 1110
    invoke-direct {p0, v1}, Lcom/bea/xml/stream/MXParser;->throwIllegalState(I)Ljava/lang/String;

    .line 1112
    :cond_8
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->attributeCount:I

    return v0
.end method

.method public getAttributeLocalName(I)Ljava/lang/String;
    .registers 5
    .param p1, "index"    # I

    .prologue
    const/4 v1, 0x1

    .line 1128
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    if-eq v0, v1, :cond_8

    .line 1129
    invoke-direct {p0, v1}, Lcom/bea/xml/stream/MXParser;->throwIllegalState(I)Ljava/lang/String;

    .line 1131
    :cond_8
    if-ltz p1, :cond_e

    iget v0, p0, Lcom/bea/xml/stream/MXParser;->attributeCount:I

    if-lt p1, v0, :cond_35

    :cond_e
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "attribute position must be 0.."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Lcom/bea/xml/stream/MXParser;->attributeCount:I

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " and not "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1133
    :cond_35
    iget-object v0, p0, Lcom/bea/xml/stream/MXParser;->attributeName:[Ljava/lang/String;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getAttributeName(I)Ljavax/xml/namespace/QName;
    .registers 6
    .param p1, "index"    # I

    .prologue
    const/4 v1, 0x1

    .line 1647
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    if-eq v0, v1, :cond_8

    .line 1648
    invoke-direct {p0, v1}, Lcom/bea/xml/stream/MXParser;->throwIllegalState(I)Ljava/lang/String;

    .line 1650
    :cond_8
    new-instance v0, Ljavax/xml/namespace/QName;

    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/MXParser;->getAttributeNamespace(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/bea/xml/stream/MXParser;->checkNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/MXParser;->getAttributeLocalName(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/MXParser;->getAttributePrefix(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/bea/xml/stream/MXParser;->checkNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Ljavax/xml/namespace/QName;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public getAttributeNamespace(I)Ljava/lang/String;
    .registers 5
    .param p1, "index"    # I

    .prologue
    const/4 v1, 0x1

    .line 1117
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    if-eq v0, v1, :cond_8

    .line 1118
    invoke-direct {p0, v1}, Lcom/bea/xml/stream/MXParser;->throwIllegalState(I)Ljava/lang/String;

    .line 1120
    :cond_8
    iget-boolean v0, p0, Lcom/bea/xml/stream/MXParser;->processNamespaces:Z

    if-nez v0, :cond_f

    sget-object v0, Lcom/bea/xml/stream/MXParser;->NO_NAMESPACE:Ljava/lang/String;

    .line 1123
    :goto_e
    return-object v0

    .line 1121
    :cond_f
    if-ltz p1, :cond_15

    iget v0, p0, Lcom/bea/xml/stream/MXParser;->attributeCount:I

    if-lt p1, v0, :cond_3c

    :cond_15
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "attribute position must be 0.."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Lcom/bea/xml/stream/MXParser;->attributeCount:I

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " and not "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1123
    :cond_3c
    iget-object v0, p0, Lcom/bea/xml/stream/MXParser;->attributeUri:[Ljava/lang/String;

    aget-object v0, v0, p1

    goto :goto_e
.end method

.method public getAttributePrefix(I)Ljava/lang/String;
    .registers 5
    .param p1, "index"    # I

    .prologue
    const/4 v1, 0x1

    .line 1138
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    if-eq v0, v1, :cond_8

    .line 1139
    invoke-direct {p0, v1}, Lcom/bea/xml/stream/MXParser;->throwIllegalState(I)Ljava/lang/String;

    .line 1141
    :cond_8
    iget-boolean v0, p0, Lcom/bea/xml/stream/MXParser;->processNamespaces:Z

    if-nez v0, :cond_e

    const/4 v0, 0x0

    .line 1144
    :goto_d
    return-object v0

    .line 1142
    :cond_e
    if-ltz p1, :cond_14

    iget v0, p0, Lcom/bea/xml/stream/MXParser;->attributeCount:I

    if-lt p1, v0, :cond_3b

    :cond_14
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "attribute position must be 0.."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Lcom/bea/xml/stream/MXParser;->attributeCount:I

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " and not "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1144
    :cond_3b
    iget-object v0, p0, Lcom/bea/xml/stream/MXParser;->attributePrefix:[Ljava/lang/String;

    aget-object v0, v0, p1

    goto :goto_d
.end method

.method public getAttributeType(I)Ljava/lang/String;
    .registers 5
    .param p1, "index"    # I

    .prologue
    const/4 v1, 0x1

    .line 1148
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    if-eq v0, v1, :cond_8

    .line 1149
    invoke-direct {p0, v1}, Lcom/bea/xml/stream/MXParser;->throwIllegalState(I)Ljava/lang/String;

    .line 1151
    :cond_8
    if-ltz p1, :cond_e

    iget v0, p0, Lcom/bea/xml/stream/MXParser;->attributeCount:I

    if-lt p1, v0, :cond_35

    :cond_e
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "attribute position must be 0.."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Lcom/bea/xml/stream/MXParser;->attributeCount:I

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " and not "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1153
    :cond_35
    const-string v0, "CDATA"

    return-object v0
.end method

.method public getAttributeValue(I)Ljava/lang/String;
    .registers 5
    .param p1, "index"    # I

    .prologue
    const/4 v1, 0x1

    .line 1167
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    if-eq v0, v1, :cond_8

    .line 1168
    invoke-direct {p0, v1}, Lcom/bea/xml/stream/MXParser;->throwIllegalState(I)Ljava/lang/String;

    .line 1170
    :cond_8
    if-ltz p1, :cond_e

    iget v0, p0, Lcom/bea/xml/stream/MXParser;->attributeCount:I

    if-lt p1, v0, :cond_35

    :cond_e
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "attribute position must be 0.."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Lcom/bea/xml/stream/MXParser;->attributeCount:I

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " and not "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1172
    :cond_35
    iget-object v0, p0, Lcom/bea/xml/stream/MXParser;->attributeValue:[Ljava/lang/String;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "namespace"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    .line 1178
    iget v1, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    if-eq v1, v2, :cond_8

    .line 1179
    invoke-direct {p0, v2}, Lcom/bea/xml/stream/MXParser;->throwIllegalState(I)Ljava/lang/String;

    .line 1181
    :cond_8
    if-nez p2, :cond_12

    .line 1182
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "attribute name can not be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1185
    :cond_12
    if-eqz p1, :cond_35

    .line 1186
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_15
    iget v1, p0, Lcom/bea/xml/stream/MXParser;->attributeCount:I

    if-ge v0, v1, :cond_4c

    .line 1190
    iget-object v1, p0, Lcom/bea/xml/stream/MXParser;->attributeName:[Ljava/lang/String;

    aget-object v1, v1, v0

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_32

    iget-object v1, p0, Lcom/bea/xml/stream/MXParser;->attributeUri:[Ljava/lang/String;

    aget-object v1, v1, v0

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_32

    .line 1193
    iget-object v1, p0, Lcom/bea/xml/stream/MXParser;->attributeValue:[Ljava/lang/String;

    aget-object v1, v1, v0

    .line 1203
    :goto_31
    return-object v1

    .line 1186
    :cond_32
    add-int/lit8 v0, v0, 0x1

    goto :goto_15

    .line 1197
    .end local v0    # "i":I
    :cond_35
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_36
    iget v1, p0, Lcom/bea/xml/stream/MXParser;->attributeCount:I

    if-ge v0, v1, :cond_4c

    .line 1198
    iget-object v1, p0, Lcom/bea/xml/stream/MXParser;->attributeName:[Ljava/lang/String;

    aget-object v1, v1, v0

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_49

    .line 1199
    iget-object v1, p0, Lcom/bea/xml/stream/MXParser;->attributeValue:[Ljava/lang/String;

    aget-object v1, v1, v0

    goto :goto_31

    .line 1197
    :cond_49
    add-int/lit8 v0, v0, 0x1

    goto :goto_36

    .line 1203
    :cond_4c
    const/4 v1, 0x0

    goto :goto_31
.end method

.method public getAttributes()Ljava/util/Iterator;
    .registers 10

    .prologue
    .line 1454
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->hasAttributes()Z

    move-result v0

    if-nez v0, :cond_9

    sget-object v0, Lcom/bea/xml/stream/util/EmptyIterator;->emptyIterator:Lcom/bea/xml/stream/util/EmptyIterator;

    .line 1464
    :goto_8
    return-object v0

    .line 1455
    :cond_9
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getAttributeCount()I

    move-result v6

    .line 1456
    .local v6, "attributeCount":I
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 1457
    .local v7, "atts":Ljava/util/ArrayList;
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_13
    if-ge v8, v6, :cond_34

    .line 1458
    new-instance v0, Lcom/bea/xml/stream/AttributeBase;

    invoke-virtual {p0, v8}, Lcom/bea/xml/stream/MXParser;->getAttributePrefix(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v8}, Lcom/bea/xml/stream/MXParser;->getAttributeNamespace(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v8}, Lcom/bea/xml/stream/MXParser;->getAttributeLocalName(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v8}, Lcom/bea/xml/stream/MXParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v8}, Lcom/bea/xml/stream/MXParser;->getAttributeType(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct/range {v0 .. v5}, Lcom/bea/xml/stream/AttributeBase;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1457
    add-int/lit8 v8, v8, 0x1

    goto :goto_13

    .line 1464
    :cond_34
    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    goto :goto_8
.end method

.method public getCharacterEncodingScheme()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1691
    iget-object v0, p0, Lcom/bea/xml/stream/MXParser;->charEncodingScheme:Ljava/lang/String;

    return-object v0
.end method

.method public getCharacterOffset()I
    .registers 2

    .prologue
    .line 1629
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    return v0
.end method

.method public getColumnNumber()I
    .registers 2

    .prologue
    .line 1026
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->columnNumber:I

    return v0
.end method

.method public getConfigurationContext()Lcom/bea/xml/stream/ConfigurationContextBase;
    .registers 2

    .prologue
    .line 3790
    iget-object v0, p0, Lcom/bea/xml/stream/MXParser;->configurationContext:Lcom/bea/xml/stream/ConfigurationContextBase;

    return-object v0
.end method

.method public getDepth()I
    .registers 2

    .prologue
    .line 972
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->depth:I

    return v0
.end method

.method public getElementText()Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 1314
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 1315
    .local v0, "buf":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getEventType()I

    move-result v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_14

    .line 1316
    new-instance v1, Ljavax/xml/stream/XMLStreamException;

    const-string v2, "Precondition for readText is getEventType() == START_ELEMENT"

    invoke-direct {v1, v2}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1319
    :cond_14
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->next()I

    move-result v1

    const/16 v2, 0x8

    if-ne v1, v2, :cond_24

    .line 1320
    new-instance v1, Ljavax/xml/stream/XMLStreamException;

    const-string v2, "Unexpected end of Document"

    invoke-direct {v1, v2}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1321
    :cond_24
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->isStartElement()Z

    move-result v1

    if-eqz v1, :cond_32

    .line 1322
    new-instance v1, Ljavax/xml/stream/XMLStreamException;

    const-string v2, "Unexpected Element start"

    invoke-direct {v1, v2}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1323
    :cond_32
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->isCharacters()Z

    move-result v1

    if-nez v1, :cond_40

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getEventType()I

    move-result v1

    const/16 v2, 0x9

    if-ne v1, v2, :cond_47

    .line 1324
    :cond_40
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1325
    :cond_47
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->isEndElement()Z

    move-result v1

    if-eqz v1, :cond_14

    .line 1326
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getEncoding()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1624
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getInputEncoding()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getEventType()I
    .registers 2

    .prologue
    .line 1207
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    return v0
.end method

.method public getFeature(Ljava/lang/String;)Z
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 746
    if-nez p1, :cond_b

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "feature name should not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 747
    :cond_b
    const-string v1, "http://xmlpull.org/v1/doc/features.html#process-namespaces"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_16

    .line 748
    iget-boolean v0, p0, Lcom/bea/xml/stream/MXParser;->processNamespaces:Z

    .line 760
    :cond_15
    :goto_15
    return v0

    .line 751
    :cond_16
    const-string v1, "http://xmlpull.org/v1/doc/features.html#names-interned"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_15

    .line 753
    const-string v1, "http://xmlpull.org/v1/doc/features.html#process-docdecl"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_15

    .line 757
    const-string v1, "http://xmlpull.org/v1/doc/features.html#xml-roundtrip"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_15

    .line 758
    const/4 v0, 0x1

    goto :goto_15
.end method

.method public getInputEncoding()Ljava/lang/String;
    .registers 2

    .prologue
    .line 856
    iget-object v0, p0, Lcom/bea/xml/stream/MXParser;->inputEncoding:Ljava/lang/String;

    return-object v0
.end method

.method public getLineNumber()I
    .registers 2

    .prologue
    .line 1021
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->lineNumber:I

    return v0
.end method

.method public getLocalName()Ljava/lang/String;
    .registers 5

    .prologue
    .line 1071
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_c

    .line 1073
    iget-object v0, p0, Lcom/bea/xml/stream/MXParser;->elName:[Ljava/lang/String;

    iget v1, p0, Lcom/bea/xml/stream/MXParser;->depth:I

    aget-object v0, v0, v1

    .line 1085
    :goto_b
    return-object v0

    .line 1074
    :cond_c
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_18

    .line 1075
    iget-object v0, p0, Lcom/bea/xml/stream/MXParser;->elName:[Ljava/lang/String;

    iget v1, p0, Lcom/bea/xml/stream/MXParser;->depth:I

    aget-object v0, v0, v1

    goto :goto_b

    .line 1076
    :cond_18
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    const/16 v1, 0x9

    if-ne v0, v1, :cond_34

    .line 1077
    iget-object v0, p0, Lcom/bea/xml/stream/MXParser;->entityRefName:Ljava/lang/String;

    if-nez v0, :cond_31

    .line 1078
    iget-object v0, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    iget v1, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    iget v2, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    iget v3, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    sub-int/2addr v2, v3

    invoke-virtual {p0, v0, v1, v2}, Lcom/bea/xml/stream/MXParser;->newString([CII)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/bea/xml/stream/MXParser;->entityRefName:Ljava/lang/String;

    .line 1080
    :cond_31
    iget-object v0, p0, Lcom/bea/xml/stream/MXParser;->entityRefName:Ljava/lang/String;

    goto :goto_b

    .line 1085
    :cond_34
    const/4 v0, 0x3

    new-array v0, v0, [I

    fill-array-data v0, :array_40

    invoke-direct {p0, v0}, Lcom/bea/xml/stream/MXParser;->throwIllegalState([I)Ljava/lang/String;

    move-result-object v0

    goto :goto_b

    nop

    :array_40
    .array-data 4
        0x1
        0x2
        0x9
    .end array-data
.end method

.method public getLocalNamespaceCount()I
    .registers 4

    .prologue
    .line 506
    iget-object v1, p0, Lcom/bea/xml/stream/MXParser;->elNamespaceCount:[I

    iget v2, p0, Lcom/bea/xml/stream/MXParser;->depth:I

    add-int/lit8 v2, v2, -0x1

    aget v0, v1, v2

    .line 507
    .local v0, "startNs":I
    iget v1, p0, Lcom/bea/xml/stream/MXParser;->namespaceEnd:I

    sub-int/2addr v1, v0

    return v1
.end method

.method public getLocation()Ljavax/xml/stream/Location;
    .registers 1

    .prologue
    .line 3775
    return-object p0
.end method

.method public getLocationURI()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1029
    const/4 v0, 0x0

    return-object v0
.end method

.method public getName()Ljavax/xml/namespace/QName;
    .registers 5

    .prologue
    .line 1661
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    invoke-static {v0}, Lcom/bea/xml/stream/MXParser;->isElementEvent(I)Z

    move-result v0

    if-nez v0, :cond_10

    .line 1662
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Current state not START_ELEMENT or END_ELEMENT"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1664
    :cond_10
    new-instance v0, Ljavax/xml/namespace/QName;

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getNamespaceURI()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/bea/xml/stream/MXParser;->checkNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocalName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getPrefix()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/bea/xml/stream/MXParser;->checkNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Ljavax/xml/namespace/QName;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public getNamespaceContext()Ljavax/xml/namespace/NamespaceContext;
    .registers 5

    .prologue
    .line 3026
    new-instance v0, Lcom/bea/xml/stream/ReadOnlyNamespaceContextBase;

    iget-object v1, p0, Lcom/bea/xml/stream/MXParser;->namespacePrefix:[Ljava/lang/String;

    iget-object v2, p0, Lcom/bea/xml/stream/MXParser;->namespaceUri:[Ljava/lang/String;

    iget v3, p0, Lcom/bea/xml/stream/MXParser;->namespaceEnd:I

    invoke-direct {v0, v1, v2, v3}, Lcom/bea/xml/stream/ReadOnlyNamespaceContextBase;-><init>([Ljava/lang/String;[Ljava/lang/String;I)V

    return-object v0
.end method

.method public getNamespaceCount()I
    .registers 2

    .prologue
    .line 892
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    invoke-static {v0}, Lcom/bea/xml/stream/MXParser;->isElementEvent(I)Z

    move-result v0

    if-nez v0, :cond_11

    .line 893
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_18

    invoke-direct {p0, v0}, Lcom/bea/xml/stream/MXParser;->throwIllegalState([I)Ljava/lang/String;

    .line 895
    :cond_11
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->depth:I

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParser;->getNamespaceCount(I)I

    move-result v0

    return v0

    .line 893
    :array_18
    .array-data 4
        0x1
        0x2
    .end array-data
.end method

.method public getNamespaceCount(I)I
    .registers 5
    .param p1, "depth"    # I

    .prologue
    .line 900
    iget-boolean v0, p0, Lcom/bea/xml/stream/MXParser;->processNamespaces:Z

    if-eqz v0, :cond_6

    if-nez p1, :cond_8

    .line 901
    :cond_6
    const/4 v0, 0x0

    .line 906
    :goto_7
    return v0

    .line 905
    :cond_8
    if-gez p1, :cond_2f

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "namespace count may be 0.."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Lcom/bea/xml/stream/MXParser;->depth:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " not "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 906
    :cond_2f
    iget-object v0, p0, Lcom/bea/xml/stream/MXParser;->elNamespaceCount:[I

    aget v0, v0, p1

    iget-object v1, p0, Lcom/bea/xml/stream/MXParser;->elNamespaceCount:[I

    add-int/lit8 v2, p1, -0x1

    aget v1, v1, v2

    sub-int/2addr v0, v1

    goto :goto_7
.end method

.method public getNamespacePrefix(I)Ljava/lang/String;
    .registers 8
    .param p1, "pos"    # I

    .prologue
    .line 911
    iget v3, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    invoke-static {v3}, Lcom/bea/xml/stream/MXParser;->isElementEvent(I)Z

    move-result v3

    if-nez v3, :cond_11

    .line 912
    const/4 v3, 0x2

    new-array v3, v3, [I

    fill-array-data v3, :array_4a

    invoke-direct {p0, v3}, Lcom/bea/xml/stream/MXParser;->throwIllegalState([I)Ljava/lang/String;

    .line 914
    :cond_11
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->depth:I

    .line 915
    .local v0, "currentDepth":I
    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParser;->getNamespaceCount(I)I

    move-result v1

    .line 916
    .local v1, "end":I
    iget-object v3, p0, Lcom/bea/xml/stream/MXParser;->elNamespaceCount:[I

    add-int/lit8 v4, v0, -0x1

    aget v3, v3, v4

    add-int v2, p1, v3

    .line 917
    .local v2, "newpos":I
    if-ge p1, v1, :cond_26

    .line 918
    iget-object v3, p0, Lcom/bea/xml/stream/MXParser;->namespacePrefix:[Ljava/lang/String;

    aget-object v3, v3, v2

    return-object v3

    .line 920
    :cond_26
    new-instance v3, Ljava/lang/ArrayIndexOutOfBoundsException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "position "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, " exceeded number of available namespaces "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 912
    nop

    :array_4a
    .array-data 4
        0x1
        0x2
    .end array-data
.end method

.method public getNamespaceURI()Ljava/lang/String;
    .registers 4

    .prologue
    const/4 v2, 0x2

    .line 1062
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_a

    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    if-ne v0, v2, :cond_18

    .line 1064
    :cond_a
    iget-boolean v0, p0, Lcom/bea/xml/stream/MXParser;->processNamespaces:Z

    if-eqz v0, :cond_15

    iget-object v0, p0, Lcom/bea/xml/stream/MXParser;->elUri:[Ljava/lang/String;

    iget v1, p0, Lcom/bea/xml/stream/MXParser;->depth:I

    aget-object v0, v0, v1

    .line 1066
    :goto_14
    return-object v0

    .line 1064
    :cond_15
    sget-object v0, Lcom/bea/xml/stream/MXParser;->NO_NAMESPACE:Ljava/lang/String;

    goto :goto_14

    .line 1066
    :cond_18
    new-array v0, v2, [I

    fill-array-data v0, :array_22

    invoke-direct {p0, v0}, Lcom/bea/xml/stream/MXParser;->throwIllegalState([I)Ljava/lang/String;

    move-result-object v0

    goto :goto_14

    :array_22
    .array-data 4
        0x1
        0x2
    .end array-data
.end method

.method public getNamespaceURI(I)Ljava/lang/String;
    .registers 8
    .param p1, "pos"    # I

    .prologue
    .line 927
    iget v3, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    invoke-static {v3}, Lcom/bea/xml/stream/MXParser;->isElementEvent(I)Z

    move-result v3

    if-nez v3, :cond_11

    .line 928
    const/4 v3, 0x2

    new-array v3, v3, [I

    fill-array-data v3, :array_4a

    invoke-direct {p0, v3}, Lcom/bea/xml/stream/MXParser;->throwIllegalState([I)Ljava/lang/String;

    .line 930
    :cond_11
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->depth:I

    .line 931
    .local v0, "currentDepth":I
    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParser;->getNamespaceCount(I)I

    move-result v1

    .line 932
    .local v1, "end":I
    iget-object v3, p0, Lcom/bea/xml/stream/MXParser;->elNamespaceCount:[I

    add-int/lit8 v4, v0, -0x1

    aget v3, v3, v4

    add-int v2, p1, v3

    .line 933
    .local v2, "newpos":I
    if-ge p1, v1, :cond_26

    .line 934
    iget-object v3, p0, Lcom/bea/xml/stream/MXParser;->namespaceUri:[Ljava/lang/String;

    aget-object v3, v3, v2

    return-object v3

    .line 936
    :cond_26
    new-instance v3, Ljava/lang/ArrayIndexOutOfBoundsException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "position "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, " exceedded number of available namespaces "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 928
    nop

    :array_4a
    .array-data 4
        0x1
        0x2
    .end array-data
.end method

.method public getNamespaceURI(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 944
    iget v1, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    invoke-static {v1}, Lcom/bea/xml/stream/MXParser;->isElementEvent(I)Z

    move-result v1

    if-nez v1, :cond_11

    .line 945
    const/4 v1, 0x2

    new-array v1, v1, [I

    fill-array-data v1, :array_5e

    invoke-direct {p0, v1}, Lcom/bea/xml/stream/MXParser;->throwIllegalState([I)Ljava/lang/String;

    .line 948
    :cond_11
    if-eqz p1, :cond_47

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_47

    .line 949
    iget v1, p0, Lcom/bea/xml/stream/MXParser;->namespaceEnd:I

    add-int/lit8 v0, v1, -0x1

    .local v0, "i":I
    :goto_1d
    if-ltz v0, :cond_31

    .line 950
    iget-object v1, p0, Lcom/bea/xml/stream/MXParser;->namespacePrefix:[Ljava/lang/String;

    aget-object v1, v1, v0

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2e

    .line 951
    iget-object v1, p0, Lcom/bea/xml/stream/MXParser;->namespaceUri:[Ljava/lang/String;

    aget-object v1, v1, v0

    .line 967
    :goto_2d
    return-object v1

    .line 949
    :cond_2e
    add-int/lit8 v0, v0, -0x1

    goto :goto_1d

    .line 954
    :cond_31
    const-string v1, "xml"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3c

    .line 955
    const-string v1, "http://www.w3.org/XML/1998/namespace"

    goto :goto_2d

    .line 956
    :cond_3c
    const-string v1, "xmlns"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5b

    .line 957
    const-string v1, "http://www.w3.org/2000/xmlns/"

    goto :goto_2d

    .line 960
    .end local v0    # "i":I
    :cond_47
    iget v1, p0, Lcom/bea/xml/stream/MXParser;->namespaceEnd:I

    add-int/lit8 v0, v1, -0x1

    .restart local v0    # "i":I
    :goto_4b
    if-ltz v0, :cond_5b

    .line 961
    iget-object v1, p0, Lcom/bea/xml/stream/MXParser;->namespacePrefix:[Ljava/lang/String;

    aget-object v1, v1, v0

    if-nez v1, :cond_58

    .line 962
    iget-object v1, p0, Lcom/bea/xml/stream/MXParser;->namespaceUri:[Ljava/lang/String;

    aget-object v1, v1, v0

    goto :goto_2d

    .line 960
    :cond_58
    add-int/lit8 v0, v0, -0x1

    goto :goto_4b

    .line 967
    :cond_5b
    const/4 v1, 0x0

    goto :goto_2d

    .line 945
    nop

    :array_5e
    .array-data 4
        0x1
        0x2
    .end array-data
.end method

.method public getNamespaces()Ljava/util/Iterator;
    .registers 3

    .prologue
    .line 1485
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->hasNamespaces()Z

    move-result v1

    if-nez v1, :cond_9

    sget-object v1, Lcom/bea/xml/stream/util/EmptyIterator;->emptyIterator:Lcom/bea/xml/stream/util/EmptyIterator;

    .line 1487
    :goto_8
    return-object v1

    .line 1486
    :cond_9
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocalNamespaceCount()I

    move-result v0

    .line 1487
    .local v0, "namespaceCount":I
    iget v1, p0, Lcom/bea/xml/stream/MXParser;->depth:I

    invoke-virtual {p0, v1, v0}, Lcom/bea/xml/stream/MXParser;->internalGetNamespaces(II)Ljava/util/Iterator;

    move-result-object v1

    goto :goto_8
.end method

.method public getOutOfScopeNamespaces()Ljava/util/Iterator;
    .registers 6

    .prologue
    .line 1491
    iget-object v3, p0, Lcom/bea/xml/stream/MXParser;->elNamespaceCount:[I

    iget v4, p0, Lcom/bea/xml/stream/MXParser;->depth:I

    add-int/lit8 v4, v4, -0x1

    aget v2, v3, v4

    .line 1492
    .local v2, "startNs":I
    iget-object v3, p0, Lcom/bea/xml/stream/MXParser;->elNamespaceCount:[I

    iget v4, p0, Lcom/bea/xml/stream/MXParser;->depth:I

    aget v0, v3, v4

    .line 1493
    .local v0, "endNs":I
    sub-int v1, v0, v2

    .line 1494
    .local v1, "namespaceCount":I
    iget v3, p0, Lcom/bea/xml/stream/MXParser;->depth:I

    invoke-virtual {p0, v3, v1}, Lcom/bea/xml/stream/MXParser;->internalGetNamespaces(II)Ljava/util/Iterator;

    move-result-object v3

    return-object v3
.end method

.method public getPIData()Ljava/lang/String;
    .registers 3

    .prologue
    const/4 v1, 0x3

    .line 3020
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    if-eq v0, v1, :cond_8

    .line 3021
    invoke-direct {p0, v1}, Lcom/bea/xml/stream/MXParser;->throwIllegalState(I)Ljava/lang/String;

    .line 3023
    :cond_8
    iget-object v0, p0, Lcom/bea/xml/stream/MXParser;->piData:Ljava/lang/String;

    return-object v0
.end method

.method public getPITarget()Ljava/lang/String;
    .registers 3

    .prologue
    const/4 v1, 0x3

    .line 3014
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    if-eq v0, v1, :cond_8

    .line 3015
    invoke-direct {p0, v1}, Lcom/bea/xml/stream/MXParser;->throwIllegalState(I)Ljava/lang/String;

    .line 3017
    :cond_8
    iget-object v0, p0, Lcom/bea/xml/stream/MXParser;->piTarget:Ljava/lang/String;

    return-object v0
.end method

.method public getPositionDescription()Ljava/lang/String;
    .registers 7

    .prologue
    .line 1002
    const/4 v0, 0x0

    .line 1003
    .local v0, "fragment":Ljava/lang/String;
    iget v2, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    iget v3, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    if-gt v2, v3, :cond_39

    .line 1004
    const/4 v2, 0x0

    iget-object v3, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    iget v4, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    iget v5, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    invoke-static {v2, v3, v4, v5}, Lcom/bea/xml/stream/MXParser;->findFragment(I[CII)I

    move-result v1

    .line 1006
    .local v1, "start":I
    iget v2, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    if-ge v1, v2, :cond_20

    .line 1007
    new-instance v0, Ljava/lang/String;

    .end local v0    # "fragment":Ljava/lang/String;
    iget-object v2, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    iget v3, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    sub-int/2addr v3, v1

    invoke-direct {v0, v2, v1, v3}, Ljava/lang/String;-><init>([CII)V

    .line 1009
    .restart local v0    # "fragment":Ljava/lang/String;
    :cond_20
    iget v2, p0, Lcom/bea/xml/stream/MXParser;->bufAbsoluteStart:I

    if-gtz v2, :cond_26

    if-lez v1, :cond_39

    :cond_26
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "..."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1014
    .end local v1    # "start":I
    :cond_39
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    if-eqz v0, :cond_88

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, " seen "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParser;->printable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v4, "..."

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_63
    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, " @"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLineNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getColumnNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    :cond_88
    const-string v2, ""

    goto :goto_63
.end method

.method public getPrefix()Ljava/lang/String;
    .registers 4

    .prologue
    const/4 v2, 0x2

    .line 1090
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_a

    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    if-ne v0, v2, :cond_11

    .line 1092
    :cond_a
    iget-object v0, p0, Lcom/bea/xml/stream/MXParser;->elPrefix:[Ljava/lang/String;

    iget v1, p0, Lcom/bea/xml/stream/MXParser;->depth:I

    aget-object v0, v0, v1

    .line 1094
    :goto_10
    return-object v0

    :cond_11
    new-array v0, v2, [I

    fill-array-data v0, :array_1c

    invoke-direct {p0, v0}, Lcom/bea/xml/stream/MXParser;->throwIllegalState([I)Ljava/lang/String;

    move-result-object v0

    goto :goto_10

    nop

    :array_1c
    .array-data 4
        0x1
        0x2
    .end array-data
.end method

.method public getProperty(Ljava/lang/String;)Ljava/lang/Object;
    .registers 11
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 3795
    const-string v7, "javax.xml.stream.entities"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_45

    .line 3796
    iget-object v7, p0, Lcom/bea/xml/stream/MXParser;->mDtdIntSubset:Lcom/wutka/dtd/DTD;

    if-eqz v7, :cond_8f

    .line 3797
    iget-object v8, p0, Lcom/bea/xml/stream/MXParser;->mDtdIntSubset:Lcom/wutka/dtd/DTD;

    sget-object v7, Lcom/bea/xml/stream/MXParser;->class$com$wutka$dtd$DTDEntity:Ljava/lang/Class;

    if-nez v7, :cond_42

    const-string v7, "com.wutka.dtd.DTDEntity"

    invoke-static {v7}, Lcom/bea/xml/stream/MXParser;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    sput-object v7, Lcom/bea/xml/stream/MXParser;->class$com$wutka$dtd$DTDEntity:Ljava/lang/Class;

    :goto_1b
    invoke-virtual {v8, v7}, Lcom/wutka/dtd/DTD;->getItemsByType(Ljava/lang/Class;)Ljava/util/Vector;

    move-result-object v6

    .line 3798
    .local v6, "v":Ljava/util/Vector;
    invoke-virtual {v6}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 3799
    .local v0, "e":Ljava/util/Enumeration;
    new-instance v5, Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/Vector;->size()I

    move-result v7

    invoke-direct {v5, v7}, Ljava/util/ArrayList;-><init>(I)V

    .line 3800
    .local v5, "result":Ljava/util/ArrayList;
    :cond_2c
    :goto_2c
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v7

    if-eqz v7, :cond_8f

    .line 3801
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/wutka/dtd/DTDEntity;

    .line 3802
    .local v2, "ent":Lcom/wutka/dtd/DTDEntity;
    invoke-static {v2}, Lcom/bea/xml/stream/events/DTDEvent;->createEntityDeclaration(Lcom/wutka/dtd/DTDEntity;)Ljavax/xml/stream/events/EntityDeclaration;

    move-result-object v4

    .line 3803
    .local v4, "nd":Ljavax/xml/stream/events/EntityDeclaration;
    if-eqz v4, :cond_2c

    .line 3804
    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2c

    .line 3797
    .end local v0    # "e":Ljava/util/Enumeration;
    .end local v2    # "ent":Lcom/wutka/dtd/DTDEntity;
    .end local v4    # "nd":Ljavax/xml/stream/events/EntityDeclaration;
    .end local v5    # "result":Ljava/util/ArrayList;
    .end local v6    # "v":Ljava/util/Vector;
    :cond_42
    sget-object v7, Lcom/bea/xml/stream/MXParser;->class$com$wutka$dtd$DTDEntity:Ljava/lang/Class;

    goto :goto_1b

    .line 3811
    :cond_45
    const-string v7, "javax.xml.stream.notations"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_89

    .line 3812
    iget-object v7, p0, Lcom/bea/xml/stream/MXParser;->mDtdIntSubset:Lcom/wutka/dtd/DTD;

    if-eqz v7, :cond_8f

    .line 3813
    iget-object v8, p0, Lcom/bea/xml/stream/MXParser;->mDtdIntSubset:Lcom/wutka/dtd/DTD;

    sget-object v7, Lcom/bea/xml/stream/MXParser;->class$com$wutka$dtd$DTDNotation:Ljava/lang/Class;

    if-nez v7, :cond_86

    const-string v7, "com.wutka.dtd.DTDNotation"

    invoke-static {v7}, Lcom/bea/xml/stream/MXParser;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    sput-object v7, Lcom/bea/xml/stream/MXParser;->class$com$wutka$dtd$DTDNotation:Ljava/lang/Class;

    :goto_5f
    invoke-virtual {v8, v7}, Lcom/wutka/dtd/DTD;->getItemsByType(Ljava/lang/Class;)Ljava/util/Vector;

    move-result-object v6

    .line 3814
    .restart local v6    # "v":Ljava/util/Vector;
    invoke-virtual {v6}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 3815
    .restart local v0    # "e":Ljava/util/Enumeration;
    new-instance v5, Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/Vector;->size()I

    move-result v7

    invoke-direct {v5, v7}, Ljava/util/ArrayList;-><init>(I)V

    .line 3816
    .restart local v5    # "result":Ljava/util/ArrayList;
    :cond_70
    :goto_70
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v7

    if-eqz v7, :cond_8f

    .line 3817
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/wutka/dtd/DTDNotation;

    .line 3818
    .local v3, "n":Lcom/wutka/dtd/DTDNotation;
    invoke-static {v3}, Lcom/bea/xml/stream/events/DTDEvent;->createNotationDeclaration(Lcom/wutka/dtd/DTDNotation;)Ljavax/xml/stream/events/NotationDeclaration;

    move-result-object v1

    .line 3819
    .local v1, "ed":Ljavax/xml/stream/events/NotationDeclaration;
    if-eqz v1, :cond_70

    .line 3820
    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_70

    .line 3813
    .end local v0    # "e":Ljava/util/Enumeration;
    .end local v1    # "ed":Ljavax/xml/stream/events/NotationDeclaration;
    .end local v3    # "n":Lcom/wutka/dtd/DTDNotation;
    .end local v5    # "result":Ljava/util/ArrayList;
    .end local v6    # "v":Ljava/util/Vector;
    :cond_86
    sget-object v7, Lcom/bea/xml/stream/MXParser;->class$com$wutka$dtd$DTDNotation:Ljava/lang/Class;

    goto :goto_5f

    .line 3827
    :cond_89
    iget-object v7, p0, Lcom/bea/xml/stream/MXParser;->configurationContext:Lcom/bea/xml/stream/ConfigurationContextBase;

    invoke-virtual {v7, p1}, Lcom/bea/xml/stream/ConfigurationContextBase;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    :cond_8f
    return-object v5
.end method

.method public getPublicId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 3778
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSystemId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 3781
    const/4 v0, 0x0

    return-object v0
.end method

.method public getText()Ljava/lang/String;
    .registers 6

    .prologue
    .line 1527
    invoke-direct {p0}, Lcom/bea/xml/stream/MXParser;->checkTextEvent()V

    .line 1528
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    const/16 v1, 0x9

    if-ne v0, v1, :cond_1d

    .line 1530
    iget-object v0, p0, Lcom/bea/xml/stream/MXParser;->text:Ljava/lang/String;

    if-nez v0, :cond_1a

    iget-object v0, p0, Lcom/bea/xml/stream/MXParser;->entityValue:[C

    if-eqz v0, :cond_1a

    .line 1531
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/bea/xml/stream/MXParser;->entityValue:[C

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([C)V

    iput-object v0, p0, Lcom/bea/xml/stream/MXParser;->text:Ljava/lang/String;

    .line 1533
    :cond_1a
    iget-object v0, p0, Lcom/bea/xml/stream/MXParser;->text:Ljava/lang/String;

    .line 1540
    :goto_1c
    return-object v0

    .line 1535
    :cond_1d
    iget-boolean v0, p0, Lcom/bea/xml/stream/MXParser;->usePC:Z

    if-eqz v0, :cond_34

    .line 1536
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/bea/xml/stream/MXParser;->pc:[C

    iget v2, p0, Lcom/bea/xml/stream/MXParser;->pcStart:I

    iget v3, p0, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    iget v4, p0, Lcom/bea/xml/stream/MXParser;->pcStart:I

    sub-int/2addr v3, v4

    invoke-direct {v0, v1, v2, v3}, Ljava/lang/String;-><init>([CII)V

    iput-object v0, p0, Lcom/bea/xml/stream/MXParser;->text:Ljava/lang/String;

    .line 1540
    :goto_31
    iget-object v0, p0, Lcom/bea/xml/stream/MXParser;->text:Ljava/lang/String;

    goto :goto_1c

    .line 1538
    :cond_34
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    iget v2, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    iget v3, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    iget v4, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    sub-int/2addr v3, v4

    invoke-direct {v0, v1, v2, v3}, Ljava/lang/String;-><init>([CII)V

    iput-object v0, p0, Lcom/bea/xml/stream/MXParser;->text:Ljava/lang/String;

    goto :goto_31
.end method

.method public getTextCharacters(I[CII)I
    .registers 10
    .param p1, "sourceStart"    # I
    .param p2, "target"    # [C
    .param p3, "targetStart"    # I
    .param p4, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 1546
    invoke-direct {p0}, Lcom/bea/xml/stream/MXParser;->checkTextEventXxx()V

    .line 1548
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getTextLength()I

    move-result v2

    .line 1554
    .local v2, "intLen":I
    if-ltz p1, :cond_b

    if-le p1, v2, :cond_11

    .line 1555
    :cond_b
    new-instance v4, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v4}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v4

    .line 1562
    :cond_11
    sub-int v0, v2, p1

    .line 1564
    .local v0, "avail":I
    if-ge v0, p4, :cond_16

    .line 1565
    move p4, v0

    .line 1568
    :cond_16
    if-lez p4, :cond_25

    .line 1569
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getTextCharacters()[C

    move-result-object v1

    .line 1570
    .local v1, "intBuf":[C
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getTextStart()I

    move-result v3

    .line 1571
    .local v3, "intStart":I
    add-int v4, v3, p1

    invoke-static {v1, v4, p2, p3, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1574
    .end local v1    # "intBuf":[C
    .end local v3    # "intStart":I
    :cond_25
    return p4
.end method

.method public getTextCharacters()[C
    .registers 3

    .prologue
    .line 1578
    invoke-direct {p0}, Lcom/bea/xml/stream/MXParser;->checkTextEventXxx()V

    .line 1580
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_12

    .line 1581
    iget-boolean v0, p0, Lcom/bea/xml/stream/MXParser;->usePC:Z

    if-eqz v0, :cond_f

    .line 1582
    iget-object v0, p0, Lcom/bea/xml/stream/MXParser;->pc:[C

    .line 1587
    :goto_e
    return-object v0

    .line 1584
    :cond_f
    iget-object v0, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    goto :goto_e

    .line 1587
    :cond_12
    iget-object v0, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    goto :goto_e
.end method

.method public getTextLength()I
    .registers 3

    .prologue
    .line 1602
    invoke-direct {p0}, Lcom/bea/xml/stream/MXParser;->checkTextEventXxx()V

    .line 1603
    iget-boolean v0, p0, Lcom/bea/xml/stream/MXParser;->usePC:Z

    if-eqz v0, :cond_d

    .line 1604
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    iget v1, p0, Lcom/bea/xml/stream/MXParser;->pcStart:I

    sub-int/2addr v0, v1

    .line 1606
    :goto_c
    return v0

    :cond_d
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    iget v1, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    sub-int/2addr v0, v1

    goto :goto_c
.end method

.method public getTextStart()I
    .registers 2

    .prologue
    .line 1592
    invoke-direct {p0}, Lcom/bea/xml/stream/MXParser;->checkTextEventXxx()V

    .line 1594
    iget-boolean v0, p0, Lcom/bea/xml/stream/MXParser;->usePC:Z

    if-eqz v0, :cond_a

    .line 1595
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->pcStart:I

    .line 1597
    :goto_9
    return v0

    :cond_a
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    goto :goto_9
.end method

.method public getTextStream()Ljava/io/Reader;
    .registers 2

    .prologue
    .line 1507
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public getValue()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1620
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getText()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getVersion()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1680
    iget-object v0, p0, Lcom/bea/xml/stream/MXParser;->xmlVersion:Ljava/lang/String;

    return-object v0
.end method

.method public hasAttributes()Z
    .registers 2

    .prologue
    .line 1442
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getAttributeCount()I

    move-result v0

    if-lez v0, :cond_8

    .line 1443
    const/4 v0, 0x1

    .line 1444
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public hasName()Z
    .registers 2

    .prologue
    .line 1676
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    invoke-static {v0}, Lcom/bea/xml/stream/MXParser;->isElementEvent(I)Z

    move-result v0

    return v0
.end method

.method public hasNamespaces()Z
    .registers 2

    .prologue
    .line 1448
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getNamespaceCount()I

    move-result v0

    if-lez v0, :cond_8

    .line 1449
    const/4 v0, 0x1

    .line 1450
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public hasNext()Z
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 1346
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    const/16 v1, 0x8

    if-eq v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public hasText()Z
    .registers 3

    .prologue
    .line 1611
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    const/4 v1, 0x4

    if-eq v0, v1, :cond_21

    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    const/16 v1, 0xb

    if-eq v0, v1, :cond_21

    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    const/16 v1, 0xc

    if-eq v0, v1, :cond_21

    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    const/4 v1, 0x5

    if-eq v0, v1, :cond_21

    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    const/4 v1, 0x6

    if-eq v0, v1, :cond_21

    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    const/16 v1, 0x9

    if-ne v0, v1, :cond_23

    :cond_21
    const/4 v0, 0x1

    :goto_22
    return v0

    :cond_23
    const/4 v0, 0x0

    goto :goto_22
.end method

.method public internalGetNamespaces(II)Ljava/util/Iterator;
    .registers 9
    .param p1, "depth"    # I
    .param p2, "namespaceCount"    # I

    .prologue
    .line 1469
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1470
    .local v1, "ns":Ljava/util/ArrayList;
    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->elNamespaceCount:[I

    add-int/lit8 v5, p1, -0x1

    aget v3, v4, v5

    .line 1471
    .local v3, "startNs":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_c
    if-ge v0, p2, :cond_36

    .line 1472
    add-int v4, v0, v3

    invoke-direct {p0, v4}, Lcom/bea/xml/stream/MXParser;->getLocalNamespacePrefix(I)Ljava/lang/String;

    move-result-object v2

    .line 1473
    .local v2, "prefix":Ljava/lang/String;
    if-nez v2, :cond_27

    .line 1474
    new-instance v4, Lcom/bea/xml/stream/NamespaceBase;

    add-int v5, v0, v3

    invoke-direct {p0, v5}, Lcom/bea/xml/stream/MXParser;->getLocalNamespaceURI(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/bea/xml/stream/NamespaceBase;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1471
    :goto_24
    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    .line 1476
    :cond_27
    new-instance v4, Lcom/bea/xml/stream/NamespaceBase;

    add-int v5, v0, v3

    invoke-direct {p0, v5}, Lcom/bea/xml/stream/MXParser;->getLocalNamespaceURI(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v2, v5}, Lcom/bea/xml/stream/NamespaceBase;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_24

    .line 1480
    .end local v2    # "prefix":Ljava/lang/String;
    :cond_36
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    return-object v4
.end method

.method public isAttributeSpecified(I)Z
    .registers 5
    .param p1, "index"    # I

    .prologue
    const/4 v1, 0x1

    .line 1157
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    if-eq v0, v1, :cond_8

    .line 1158
    invoke-direct {p0, v1}, Lcom/bea/xml/stream/MXParser;->throwIllegalState(I)Ljava/lang/String;

    .line 1160
    :cond_8
    if-ltz p1, :cond_e

    iget v0, p0, Lcom/bea/xml/stream/MXParser;->attributeCount:I

    if-lt p1, v0, :cond_35

    :cond_e
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "attribute position must be 0.."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Lcom/bea/xml/stream/MXParser;->attributeCount:I

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " and not "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1162
    :cond_35
    return v1
.end method

.method public isCharacters()Z
    .registers 3

    .prologue
    .line 1366
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_7

    const/4 v0, 0x1

    :goto_6
    return v0

    :cond_7
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public isEOF()Z
    .registers 3

    .prologue
    .line 1370
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    const/16 v1, 0x8

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isEmptyElementTag()Z
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 1100
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_11

    new-instance v0, Ljavax/xml/stream/XMLStreamException;

    const-string v1, "parser must be on XMLStreamConstants.START_ELEMENT to check for empty element"

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v0

    .line 1103
    :cond_11
    iget-boolean v0, p0, Lcom/bea/xml/stream/MXParser;->emptyElementTag:Z

    return v0
.end method

.method public isEndElement()Z
    .registers 3

    .prologue
    .line 1362
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_7

    const/4 v0, 0x1

    :goto_6
    return v0

    :cond_7
    const/4 v0, 0x0

    goto :goto_6
.end method

.method protected isNameChar(C)Z
    .registers 4
    .param p1, "ch"    # C

    .prologue
    const/16 v1, 0x400

    .line 319
    if-ge p1, v1, :cond_a

    sget-object v0, Lcom/bea/xml/stream/MXParser;->lookupNameChar:[Z

    aget-boolean v0, v0, p1

    if-nez v0, :cond_21

    :cond_a
    if-lt p1, v1, :cond_10

    const/16 v0, 0x2027

    if-le p1, v0, :cond_21

    :cond_10
    const/16 v0, 0x202a

    if-lt p1, v0, :cond_18

    const/16 v0, 0x218f

    if-le p1, v0, :cond_21

    :cond_18
    const/16 v0, 0x2800

    if-lt p1, v0, :cond_23

    const v0, 0xffef

    if-gt p1, v0, :cond_23

    :cond_21
    const/4 v0, 0x1

    :goto_22
    return v0

    :cond_23
    const/4 v0, 0x0

    goto :goto_22
.end method

.method protected isNameStartChar(C)Z
    .registers 4
    .param p1, "ch"    # C

    .prologue
    const/16 v1, 0x400

    .line 285
    if-ge p1, v1, :cond_a

    sget-object v0, Lcom/bea/xml/stream/MXParser;->lookupNameStartChar:[Z

    aget-boolean v0, v0, p1

    if-nez v0, :cond_21

    :cond_a
    if-lt p1, v1, :cond_10

    const/16 v0, 0x2027

    if-le p1, v0, :cond_21

    :cond_10
    const/16 v0, 0x202a

    if-lt p1, v0, :cond_18

    const/16 v0, 0x218f

    if-le p1, v0, :cond_21

    :cond_18
    const/16 v0, 0x2800

    if-lt p1, v0, :cond_23

    const v0, 0xffef

    if-gt p1, v0, :cond_23

    :cond_21
    const/4 v0, 0x1

    :goto_22
    return v0

    :cond_23
    const/4 v0, 0x0

    goto :goto_22
.end method

.method protected isS(C)Z
    .registers 3
    .param p1, "ch"    # C

    .prologue
    .line 341
    const/16 v0, 0x20

    if-eq p1, v0, :cond_10

    const/16 v0, 0xa

    if-eq p1, v0, :cond_10

    const/16 v0, 0xd

    if-eq p1, v0, :cond_10

    const/16 v0, 0x9

    if-ne p1, v0, :cond_12

    :cond_10
    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public isStandalone()Z
    .registers 2

    .prologue
    .line 1684
    iget-boolean v0, p0, Lcom/bea/xml/stream/MXParser;->standalone:Z

    return v0
.end method

.method public isStartElement()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 1358
    iget v1, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    if-ne v1, v0, :cond_6

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public isWhiteSpace()Z
    .registers 6

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 1034
    iget v3, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    const/4 v4, 0x4

    if-eq v3, v4, :cond_d

    iget v3, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    const/16 v4, 0xc

    if-ne v3, v4, :cond_3b

    .line 1035
    :cond_d
    iget-boolean v3, p0, Lcom/bea/xml/stream/MXParser;->usePC:Z

    if-eqz v3, :cond_26

    .line 1036
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->pcStart:I

    .local v0, "i":I
    :goto_13
    iget v3, p0, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    if-ge v0, v3, :cond_22

    .line 1038
    iget-object v3, p0, Lcom/bea/xml/stream/MXParser;->pc:[C

    aget-char v3, v3, v0

    invoke-virtual {p0, v3}, Lcom/bea/xml/stream/MXParser;->isS(C)Z

    move-result v3

    if-nez v3, :cond_23

    move v1, v2

    .line 1056
    .end local v0    # "i":I
    :cond_22
    :goto_22
    return v1

    .line 1036
    .restart local v0    # "i":I
    :cond_23
    add-int/lit8 v0, v0, 0x1

    goto :goto_13

    .line 1042
    .end local v0    # "i":I
    :cond_26
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    .restart local v0    # "i":I
    :goto_28
    iget v3, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    if-ge v0, v3, :cond_22

    .line 1044
    iget-object v3, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    aget-char v3, v3, v0

    invoke-virtual {p0, v3}, Lcom/bea/xml/stream/MXParser;->isS(C)Z

    move-result v3

    if-nez v3, :cond_38

    move v1, v2

    goto :goto_22

    .line 1042
    :cond_38
    add-int/lit8 v0, v0, 0x1

    goto :goto_28

    .line 1048
    .end local v0    # "i":I
    :cond_3b
    iget v3, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    const/4 v4, 0x6

    if-eq v3, v4, :cond_22

    move v1, v2

    .line 1056
    goto :goto_22
.end method

.method protected joinPC()V
    .registers 7

    .prologue
    .line 3765
    iget v2, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    iget v3, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    sub-int v0, v2, v3

    .line 3766
    .local v0, "len":I
    iget v2, p0, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    add-int/2addr v2, v0

    add-int/lit8 v1, v2, 0x1

    .line 3767
    .local v1, "newEnd":I
    iget-object v2, p0, Lcom/bea/xml/stream/MXParser;->pc:[C

    array-length v2, v2

    if-lt v1, v2, :cond_13

    invoke-virtual {p0, v1}, Lcom/bea/xml/stream/MXParser;->ensurePC(I)V

    .line 3769
    :cond_13
    iget-object v2, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    iget v3, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->pc:[C

    iget v5, p0, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    invoke-static {v2, v3, v4, v5, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 3770
    iget v2, p0, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    add-int/2addr v2, v0

    iput v2, p0, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    .line 3771
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/bea/xml/stream/MXParser;->usePC:Z

    .line 3773
    return-void
.end method

.method protected lookupEntityReplacement(I)[C
    .registers 10
    .param p1, "entitNameLen"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 2900
    iget-boolean v4, p0, Lcom/bea/xml/stream/MXParser;->allStringsInterned:Z

    if-nez v4, :cond_51

    .line 2901
    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    iget v5, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    iget v6, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    iget v7, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    sub-int/2addr v6, v7

    invoke-static {v4, v5, v6}, Lcom/bea/xml/stream/MXParser;->fastHash([CII)I

    move-result v1

    .line 2903
    .local v1, "hash":I
    iget v4, p0, Lcom/bea/xml/stream/MXParser;->entityEnd:I

    add-int/lit8 v2, v4, -0x1

    .local v2, "i":I
    :goto_15
    if-ltz v2, :cond_80

    .line 2905
    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->entityNameHash:[I

    aget v4, v4, v2

    if-ne v1, v4, :cond_36

    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->entityNameBuf:[[C

    aget-object v4, v4, v2

    array-length v4, v4

    if-ne p1, v4, :cond_36

    .line 2906
    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->entityNameBuf:[[C

    aget-object v0, v4, v2

    .line 2907
    .local v0, "entityBuf":[C
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_29
    if-ge v3, p1, :cond_3c

    .line 2909
    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    iget v5, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    add-int/2addr v5, v3

    aget-char v4, v4, v5

    aget-char v5, v0, v3

    if-eq v4, v5, :cond_39

    .line 2903
    .end local v0    # "entityBuf":[C
    .end local v3    # "j":I
    :cond_36
    add-int/lit8 v2, v2, -0x1

    goto :goto_15

    .line 2907
    .restart local v0    # "entityBuf":[C
    .restart local v3    # "j":I
    :cond_39
    add-int/lit8 v3, v3, 0x1

    goto :goto_29

    .line 2911
    :cond_3c
    iget-boolean v4, p0, Lcom/bea/xml/stream/MXParser;->tokenize:Z

    if-eqz v4, :cond_46

    .line 2912
    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->entityReplacement:[Ljava/lang/String;

    aget-object v4, v4, v2

    iput-object v4, p0, Lcom/bea/xml/stream/MXParser;->text:Ljava/lang/String;

    .line 2914
    :cond_46
    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->entityName:[Ljava/lang/String;

    aget-object v4, v4, v2

    iput-object v4, p0, Lcom/bea/xml/stream/MXParser;->entityRefName:Ljava/lang/String;

    .line 2915
    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->entityReplacementBuf:[[C

    aget-object v4, v4, v2

    .line 2931
    .end local v0    # "entityBuf":[C
    .end local v1    # "hash":I
    .end local v3    # "j":I
    :goto_50
    return-object v4

    .line 2919
    .end local v2    # "i":I
    :cond_51
    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    iget v5, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    iget v6, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    iget v7, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    sub-int/2addr v6, v7

    invoke-virtual {p0, v4, v5, v6}, Lcom/bea/xml/stream/MXParser;->newString([CII)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/bea/xml/stream/MXParser;->entityRefName:Ljava/lang/String;

    .line 2920
    iget v4, p0, Lcom/bea/xml/stream/MXParser;->entityEnd:I

    add-int/lit8 v2, v4, -0x1

    .restart local v2    # "i":I
    :goto_64
    if-ltz v2, :cond_80

    .line 2923
    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->entityRefName:Ljava/lang/String;

    iget-object v5, p0, Lcom/bea/xml/stream/MXParser;->entityName:[Ljava/lang/String;

    aget-object v5, v5, v2

    if-ne v4, v5, :cond_7d

    .line 2924
    iget-boolean v4, p0, Lcom/bea/xml/stream/MXParser;->tokenize:Z

    if-eqz v4, :cond_78

    .line 2925
    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->entityReplacement:[Ljava/lang/String;

    aget-object v4, v4, v2

    iput-object v4, p0, Lcom/bea/xml/stream/MXParser;->text:Ljava/lang/String;

    .line 2927
    :cond_78
    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->entityReplacementBuf:[[C

    aget-object v4, v4, v2

    goto :goto_50

    .line 2920
    :cond_7d
    add-int/lit8 v2, v2, -0x1

    goto :goto_64

    .line 2931
    :cond_80
    const/4 v4, 0x0

    goto :goto_50
.end method

.method protected more()C
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;,
            Ljava/io/EOFException;
        }
    .end annotation

    .prologue
    .line 3715
    iget v1, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    iget v2, p0, Lcom/bea/xml/stream/MXParser;->bufEnd:I

    if-lt v1, v2, :cond_9

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->fillBuf()V

    .line 3716
    :cond_9
    iget-object v1, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    iget v2, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    aget-char v0, v1, v2

    .line 3721
    .local v0, "ch":C
    const/16 v1, 0xa

    if-ne v0, v1, :cond_21

    iget v1, p0, Lcom/bea/xml/stream/MXParser;->lineNumber:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/bea/xml/stream/MXParser;->lineNumber:I

    const/4 v1, 0x1

    iput v1, p0, Lcom/bea/xml/stream/MXParser;->columnNumber:I

    .line 3723
    :goto_20
    return v0

    .line 3722
    :cond_21
    iget v1, p0, Lcom/bea/xml/stream/MXParser;->columnNumber:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/bea/xml/stream/MXParser;->columnNumber:I

    goto :goto_20
.end method

.method public moveToEndElement()Z
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    .line 1408
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->isEndElement()Z

    move-result v1

    if-eqz v1, :cond_b

    .line 1414
    :goto_7
    return v0

    .line 1412
    :cond_8
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->next()I

    .line 1409
    :cond_b
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_18

    .line 1410
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->isEndElement()Z

    move-result v1

    if-eqz v1, :cond_8

    goto :goto_7

    .line 1414
    :cond_18
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public moveToEndElement(Ljava/lang/String;)Z
    .registers 4
    .param p1, "localName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 1420
    if-nez p1, :cond_7

    .line 1426
    :cond_3
    :goto_3
    return v0

    .line 1424
    :cond_4
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->next()I

    .line 1421
    :cond_7
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->moveToEndElement()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1422
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocalName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_19

    const/4 v0, 0x1

    goto :goto_3

    .line 1423
    :cond_19
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->hasNext()Z

    move-result v1

    if-nez v1, :cond_4

    goto :goto_3
.end method

.method public moveToEndElement(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 5
    .param p1, "localName"    # Ljava/lang/String;
    .param p2, "namespaceUri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 1432
    if-eqz p1, :cond_5

    if-nez p2, :cond_9

    .line 1438
    :cond_5
    :goto_5
    return v0

    .line 1436
    :cond_6
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->next()I

    .line 1433
    :cond_9
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/MXParser;->moveToEndElement(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 1434
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getNamespaceURI()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1b

    const/4 v0, 0x1

    goto :goto_5

    .line 1435
    :cond_1b
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->hasNext()Z

    move-result v1

    if-nez v1, :cond_6

    goto :goto_5
.end method

.method public moveToStartElement()Z
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    .line 1374
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->isStartElement()Z

    move-result v1

    if-eqz v1, :cond_b

    .line 1380
    :goto_7
    return v0

    .line 1378
    :cond_8
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->next()I

    .line 1375
    :cond_b
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_18

    .line 1376
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->isStartElement()Z

    move-result v1

    if-eqz v1, :cond_8

    goto :goto_7

    .line 1380
    :cond_18
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public moveToStartElement(Ljava/lang/String;)Z
    .registers 4
    .param p1, "localName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 1386
    if-nez p1, :cond_7

    .line 1392
    :cond_3
    :goto_3
    return v0

    .line 1390
    :cond_4
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->next()I

    .line 1387
    :cond_7
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->moveToStartElement()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1388
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocalName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_19

    const/4 v0, 0x1

    goto :goto_3

    .line 1389
    :cond_19
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->hasNext()Z

    move-result v1

    if-nez v1, :cond_4

    goto :goto_3
.end method

.method public moveToStartElement(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 5
    .param p1, "localName"    # Ljava/lang/String;
    .param p2, "namespaceUri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 1398
    if-eqz p1, :cond_5

    if-nez p2, :cond_9

    .line 1404
    :cond_5
    :goto_5
    return v0

    .line 1402
    :cond_6
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->next()I

    .line 1399
    :cond_9
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/MXParser;->moveToStartElement(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 1400
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getNamespaceURI()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1b

    const/4 v0, 0x1

    goto :goto_5

    .line 1401
    :cond_1b
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->hasNext()Z

    move-result v1

    if-nez v1, :cond_6

    goto :goto_5
.end method

.method protected newString([CII)Ljava/lang/String;
    .registers 5
    .param p1, "cbuf"    # [C
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 126
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    return-object v0
.end method

.method protected newStringIntern([CII)Ljava/lang/String;
    .registers 5
    .param p1, "cbuf"    # [C
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 130
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v0}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public next()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 1330
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bea/xml/stream/MXParser;->tokenize:Z

    .line 1331
    iput v1, p0, Lcom/bea/xml/stream/MXParser;->pcStart:I

    iput v1, p0, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    .line 1332
    iput-boolean v1, p0, Lcom/bea/xml/stream/MXParser;->usePC:Z

    .line 1333
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->nextImpl()I

    move-result v0

    return v0
.end method

.method public nextElement()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 1342
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->nextTag()I

    move-result v0

    return v0
.end method

.method protected nextImpl()I
    .registers 22
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 1700
    const/16 v17, 0x0

    :try_start_2
    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/bea/xml/stream/MXParser;->text:Ljava/lang/String;

    .line 1701
    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    move/from16 v17, v0

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->bufStart:I

    .line 1702
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->pastEndTag:Z

    move/from16 v17, v0

    if-eqz v17, :cond_46

    .line 1703
    const/16 v17, 0x0

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/bea/xml/stream/MXParser;->pastEndTag:Z

    .line 1704
    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->depth:I

    move/from16 v17, v0

    add-int/lit8 v17, v17, -0x1

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->depth:I

    .line 1705
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->elNamespaceCount:[I

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->depth:I

    move/from16 v18, v0

    aget v17, v17, v18

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->namespaceEnd:I

    .line 1707
    :cond_46
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->emptyElementTag:Z

    move/from16 v17, v0

    if-eqz v17, :cond_67

    .line 1708
    const/16 v17, 0x0

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/bea/xml/stream/MXParser;->emptyElementTag:Z

    .line 1709
    const/16 v17, 0x1

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/bea/xml/stream/MXParser;->pastEndTag:Z

    .line 1710
    const/16 v17, 0x2

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->eventType:I

    .line 1947
    :goto_66
    return v17

    .line 1714
    :cond_67
    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->depth:I

    move/from16 v17, v0

    if-lez v17, :cond_55c

    .line 1716
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->seenStartTag:Z

    move/from16 v17, v0

    if-eqz v17, :cond_9d

    .line 1717
    const/16 v17, 0x0

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/bea/xml/stream/MXParser;->seenStartTag:Z

    .line 1718
    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->parseStartTag()I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->eventType:I
    :try_end_89
    .catch Ljava/io/EOFException; {:try_start_2 .. :try_end_89} :catch_8a

    goto :goto_66

    .line 1951
    :catch_8a
    move-exception v8

    .line 1952
    .local v8, "eofe":Ljava/io/EOFException;
    new-instance v17, Ljavax/xml/stream/XMLStreamException;

    const-string v18, "Unexpected end of stream"

    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2, v8}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;Ljava/lang/Throwable;)V

    throw v17

    .line 1720
    .end local v8    # "eofe":Ljava/io/EOFException;
    :cond_9d
    :try_start_9d
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->seenEndTag:Z

    move/from16 v17, v0

    if-eqz v17, :cond_b8

    .line 1721
    const/16 v17, 0x0

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/bea/xml/stream/MXParser;->seenEndTag:Z

    .line 1722
    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->parseEndTag()I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->eventType:I

    goto :goto_66

    .line 1728
    :cond_b8
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->seenMarkup:Z

    move/from16 v17, v0

    if-eqz v17, :cond_fc

    .line 1729
    const/16 v17, 0x0

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/bea/xml/stream/MXParser;->seenMarkup:Z

    .line 1730
    const/16 v7, 0x3c

    .line 1737
    .local v7, "ch":C
    :goto_ca
    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pos:I

    move/from16 v17, v0

    add-int/lit8 v17, v17, -0x1

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->posStart:I

    .line 1740
    const/4 v9, 0x0

    .line 1743
    .local v9, "hadCharData":Z
    const/4 v11, 0x0

    .line 1748
    .local v11, "needsMerging":Z
    :goto_da
    const/16 v17, 0x3c

    move/from16 v0, v17

    if-ne v7, v0, :cond_2ef

    .line 1749
    if-eqz v9, :cond_114

    .line 1751
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->tokenize:Z

    move/from16 v17, v0

    if-eqz v17, :cond_114

    .line 1752
    const/16 v17, 0x1

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/bea/xml/stream/MXParser;->seenMarkup:Z

    .line 1753
    const/16 v17, 0x4

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->eventType:I

    goto/16 :goto_66

    .line 1731
    .end local v7    # "ch":C
    .end local v9    # "hadCharData":Z
    .end local v11    # "needsMerging":Z
    :cond_fc
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->seenAmpersand:Z

    move/from16 v17, v0

    if-eqz v17, :cond_10f

    .line 1732
    const/16 v17, 0x0

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/bea/xml/stream/MXParser;->seenAmpersand:Z

    .line 1733
    const/16 v7, 0x26

    .line 1734
    .restart local v7    # "ch":C
    goto :goto_ca

    .line 1735
    .end local v7    # "ch":C
    :cond_10f
    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v7

    .restart local v7    # "ch":C
    goto :goto_ca

    .line 1756
    .restart local v9    # "hadCharData":Z
    .restart local v11    # "needsMerging":Z
    :cond_114
    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v7

    .line 1757
    const/16 v17, 0x2f

    move/from16 v0, v17

    if-ne v7, v0, :cond_146

    .line 1758
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->tokenize:Z

    move/from16 v17, v0

    if-nez v17, :cond_13a

    if-eqz v9, :cond_13a

    .line 1759
    const/16 v17, 0x1

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/bea/xml/stream/MXParser;->seenEndTag:Z

    .line 1761
    const/16 v17, 0x4

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->eventType:I

    goto/16 :goto_66

    .line 1763
    :cond_13a
    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->parseEndTag()I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->eventType:I

    goto/16 :goto_66

    .line 1764
    :cond_146
    const/16 v17, 0x21

    move/from16 v0, v17

    if-ne v7, v0, :cond_274

    .line 1765
    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v7

    .line 1766
    const/16 v17, 0x2d

    move/from16 v0, v17

    if-ne v7, v0, :cond_17c

    .line 1768
    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->parseComment()V

    .line 1769
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->tokenize:Z

    move/from16 v17, v0

    if-eqz v17, :cond_16b

    const/16 v17, 0x5

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->eventType:I

    goto/16 :goto_66

    .line 1770
    :cond_16b
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->usePC:Z

    move/from16 v17, v0

    if-nez v17, :cond_176

    if-eqz v9, :cond_176

    const/4 v11, 0x1

    .line 1941
    :cond_176
    :goto_176
    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v7

    .line 1942
    goto/16 :goto_da

    .line 1771
    :cond_17c
    const/16 v17, 0x5b

    move/from16 v0, v17

    if-ne v7, v0, :cond_251

    .line 1774
    move-object/from16 v0, p0

    iget v14, v0, Lcom/bea/xml/stream/MXParser;->posStart:I

    .line 1775
    .local v14, "oldStart":I
    move-object/from16 v0, p0

    iget v13, v0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    .line 1776
    .local v13, "oldEnd":I
    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->parseCDATA()V

    .line 1778
    move-object/from16 v0, p0

    iget v6, v0, Lcom/bea/xml/stream/MXParser;->posStart:I

    .line 1779
    .local v6, "cdStart":I
    move-object/from16 v0, p0

    iget v4, v0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    .line 1780
    .local v4, "cdEnd":I
    move-object/from16 v0, p0

    iput v14, v0, Lcom/bea/xml/stream/MXParser;->posStart:I

    .line 1781
    move-object/from16 v0, p0

    iput v13, v0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    .line 1782
    sub-int v5, v4, v6

    .line 1783
    .local v5, "cdLen":I
    if-lez v5, :cond_245

    .line 1784
    if-eqz v9, :cond_23b

    .line 1786
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->usePC:Z

    move/from16 v17, v0

    if-nez v17, :cond_1c0

    .line 1788
    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    move/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->posStart:I

    move/from16 v18, v0

    move/from16 v0, v17

    move/from16 v1, v18

    if-le v0, v1, :cond_224

    .line 1789
    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->joinPC()V

    .line 1795
    :cond_1c0
    :goto_1c0
    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    move/from16 v17, v0

    add-int v17, v17, v5

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->pc:[C

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v18, v0

    move/from16 v0, v17

    move/from16 v1, v18

    if-lt v0, v1, :cond_1e8

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    move/from16 v17, v0

    add-int v17, v17, v5

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/MXParser;->ensurePC(I)V

    .line 1797
    :cond_1e8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->buf:[C

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->pc:[C

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    move/from16 v19, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move/from16 v2, v19

    invoke-static {v0, v6, v1, v2, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1798
    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    move/from16 v17, v0

    add-int v17, v17, v5

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    .line 1804
    :goto_211
    const/4 v9, 0x1

    .line 1809
    :cond_212
    :goto_212
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->reportCdataEvent:Z

    move/from16 v17, v0

    if-eqz v17, :cond_176

    const/16 v17, 0xc

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->eventType:I

    goto/16 :goto_66

    .line 1791
    :cond_224
    const/16 v17, 0x1

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/bea/xml/stream/MXParser;->usePC:Z

    .line 1792
    const/16 v17, 0x0

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->pcStart:I

    goto :goto_1c0

    .line 1800
    :cond_23b
    const/4 v11, 0x1

    .line 1801
    move-object/from16 v0, p0

    iput v6, v0, Lcom/bea/xml/stream/MXParser;->posStart:I

    .line 1802
    move-object/from16 v0, p0

    iput v4, v0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    goto :goto_211

    .line 1806
    :cond_245
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->usePC:Z

    move/from16 v17, v0

    if-nez v17, :cond_212

    if-eqz v9, :cond_212

    const/4 v11, 0x1

    goto :goto_212

    .line 1811
    .end local v4    # "cdEnd":I
    .end local v5    # "cdLen":I
    .end local v6    # "cdStart":I
    .end local v13    # "oldEnd":I
    .end local v14    # "oldStart":I
    :cond_251
    new-instance v17, Ljavax/xml/stream/XMLStreamException;

    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string v19, "unexpected character in markup "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Lcom/bea/xml/stream/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v19

    invoke-direct/range {v17 .. v19}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v17

    .line 1816
    :cond_274
    const/16 v17, 0x3f

    move/from16 v0, v17

    if-ne v7, v0, :cond_29c

    .line 1817
    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->parsePI()Z

    .line 1818
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->tokenize:Z

    move/from16 v17, v0

    if-eqz v17, :cond_28f

    const/16 v17, 0x3

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->eventType:I

    goto/16 :goto_66

    .line 1819
    :cond_28f
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->usePC:Z

    move/from16 v17, v0

    if-nez v17, :cond_176

    if-eqz v9, :cond_176

    const/4 v11, 0x1

    goto/16 :goto_176

    .line 1820
    :cond_29c
    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Lcom/bea/xml/stream/MXParser;->isNameStartChar(C)Z

    move-result v17

    if-eqz v17, :cond_2cc

    .line 1821
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->tokenize:Z

    move/from16 v17, v0

    if-nez v17, :cond_2c0

    if-eqz v9, :cond_2c0

    .line 1822
    const/16 v17, 0x1

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/bea/xml/stream/MXParser;->seenStartTag:Z

    .line 1824
    const/16 v17, 0x4

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->eventType:I

    goto/16 :goto_66

    .line 1826
    :cond_2c0
    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->parseStartTag()I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->eventType:I

    goto/16 :goto_66

    .line 1828
    :cond_2cc
    new-instance v17, Ljavax/xml/stream/XMLStreamException;

    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string v19, "unexpected character in markup "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Lcom/bea/xml/stream/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v19

    invoke-direct/range {v17 .. v19}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v17

    .line 1834
    :cond_2ef
    const/16 v17, 0x26

    move/from16 v0, v17

    if-ne v7, v0, :cond_41b

    .line 1838
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->tokenize:Z

    move/from16 v17, v0

    if-eqz v17, :cond_311

    if-eqz v9, :cond_311

    .line 1839
    const/16 v17, 0x1

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/bea/xml/stream/MXParser;->seenAmpersand:Z

    .line 1840
    const/16 v17, 0x4

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->eventType:I

    goto/16 :goto_66

    .line 1843
    :cond_311
    move-object/from16 v0, p0

    iget v14, v0, Lcom/bea/xml/stream/MXParser;->posStart:I

    .line 1844
    .restart local v14    # "oldStart":I
    move-object/from16 v0, p0

    iget v13, v0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    .line 1845
    .restart local v13    # "oldEnd":I
    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->getConfigurationContext()Lcom/bea/xml/stream/ConfigurationContextBase;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lcom/bea/xml/stream/ConfigurationContextBase;->isReplacingEntities()Z

    move-result v15

    .line 1846
    .local v15, "replace":Z
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/bea/xml/stream/MXParser;->parseEntityRef(Z)[C

    move-result-object v16

    .line 1847
    .local v16, "resolvedEntity":[C
    if-nez v15, :cond_333

    .line 1848
    const/16 v17, 0x9

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->eventType:I

    goto/16 :goto_66

    .line 1850
    :cond_333
    const/16 v17, 0x4

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->eventType:I

    .line 1852
    if-nez v16, :cond_3a2

    .line 1853
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->entityRefName:Ljava/lang/String;

    move-object/from16 v17, v0

    if-nez v17, :cond_371

    .line 1854
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->buf:[C

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->posStart:I

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->posStart:I

    move/from16 v20, v0

    sub-int v19, v19, v20

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move/from16 v2, v18

    move/from16 v3, v19

    invoke-virtual {v0, v1, v2, v3}, Lcom/bea/xml/stream/MXParser;->newString([CII)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/bea/xml/stream/MXParser;->entityRefName:Ljava/lang/String;

    .line 1856
    :cond_371
    new-instance v17, Ljavax/xml/stream/XMLStreamException;

    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string v19, "could not resolve entity named \'"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->entityRefName:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/MXParser;->printable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string v19, "\'"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v19

    invoke-direct/range {v17 .. v19}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v17

    .line 1862
    :cond_3a2
    move-object/from16 v0, p0

    iput v14, v0, Lcom/bea/xml/stream/MXParser;->posStart:I

    .line 1863
    move-object/from16 v0, p0

    iput v13, v0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    .line 1864
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->usePC:Z

    move/from16 v17, v0

    if-nez v17, :cond_3b8

    .line 1865
    if-eqz v9, :cond_401

    .line 1866
    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->joinPC()V

    .line 1867
    const/4 v11, 0x0

    .line 1875
    :cond_3b8
    :goto_3b8
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_3b9
    move-object/from16 v0, v16

    array-length v0, v0

    move/from16 v17, v0

    move/from16 v0, v17

    if-ge v10, v0, :cond_418

    .line 1877
    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    move/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->pc:[C

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v18, v0

    move/from16 v0, v17

    move/from16 v1, v18

    if-lt v0, v1, :cond_3e6

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    move/from16 v17, v0

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/MXParser;->ensurePC(I)V

    .line 1878
    :cond_3e6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->pc:[C

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    move/from16 v18, v0

    add-int/lit8 v19, v18, 0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    aget-char v19, v16, v10

    aput-char v19, v17, v18

    .line 1875
    add-int/lit8 v10, v10, 0x1

    goto :goto_3b9

    .line 1869
    .end local v10    # "i":I
    :cond_401
    const/16 v17, 0x1

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/bea/xml/stream/MXParser;->usePC:Z

    .line 1870
    const/16 v17, 0x0

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->pcStart:I

    goto :goto_3b8

    .line 1883
    .restart local v10    # "i":I
    :cond_418
    const/4 v9, 0x1

    .line 1886
    goto/16 :goto_176

    .line 1888
    .end local v10    # "i":I
    .end local v13    # "oldEnd":I
    .end local v14    # "oldStart":I
    .end local v15    # "replace":Z
    .end local v16    # "resolvedEntity":[C
    :cond_41b
    if-eqz v11, :cond_421

    .line 1890
    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->joinPC()V

    .line 1892
    const/4 v11, 0x0

    .line 1898
    :cond_421
    const/4 v9, 0x1

    .line 1900
    const/4 v12, 0x0

    .line 1906
    .local v12, "normalizedCR":Z
    :cond_423
    const/16 v17, 0xd

    move/from16 v0, v17

    if-ne v7, v0, :cond_4c8

    .line 1907
    const/4 v12, 0x1

    .line 1908
    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pos:I

    move/from16 v17, v0

    add-int/lit8 v17, v17, -0x1

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->posEnd:I

    .line 1910
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->usePC:Z

    move/from16 v17, v0

    if-nez v17, :cond_455

    .line 1911
    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    move/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->posStart:I

    move/from16 v18, v0

    move/from16 v0, v17

    move/from16 v1, v18

    if-le v0, v1, :cond_4b1

    .line 1912
    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->joinPC()V

    .line 1919
    :cond_455
    :goto_455
    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    move/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->pc:[C

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v18, v0

    move/from16 v0, v17

    move/from16 v1, v18

    if-lt v0, v1, :cond_479

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    move/from16 v17, v0

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/MXParser;->ensurePC(I)V

    .line 1920
    :cond_479
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->pc:[C

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    move/from16 v18, v0

    add-int/lit8 v19, v18, 0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    const/16 v19, 0xa

    aput-char v19, v17, v18

    .line 1936
    :goto_491
    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v7

    .line 1937
    const/16 v17, 0x3c

    move/from16 v0, v17

    if-eq v7, v0, :cond_4a1

    const/16 v17, 0x26

    move/from16 v0, v17

    if-ne v7, v0, :cond_423

    .line 1938
    :cond_4a1
    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pos:I

    move/from16 v17, v0

    add-int/lit8 v17, v17, -0x1

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->posEnd:I

    goto/16 :goto_da

    .line 1914
    :cond_4b1
    const/16 v17, 0x1

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/bea/xml/stream/MXParser;->usePC:Z

    .line 1915
    const/16 v17, 0x0

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->pcStart:I

    goto :goto_455

    .line 1921
    :cond_4c8
    const/16 v17, 0xa

    move/from16 v0, v17

    if-ne v7, v0, :cond_517

    .line 1923
    if-nez v12, :cond_514

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->usePC:Z

    move/from16 v17, v0

    if-eqz v17, :cond_514

    .line 1924
    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    move/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->pc:[C

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v18, v0

    move/from16 v0, v17

    move/from16 v1, v18

    if-lt v0, v1, :cond_4fc

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    move/from16 v17, v0

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/MXParser;->ensurePC(I)V

    .line 1925
    :cond_4fc
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->pc:[C

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    move/from16 v18, v0

    add-int/lit8 v19, v18, 0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    const/16 v19, 0xa

    aput-char v19, v17, v18

    .line 1927
    :cond_514
    const/4 v12, 0x0

    .line 1928
    goto/16 :goto_491

    .line 1929
    :cond_517
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->usePC:Z

    move/from16 v17, v0

    if-eqz v17, :cond_559

    .line 1930
    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    move/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->pc:[C

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v18, v0

    move/from16 v0, v17

    move/from16 v1, v18

    if-lt v0, v1, :cond_543

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    move/from16 v17, v0

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/MXParser;->ensurePC(I)V

    .line 1931
    :cond_543
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->pc:[C

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    move/from16 v18, v0

    add-int/lit8 v19, v18, 0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    aput-char v7, v17, v18

    .line 1933
    :cond_559
    const/4 v12, 0x0

    goto/16 :goto_491

    .line 1944
    .end local v7    # "ch":C
    .end local v9    # "hadCharData":Z
    .end local v11    # "needsMerging":Z
    .end local v12    # "normalizedCR":Z
    :cond_55c
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->seenRoot:Z

    move/from16 v17, v0

    if-eqz v17, :cond_56a

    .line 1945
    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->parseEpilog()I

    move-result v17

    goto/16 :goto_66

    .line 1947
    :cond_56a
    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->parseProlog()I
    :try_end_56d
    .catch Ljava/io/EOFException; {:try_start_9d .. :try_end_56d} :catch_8a

    move-result v17

    goto/16 :goto_66
.end method

.method public nextTag()I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 1294
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->next()I

    .line 1300
    :goto_3
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    const/4 v1, 0x6

    if-eq v0, v1, :cond_29

    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    const/4 v1, 0x5

    if-eq v0, v1, :cond_29

    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_29

    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_1d

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->isWhiteSpace()Z

    move-result v0

    if-nez v0, :cond_29

    :cond_1d
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    const/16 v1, 0xc

    if-ne v0, v1, :cond_2d

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->isWhiteSpace()Z

    move-result v0

    if-eqz v0, :cond_2d

    .line 1301
    :cond_29
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->next()I

    goto :goto_3

    .line 1303
    :cond_2d
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_5c

    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_5c

    .line 1304
    new-instance v0, Ljavax/xml/stream/XMLStreamException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "expected XMLStreamConstants.START_ELEMENT or XMLStreamConstants.END_ELEMENT not "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getEventType()I

    move-result v2

    invoke-static {v2}, Lcom/bea/xml/stream/util/ElementTypeNames;->getEventTypeString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v0

    .line 1308
    :cond_5c
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    return v0
.end method

.method public nextText()Ljava/lang/String;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x2

    .line 1266
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getEventType()I

    move-result v2

    const/4 v3, 0x1

    if-eq v2, v3, :cond_14

    .line 1267
    new-instance v2, Ljavax/xml/stream/XMLStreamException;

    const-string v3, "parser must be on START_ELEMENT to read next text"

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v2

    .line 1271
    :cond_14
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->next()I

    move-result v0

    .line 1272
    .local v0, "eventType":I
    const/4 v2, 0x4

    if-ne v0, v2, :cond_4a

    .line 1273
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getText()Ljava/lang/String;

    move-result-object v1

    .line 1274
    .local v1, "result":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->next()I

    move-result v0

    .line 1275
    if-eq v0, v4, :cond_4e

    .line 1276
    new-instance v2, Ljavax/xml/stream/XMLStreamException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "TEXT must be immediately followed by END_ELEMENT and not "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getEventType()I

    move-result v4

    invoke-static {v4}, Lcom/bea/xml/stream/util/ElementTypeNames;->getEventTypeString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v2

    .line 1282
    .end local v1    # "result":Ljava/lang/String;
    :cond_4a
    if-ne v0, v4, :cond_4f

    .line 1283
    const-string v1, ""

    :cond_4e
    return-object v1

    .line 1285
    :cond_4f
    new-instance v2, Ljavax/xml/stream/XMLStreamException;

    const-string v3, "parser must be on START_ELEMENT or TEXT to read text"

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v2
.end method

.method public nextToken()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 1337
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bea/xml/stream/MXParser;->tokenize:Z

    .line 1338
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->nextImpl()I

    move-result v0

    return v0
.end method

.method protected parseAttribute()C
    .registers 30
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 2457
    :try_start_0
    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->posStart:I

    move/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->bufAbsoluteStart:I

    move/from16 v23, v0

    add-int v16, v22, v23

    .line 2458
    .local v16, "prevPosStart":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pos:I

    move/from16 v22, v0

    add-int/lit8 v22, v22, -0x1

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->bufAbsoluteStart:I

    move/from16 v23, v0

    add-int v11, v22, v23

    .line 2459
    .local v11, "nameStart":I
    const/4 v5, -0x1

    .line 2460
    .local v5, "colonPos":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->buf:[C

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pos:I

    move/from16 v23, v0

    add-int/lit8 v23, v23, -0x1

    aget-char v4, v22, v23

    .line 2461
    .local v4, "ch":C
    const/16 v22, 0x3a

    move/from16 v0, v22

    if-ne v4, v0, :cond_5c

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->processNamespaces:Z

    move/from16 v22, v0

    if-eqz v22, :cond_5c

    new-instance v22, Ljavax/xml/stream/XMLStreamException;

    const-string v23, "when namespaces processing enabled colon can not be at attribute name start"

    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v24

    invoke-direct/range {v22 .. v24}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v22
    :try_end_49
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_49} :catch_49

    .line 2741
    .end local v4    # "ch":C
    .end local v5    # "colonPos":I
    .end local v11    # "nameStart":I
    .end local v16    # "prevPosStart":I
    :catch_49
    move-exception v7

    .line 2742
    .local v7, "eofe":Ljava/io/EOFException;
    new-instance v22, Ljavax/xml/stream/XMLStreamException;

    const-string v23, "Unexpected end of stream"

    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v24

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    move-object/from16 v2, v24

    invoke-direct {v0, v1, v2, v7}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;Ljava/lang/Throwable;)V

    throw v22

    .line 2466
    .end local v7    # "eofe":Ljava/io/EOFException;
    .restart local v4    # "ch":C
    .restart local v5    # "colonPos":I
    .restart local v11    # "nameStart":I
    .restart local v16    # "prevPosStart":I
    :cond_5c
    :try_start_5c
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->processNamespaces:Z

    move/from16 v22, v0

    if-eqz v22, :cond_b6

    const/16 v22, 0x78

    move/from16 v0, v22

    if-ne v4, v0, :cond_b6

    const/16 v20, 0x1

    .line 2467
    .local v20, "startsWithXmlns":Z
    :goto_6c
    const/16 v21, 0x0

    .line 2469
    .local v21, "xmlnsPos":I
    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v4

    .line 2470
    :goto_72
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/bea/xml/stream/MXParser;->isNameChar(C)Z

    move-result v22

    if-eqz v22, :cond_11c

    .line 2471
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->processNamespaces:Z

    move/from16 v22, v0

    if-eqz v22, :cond_116

    .line 2472
    if-eqz v20, :cond_9e

    const/16 v22, 0x5

    move/from16 v0, v21

    move/from16 v1, v22

    if-ge v0, v1, :cond_9e

    .line 2473
    add-int/lit8 v21, v21, 0x1

    .line 2474
    const/16 v22, 0x1

    move/from16 v0, v21

    move/from16 v1, v22

    if-ne v0, v1, :cond_b9

    const/16 v22, 0x6d

    move/from16 v0, v22

    if-eq v4, v0, :cond_9e

    const/16 v20, 0x0

    .line 2486
    :cond_9e
    :goto_9e
    const/16 v22, 0x3a

    move/from16 v0, v22

    if-ne v4, v0, :cond_116

    .line 2487
    const/16 v22, -0x1

    move/from16 v0, v22

    if-eq v5, v0, :cond_106

    new-instance v22, Ljavax/xml/stream/XMLStreamException;

    const-string v23, "only one colon is allowed in attribute name when namespaces are enabled"

    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v24

    invoke-direct/range {v22 .. v24}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v22

    .line 2466
    .end local v20    # "startsWithXmlns":Z
    .end local v21    # "xmlnsPos":I
    :cond_b6
    const/16 v20, 0x0

    goto :goto_6c

    .line 2475
    .restart local v20    # "startsWithXmlns":Z
    .restart local v21    # "xmlnsPos":I
    :cond_b9
    const/16 v22, 0x2

    move/from16 v0, v21

    move/from16 v1, v22

    if-ne v0, v1, :cond_ca

    const/16 v22, 0x6c

    move/from16 v0, v22

    if-eq v4, v0, :cond_9e

    const/16 v20, 0x0

    goto :goto_9e

    .line 2476
    :cond_ca
    const/16 v22, 0x3

    move/from16 v0, v21

    move/from16 v1, v22

    if-ne v0, v1, :cond_db

    const/16 v22, 0x6e

    move/from16 v0, v22

    if-eq v4, v0, :cond_9e

    const/16 v20, 0x0

    goto :goto_9e

    .line 2477
    :cond_db
    const/16 v22, 0x4

    move/from16 v0, v21

    move/from16 v1, v22

    if-ne v0, v1, :cond_ec

    const/16 v22, 0x73

    move/from16 v0, v22

    if-eq v4, v0, :cond_9e

    const/16 v20, 0x0

    goto :goto_9e

    .line 2478
    :cond_ec
    const/16 v22, 0x5

    move/from16 v0, v21

    move/from16 v1, v22

    if-ne v0, v1, :cond_9e

    .line 2479
    const/16 v22, 0x3a

    move/from16 v0, v22

    if-eq v4, v0, :cond_9e

    new-instance v22, Ljavax/xml/stream/XMLStreamException;

    const-string v23, "after xmlns in attribute name must be colonwhen namespaces are enabled"

    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v24

    invoke-direct/range {v22 .. v24}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v22

    .line 2491
    :cond_106
    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pos:I

    move/from16 v22, v0

    add-int/lit8 v22, v22, -0x1

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->bufAbsoluteStart:I

    move/from16 v23, v0

    add-int v5, v22, v23

    .line 2494
    :cond_116
    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v4

    .line 2495
    goto/16 :goto_72

    .line 2497
    :cond_11c
    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->attributeCount:I

    move/from16 v22, v0

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/MXParser;->ensureAttributesCapacity(I)V

    .line 2500
    const/4 v10, 0x0

    .line 2501
    .local v10, "name":Ljava/lang/String;
    const/4 v14, 0x0

    .line 2503
    .local v14, "prefix":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->processNamespaces:Z

    move/from16 v22, v0

    if-eqz v22, :cond_266

    .line 2504
    const/16 v22, 0x4

    move/from16 v0, v21

    move/from16 v1, v22

    if-ge v0, v1, :cond_13d

    const/16 v20, 0x0

    .line 2505
    :cond_13d
    if-eqz v20, :cond_189

    .line 2506
    const/16 v22, -0x1

    move/from16 v0, v22

    if-eq v5, v0, :cond_20f

    .line 2508
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->buf:[C

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->bufAbsoluteStart:I

    move/from16 v23, v0

    sub-int v23, v5, v23

    add-int/lit8 v23, v23, 0x1

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pos:I

    move/from16 v24, v0

    add-int/lit8 v24, v24, -0x2

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->bufAbsoluteStart:I

    move/from16 v25, v0

    sub-int v25, v5, v25

    sub-int v24, v24, v25

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move/from16 v2, v23

    move/from16 v3, v24

    invoke-virtual {v0, v1, v2, v3}, Lcom/bea/xml/stream/MXParser;->newString([CII)Ljava/lang/String;

    move-result-object v10

    .line 2519
    const-string v22, "xmlns"

    move-object/from16 v0, v22

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_20f

    .line 2520
    new-instance v22, Ljavax/xml/stream/XMLStreamException;

    const-string v23, "trying to bind reserved NS prefix \'xmlns\'"

    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v24

    invoke-direct/range {v22 .. v24}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v22

    .line 2525
    :cond_189
    const/16 v22, -0x1

    move/from16 v0, v22

    if-eq v5, v0, :cond_21c

    .line 2526
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->attributePrefix:[Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->attributeCount:I

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->buf:[C

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->bufAbsoluteStart:I

    move/from16 v25, v0

    sub-int v25, v11, v25

    sub-int v26, v5, v11

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, v26

    invoke-virtual {v0, v1, v2, v3}, Lcom/bea/xml/stream/MXParser;->newString([CII)Ljava/lang/String;

    move-result-object v14

    .end local v14    # "prefix":Ljava/lang/String;
    aput-object v14, v22, v23

    .line 2530
    .restart local v14    # "prefix":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->attributeName:[Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->attributeCount:I

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->buf:[C

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->bufAbsoluteStart:I

    move/from16 v25, v0

    sub-int v25, v5, v25

    add-int/lit8 v25, v25, 0x1

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pos:I

    move/from16 v26, v0

    add-int/lit8 v26, v26, -0x2

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->bufAbsoluteStart:I

    move/from16 v27, v0

    sub-int v27, v5, v27

    sub-int v26, v26, v27

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, v26

    invoke-virtual {v0, v1, v2, v3}, Lcom/bea/xml/stream/MXParser;->newString([CII)Ljava/lang/String;

    move-result-object v10

    .end local v10    # "name":Ljava/lang/String;
    aput-object v10, v22, v23

    .line 2541
    .restart local v10    # "name":Ljava/lang/String;
    :goto_1f5
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->allStringsInterned:Z

    move/from16 v22, v0

    if-nez v22, :cond_20f

    .line 2542
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->attributeNameHash:[I

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->attributeCount:I

    move/from16 v23, v0

    invoke-virtual {v10}, Ljava/lang/String;->hashCode()I

    move-result v24

    aput v24, v22, v23

    .line 2558
    :cond_20f
    :goto_20f
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/bea/xml/stream/MXParser;->isS(C)Z

    move-result v22

    if-eqz v22, :cond_2bc

    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v4

    goto :goto_20f

    .line 2536
    :cond_21c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->attributePrefix:[Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->attributeCount:I

    move/from16 v23, v0

    const/4 v14, 0x0

    aput-object v14, v22, v23

    .line 2537
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->attributeName:[Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->attributeCount:I

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->buf:[C

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->bufAbsoluteStart:I

    move/from16 v25, v0

    sub-int v25, v11, v25

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pos:I

    move/from16 v26, v0

    add-int/lit8 v26, v26, -0x1

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->bufAbsoluteStart:I

    move/from16 v27, v0

    sub-int v27, v11, v27

    sub-int v26, v26, v27

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, v26

    invoke-virtual {v0, v1, v2, v3}, Lcom/bea/xml/stream/MXParser;->newString([CII)Ljava/lang/String;

    move-result-object v10

    .end local v10    # "name":Ljava/lang/String;
    aput-object v10, v22, v23

    .restart local v10    # "name":Ljava/lang/String;
    goto :goto_1f5

    .line 2548
    :cond_266
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->attributeName:[Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->attributeCount:I

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->buf:[C

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->bufAbsoluteStart:I

    move/from16 v25, v0

    sub-int v25, v11, v25

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pos:I

    move/from16 v26, v0

    add-int/lit8 v26, v26, -0x1

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->bufAbsoluteStart:I

    move/from16 v27, v0

    sub-int v27, v11, v27

    sub-int v26, v26, v27

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, v26

    invoke-virtual {v0, v1, v2, v3}, Lcom/bea/xml/stream/MXParser;->newString([CII)Ljava/lang/String;

    move-result-object v10

    .end local v10    # "name":Ljava/lang/String;
    aput-object v10, v22, v23

    .line 2552
    .restart local v10    # "name":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->allStringsInterned:Z

    move/from16 v22, v0

    if-nez v22, :cond_20f

    .line 2553
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->attributeNameHash:[I

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->attributeCount:I

    move/from16 v23, v0

    invoke-virtual {v10}, Ljava/lang/String;->hashCode()I

    move-result v24

    aput v24, v22, v23

    goto/16 :goto_20f

    .line 2559
    :cond_2bc
    const/16 v22, 0x3d

    move/from16 v0, v22

    if-eq v4, v0, :cond_2ce

    new-instance v22, Ljavax/xml/stream/XMLStreamException;

    const-string v23, "expected = after attribute name"

    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v24

    invoke-direct/range {v22 .. v24}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v22

    .line 2562
    :cond_2ce
    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v4

    .line 2563
    :goto_2d2
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/bea/xml/stream/MXParser;->isS(C)Z

    move-result v22

    if-eqz v22, :cond_2df

    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v4

    goto :goto_2d2

    .line 2567
    :cond_2df
    move v6, v4

    .line 2568
    .local v6, "delimit":C
    const/16 v22, 0x22

    move/from16 v0, v22

    if-eq v6, v0, :cond_30f

    const/16 v22, 0x27

    move/from16 v0, v22

    if-eq v6, v0, :cond_30f

    new-instance v22, Ljavax/xml/stream/XMLStreamException;

    new-instance v23, Ljava/lang/StringBuffer;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuffer;-><init>()V

    const-string v24, "attribute value must start with quotation or apostrophe not "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v23

    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcom/bea/xml/stream/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v24

    invoke-direct/range {v22 .. v24}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v22

    .line 2577
    :cond_30f
    const/4 v12, 0x0

    .line 2578
    .local v12, "normalizedCR":Z
    const/16 v22, 0x0

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/bea/xml/stream/MXParser;->usePC:Z

    .line 2579
    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    move/from16 v22, v0

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->pcStart:I

    .line 2580
    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pos:I

    move/from16 v22, v0

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->posStart:I

    .line 2583
    :goto_330
    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v4

    .line 2584
    if-ne v4, v6, :cond_39b

    .line 2651
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->processNamespaces:Z

    move/from16 v22, v0

    if-eqz v22, :cond_73a

    if-eqz v20, :cond_73a

    .line 2653
    const/4 v13, 0x0

    .line 2654
    .local v13, "ns":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->usePC:Z

    move/from16 v22, v0

    if-nez v22, :cond_5a1

    .line 2655
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->buf:[C

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->posStart:I

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pos:I

    move/from16 v24, v0

    add-int/lit8 v24, v24, -0x1

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->posStart:I

    move/from16 v25, v0

    sub-int v24, v24, v25

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move/from16 v2, v23

    move/from16 v3, v24

    invoke-virtual {v0, v1, v2, v3}, Lcom/bea/xml/stream/MXParser;->newStringIntern([CII)Ljava/lang/String;

    move-result-object v13

    .line 2659
    :goto_371
    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->namespaceEnd:I

    move/from16 v22, v0

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/MXParser;->ensureNamespacesCapacity(I)V

    .line 2660
    const/4 v15, -0x1

    .line 2666
    .local v15, "prefixHash":I
    const-string v22, "http://www.w3.org/XML/1998/namespace"

    move-object/from16 v0, v22

    invoke-virtual {v13, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_5c9

    .line 2667
    const-string v22, "xml"

    move-object/from16 v0, v22

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_5db

    .line 2668
    new-instance v22, Ljavax/xml/stream/XMLStreamException;

    const-string v23, "trying to bind reserved NS URI  \'http://www.w3.org/XML/1998/namespace\' to prefix other than \'xml\'"

    invoke-direct/range {v22 .. v23}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;)V

    throw v22

    .line 2586
    .end local v13    # "ns":Ljava/lang/String;
    .end local v15    # "prefixHash":I
    :cond_39b
    const/16 v22, 0x3c

    move/from16 v0, v22

    if-ne v4, v0, :cond_3ad

    .line 2587
    new-instance v22, Ljavax/xml/stream/XMLStreamException;

    const-string v23, "markup not allowed inside attribute value - illegal < "

    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v24

    invoke-direct/range {v22 .. v24}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v22

    .line 2589
    :cond_3ad
    const/16 v22, 0x26

    move/from16 v0, v22

    if-ne v4, v0, :cond_4bb

    .line 2591
    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pos:I

    move/from16 v22, v0

    add-int/lit8 v22, v22, -0x1

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->posEnd:I

    .line 2592
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->usePC:Z

    move/from16 v22, v0

    if-nez v22, :cond_3e1

    .line 2593
    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    move/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->posStart:I

    move/from16 v23, v0

    move/from16 v0, v22

    move/from16 v1, v23

    if-le v0, v1, :cond_458

    const/4 v8, 0x1

    .line 2594
    .local v8, "hadCharData":Z
    :goto_3dc
    if-eqz v8, :cond_45a

    .line 2596
    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->joinPC()V

    .line 2604
    .end local v8    # "hadCharData":Z
    :cond_3e1
    :goto_3e1
    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->getConfigurationContext()Lcom/bea/xml/stream/ConfigurationContextBase;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Lcom/bea/xml/stream/ConfigurationContextBase;->isReplacingEntities()Z

    move-result v22

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/MXParser;->parseEntityRef(Z)[C

    move-result-object v17

    .line 2606
    .local v17, "resolvedEntity":[C
    if-nez v17, :cond_472

    .line 2607
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->entityRefName:Ljava/lang/String;

    move-object/from16 v22, v0

    if-nez v22, :cond_427

    .line 2608
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->buf:[C

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->posStart:I

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    move/from16 v24, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->posStart:I

    move/from16 v25, v0

    sub-int v24, v24, v25

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move/from16 v2, v23

    move/from16 v3, v24

    invoke-virtual {v0, v1, v2, v3}, Lcom/bea/xml/stream/MXParser;->newString([CII)Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/bea/xml/stream/MXParser;->entityRefName:Ljava/lang/String;

    .line 2610
    :cond_427
    new-instance v22, Ljavax/xml/stream/XMLStreamException;

    new-instance v23, Ljava/lang/StringBuffer;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuffer;-><init>()V

    const-string v24, "could not resolve entity named \'"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->entityRefName:Ljava/lang/String;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/MXParser;->printable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v23

    const-string v24, "\'"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v24

    invoke-direct/range {v22 .. v24}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v22

    .line 2593
    .end local v17    # "resolvedEntity":[C
    :cond_458
    const/4 v8, 0x0

    goto :goto_3dc

    .line 2598
    .restart local v8    # "hadCharData":Z
    :cond_45a
    const/16 v22, 0x1

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/bea/xml/stream/MXParser;->usePC:Z

    .line 2599
    const/16 v22, 0x0

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->pcStart:I

    goto/16 :goto_3e1

    .line 2615
    .end local v8    # "hadCharData":Z
    .restart local v17    # "resolvedEntity":[C
    :cond_472
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_473
    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_53c

    .line 2617
    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    move/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->pc:[C

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    array-length v0, v0

    move/from16 v23, v0

    move/from16 v0, v22

    move/from16 v1, v23

    if-lt v0, v1, :cond_4a0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    move/from16 v22, v0

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/MXParser;->ensurePC(I)V

    .line 2618
    :cond_4a0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->pc:[C

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    move/from16 v23, v0

    add-int/lit8 v24, v23, 0x1

    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    aget-char v24, v17, v9

    aput-char v24, v22, v23

    .line 2615
    add-int/lit8 v9, v9, 0x1

    goto :goto_473

    .line 2621
    .end local v9    # "i":I
    .end local v17    # "resolvedEntity":[C
    :cond_4bb
    const/16 v22, 0x9

    move/from16 v0, v22

    if-eq v4, v0, :cond_4cd

    const/16 v22, 0xa

    move/from16 v0, v22

    if-eq v4, v0, :cond_4cd

    const/16 v22, 0xd

    move/from16 v0, v22

    if-ne v4, v0, :cond_55c

    .line 2626
    :cond_4cd
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->usePC:Z

    move/from16 v22, v0

    if-nez v22, :cond_4f8

    .line 2627
    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pos:I

    move/from16 v22, v0

    add-int/lit8 v22, v22, -0x1

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->posEnd:I

    .line 2628
    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    move/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->posStart:I

    move/from16 v23, v0

    move/from16 v0, v22

    move/from16 v1, v23

    if-le v0, v1, :cond_545

    .line 2629
    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->joinPC()V

    .line 2636
    :cond_4f8
    :goto_4f8
    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    move/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->pc:[C

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    array-length v0, v0

    move/from16 v23, v0

    move/from16 v0, v22

    move/from16 v1, v23

    if-lt v0, v1, :cond_51c

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    move/from16 v22, v0

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/MXParser;->ensurePC(I)V

    .line 2637
    :cond_51c
    const/16 v22, 0xa

    move/from16 v0, v22

    if-ne v4, v0, :cond_524

    if-nez v12, :cond_53c

    .line 2638
    :cond_524
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->pc:[C

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    move/from16 v23, v0

    add-int/lit8 v24, v23, 0x1

    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    const/16 v24, 0x20

    aput-char v24, v22, v23

    .line 2647
    :cond_53c
    :goto_53c
    const/16 v22, 0xd

    move/from16 v0, v22

    if-ne v4, v0, :cond_59f

    const/4 v12, 0x1

    .line 2648
    :goto_543
    goto/16 :goto_330

    .line 2631
    :cond_545
    const/16 v22, 0x1

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/bea/xml/stream/MXParser;->usePC:Z

    .line 2632
    const/16 v22, 0x0

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->pcStart:I

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    goto :goto_4f8

    .line 2642
    :cond_55c
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->usePC:Z

    move/from16 v22, v0

    if-eqz v22, :cond_53c

    .line 2643
    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    move/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->pc:[C

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    array-length v0, v0

    move/from16 v23, v0

    move/from16 v0, v22

    move/from16 v1, v23

    if-lt v0, v1, :cond_588

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    move/from16 v22, v0

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/MXParser;->ensurePC(I)V

    .line 2644
    :cond_588
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->pc:[C

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    move/from16 v23, v0

    add-int/lit8 v24, v23, 0x1

    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    aput-char v4, v22, v23

    goto :goto_53c

    .line 2647
    :cond_59f
    const/4 v12, 0x0

    goto :goto_543

    .line 2657
    .restart local v13    # "ns":Ljava/lang/String;
    :cond_5a1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->pc:[C

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pcStart:I

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    move/from16 v24, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pcStart:I

    move/from16 v25, v0

    sub-int v24, v24, v25

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move/from16 v2, v23

    move/from16 v3, v24

    invoke-virtual {v0, v1, v2, v3}, Lcom/bea/xml/stream/MXParser;->newStringIntern([CII)Ljava/lang/String;

    move-result-object v13

    goto/16 :goto_371

    .line 2670
    .restart local v15    # "prefixHash":I
    :cond_5c9
    const-string v22, "http://www.w3.org/2000/xmlns/"

    move-object/from16 v0, v22

    invoke-virtual {v13, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_5db

    .line 2672
    new-instance v22, Ljavax/xml/stream/XMLStreamException;

    const-string v23, "trying to bind reserved NS URI  \'http://www.w3.org/2000/xmlns/\'"

    invoke-direct/range {v22 .. v23}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;)V

    throw v22

    .line 2675
    :cond_5db
    const/16 v22, -0x1

    move/from16 v0, v22

    if-eq v5, v0, :cond_6cc

    .line 2676
    invoke-virtual {v13}, Ljava/lang/String;->length()I

    move-result v22

    if-nez v22, :cond_5f3

    .line 2677
    new-instance v22, Ljavax/xml/stream/XMLStreamException;

    const-string v23, "non-default namespace can not be declared to be empty string (in xml 1.0)"

    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v24

    invoke-direct/range {v22 .. v24}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v22

    .line 2685
    :cond_5f3
    const-string v22, "xml"

    move-object/from16 v0, v22

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_613

    .line 2686
    const-string v22, "http://www.w3.org/XML/1998/namespace"

    move-object/from16 v0, v22

    invoke-virtual {v13, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_613

    .line 2687
    new-instance v22, Ljavax/xml/stream/XMLStreamException;

    const-string v23, "trying to bind reserved NS prefix \'xml\' to URI other than its standard value (http://www.w3.org/XML/1998/namespace)"

    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v24

    invoke-direct/range {v22 .. v24}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v22

    .line 2693
    :cond_613
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->namespacePrefix:[Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->namespaceEnd:I

    move/from16 v23, v0

    aput-object v10, v22, v23

    .line 2694
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->allStringsInterned:Z

    move/from16 v22, v0

    if-nez v22, :cond_63b

    .line 2695
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->namespacePrefixHash:[I

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->namespaceEnd:I

    move/from16 v23, v0

    invoke-virtual {v10}, Ljava/lang/String;->hashCode()I

    move-result v15

    .end local v15    # "prefixHash":I
    aput v15, v22, v23

    .line 2707
    .restart local v15    # "prefixHash":I
    :cond_63b
    :goto_63b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->namespaceUri:[Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->namespaceEnd:I

    move/from16 v23, v0

    aput-object v13, v22, v23

    .line 2710
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->elNamespaceCount:[I

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->depth:I

    move/from16 v23, v0

    add-int/lit8 v23, v23, -0x1

    aget v19, v22, v23

    .line 2711
    .local v19, "startNs":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->namespaceEnd:I

    move/from16 v22, v0

    add-int/lit8 v9, v22, -0x1

    .restart local v9    # "i":I
    :goto_661
    move/from16 v0, v19

    if-lt v9, v0, :cond_71d

    .line 2713
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->allStringsInterned:Z

    move/from16 v22, v0

    if-nez v22, :cond_66f

    if-nez v10, :cond_67b

    :cond_66f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->namespacePrefix:[Ljava/lang/String;

    move-object/from16 v22, v0

    aget-object v22, v22, v9

    move-object/from16 v0, v22

    if-eq v0, v10, :cond_6a1

    :cond_67b
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->allStringsInterned:Z

    move/from16 v22, v0

    if-nez v22, :cond_719

    if-eqz v10, :cond_719

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->namespacePrefixHash:[I

    move-object/from16 v22, v0

    aget v22, v22, v9

    move/from16 v0, v22

    if-ne v0, v15, :cond_719

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->namespacePrefix:[Ljava/lang/String;

    move-object/from16 v22, v0

    aget-object v22, v22, v9

    move-object/from16 v0, v22

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_719

    .line 2719
    :cond_6a1
    if-nez v10, :cond_6fd

    const-string v18, "default"

    .line 2720
    .local v18, "s":Ljava/lang/String;
    :goto_6a5
    new-instance v22, Ljavax/xml/stream/XMLStreamException;

    new-instance v23, Ljava/lang/StringBuffer;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuffer;-><init>()V

    const-string v24, "duplicated namespace declaration for "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v23

    const-string v24, " prefix"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v24

    invoke-direct/range {v22 .. v24}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v22

    .line 2699
    .end local v9    # "i":I
    .end local v18    # "s":Ljava/lang/String;
    .end local v19    # "startNs":I
    :cond_6cc
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->namespacePrefix:[Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->namespaceEnd:I

    move/from16 v23, v0

    const/16 v24, 0x0

    aput-object v24, v22, v23

    .line 2700
    invoke-virtual {v13}, Ljava/lang/String;->length()I

    move-result v22

    if-nez v22, :cond_6e4

    .line 2701
    sget-object v13, Lcom/bea/xml/stream/MXParser;->NO_NAMESPACE:Ljava/lang/String;

    .line 2703
    :cond_6e4
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->allStringsInterned:Z

    move/from16 v22, v0

    if-nez v22, :cond_63b

    .line 2704
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->namespacePrefixHash:[I

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->namespaceEnd:I

    move/from16 v23, v0

    const/4 v15, -0x1

    aput v15, v22, v23

    goto/16 :goto_63b

    .line 2719
    .restart local v9    # "i":I
    .restart local v19    # "startNs":I
    :cond_6fd
    new-instance v22, Ljava/lang/StringBuffer;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuffer;-><init>()V

    const-string v23, "\'"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v22

    const-string v23, "\'"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    goto :goto_6a5

    .line 2711
    :cond_719
    add-int/lit8 v9, v9, -0x1

    goto/16 :goto_661

    .line 2726
    :cond_71d
    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->namespaceEnd:I

    move/from16 v22, v0

    add-int/lit8 v22, v22, 0x1

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->namespaceEnd:I

    .line 2738
    .end local v9    # "i":I
    .end local v13    # "ns":Ljava/lang/String;
    .end local v15    # "prefixHash":I
    .end local v19    # "startNs":I
    :goto_72b
    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->bufAbsoluteStart:I

    move/from16 v22, v0

    sub-int v22, v16, v22

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->posStart:I

    .line 2739
    return v4

    .line 2729
    :cond_73a
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->usePC:Z

    move/from16 v22, v0

    if-nez v22, :cond_780

    .line 2730
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->attributeValue:[Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->attributeCount:I

    move/from16 v23, v0

    new-instance v24, Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->buf:[C

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->posStart:I

    move/from16 v26, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pos:I

    move/from16 v27, v0

    add-int/lit8 v27, v27, -0x1

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->posStart:I

    move/from16 v28, v0

    sub-int v27, v27, v28

    invoke-direct/range {v24 .. v27}, Ljava/lang/String;-><init>([CII)V

    aput-object v24, v22, v23

    .line 2736
    :goto_771
    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->attributeCount:I

    move/from16 v22, v0

    add-int/lit8 v22, v22, 0x1

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->attributeCount:I

    goto :goto_72b

    .line 2733
    :cond_780
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->attributeValue:[Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->attributeCount:I

    move/from16 v23, v0

    new-instance v24, Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->pc:[C

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pcStart:I

    move/from16 v26, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pcEnd:I

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pcStart:I

    move/from16 v28, v0

    sub-int v27, v27, v28

    invoke-direct/range {v24 .. v27}, Ljava/lang/String;-><init>([CII)V

    aput-object v24, v22, v23
    :try_end_7ad
    .catch Ljava/io/EOFException; {:try_start_5c .. :try_end_7ad} :catch_49

    goto :goto_771
.end method

.method protected parseCDATA()V
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    const/16 v11, 0x41

    const/16 v12, 0xa

    .line 3565
    :try_start_4
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v9

    const/16 v10, 0x43

    if-ne v9, v10, :cond_30

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v9

    const/16 v10, 0x44

    if-ne v9, v10, :cond_30

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v9

    if-ne v9, v11, :cond_30

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v9

    const/16 v10, 0x54

    if-ne v9, v10, :cond_30

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v9

    if-ne v9, v11, :cond_30

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v9

    const/16 v10, 0x5b

    if-eq v9, v10, :cond_49

    .line 3572
    :cond_30
    new-instance v9, Ljavax/xml/stream/XMLStreamException;

    const-string v10, "expected <[CDATA[ for CDATA start"

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v11

    invoke-direct {v9, v10, v11}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v9
    :try_end_3c
    .catch Ljava/io/EOFException; {:try_start_4 .. :try_end_3c} :catch_3c

    .line 3574
    :catch_3c
    move-exception v6

    .line 3575
    .local v6, "eofe":Ljava/io/EOFException;
    new-instance v9, Ljavax/xml/stream/XMLStreamException;

    const-string v10, "Unexpected EOF in directive"

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v11

    invoke-direct {v9, v10, v11, v6}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;Ljava/lang/Throwable;)V

    throw v9

    .line 3581
    .end local v6    # "eofe":Ljava/io/EOFException;
    :cond_49
    iget v9, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    iput v9, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    .line 3582
    iget v5, p0, Lcom/bea/xml/stream/MXParser;->lineNumber:I

    .line 3583
    .local v5, "curLine":I
    iget v4, p0, Lcom/bea/xml/stream/MXParser;->columnNumber:I

    .line 3585
    .local v4, "curColumn":I
    const/4 v2, 0x0

    .line 3586
    .local v2, "bracketCount":I
    const/4 v8, -0x2

    .line 3587
    .local v8, "skipLfAt":I
    const/4 v1, -0x1

    .line 3588
    .local v1, "at":I
    const/4 v0, 0x0

    .line 3591
    .local v0, "anySkipped":Z
    :cond_55
    :goto_55
    add-int/lit8 v1, v1, 0x1

    .line 3592
    :try_start_57
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v3

    .line 3593
    .local v3, "ch":C
    const/16 v9, 0x5d

    if-ne v3, v9, :cond_9e

    .line 3594
    add-int/lit8 v2, v2, 0x1

    .line 3625
    :cond_61
    :goto_61
    if-eqz v0, :cond_55

    .line 3626
    iget-object v9, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    iget v10, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    aput-char v3, v9, v10

    .line 3627
    iget v9, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    add-int/lit8 v9, v9, 0x1

    iput v9, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I
    :try_end_6f
    .catch Ljava/io/EOFException; {:try_start_57 .. :try_end_6f} :catch_70

    goto :goto_55

    .line 3635
    .end local v3    # "ch":C
    :catch_70
    move-exception v7

    .line 3637
    .local v7, "ex":Ljava/io/EOFException;
    new-instance v9, Ljavax/xml/stream/XMLStreamException;

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string v11, "CDATA section on line "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, " and column "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, " was not closed"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v11

    invoke-direct {v9, v10, v11, v7}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;Ljava/lang/Throwable;)V

    throw v9

    .line 3596
    .end local v7    # "ex":Ljava/io/EOFException;
    .restart local v3    # "ch":C
    :cond_9e
    const/16 v9, 0x3e

    if-ne v3, v9, :cond_b0

    .line 3597
    const/4 v9, 0x2

    if-lt v2, v9, :cond_ae

    .line 3630
    if-eqz v0, :cond_d6

    .line 3631
    :try_start_a7
    iget v9, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    add-int/lit8 v9, v9, -0x2

    iput v9, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    .line 3641
    :goto_ad
    return-void

    .line 3600
    :cond_ae
    const/4 v2, 0x0

    .line 3601
    goto :goto_61

    .line 3602
    :cond_b0
    const/4 v2, 0x0

    .line 3603
    const/16 v9, 0xd

    if-ne v3, v9, :cond_ca

    .line 3604
    const/4 v9, 0x1

    iput v9, p0, Lcom/bea/xml/stream/MXParser;->columnNumber:I

    .line 3605
    add-int/lit8 v8, v1, 0x1

    .line 3607
    if-nez v0, :cond_c7

    .line 3608
    iget-object v9, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    iget v10, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    add-int/lit8 v10, v10, -0x1

    const/16 v11, 0xa

    aput-char v11, v9, v10

    goto :goto_55

    .line 3612
    :cond_c7
    const/16 v3, 0xa

    .line 3613
    goto :goto_61

    :cond_ca
    if-ne v3, v12, :cond_61

    .line 3614
    if-ne v8, v1, :cond_61

    .line 3615
    const/4 v0, 0x1

    .line 3616
    iget v9, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    add-int/lit8 v9, v9, -0x1

    iput v9, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    goto :goto_55

    .line 3633
    :cond_d6
    iget v9, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    add-int/lit8 v9, v9, -0x3

    iput v9, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I
    :try_end_dc
    .catch Ljava/io/EOFException; {:try_start_a7 .. :try_end_dc} :catch_70

    goto :goto_ad
.end method

.method protected parseComment()V
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    const/16 v13, 0x2d

    const/16 v12, 0xa

    .line 2941
    :try_start_4
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v2

    .line 2942
    .local v2, "ch":C
    if-eq v2, v13, :cond_23

    .line 2943
    new-instance v9, Ljavax/xml/stream/XMLStreamException;

    const-string v10, "expected <!-- for COMMENT start"

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v11

    invoke-direct {v9, v10, v11}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v9
    :try_end_16
    .catch Ljava/io/EOFException; {:try_start_4 .. :try_end_16} :catch_16

    .line 3008
    .end local v2    # "ch":C
    :catch_16
    move-exception v5

    .line 3009
    .local v5, "eofe":Ljava/io/EOFException;
    new-instance v9, Ljavax/xml/stream/XMLStreamException;

    const-string v10, "Unexpected end of stream"

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v11

    invoke-direct {v9, v10, v11, v5}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;Ljava/lang/Throwable;)V

    throw v9

    .line 2945
    .end local v5    # "eofe":Ljava/io/EOFException;
    .restart local v2    # "ch":C
    :cond_23
    :try_start_23
    iget v9, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    iput v9, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    .line 2947
    iget v4, p0, Lcom/bea/xml/stream/MXParser;->lineNumber:I

    .line 2948
    .local v4, "curLine":I
    iget v3, p0, Lcom/bea/xml/stream/MXParser;->columnNumber:I
    :try_end_2b
    .catch Ljava/io/EOFException; {:try_start_23 .. :try_end_2b} :catch_16

    .line 2950
    .local v3, "curColumn":I
    const/4 v7, -0x2

    .line 2951
    .local v7, "expDash":I
    const/4 v8, -0x2

    .line 2952
    .local v8, "skipLfAt":I
    const/4 v1, -0x1

    .line 2953
    .local v1, "at":I
    const/4 v0, 0x0

    .line 2956
    .local v0, "anySkipped":Z
    :cond_2f
    :goto_2f
    :try_start_2f
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v2

    .line 2957
    add-int/lit8 v1, v1, 0x1

    .line 2959
    if-ne v2, v13, :cond_a1

    .line 2960
    if-ge v7, v1, :cond_78

    .line 2961
    add-int/lit8 v7, v1, 0x1

    .line 2991
    :cond_3b
    :goto_3b
    if-eqz v0, :cond_2f

    .line 2992
    iget-object v9, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    iget v10, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    aput-char v2, v9, v10

    .line 2993
    iget v9, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    add-int/lit8 v9, v9, 0x1

    iput v9, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I
    :try_end_49
    .catch Ljava/io/EOFException; {:try_start_2f .. :try_end_49} :catch_4a

    goto :goto_2f

    .line 3001
    :catch_4a
    move-exception v6

    .line 3003
    .local v6, "ex":Ljava/io/EOFException;
    :try_start_4b
    new-instance v9, Ljavax/xml/stream/XMLStreamException;

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string v11, "COMMENT started on line "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, " and column "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, " was not closed"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v11

    invoke-direct {v9, v10, v11, v6}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;Ljava/lang/Throwable;)V

    throw v9
    :try_end_78
    .catch Ljava/io/EOFException; {:try_start_4b .. :try_end_78} :catch_16

    .line 2963
    .end local v6    # "ex":Ljava/io/EOFException;
    :cond_78
    :try_start_78
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v2

    .line 2964
    const/16 v9, 0x3e

    if-eq v2, v9, :cond_ca

    .line 2965
    new-instance v9, Ljavax/xml/stream/XMLStreamException;

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string v11, "in COMMENT after two dashes (--) next character must be \'>\' not "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {p0, v2}, Lcom/bea/xml/stream/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v11

    invoke-direct {v9, v10, v11}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v9

    .line 2969
    :cond_a1
    const/16 v9, 0xd

    if-ne v2, v9, :cond_bb

    .line 2970
    const/4 v9, 0x1

    iput v9, p0, Lcom/bea/xml/stream/MXParser;->columnNumber:I

    .line 2971
    add-int/lit8 v8, v1, 0x1

    .line 2973
    if-nez v0, :cond_b8

    .line 2974
    iget-object v9, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    iget v10, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    add-int/lit8 v10, v10, -0x1

    const/16 v11, 0xa

    aput-char v11, v9, v10

    goto/16 :goto_2f

    .line 2978
    :cond_b8
    const/16 v2, 0xa

    .line 2979
    goto :goto_3b

    :cond_bb
    if-ne v2, v12, :cond_3b

    .line 2980
    if-ne v8, v1, :cond_3b

    .line 2981
    if-nez v0, :cond_2f

    .line 2982
    const/4 v0, 0x1

    .line 2983
    iget v9, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    add-int/lit8 v9, v9, -0x1

    iput v9, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    goto/16 :goto_2f

    .line 2996
    :cond_ca
    if-eqz v0, :cond_d3

    .line 2997
    iget v9, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    add-int/lit8 v9, v9, -0x1

    iput v9, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    .line 3011
    :goto_d2
    return-void

    .line 2999
    :cond_d3
    iget v9, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    add-int/lit8 v9, v9, -0x3

    iput v9, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I
    :try_end_d9
    .catch Ljava/io/EOFException; {:try_start_78 .. :try_end_d9} :catch_4a

    goto :goto_d2
.end method

.method protected parseDocdecl()V
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    const/16 v11, 0x45

    const/16 v10, 0x43

    const/16 v9, 0x27

    const/16 v8, 0x22

    const/16 v7, 0x53

    .line 3396
    iget v5, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    add-int/lit8 v5, v5, -0x3

    iput v5, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    .line 3399
    :try_start_10
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v5

    const/16 v6, 0x4f

    if-ne v5, v6, :cond_3c

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v5

    if-ne v5, v10, :cond_3c

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v5

    const/16 v6, 0x54

    if-ne v5, v6, :cond_3c

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v5

    const/16 v6, 0x59

    if-ne v5, v6, :cond_3c

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v5

    const/16 v6, 0x50

    if-ne v5, v6, :cond_3c

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v5

    if-eq v5, v11, :cond_55

    .line 3405
    :cond_3c
    new-instance v5, Ljavax/xml/stream/XMLStreamException;

    const-string v6, "expected <!DOCTYPE"

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v5
    :try_end_48
    .catch Ljava/io/EOFException; {:try_start_10 .. :try_end_48} :catch_48

    .line 3506
    :catch_48
    move-exception v2

    .line 3507
    .local v2, "eofe":Ljava/io/EOFException;
    new-instance v5, Ljavax/xml/stream/XMLStreamException;

    const-string v6, "Unexpected end of stream"

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v7

    invoke-direct {v5, v6, v7, v2}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;Ljava/lang/Throwable;)V

    throw v5

    .line 3419
    .end local v2    # "eofe":Ljava/io/EOFException;
    :cond_55
    :try_start_55
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->requireNextS()C

    move-result v1

    .line 3422
    .local v1, "ch":C
    invoke-virtual {p0, v1}, Lcom/bea/xml/stream/MXParser;->isNameStartChar(C)Z

    move-result v5

    if-nez v5, :cond_62

    .line 3423
    invoke-direct {p0, v1}, Lcom/bea/xml/stream/MXParser;->throwNotNameStart(C)V

    .line 3425
    :cond_62
    iget v5, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    add-int/lit8 v5, v5, -0x1

    iget v6, p0, Lcom/bea/xml/stream/MXParser;->bufAbsoluteStart:I

    add-int v3, v5, v6

    .line 3427
    .local v3, "nameStart":I
    :cond_6a
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v1

    .line 3428
    invoke-virtual {p0, v1}, Lcom/bea/xml/stream/MXParser;->isNameChar(C)Z

    move-result v5

    if-nez v5, :cond_6a

    .line 3431
    invoke-virtual {p0, v1}, Lcom/bea/xml/stream/MXParser;->skipS(C)C

    move-result v1

    .line 3433
    if-eq v1, v7, :cond_7e

    const/16 v5, 0x50

    if-ne v1, v5, :cond_148

    .line 3434
    :cond_7e
    if-ne v1, v7, :cond_b0

    .line 3435
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v5

    const/16 v6, 0x59

    if-ne v5, v6, :cond_a4

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v5

    if-ne v5, v7, :cond_a4

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v5

    const/16 v6, 0x54

    if-ne v5, v6, :cond_a4

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v5

    if-ne v5, v11, :cond_a4

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v5

    const/16 v6, 0x4d

    if-eq v5, v6, :cond_111

    .line 3437
    :cond_a4
    new-instance v5, Ljavax/xml/stream/XMLStreamException;

    const-string v6, "expected keyword SYSTEM"

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v5

    .line 3440
    :cond_b0
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v5

    const/16 v6, 0x55

    if-ne v5, v6, :cond_d6

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v5

    const/16 v6, 0x42

    if-ne v5, v6, :cond_d6

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v5

    const/16 v6, 0x4c

    if-ne v5, v6, :cond_d6

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v5

    const/16 v6, 0x49

    if-ne v5, v6, :cond_d6

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v5

    if-eq v5, v10, :cond_e2

    .line 3442
    :cond_d6
    new-instance v5, Ljavax/xml/stream/XMLStreamException;

    const-string v6, "expected keyword PUBLIC"

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v5

    .line 3445
    :cond_e2
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->requireNextS()C

    move-result v4

    .line 3446
    .local v4, "quotChar":C
    if-eq v4, v8, :cond_10b

    if-eq v4, v9, :cond_10b

    .line 3447
    new-instance v5, Ljavax/xml/stream/XMLStreamException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Public identifier has to be enclosed in quotes, not "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p0, v1}, Lcom/bea/xml/stream/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v5

    .line 3449
    :cond_10b
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v1

    if-ne v1, v4, :cond_10b

    .line 3454
    .end local v4    # "quotChar":C
    :cond_111
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->requireNextS()C

    move-result v4

    .line 3455
    .restart local v4    # "quotChar":C
    if-eq v4, v8, :cond_13a

    if-eq v4, v9, :cond_13a

    .line 3456
    new-instance v5, Ljavax/xml/stream/XMLStreamException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "System identifier has to be enclosed in quotes, not "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p0, v1}, Lcom/bea/xml/stream/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v5

    .line 3458
    :cond_13a
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v1

    if-ne v1, v4, :cond_13a

    .line 3462
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v5

    invoke-virtual {p0, v5}, Lcom/bea/xml/stream/MXParser;->skipS(C)C

    move-result v1

    .line 3465
    .end local v4    # "quotChar":C
    :cond_148
    const/16 v5, 0x5b

    if-ne v1, v5, :cond_172

    .line 3466
    iget v5, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    iput v5, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    .line 3467
    const/4 v0, 0x1

    .line 3474
    .local v0, "bracketLevel":I
    :cond_151
    :goto_151
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v1

    .line 3475
    sparse-switch v1, :sswitch_data_1a8

    goto :goto_151

    .line 3489
    :goto_159
    :sswitch_159
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v5

    if-eq v5, v1, :cond_151

    goto :goto_159

    .line 3477
    :sswitch_160
    add-int/lit8 v0, v0, 0x1

    .line 3478
    goto :goto_151

    .line 3480
    :sswitch_163
    add-int/lit8 v0, v0, -0x1

    .line 3481
    goto :goto_151

    .line 3483
    :sswitch_166
    if-gtz v0, :cond_151

    .line 3495
    iget v5, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    add-int/lit8 v5, v5, -0x2

    iput v5, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    .line 3496
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->processDTD()V

    .line 3509
    .end local v0    # "bracketLevel":I
    :cond_171
    return-void

    .line 3499
    :cond_172
    iget v5, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    iput v5, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    iput v5, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    .line 3500
    invoke-virtual {p0, v1}, Lcom/bea/xml/stream/MXParser;->skipS(C)C

    move-result v1

    .line 3501
    const/16 v5, 0x3e

    if-eq v1, v5, :cond_171

    .line 3502
    new-instance v5, Ljavax/xml/stream/XMLStreamException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Expected closing \'>\' after internal DTD subset, not \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p0, v1}, Lcom/bea/xml/stream/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v5
    :try_end_1a7
    .catch Ljava/io/EOFException; {:try_start_55 .. :try_end_1a7} :catch_48

    .line 3475
    nop

    :sswitch_data_1a8
    .sparse-switch
        0x22 -> :sswitch_159
        0x27 -> :sswitch_159
        0x3e -> :sswitch_166
        0x5b -> :sswitch_160
        0x5d -> :sswitch_163
    .end sparse-switch
.end method

.method public parseEndTag()I
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    const/4 v13, 0x2

    .line 2152
    iput v13, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    .line 2155
    :try_start_3
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v1

    .line 2156
    .local v1, "ch":C
    invoke-virtual {p0, v1}, Lcom/bea/xml/stream/MXParser;->isNameStartChar(C)Z

    move-result v11

    if-nez v11, :cond_3b

    .line 2157
    new-instance v11, Ljavax/xml/stream/XMLStreamException;

    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string v13, "expected name start and not "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {p0, v1}, Lcom/bea/xml/stream/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v13

    invoke-direct {v11, v12, v13}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v11
    :try_end_2e
    .catch Ljava/io/EOFException; {:try_start_3 .. :try_end_2e} :catch_2e

    .line 2209
    .end local v1    # "ch":C
    :catch_2e
    move-exception v3

    .line 2210
    .local v3, "eofe":Ljava/io/EOFException;
    new-instance v11, Ljavax/xml/stream/XMLStreamException;

    const-string v12, "Unexpected end of stream"

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v13

    invoke-direct {v11, v12, v13, v3}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;Ljava/lang/Throwable;)V

    throw v11

    .line 2161
    .end local v3    # "eofe":Ljava/io/EOFException;
    .restart local v1    # "ch":C
    :cond_3b
    :try_start_3b
    iget v11, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    add-int/lit8 v11, v11, -0x3

    iput v11, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    .line 2162
    iget v11, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    add-int/lit8 v11, v11, -0x1

    iget v12, p0, Lcom/bea/xml/stream/MXParser;->bufAbsoluteStart:I

    add-int v7, v11, v12

    .line 2164
    .local v7, "nameStart":I
    :cond_49
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v1

    .line 2165
    invoke-virtual {p0, v1}, Lcom/bea/xml/stream/MXParser;->isNameChar(C)Z

    move-result v11

    if-nez v11, :cond_49

    .line 2173
    iget v11, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    add-int/lit8 v5, v11, -0x1

    .line 2174
    .local v5, "last":I
    iget v11, p0, Lcom/bea/xml/stream/MXParser;->bufAbsoluteStart:I

    sub-int v8, v7, v11

    .line 2175
    .local v8, "off":I
    sub-int v6, v5, v8

    .line 2176
    .local v6, "len":I
    iget-object v11, p0, Lcom/bea/xml/stream/MXParser;->elRawName:[[C

    iget v12, p0, Lcom/bea/xml/stream/MXParser;->depth:I

    aget-object v0, v11, v12

    .line 2177
    .local v0, "cbuf":[C
    iget-object v11, p0, Lcom/bea/xml/stream/MXParser;->elRawNameEnd:[I

    iget v12, p0, Lcom/bea/xml/stream/MXParser;->depth:I

    aget v11, v11, v12

    if-eq v11, v6, :cond_ab

    .line 2179
    new-instance v10, Ljava/lang/String;

    const/4 v11, 0x0

    iget-object v12, p0, Lcom/bea/xml/stream/MXParser;->elRawNameEnd:[I

    iget v13, p0, Lcom/bea/xml/stream/MXParser;->depth:I

    aget v12, v12, v13

    invoke-direct {v10, v0, v11, v12}, Ljava/lang/String;-><init>([CII)V

    .line 2180
    .local v10, "startname":Ljava/lang/String;
    new-instance v2, Ljava/lang/String;

    iget-object v11, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    invoke-direct {v2, v11, v8, v6}, Ljava/lang/String;-><init>([CII)V

    .line 2181
    .local v2, "endname":Ljava/lang/String;
    new-instance v11, Ljavax/xml/stream/XMLStreamException;

    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string v13, "end tag name \'"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string v13, "\' must match start tag name \'"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string v13, "\'"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v13

    invoke-direct {v11, v12, v13}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v11

    .line 2185
    .end local v2    # "endname":Ljava/lang/String;
    .end local v10    # "startname":Ljava/lang/String;
    :cond_ab
    const/4 v4, 0x0

    .local v4, "i":I
    move v9, v8

    .end local v8    # "off":I
    .local v9, "off":I
    :goto_ad
    if-ge v4, v6, :cond_fb

    .line 2187
    iget-object v11, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    add-int/lit8 v8, v9, 0x1

    .end local v9    # "off":I
    .restart local v8    # "off":I
    aget-char v11, v11, v9

    aget-char v12, v0, v4

    if-eq v11, v12, :cond_f7

    .line 2189
    new-instance v10, Ljava/lang/String;

    const/4 v11, 0x0

    invoke-direct {v10, v0, v11, v6}, Ljava/lang/String;-><init>([CII)V

    .line 2190
    .restart local v10    # "startname":Ljava/lang/String;
    new-instance v2, Ljava/lang/String;

    iget-object v11, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    sub-int v12, v8, v4

    add-int/lit8 v12, v12, -0x1

    invoke-direct {v2, v11, v12, v6}, Ljava/lang/String;-><init>([CII)V

    .line 2191
    .restart local v2    # "endname":Ljava/lang/String;
    new-instance v11, Ljavax/xml/stream/XMLStreamException;

    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string v13, "end tag name \'"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string v13, "\' must be the same as start tag \'"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string v13, "\'"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v13

    invoke-direct {v11, v12, v13}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v11

    .line 2185
    .end local v2    # "endname":Ljava/lang/String;
    .end local v10    # "startname":Ljava/lang/String;
    :cond_f7
    add-int/lit8 v4, v4, 0x1

    move v9, v8

    .end local v8    # "off":I
    .restart local v9    # "off":I
    goto :goto_ad

    .line 2197
    :cond_fb
    :goto_fb
    invoke-virtual {p0, v1}, Lcom/bea/xml/stream/MXParser;->isS(C)Z

    move-result v11

    if-eqz v11, :cond_106

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v1

    goto :goto_fb

    .line 2198
    :cond_106
    const/16 v11, 0x3e

    if-eq v1, v11, :cond_12b

    new-instance v11, Ljavax/xml/stream/XMLStreamException;

    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string v13, "expected > to finsh end tag not "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {p0, v1}, Lcom/bea/xml/stream/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v13

    invoke-direct {v11, v12, v13}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v11

    .line 2206
    :cond_12b
    iget v11, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    iput v11, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    .line 2207
    const/4 v11, 0x1

    iput-boolean v11, p0, Lcom/bea/xml/stream/MXParser;->pastEndTag:Z
    :try_end_132
    .catch Ljava/io/EOFException; {:try_start_3b .. :try_end_132} :catch_2e

    .line 2213
    return v13
.end method

.method protected parseEntityRef(Z)[C
    .registers 12
    .param p1, "replace"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x2

    const/16 v8, 0x74

    const/16 v7, 0x61

    const/16 v6, 0x3b

    .line 2767
    const/4 v4, 0x0

    :try_start_8
    iput-object v4, p0, Lcom/bea/xml/stream/MXParser;->entityRefName:Ljava/lang/String;

    .line 2768
    iget v4, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    iput v4, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    .line 2769
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v0

    .line 2772
    .local v0, "ch":C
    const/16 v4, 0x23

    if-ne v0, v4, :cond_fc

    .line 2774
    const/4 v1, 0x0

    .line 2775
    .local v1, "charRef":I
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v0

    .line 2776
    const/16 v4, 0x78

    if-ne v0, v4, :cond_b4

    .line 2779
    :cond_1f
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v0

    .line 2780
    if-ne v0, v6, :cond_5d

    .line 2811
    :cond_25
    :goto_25
    iget v4, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    add-int/lit8 v4, v4, -0x1

    iput v4, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    .line 2816
    const/4 v4, 0x0

    invoke-virtual {p0, v1, v4}, Lcom/bea/xml/stream/MXParser;->checkCharValidity(IZ)V

    .line 2818
    const v4, 0xffff

    if-le v1, v4, :cond_f0

    .line 2819
    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->charRefTwoCharBuf:[C

    if-nez v4, :cond_3d

    .line 2820
    const/4 v4, 0x2

    new-array v4, v4, [C

    iput-object v4, p0, Lcom/bea/xml/stream/MXParser;->charRefTwoCharBuf:[C

    .line 2822
    :cond_3d
    const/high16 v4, 0x10000

    sub-int/2addr v1, v4

    .line 2823
    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->charRefTwoCharBuf:[C

    const/4 v5, 0x0

    shr-int/lit8 v6, v1, 0xa

    const v7, 0xd800

    add-int/2addr v6, v7

    int-to-char v6, v6

    aput-char v6, v4, v5

    .line 2824
    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->charRefTwoCharBuf:[C

    const/4 v5, 0x1

    and-int/lit16 v6, v1, 0x3ff

    const v7, 0xdc00

    add-int/2addr v6, v7

    int-to-char v6, v6

    aput-char v6, v4, v5

    .line 2825
    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->charRefTwoCharBuf:[C

    iput-object v4, p0, Lcom/bea/xml/stream/MXParser;->entityValue:[C

    .line 2887
    .end local v1    # "charRef":I
    :goto_5c
    return-object v4

    .line 2783
    .restart local v1    # "charRef":I
    :cond_5d
    shl-int/lit8 v1, v1, 0x4

    .line 2784
    const/16 v4, 0x30

    if-lt v0, v4, :cond_70

    const/16 v4, 0x39

    if-gt v0, v4, :cond_70

    .line 2785
    add-int/lit8 v4, v0, -0x30

    add-int/2addr v1, v4

    .line 2795
    :goto_6a
    const v4, 0x10ffff

    if-le v1, v4, :cond_1f

    goto :goto_25

    .line 2786
    :cond_70
    if-lt v0, v7, :cond_7a

    const/16 v4, 0x66

    if-gt v0, v4, :cond_7a

    .line 2787
    add-int/lit8 v4, v0, -0x57

    add-int/2addr v1, v4

    .line 2788
    goto :goto_6a

    :cond_7a
    const/16 v4, 0x41

    if-lt v0, v4, :cond_86

    const/16 v4, 0x46

    if-gt v0, v4, :cond_86

    .line 2789
    add-int/lit8 v4, v0, -0x37

    add-int/2addr v1, v4

    .line 2790
    goto :goto_6a

    .line 2791
    :cond_86
    new-instance v4, Ljavax/xml/stream/XMLStreamException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "character reference (with hex value) may not contain "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v4
    :try_end_a7
    .catch Ljava/io/EOFException; {:try_start_8 .. :try_end_a7} :catch_a7

    .line 2888
    .end local v0    # "ch":C
    .end local v1    # "charRef":I
    :catch_a7
    move-exception v2

    .line 2889
    .local v2, "eofe":Ljava/io/EOFException;
    new-instance v4, Ljavax/xml/stream/XMLStreamException;

    const-string v5, "Unexpected end of stream"

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v6

    invoke-direct {v4, v5, v6, v2}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;Ljava/lang/Throwable;)V

    throw v4

    .line 2799
    .end local v2    # "eofe":Ljava/io/EOFException;
    .restart local v0    # "ch":C
    .restart local v1    # "charRef":I
    :cond_b4
    const/16 v4, 0x30

    if-lt v0, v4, :cond_cd

    const/16 v4, 0x39

    if-gt v0, v4, :cond_cd

    .line 2800
    mul-int/lit8 v4, v1, 0xa

    add-int/lit8 v5, v0, -0x30

    add-int v1, v4, v5

    .line 2808
    :try_start_c2
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v0

    .line 2809
    const v4, 0x10ffff

    if-le v1, v4, :cond_b4

    goto/16 :goto_25

    .line 2801
    :cond_cd
    if-eq v0, v6, :cond_25

    .line 2804
    new-instance v4, Ljavax/xml/stream/XMLStreamException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "character reference (with decimal value) may not contain "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v4

    .line 2828
    :cond_f0
    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->charRefOneCharBuf:[C

    const/4 v5, 0x0

    int-to-char v6, v1

    aput-char v6, v4, v5

    .line 2829
    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->charRefOneCharBuf:[C

    iput-object v4, p0, Lcom/bea/xml/stream/MXParser;->entityValue:[C

    goto/16 :goto_5c

    .line 2835
    .end local v1    # "charRef":I
    :cond_fc
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v0

    if-ne v0, v6, :cond_fc

    .line 2836
    iget v4, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    add-int/lit8 v4, v4, -0x1

    iput v4, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    .line 2838
    iget v4, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    iget v5, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    sub-int v3, v4, v5

    .line 2839
    .local v3, "len":I
    if-ne v3, v9, :cond_15e

    .line 2840
    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    iget v5, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    aget-char v4, v4, v5

    const/16 v5, 0x6c

    if-ne v4, v5, :cond_137

    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    iget v5, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    add-int/lit8 v5, v5, 0x1

    aget-char v4, v4, v5

    if-ne v4, v8, :cond_137

    .line 2841
    if-nez p1, :cond_12a

    .line 2842
    const-string v4, "<"

    iput-object v4, p0, Lcom/bea/xml/stream/MXParser;->text:Ljava/lang/String;

    .line 2843
    :cond_12a
    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->charRefOneCharBuf:[C

    const/4 v5, 0x0

    const/16 v6, 0x3c

    aput-char v6, v4, v5

    .line 2845
    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->charRefOneCharBuf:[C

    iput-object v4, p0, Lcom/bea/xml/stream/MXParser;->entityValue:[C

    goto/16 :goto_5c

    .line 2851
    :cond_137
    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    iget v5, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    aget-char v4, v4, v5

    const/16 v5, 0x67

    if-ne v4, v5, :cond_215

    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    iget v5, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    add-int/lit8 v5, v5, 0x1

    aget-char v4, v4, v5

    if-ne v4, v8, :cond_215

    .line 2852
    if-nez p1, :cond_151

    .line 2853
    const-string v4, ">"

    iput-object v4, p0, Lcom/bea/xml/stream/MXParser;->text:Ljava/lang/String;

    .line 2854
    :cond_151
    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->charRefOneCharBuf:[C

    const/4 v5, 0x0

    const/16 v6, 0x3e

    aput-char v6, v4, v5

    .line 2856
    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->charRefOneCharBuf:[C

    iput-object v4, p0, Lcom/bea/xml/stream/MXParser;->entityValue:[C

    goto/16 :goto_5c

    .line 2858
    :cond_15e
    const/4 v4, 0x3

    if-ne v3, v4, :cond_194

    .line 2859
    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    iget v5, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    aget-char v4, v4, v5

    if-ne v4, v7, :cond_215

    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    iget v5, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    add-int/lit8 v5, v5, 0x1

    aget-char v4, v4, v5

    const/16 v5, 0x6d

    if-ne v4, v5, :cond_215

    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    iget v5, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    add-int/lit8 v5, v5, 0x2

    aget-char v4, v4, v5

    const/16 v5, 0x70

    if-ne v4, v5, :cond_215

    .line 2861
    if-nez p1, :cond_187

    .line 2862
    const-string v4, "&"

    iput-object v4, p0, Lcom/bea/xml/stream/MXParser;->text:Ljava/lang/String;

    .line 2863
    :cond_187
    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->charRefOneCharBuf:[C

    const/4 v5, 0x0

    const/16 v6, 0x26

    aput-char v6, v4, v5

    .line 2865
    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->charRefOneCharBuf:[C

    iput-object v4, p0, Lcom/bea/xml/stream/MXParser;->entityValue:[C

    goto/16 :goto_5c

    .line 2867
    :cond_194
    const/4 v4, 0x4

    if-ne v3, v4, :cond_215

    .line 2868
    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    iget v5, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    aget-char v4, v4, v5

    if-ne v4, v7, :cond_1d6

    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    iget v5, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    add-int/lit8 v5, v5, 0x1

    aget-char v4, v4, v5

    const/16 v5, 0x70

    if-ne v4, v5, :cond_1d6

    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    iget v5, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    add-int/lit8 v5, v5, 0x2

    aget-char v4, v4, v5

    const/16 v5, 0x6f

    if-ne v4, v5, :cond_1d6

    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    iget v5, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    add-int/lit8 v5, v5, 0x3

    aget-char v4, v4, v5

    const/16 v5, 0x73

    if-ne v4, v5, :cond_1d6

    .line 2870
    if-nez p1, :cond_1c9

    .line 2871
    const-string v4, "\'"

    iput-object v4, p0, Lcom/bea/xml/stream/MXParser;->text:Ljava/lang/String;

    .line 2872
    :cond_1c9
    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->charRefOneCharBuf:[C

    const/4 v5, 0x0

    const/16 v6, 0x27

    aput-char v6, v4, v5

    .line 2874
    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->charRefOneCharBuf:[C

    iput-object v4, p0, Lcom/bea/xml/stream/MXParser;->entityValue:[C

    goto/16 :goto_5c

    .line 2876
    :cond_1d6
    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    iget v5, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    aget-char v4, v4, v5

    const/16 v5, 0x71

    if-ne v4, v5, :cond_215

    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    iget v5, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    add-int/lit8 v5, v5, 0x1

    aget-char v4, v4, v5

    const/16 v5, 0x75

    if-ne v4, v5, :cond_215

    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    iget v5, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    add-int/lit8 v5, v5, 0x2

    aget-char v4, v4, v5

    const/16 v5, 0x6f

    if-ne v4, v5, :cond_215

    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    iget v5, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    add-int/lit8 v5, v5, 0x3

    aget-char v4, v4, v5

    if-ne v4, v8, :cond_215

    .line 2878
    if-nez p1, :cond_208

    .line 2879
    const-string v4, "\""

    iput-object v4, p0, Lcom/bea/xml/stream/MXParser;->text:Ljava/lang/String;

    .line 2880
    :cond_208
    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->charRefOneCharBuf:[C

    const/4 v5, 0x0

    const/16 v6, 0x22

    aput-char v6, v4, v5

    .line 2882
    iget-object v4, p0, Lcom/bea/xml/stream/MXParser;->charRefOneCharBuf:[C

    iput-object v4, p0, Lcom/bea/xml/stream/MXParser;->entityValue:[C

    goto/16 :goto_5c

    .line 2887
    :cond_215
    invoke-virtual {p0, v3}, Lcom/bea/xml/stream/MXParser;->lookupEntityReplacement(I)[C

    move-result-object v4

    iput-object v4, p0, Lcom/bea/xml/stream/MXParser;->entityValue:[C
    :try_end_21b
    .catch Ljava/io/EOFException; {:try_start_c2 .. :try_end_21b} :catch_a7

    goto/16 :goto_5c
.end method

.method protected parseEpilog()I
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x6

    const/4 v8, 0x1

    const/16 v3, 0x8

    .line 2059
    iget v5, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    if-ne v5, v3, :cond_14

    .line 2060
    new-instance v3, Ljavax/xml/stream/XMLStreamException;

    const-string v4, "already reached end document"

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v3

    .line 2064
    :cond_14
    iget-boolean v5, p0, Lcom/bea/xml/stream/MXParser;->reachedEnd:Z

    if-eqz v5, :cond_1b

    .line 2065
    iput v3, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    .line 2139
    :goto_1a
    return v3

    .line 2067
    :cond_1b
    const/4 v2, 0x0

    .line 2071
    .local v2, "gotS":Z
    :try_start_1c
    iget-boolean v5, p0, Lcom/bea/xml/stream/MXParser;->seenMarkup:Z

    if-eqz v5, :cond_49

    .line 2072
    iget-object v5, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    iget v6, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    add-int/lit8 v6, v6, -0x1

    aget-char v0, v5, v6

    .line 2076
    .local v0, "ch":C
    :goto_28
    const/4 v5, 0x0

    iput-boolean v5, p0, Lcom/bea/xml/stream/MXParser;->seenMarkup:Z

    .line 2077
    iget v5, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    add-int/lit8 v5, v5, -0x1

    iput v5, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    .line 2081
    :goto_31
    const/16 v5, 0x3c

    if-ne v0, v5, :cond_12b

    .line 2082
    if-eqz v2, :cond_4e

    iget-boolean v5, p0, Lcom/bea/xml/stream/MXParser;->tokenize:Z

    if-eqz v5, :cond_4e

    .line 2083
    iget v5, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    add-int/lit8 v5, v5, -0x1

    iput v5, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    .line 2084
    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/bea/xml/stream/MXParser;->seenMarkup:Z

    .line 2085
    const/4 v5, 0x6

    iput v5, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    move v3, v4

    goto :goto_1a

    .line 2074
    .end local v0    # "ch":C
    :cond_49
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v0

    .restart local v0    # "ch":C
    goto :goto_28

    .line 2087
    :cond_4e
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v0

    .line 2088
    const/16 v5, 0x3f

    if-ne v0, v5, :cond_62

    .line 2091
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->parsePI()Z

    .line 2092
    iget-boolean v5, p0, Lcom/bea/xml/stream/MXParser;->tokenize:Z

    if-eqz v5, :cond_132

    const/4 v5, 0x3

    iput v5, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    move v3, v5

    goto :goto_1a

    .line 2094
    :cond_62
    const/16 v5, 0x21

    if-ne v0, v5, :cond_be

    .line 2095
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v0

    .line 2096
    const/16 v5, 0x44

    if-ne v0, v5, :cond_7b

    .line 2097
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->parseDocdecl()V

    .line 2098
    iget-boolean v5, p0, Lcom/bea/xml/stream/MXParser;->tokenize:Z

    if-eqz v5, :cond_132

    const/16 v5, 0xb

    iput v5, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    move v3, v5

    goto :goto_1a

    .line 2099
    :cond_7b
    const/16 v5, 0x2d

    if-ne v0, v5, :cond_8b

    .line 2100
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->parseComment()V

    .line 2101
    iget-boolean v5, p0, Lcom/bea/xml/stream/MXParser;->tokenize:Z

    if-eqz v5, :cond_132

    const/4 v5, 0x5

    iput v5, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    move v3, v5

    goto :goto_1a

    .line 2103
    :cond_8b
    new-instance v5, Ljavax/xml/stream/XMLStreamException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "unexpected markup <!"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v5
    :try_end_ac
    .catch Ljava/io/EOFException; {:try_start_1c .. :try_end_ac} :catch_ac

    .line 2133
    .end local v0    # "ch":C
    :catch_ac
    move-exception v1

    .line 2134
    .local v1, "ex":Ljava/io/EOFException;
    iput-boolean v8, p0, Lcom/bea/xml/stream/MXParser;->reachedEnd:Z

    .line 2135
    iget-boolean v5, p0, Lcom/bea/xml/stream/MXParser;->tokenize:Z

    if-eqz v5, :cond_159

    if-eqz v2, :cond_159

    .line 2136
    iget v3, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    iput v3, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    .line 2137
    iput v4, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    move v3, v4

    goto/16 :goto_1a

    .line 2107
    .end local v1    # "ex":Ljava/io/EOFException;
    .restart local v0    # "ch":C
    :cond_be
    const/16 v5, 0x2f

    if-ne v0, v5, :cond_e3

    .line 2108
    :try_start_c2
    new-instance v5, Ljavax/xml/stream/XMLStreamException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "end tag not allowed in epilog but got "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v5

    .line 2111
    :cond_e3
    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParser;->isNameStartChar(C)Z

    move-result v5

    if-eqz v5, :cond_10a

    .line 2112
    new-instance v5, Ljavax/xml/stream/XMLStreamException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "start tag not allowed in epilog but got "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v5

    .line 2116
    :cond_10a
    new-instance v5, Ljavax/xml/stream/XMLStreamException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "in epilog expected ignorable content and not "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v5

    .line 2120
    :cond_12b
    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParser;->isS(C)Z

    move-result v5

    if-eqz v5, :cond_138

    .line 2121
    const/4 v2, 0x1

    .line 2127
    :cond_132
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v0

    .line 2128
    goto/16 :goto_31

    .line 2123
    :cond_138
    new-instance v5, Ljavax/xml/stream/XMLStreamException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "in epilog non whitespace content is not allowed but got "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v5
    :try_end_159
    .catch Ljava/io/EOFException; {:try_start_c2 .. :try_end_159} :catch_ac

    .line 2139
    .end local v0    # "ch":C
    .restart local v1    # "ex":Ljava/io/EOFException;
    :cond_159
    iput v3, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    goto/16 :goto_1a
.end method

.method protected parsePI()Z
    .registers 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    const/16 v14, 0xa

    const/16 v13, 0x3f

    .line 3042
    iget v4, p0, Lcom/bea/xml/stream/MXParser;->lineNumber:I

    .line 3043
    .local v4, "curLine":I
    iget v3, p0, Lcom/bea/xml/stream/MXParser;->columnNumber:I

    .line 3046
    .local v3, "curColumn":I
    const/4 v10, 0x0

    :try_start_9
    iput-object v10, p0, Lcom/bea/xml/stream/MXParser;->piTarget:Ljava/lang/String;

    .line 3047
    const/4 v10, 0x0

    iput-object v10, p0, Lcom/bea/xml/stream/MXParser;->piData:Ljava/lang/String;

    .line 3052
    iget v10, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    iput v10, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    .line 3055
    :cond_12
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v2

    .line 3056
    .local v2, "ch":C
    if-ne v2, v13, :cond_5b

    .line 3068
    :cond_18
    iget v10, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    iget v11, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    sub-int/2addr v10, v11

    add-int/lit8 v8, v10, -0x1

    .line 3070
    .local v8, "len":I
    if-nez v8, :cond_8e

    .line 3071
    new-instance v10, Ljavax/xml/stream/XMLStreamException;

    const-string v11, "processing instruction must have PITarget name"

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v12

    invoke-direct {v10, v11, v12}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v10
    :try_end_2d
    .catch Ljava/io/EOFException; {:try_start_9 .. :try_end_2d} :catch_2d

    .line 3157
    .end local v2    # "ch":C
    .end local v8    # "len":I
    :catch_2d
    move-exception v5

    .line 3159
    .local v5, "ex":Ljava/io/EOFException;
    new-instance v10, Ljavax/xml/stream/XMLStreamException;

    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string v12, "processing instruction started on line "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, v4}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string v12, " and column "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string v12, " was not closed"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v12

    invoke-direct {v10, v11, v12, v5}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;Ljava/lang/Throwable;)V

    throw v10

    .line 3059
    .end local v5    # "ex":Ljava/io/EOFException;
    .restart local v2    # "ch":C
    :cond_5b
    :try_start_5b
    invoke-virtual {p0, v2}, Lcom/bea/xml/stream/MXParser;->isNameChar(C)Z

    move-result v10

    if-nez v10, :cond_12

    .line 3061
    invoke-virtual {p0, v2}, Lcom/bea/xml/stream/MXParser;->isS(C)Z

    move-result v10

    if-nez v10, :cond_18

    .line 3064
    new-instance v10, Ljavax/xml/stream/XMLStreamException;

    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string v12, "unexpected character "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {p0, v2}, Lcom/bea/xml/stream/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string v12, " after processing instruction name; expected a white space or \'?>\'"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v12

    invoke-direct {v10, v11, v12}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v10

    .line 3075
    .restart local v8    # "len":I
    :cond_8e
    new-instance v10, Ljava/lang/String;

    iget-object v11, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    iget v12, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    invoke-direct {v10, v11, v12, v8}, Ljava/lang/String;-><init>([CII)V

    iput-object v10, p0, Lcom/bea/xml/stream/MXParser;->piTarget:Ljava/lang/String;

    .line 3080
    if-eq v2, v13, :cond_9f

    .line 3081
    invoke-virtual {p0, v2}, Lcom/bea/xml/stream/MXParser;->skipS(C)C

    move-result v2

    .line 3084
    :cond_9f
    iget-object v10, p0, Lcom/bea/xml/stream/MXParser;->piTarget:Ljava/lang/String;

    const-string v11, "xml"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    .line 3087
    .local v7, "isXMLDecl":Z
    if-eqz v7, :cond_f4

    .line 3093
    iget v10, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    iget v11, p0, Lcom/bea/xml/stream/MXParser;->bufAbsoluteStart:I

    add-int/2addr v10, v11

    const/4 v11, 0x2

    if-le v10, v11, :cond_bd

    .line 3094
    new-instance v10, Ljavax/xml/stream/XMLStreamException;

    const-string v11, "processing instruction can not have PITarget with reserved name \'xml\'"

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v12

    invoke-direct {v10, v11, v12}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v10

    .line 3097
    :cond_bd
    const-string v10, "xml"

    iget-object v11, p0, Lcom/bea/xml/stream/MXParser;->piTarget:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_d3

    .line 3098
    new-instance v10, Ljavax/xml/stream/XMLStreamException;

    const-string v11, "XMLDecl must have xml name in lowercase"

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v12

    invoke-direct {v10, v11, v12}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v10

    .line 3101
    :cond_d3
    iget v10, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    add-int/lit8 v10, v10, -0x1

    iput v10, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    .line 3102
    invoke-virtual {p0, v2}, Lcom/bea/xml/stream/MXParser;->parseXmlDecl(C)V

    .line 3103
    const/4 v7, 0x1

    .line 3104
    iget v10, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    add-int/lit8 v10, v10, -0x2

    iput v10, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    .line 3154
    :goto_e3
    new-instance v10, Ljava/lang/String;

    iget-object v11, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    iget v12, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    iget v13, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    iget v14, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    sub-int/2addr v13, v14

    invoke-direct {v10, v11, v12, v13}, Ljava/lang/String;-><init>([CII)V

    iput-object v10, p0, Lcom/bea/xml/stream/MXParser;->piData:Ljava/lang/String;

    .line 3155
    return v7

    .line 3106
    :cond_f4
    iget v10, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    add-int/lit8 v10, v10, -0x1

    iput v10, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    .line 3108
    const/4 v6, -0x2

    .line 3109
    .local v6, "expLT":I
    const/4 v9, -0x2

    .line 3110
    .local v9, "skipLfAt":I
    const/4 v1, -0x1

    .line 3111
    .local v1, "at":I
    const/4 v0, 0x0

    .line 3114
    .local v0, "anySkipped":Z
    :goto_fe
    add-int/lit8 v1, v1, 0x1

    .line 3115
    if-ne v2, v13, :cond_117

    .line 3116
    add-int/lit8 v6, v1, 0x1

    .line 3143
    :cond_104
    :goto_104
    if-eqz v0, :cond_112

    .line 3144
    iget-object v10, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    iget v11, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    aput-char v2, v10, v11

    .line 3145
    iget v10, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    add-int/lit8 v10, v10, 0x1

    iput v10, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    .line 3113
    :cond_112
    :goto_112
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v2

    goto :goto_fe

    .line 3117
    :cond_117
    const/16 v10, 0x3e

    if-ne v2, v10, :cond_126

    .line 3118
    if-ne v1, v6, :cond_104

    .line 3148
    if-eqz v0, :cond_14d

    .line 3149
    iget v10, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    add-int/lit8 v10, v10, -0x1

    iput v10, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    goto :goto_e3

    .line 3121
    :cond_126
    const/16 v10, 0xd

    if-ne v2, v10, :cond_13f

    .line 3122
    const/4 v10, 0x1

    iput v10, p0, Lcom/bea/xml/stream/MXParser;->columnNumber:I

    .line 3123
    add-int/lit8 v9, v1, 0x1

    .line 3125
    if-nez v0, :cond_13c

    .line 3126
    iget-object v10, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    iget v11, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    add-int/lit8 v11, v11, -0x1

    const/16 v12, 0xa

    aput-char v12, v10, v11

    goto :goto_112

    .line 3130
    :cond_13c
    const/16 v2, 0xa

    .line 3131
    goto :goto_104

    :cond_13f
    if-ne v2, v14, :cond_104

    .line 3132
    if-ne v9, v1, :cond_104

    .line 3133
    if-nez v0, :cond_112

    .line 3134
    const/4 v0, 0x1

    .line 3135
    iget v10, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    add-int/lit8 v10, v10, -0x1

    iput v10, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    goto :goto_112

    .line 3151
    :cond_14d
    iget v10, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    add-int/lit8 v10, v10, -0x2

    iput v10, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I
    :try_end_153
    .catch Ljava/io/EOFException; {:try_start_5b .. :try_end_153} :catch_2d

    goto :goto_e3
.end method

.method protected parseProlog()I
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x7

    .line 1965
    :try_start_1
    iget-boolean v5, p0, Lcom/bea/xml/stream/MXParser;->seenMarkup:Z

    if-eqz v5, :cond_2f

    .line 1966
    iget-object v5, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    iget v6, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    add-int/lit8 v6, v6, -0x1

    aget-char v0, v5, v6

    .line 1971
    .local v0, "ch":C
    :goto_d
    iget v5, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    if-ne v5, v4, :cond_3d

    .line 1975
    const v5, 0xfffe

    if-ne v0, v5, :cond_34

    .line 1976
    new-instance v4, Ljavax/xml/stream/XMLStreamException;

    const-string v5, "first character in input was UNICODE noncharacter (0xFFFE)- input requires int swapping"

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v4
    :try_end_22
    .catch Ljava/io/EOFException; {:try_start_1 .. :try_end_22} :catch_22

    .line 2051
    .end local v0    # "ch":C
    :catch_22
    move-exception v1

    .line 2052
    .local v1, "eofe":Ljava/io/EOFException;
    new-instance v4, Ljavax/xml/stream/XMLStreamException;

    const-string v5, "Unexpected end of stream"

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v6

    invoke-direct {v4, v5, v6, v1}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;Ljava/lang/Throwable;)V

    throw v4

    .line 1968
    .end local v1    # "eofe":Ljava/io/EOFException;
    :cond_2f
    :try_start_2f
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v0

    .restart local v0    # "ch":C
    goto :goto_d

    .line 1981
    :cond_34
    const v5, 0xfeff

    if-ne v0, v5, :cond_3d

    .line 1983
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v0

    .line 1986
    :cond_3d
    const/4 v5, 0x0

    iput-boolean v5, p0, Lcom/bea/xml/stream/MXParser;->seenMarkup:Z

    .line 1987
    const/4 v2, 0x0

    .line 1988
    .local v2, "gotS":Z
    iget v5, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    add-int/lit8 v5, v5, -0x1

    iput v5, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    .line 1994
    :goto_47
    const/16 v5, 0x3c

    if-ne v0, v5, :cond_128

    .line 1995
    if-eqz v2, :cond_5e

    iget-boolean v5, p0, Lcom/bea/xml/stream/MXParser;->tokenize:Z

    if-eqz v5, :cond_5e

    .line 1996
    iget v4, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    add-int/lit8 v4, v4, -0x1

    iput v4, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    .line 1997
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/bea/xml/stream/MXParser;->seenMarkup:Z

    .line 1998
    const/4 v4, 0x6

    iput v4, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    .line 2035
    :goto_5d
    return v4

    .line 2000
    :cond_5e
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v0

    .line 2001
    const/16 v5, 0x3f

    if-ne v0, v5, :cond_78

    .line 2004
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->parsePI()Z

    move-result v3

    .line 2005
    .local v3, "isXMLDecl":Z
    iget-boolean v5, p0, Lcom/bea/xml/stream/MXParser;->tokenize:Z

    if-eqz v5, :cond_12f

    .line 2006
    if-eqz v3, :cond_74

    .line 2007
    const/4 v5, 0x7

    iput v5, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    goto :goto_5d

    .line 2008
    :cond_74
    const/4 v4, 0x3

    iput v4, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    goto :goto_5d

    .line 2010
    .end local v3    # "isXMLDecl":Z
    :cond_78
    const/16 v5, 0x21

    if-ne v0, v5, :cond_d3

    .line 2011
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v0

    .line 2012
    const/16 v5, 0x44

    if-ne v0, v5, :cond_a3

    .line 2013
    iget-boolean v5, p0, Lcom/bea/xml/stream/MXParser;->seenDocdecl:Z

    if-eqz v5, :cond_94

    .line 2014
    new-instance v4, Ljavax/xml/stream/XMLStreamException;

    const-string v5, "only one docdecl allowed in XML document"

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v4

    .line 2018
    :cond_94
    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/bea/xml/stream/MXParser;->seenDocdecl:Z

    .line 2019
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->parseDocdecl()V

    .line 2020
    iget-boolean v5, p0, Lcom/bea/xml/stream/MXParser;->tokenize:Z

    if-eqz v5, :cond_12f

    const/16 v4, 0xb

    iput v4, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    goto :goto_5d

    .line 2021
    :cond_a3
    const/16 v5, 0x2d

    if-ne v0, v5, :cond_b2

    .line 2022
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->parseComment()V

    .line 2023
    iget-boolean v5, p0, Lcom/bea/xml/stream/MXParser;->tokenize:Z

    if-eqz v5, :cond_12f

    const/4 v4, 0x5

    iput v4, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    goto :goto_5d

    .line 2025
    :cond_b2
    new-instance v4, Ljavax/xml/stream/XMLStreamException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "unexpected markup <!"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v4

    .line 2029
    :cond_d3
    const/16 v4, 0x2f

    if-ne v0, v4, :cond_f8

    .line 2030
    new-instance v4, Ljavax/xml/stream/XMLStreamException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "expected start tag name and not "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v4

    .line 2033
    :cond_f8
    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParser;->isNameStartChar(C)Z

    move-result v4

    if-eqz v4, :cond_107

    .line 2034
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/bea/xml/stream/MXParser;->seenRoot:Z

    .line 2035
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->parseStartTag()I

    move-result v4

    goto/16 :goto_5d

    .line 2037
    :cond_107
    new-instance v4, Ljavax/xml/stream/XMLStreamException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "expected start tag name and not "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v4

    .line 2041
    :cond_128
    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParser;->isS(C)Z

    move-result v5

    if-eqz v5, :cond_135

    .line 2042
    const/4 v2, 0x1

    .line 2048
    :cond_12f
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v0

    .line 2049
    goto/16 :goto_47

    .line 2044
    :cond_135
    new-instance v4, Ljavax/xml/stream/XMLStreamException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "only whitespace content allowed before start tag and not "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v4
    :try_end_156
    .catch Ljava/io/EOFException; {:try_start_2f .. :try_end_156} :catch_22
.end method

.method public parseStartTag()I
    .registers 26
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 2225
    const/16 v19, 0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->eventType:I

    .line 2229
    :try_start_8
    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->depth:I

    move/from16 v19, v0

    add-int/lit8 v19, v19, 0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->depth:I

    .line 2231
    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pos:I

    move/from16 v19, v0

    add-int/lit8 v19, v19, -0x2

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->posStart:I

    .line 2233
    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/bea/xml/stream/MXParser;->emptyElementTag:Z

    .line 2234
    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->attributeCount:I

    .line 2235
    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->localNamespaceEnd:I

    .line 2237
    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pos:I

    move/from16 v19, v0

    add-int/lit8 v19, v19, -0x1

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->bufAbsoluteStart:I

    move/from16 v20, v0

    add-int v16, v19, v20

    .line 2238
    .local v16, "nameStart":I
    const/4 v9, -0x1

    .line 2239
    .local v9, "colonPos":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->buf:[C

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pos:I

    move/from16 v20, v0

    add-int/lit8 v20, v20, -0x1

    aget-char v8, v19, v20

    .line 2240
    .local v8, "ch":C
    const/16 v19, 0x3a

    move/from16 v0, v19

    if-ne v8, v0, :cond_9a

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->processNamespaces:Z

    move/from16 v19, v0

    if-eqz v19, :cond_9a

    new-instance v19, Ljavax/xml/stream/XMLStreamException;

    const-string v20, "when namespaces processing enabled colon can not be at element name start"

    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v21

    invoke-direct/range {v19 .. v21}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v19
    :try_end_77
    .catch Ljava/io/EOFException; {:try_start_8 .. :try_end_77} :catch_77

    .line 2412
    .end local v8    # "ch":C
    .end local v9    # "colonPos":I
    .end local v16    # "nameStart":I
    :catch_77
    move-exception v11

    .line 2413
    .local v11, "eofe":Ljava/io/EOFException;
    new-instance v19, Ljavax/xml/stream/XMLStreamException;

    const-string v20, "Unexpected end of stream"

    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v21

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v2, v11}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;Ljava/lang/Throwable;)V

    throw v19

    .line 2250
    .end local v11    # "eofe":Ljava/io/EOFException;
    .restart local v8    # "ch":C
    .restart local v9    # "colonPos":I
    .restart local v16    # "nameStart":I
    :cond_8a
    :try_start_8a
    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pos:I

    move/from16 v19, v0

    add-int/lit8 v19, v19, -0x1

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->bufAbsoluteStart:I

    move/from16 v20, v0

    add-int v9, v19, v20

    .line 2244
    :cond_9a
    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v8

    .line 2245
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/bea/xml/stream/MXParser;->isNameChar(C)Z

    move-result v19

    if-nez v19, :cond_220

    .line 2255
    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->ensureElementsCapacity()V

    .line 2260
    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pos:I

    move/from16 v19, v0

    add-int/lit8 v19, v19, -0x1

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->bufAbsoluteStart:I

    move/from16 v20, v0

    sub-int v20, v16, v20

    sub-int v10, v19, v20

    .line 2261
    .local v10, "elLen":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->elRawName:[[C

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->depth:I

    move/from16 v20, v0

    aget-object v19, v19, v20

    if-eqz v19, :cond_e2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->elRawName:[[C

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->depth:I

    move/from16 v20, v0

    aget-object v19, v19, v20

    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v19, v0

    move/from16 v0, v19

    if-ge v0, v10, :cond_f8

    .line 2262
    :cond_e2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->elRawName:[[C

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->depth:I

    move/from16 v20, v0

    mul-int/lit8 v21, v10, 0x2

    move/from16 v0, v21

    new-array v0, v0, [C

    move-object/from16 v21, v0

    aput-object v21, v19, v20

    .line 2264
    :cond_f8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->buf:[C

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->bufAbsoluteStart:I

    move/from16 v20, v0

    sub-int v20, v16, v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->elRawName:[[C

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->depth:I

    move/from16 v22, v0

    aget-object v21, v21, v22

    const/16 v22, 0x0

    move-object/from16 v0, v19

    move/from16 v1, v20

    move-object/from16 v2, v21

    move/from16 v3, v22

    invoke-static {v0, v1, v2, v3, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2265
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->elRawNameEnd:[I

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->depth:I

    move/from16 v20, v0

    aput v10, v19, v20

    .line 2267
    const/4 v15, 0x0

    .line 2270
    .local v15, "name":Ljava/lang/String;
    const/16 v17, 0x0

    .line 2271
    .local v17, "prefix":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->processNamespaces:Z

    move/from16 v19, v0

    if-eqz v19, :cond_278

    .line 2272
    const/16 v19, -0x1

    move/from16 v0, v19

    if-eq v9, v0, :cond_240

    .line 2273
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->elPrefix:[Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->depth:I

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->buf:[C

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->bufAbsoluteStart:I

    move/from16 v22, v0

    sub-int v22, v16, v22

    sub-int v23, v9, v16

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move/from16 v2, v22

    move/from16 v3, v23

    invoke-virtual {v0, v1, v2, v3}, Lcom/bea/xml/stream/MXParser;->newString([CII)Ljava/lang/String;

    move-result-object v17

    .end local v17    # "prefix":Ljava/lang/String;
    aput-object v17, v19, v20

    .line 2275
    .restart local v17    # "prefix":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->elName:[Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->depth:I

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->buf:[C

    move-object/from16 v21, v0

    add-int/lit8 v22, v9, 0x1

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->bufAbsoluteStart:I

    move/from16 v23, v0

    sub-int v22, v22, v23

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pos:I

    move/from16 v23, v0

    add-int/lit8 v23, v23, -0x2

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->bufAbsoluteStart:I

    move/from16 v24, v0

    sub-int v24, v9, v24

    sub-int v23, v23, v24

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move/from16 v2, v22

    move/from16 v3, v23

    invoke-virtual {v0, v1, v2, v3}, Lcom/bea/xml/stream/MXParser;->newString([CII)Ljava/lang/String;

    move-result-object v15

    .end local v15    # "name":Ljava/lang/String;
    aput-object v15, v19, v20

    .line 2287
    .restart local v15    # "name":Ljava/lang/String;
    :goto_1a6
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/bea/xml/stream/MXParser;->isS(C)Z

    move-result v12

    .line 2288
    .local v12, "gotS":Z
    if-eqz v12, :cond_1ba

    .line 2289
    :cond_1ae
    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v8

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/bea/xml/stream/MXParser;->isS(C)Z

    move-result v19

    if-nez v19, :cond_1ae

    .line 2291
    :cond_1ba
    const/16 v19, 0x3e

    move/from16 v0, v19

    if-ne v8, v0, :cond_2a0

    .line 2315
    :cond_1c0
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->processNamespaces:Z

    move/from16 v19, v0

    if-eqz v19, :cond_46b

    .line 2316
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/MXParser;->getNamespaceURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 2317
    .local v18, "uri":Ljava/lang/String;
    if-nez v18, :cond_1d6

    .line 2318
    if-nez v17, :cond_324

    .line 2319
    sget-object v18, Lcom/bea/xml/stream/MXParser;->NO_NAMESPACE:Ljava/lang/String;

    .line 2327
    :cond_1d6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->elUri:[Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->depth:I

    move/from16 v20, v0

    aput-object v18, v19, v20

    .line 2335
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_1e5
    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->attributeCount:I

    move/from16 v19, v0

    move/from16 v0, v19

    if-ge v13, v0, :cond_35c

    .line 2337
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->attributePrefix:[Ljava/lang/String;

    move-object/from16 v19, v0

    aget-object v6, v19, v13

    .line 2338
    .local v6, "attrPrefix":Ljava/lang/String;
    if-eqz v6, :cond_351

    .line 2339
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcom/bea/xml/stream/MXParser;->getNamespaceURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 2340
    .local v7, "attrUri":Ljava/lang/String;
    if-nez v7, :cond_345

    .line 2341
    new-instance v19, Ljavax/xml/stream/XMLStreamException;

    new-instance v20, Ljava/lang/StringBuffer;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuffer;-><init>()V

    const-string v21, "could not determine namespace bound to attribute prefix "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v21

    invoke-direct/range {v19 .. v21}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v19

    .line 2246
    .end local v6    # "attrPrefix":Ljava/lang/String;
    .end local v7    # "attrUri":Ljava/lang/String;
    .end local v10    # "elLen":I
    .end local v12    # "gotS":Z
    .end local v13    # "i":I
    .end local v15    # "name":Ljava/lang/String;
    .end local v17    # "prefix":Ljava/lang/String;
    .end local v18    # "uri":Ljava/lang/String;
    :cond_220
    const/16 v19, 0x3a

    move/from16 v0, v19

    if-ne v8, v0, :cond_9a

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->processNamespaces:Z

    move/from16 v19, v0

    if-eqz v19, :cond_9a

    .line 2247
    const/16 v19, -0x1

    move/from16 v0, v19

    if-eq v9, v0, :cond_8a

    new-instance v19, Ljavax/xml/stream/XMLStreamException;

    const-string v20, "only one colon is allowed in name of element when namespaces are enabled"

    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v21

    invoke-direct/range {v19 .. v21}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v19

    .line 2279
    .restart local v10    # "elLen":I
    .restart local v15    # "name":Ljava/lang/String;
    .restart local v17    # "prefix":Ljava/lang/String;
    :cond_240
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->elPrefix:[Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->depth:I

    move/from16 v20, v0

    const/16 v17, 0x0

    aput-object v17, v19, v20

    .line 2280
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->elName:[Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->depth:I

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->buf:[C

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->bufAbsoluteStart:I

    move/from16 v22, v0

    sub-int v22, v16, v22

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move/from16 v2, v22

    invoke-virtual {v0, v1, v2, v10}, Lcom/bea/xml/stream/MXParser;->newString([CII)Ljava/lang/String;

    move-result-object v15

    .end local v15    # "name":Ljava/lang/String;
    aput-object v15, v19, v20

    .line 2282
    .restart local v15    # "name":Ljava/lang/String;
    goto/16 :goto_1a6

    .line 2283
    :cond_278
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->elName:[Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->depth:I

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->buf:[C

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->bufAbsoluteStart:I

    move/from16 v22, v0

    sub-int v22, v16, v22

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move/from16 v2, v22

    invoke-virtual {v0, v1, v2, v10}, Lcom/bea/xml/stream/MXParser;->newString([CII)Ljava/lang/String;

    move-result-object v15

    .end local v15    # "name":Ljava/lang/String;
    aput-object v15, v19, v20

    .restart local v15    # "name":Ljava/lang/String;
    goto/16 :goto_1a6

    .line 2293
    .restart local v12    # "gotS":Z
    :cond_2a0
    const/16 v19, 0x2f

    move/from16 v0, v19

    if-ne v8, v0, :cond_2db

    .line 2294
    const/16 v19, 0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/bea/xml/stream/MXParser;->emptyElementTag:Z

    .line 2295
    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v8

    .line 2296
    const/16 v19, 0x3e

    move/from16 v0, v19

    if-eq v8, v0, :cond_1c0

    new-instance v19, Ljavax/xml/stream/XMLStreamException;

    new-instance v20, Ljava/lang/StringBuffer;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuffer;-><init>()V

    const-string v21, "expected > to end empty tag not "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/bea/xml/stream/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v21

    invoke-direct/range {v19 .. v21}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v19

    .line 2299
    :cond_2db
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/bea/xml/stream/MXParser;->isNameStartChar(C)Z

    move-result v19

    if-eqz v19, :cond_301

    .line 2300
    if-nez v12, :cond_2f7

    .line 2301
    const/16 v19, 0x3e

    move/from16 v0, v19

    if-eq v8, v0, :cond_2f7

    new-instance v19, Ljavax/xml/stream/XMLStreamException;

    const-string v20, "expected a white space between attributes"

    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v21

    invoke-direct/range {v19 .. v21}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v19

    .line 2303
    :cond_2f7
    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->parseAttribute()C

    move-result v8

    .line 2304
    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v8

    .line 2305
    goto/16 :goto_1a6

    .line 2307
    :cond_301
    new-instance v19, Ljavax/xml/stream/XMLStreamException;

    new-instance v20, Ljava/lang/StringBuffer;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuffer;-><init>()V

    const-string v21, "start tag unexpected character "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/bea/xml/stream/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v21

    invoke-direct/range {v19 .. v21}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v19

    .line 2321
    .restart local v18    # "uri":Ljava/lang/String;
    :cond_324
    new-instance v19, Ljavax/xml/stream/XMLStreamException;

    new-instance v20, Ljava/lang/StringBuffer;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuffer;-><init>()V

    const-string v21, "could not determine namespace bound to element prefix "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v21

    invoke-direct/range {v19 .. v21}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v19

    .line 2346
    .restart local v6    # "attrPrefix":Ljava/lang/String;
    .restart local v7    # "attrUri":Ljava/lang/String;
    .restart local v13    # "i":I
    :cond_345
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->attributeUri:[Ljava/lang/String;

    move-object/from16 v19, v0

    aput-object v7, v19, v13

    .line 2335
    .end local v7    # "attrUri":Ljava/lang/String;
    :goto_34d
    add-int/lit8 v13, v13, 0x1

    goto/16 :goto_1e5

    .line 2348
    :cond_351
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->attributeUri:[Ljava/lang/String;

    move-object/from16 v19, v0

    sget-object v20, Lcom/bea/xml/stream/MXParser;->NO_NAMESPACE:Ljava/lang/String;

    aput-object v20, v19, v13

    goto :goto_34d

    .line 2356
    .end local v6    # "attrPrefix":Ljava/lang/String;
    :cond_35c
    const/4 v13, 0x1

    :goto_35d
    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->attributeCount:I

    move/from16 v19, v0

    move/from16 v0, v19

    if-ge v13, v0, :cond_50e

    .line 2358
    const/4 v14, 0x0

    .local v14, "j":I
    :goto_368
    if-ge v14, v13, :cond_467

    .line 2360
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->attributeUri:[Ljava/lang/String;

    move-object/from16 v19, v0

    aget-object v19, v19, v14

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->attributeUri:[Ljava/lang/String;

    move-object/from16 v20, v0

    aget-object v20, v20, v13

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    if-ne v0, v1, :cond_463

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->allStringsInterned:Z

    move/from16 v19, v0

    if-eqz v19, :cond_39e

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->attributeName:[Ljava/lang/String;

    move-object/from16 v19, v0

    aget-object v19, v19, v14

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->attributeName:[Ljava/lang/String;

    move-object/from16 v20, v0

    aget-object v20, v20, v13

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_3d2

    :cond_39e
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->allStringsInterned:Z

    move/from16 v19, v0

    if-nez v19, :cond_463

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->attributeNameHash:[I

    move-object/from16 v19, v0

    aget v19, v19, v14

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->attributeNameHash:[I

    move-object/from16 v20, v0

    aget v20, v20, v13

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_463

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->attributeName:[Ljava/lang/String;

    move-object/from16 v19, v0

    aget-object v19, v19, v14

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->attributeName:[Ljava/lang/String;

    move-object/from16 v20, v0

    aget-object v20, v20, v13

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_463

    .line 2367
    :cond_3d2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->attributeName:[Ljava/lang/String;

    move-object/from16 v19, v0

    aget-object v4, v19, v14

    .line 2368
    .local v4, "attr1":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->attributeUri:[Ljava/lang/String;

    move-object/from16 v19, v0

    aget-object v19, v19, v14

    if-eqz v19, :cond_405

    new-instance v19, Ljava/lang/StringBuffer;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->attributeUri:[Ljava/lang/String;

    move-object/from16 v20, v0

    aget-object v20, v20, v14

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    const-string v20, ":"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 2369
    :cond_405
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->attributeName:[Ljava/lang/String;

    move-object/from16 v19, v0

    aget-object v5, v19, v13

    .line 2370
    .local v5, "attr2":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->attributeUri:[Ljava/lang/String;

    move-object/from16 v19, v0

    aget-object v19, v19, v13

    if-eqz v19, :cond_438

    new-instance v19, Ljava/lang/StringBuffer;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->attributeUri:[Ljava/lang/String;

    move-object/from16 v20, v0

    aget-object v20, v20, v13

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    const-string v20, ":"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 2371
    :cond_438
    new-instance v19, Ljavax/xml/stream/XMLStreamException;

    new-instance v20, Ljava/lang/StringBuffer;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuffer;-><init>()V

    const-string v21, "duplicated attributes "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    const-string v21, " and "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v21

    invoke-direct/range {v19 .. v21}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v19

    .line 2358
    .end local v4    # "attr1":Ljava/lang/String;
    .end local v5    # "attr2":Ljava/lang/String;
    :cond_463
    add-int/lit8 v14, v14, 0x1

    goto/16 :goto_368

    .line 2356
    :cond_467
    add-int/lit8 v13, v13, 0x1

    goto/16 :goto_35d

    .line 2383
    .end local v13    # "i":I
    .end local v14    # "j":I
    .end local v18    # "uri":Ljava/lang/String;
    :cond_46b
    const/4 v13, 0x1

    .restart local v13    # "i":I
    :goto_46c
    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->attributeCount:I

    move/from16 v19, v0

    move/from16 v0, v19

    if-ge v13, v0, :cond_50e

    .line 2385
    const/4 v14, 0x0

    .restart local v14    # "j":I
    :goto_477
    if-ge v14, v13, :cond_50a

    .line 2387
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->allStringsInterned:Z

    move/from16 v19, v0

    if-eqz v19, :cond_497

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->attributeName:[Ljava/lang/String;

    move-object/from16 v19, v0

    aget-object v19, v19, v14

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->attributeName:[Ljava/lang/String;

    move-object/from16 v20, v0

    aget-object v20, v20, v13

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_4cb

    :cond_497
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/bea/xml/stream/MXParser;->allStringsInterned:Z

    move/from16 v19, v0

    if-nez v19, :cond_506

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->attributeNameHash:[I

    move-object/from16 v19, v0

    aget v19, v19, v14

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->attributeNameHash:[I

    move-object/from16 v20, v0

    aget v20, v20, v13

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_506

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->attributeName:[Ljava/lang/String;

    move-object/from16 v19, v0

    aget-object v19, v19, v14

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->attributeName:[Ljava/lang/String;

    move-object/from16 v20, v0

    aget-object v20, v20, v13

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_506

    .line 2394
    :cond_4cb
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->attributeName:[Ljava/lang/String;

    move-object/from16 v19, v0

    aget-object v4, v19, v14

    .line 2395
    .restart local v4    # "attr1":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->attributeName:[Ljava/lang/String;

    move-object/from16 v19, v0

    aget-object v5, v19, v13

    .line 2396
    .restart local v5    # "attr2":Ljava/lang/String;
    new-instance v19, Ljavax/xml/stream/XMLStreamException;

    new-instance v20, Ljava/lang/StringBuffer;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuffer;-><init>()V

    const-string v21, "duplicated attributes "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    const-string v21, " and "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {p0 .. p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v21

    invoke-direct/range {v19 .. v21}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v19

    .line 2385
    .end local v4    # "attr1":Ljava/lang/String;
    .end local v5    # "attr2":Ljava/lang/String;
    :cond_506
    add-int/lit8 v14, v14, 0x1

    goto/16 :goto_477

    .line 2383
    :cond_50a
    add-int/lit8 v13, v13, 0x1

    goto/16 :goto_46c

    .line 2404
    .end local v14    # "j":I
    :cond_50e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->elNamespaceCount:[I

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->depth:I

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->namespaceEnd:I

    move/from16 v21, v0

    aput v21, v19, v20

    .line 2405
    move-object/from16 v0, p0

    iget v0, v0, Lcom/bea/xml/stream/MXParser;->pos:I

    move/from16 v19, v0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/bea/xml/stream/MXParser;->posEnd:I

    .line 2407
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bea/xml/stream/MXParser;->defaultAttributes:Ljava/util/HashMap;

    move-object/from16 v19, v0

    if-eqz v19, :cond_55c

    .line 2408
    if-eqz v17, :cond_55f

    .line 2409
    new-instance v19, Ljava/lang/StringBuffer;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    const-string v20, ":"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/MXParser;->addDefaultAttributes(Ljava/lang/String;)V

    .line 2416
    :cond_55c
    :goto_55c
    const/16 v19, 0x1

    return v19

    .line 2411
    :cond_55f
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/bea/xml/stream/MXParser;->addDefaultAttributes(Ljava/lang/String;)V
    :try_end_564
    .catch Ljava/io/EOFException; {:try_start_8a .. :try_end_564} :catch_77

    goto :goto_55c
.end method

.method protected parseXmlDecl(C)V
    .registers 9
    .param p1, "ch"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 3230
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/MXParser;->skipS(C)C

    move-result p1

    .line 3231
    sget-object v4, Lcom/bea/xml/stream/MXParser;->VERSION:[C

    invoke-virtual {p0, p1, v4}, Lcom/bea/xml/stream/MXParser;->requireInput(C[C)C

    move-result p1

    .line 3233
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/MXParser;->skipS(C)C

    move-result p1

    .line 3234
    const/16 v4, 0x3d

    if-eq p1, v4, :cond_40

    .line 3235
    new-instance v4, Ljavax/xml/stream/XMLStreamException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "expected equals sign (=) after version and not "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v4
    :try_end_33
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_33} :catch_33

    .line 3262
    :catch_33
    move-exception v0

    .line 3263
    .local v0, "eofe":Ljava/io/EOFException;
    new-instance v4, Ljavax/xml/stream/XMLStreamException;

    const-string v5, "Unexpected end of stream"

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v6

    invoke-direct {v4, v5, v6, v0}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;Ljava/lang/Throwable;)V

    throw v4

    .line 3238
    .end local v0    # "eofe":Ljava/io/EOFException;
    :cond_40
    :try_start_40
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result p1

    .line 3239
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/MXParser;->skipS(C)C

    move-result p1

    .line 3240
    const/16 v4, 0x27

    if-eq p1, v4, :cond_71

    const/16 v4, 0x22

    if-eq p1, v4, :cond_71

    .line 3241
    new-instance v4, Ljavax/xml/stream/XMLStreamException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "expected apostrophe (\') or quotation mark (\") after version and not "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v4

    .line 3245
    :cond_71
    move v1, p1

    .line 3246
    .local v1, "quotChar":C
    iget v3, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    .line 3247
    .local v3, "versionStart":I
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result p1

    .line 3249
    :goto_78
    if-eq p1, v1, :cond_c8

    .line 3250
    const/16 v4, 0x61

    if-lt p1, v4, :cond_82

    const/16 v4, 0x7a

    if-le p1, v4, :cond_c3

    :cond_82
    const/16 v4, 0x41

    if-lt p1, v4, :cond_8a

    const/16 v4, 0x5a

    if-le p1, v4, :cond_c3

    :cond_8a
    const/16 v4, 0x30

    if-lt p1, v4, :cond_92

    const/16 v4, 0x39

    if-le p1, v4, :cond_c3

    :cond_92
    const/16 v4, 0x5f

    if-eq p1, v4, :cond_c3

    const/16 v4, 0x2e

    if-eq p1, v4, :cond_c3

    const/16 v4, 0x3a

    if-eq p1, v4, :cond_c3

    const/16 v4, 0x2d

    if-eq p1, v4, :cond_c3

    .line 3253
    new-instance v4, Ljavax/xml/stream/XMLStreamException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "<?xml version value expected to be in ([a-zA-Z0-9_.:] | \'-\') not "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v4

    .line 3257
    :cond_c3
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result p1

    .line 3258
    goto :goto_78

    .line 3259
    :cond_c8
    iget v4, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    add-int/lit8 v2, v4, -0x1

    .line 3260
    .local v2, "versionEnd":I
    invoke-virtual {p0, v3, v2}, Lcom/bea/xml/stream/MXParser;->parseXmlDeclWithVersion(II)V
    :try_end_cf
    .catch Ljava/io/EOFException; {:try_start_40 .. :try_end_cf} :catch_33

    .line 3265
    return-void
.end method

.method protected parseXmlDeclWithVersion(II)V
    .registers 15
    .param p1, "versionStart"    # I
    .param p2, "versionEnd"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    const/16 v11, 0x27

    const/16 v10, 0x22

    const/16 v9, 0x3f

    .line 3275
    sub-int v6, p2, p1

    const/4 v7, 0x3

    if-ne v6, v7, :cond_27

    :try_start_b
    iget-object v6, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    aget-char v6, v6, p1

    const/16 v7, 0x31

    if-ne v6, v7, :cond_27

    iget-object v6, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    add-int/lit8 v7, p1, 0x1

    aget-char v6, v6, v7

    const/16 v7, 0x2e

    if-ne v6, v7, :cond_27

    iget-object v6, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    add-int/lit8 v7, p1, 0x2

    aget-char v6, v6, v7

    const/16 v7, 0x30

    if-eq v6, v7, :cond_62

    .line 3280
    :cond_27
    new-instance v6, Ljavax/xml/stream/XMLStreamException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "only 1.0 is supported as <?xml version not \'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    new-instance v8, Ljava/lang/String;

    iget-object v9, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    invoke-direct {v8, v9, p1, p2}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {p0, v8}, Lcom/bea/xml/stream/MXParser;->printable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string v8, "\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v6
    :try_end_55
    .catch Ljava/io/EOFException; {:try_start_b .. :try_end_55} :catch_55

    .line 3387
    :catch_55
    move-exception v3

    .line 3388
    .local v3, "eofe":Ljava/io/EOFException;
    new-instance v6, Ljavax/xml/stream/XMLStreamException;

    const-string v7, "Unexpected end of stream"

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v8

    invoke-direct {v6, v7, v8, v3}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;Ljava/lang/Throwable;)V

    throw v6

    .line 3284
    .end local v3    # "eofe":Ljava/io/EOFException;
    :cond_62
    :try_start_62
    new-instance v6, Ljava/lang/String;

    iget-object v7, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    sub-int v8, p2, p1

    invoke-direct {v6, v7, p1, v8}, Ljava/lang/String;-><init>([CII)V

    iput-object v6, p0, Lcom/bea/xml/stream/MXParser;->xmlVersion:Ljava/lang/String;

    .line 3287
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v0

    .line 3288
    .local v0, "ch":C
    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParser;->skipS(C)C

    move-result v0

    .line 3289
    if-eq v0, v9, :cond_255

    .line 3290
    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParser;->skipS(C)C

    move-result v0

    .line 3292
    sget-object v6, Lcom/bea/xml/stream/MXParser;->ENCODING:[C

    const/4 v7, 0x0

    aget-char v6, v6, v7

    if-ne v0, v6, :cond_17c

    .line 3293
    sget-object v6, Lcom/bea/xml/stream/MXParser;->ENCODING:[C

    invoke-virtual {p0, v0, v6}, Lcom/bea/xml/stream/MXParser;->requireInput(C[C)C

    move-result v0

    .line 3294
    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParser;->skipS(C)C

    move-result v0

    .line 3295
    const/16 v6, 0x3d

    if-eq v0, v6, :cond_b1

    .line 3296
    new-instance v6, Ljavax/xml/stream/XMLStreamException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "expected equals sign (=) after encoding and not "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v6

    .line 3299
    :cond_b1
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v0

    .line 3300
    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParser;->skipS(C)C

    move-result v0

    .line 3301
    if-eq v0, v11, :cond_de

    if-eq v0, v10, :cond_de

    .line 3302
    new-instance v6, Ljavax/xml/stream/XMLStreamException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "expected apostrophe (\') or quotation mark (\") after encoding and not "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v6

    .line 3306
    :cond_de
    move v4, v0

    .line 3307
    .local v4, "quotChar":C
    iget v2, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    .line 3308
    .local v2, "encodingStart":I
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v0

    .line 3310
    const/16 v6, 0x61

    if-lt v0, v6, :cond_ed

    const/16 v6, 0x7a

    if-le v0, v6, :cond_116

    :cond_ed
    const/16 v6, 0x41

    if-lt v0, v6, :cond_f5

    const/16 v6, 0x5a

    if-le v0, v6, :cond_116

    .line 3312
    :cond_f5
    new-instance v6, Ljavax/xml/stream/XMLStreamException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "<?xml encoding name expected to start with [A-Za-z] not "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v6

    .line 3316
    :cond_116
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v0

    .line 3317
    :goto_11a
    if-eq v0, v4, :cond_166

    .line 3318
    const/16 v6, 0x61

    if-lt v0, v6, :cond_124

    const/16 v6, 0x7a

    if-le v0, v6, :cond_161

    :cond_124
    const/16 v6, 0x41

    if-lt v0, v6, :cond_12c

    const/16 v6, 0x5a

    if-le v0, v6, :cond_161

    :cond_12c
    const/16 v6, 0x30

    if-lt v0, v6, :cond_134

    const/16 v6, 0x39

    if-le v0, v6, :cond_161

    :cond_134
    const/16 v6, 0x2e

    if-eq v0, v6, :cond_161

    const/16 v6, 0x5f

    if-eq v0, v6, :cond_161

    const/16 v6, 0x2d

    if-eq v0, v6, :cond_161

    .line 3321
    new-instance v6, Ljavax/xml/stream/XMLStreamException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "<?xml encoding value expected to be in ([A-Za-z0-9._] | \'-\') not "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v6

    .line 3325
    :cond_161
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v0

    .line 3326
    goto :goto_11a

    .line 3327
    :cond_166
    iget v6, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    add-int/lit8 v1, v6, -0x1

    .line 3330
    .local v1, "encodingEnd":I
    iget-object v6, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    sub-int v7, v1, v2

    invoke-virtual {p0, v6, v2, v7}, Lcom/bea/xml/stream/MXParser;->newString([CII)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/bea/xml/stream/MXParser;->charEncodingScheme:Ljava/lang/String;

    .line 3331
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v0

    .line 3332
    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParser;->skipS(C)C

    move-result v0

    .line 3335
    .end local v1    # "encodingEnd":I
    .end local v2    # "encodingStart":I
    .end local v4    # "quotChar":C
    :cond_17c
    if-eq v0, v9, :cond_255

    .line 3336
    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParser;->skipS(C)C

    move-result v0

    .line 3337
    sget-object v6, Lcom/bea/xml/stream/MXParser;->STANDALONE:[C

    invoke-virtual {p0, v0, v6}, Lcom/bea/xml/stream/MXParser;->requireInput(C[C)C

    move-result v0

    .line 3338
    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParser;->skipS(C)C

    move-result v0

    .line 3339
    const/16 v6, 0x3d

    if-eq v0, v6, :cond_1b1

    .line 3340
    new-instance v6, Ljavax/xml/stream/XMLStreamException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "expected equals sign (=) after standalone and not "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v6

    .line 3344
    :cond_1b1
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v0

    .line 3345
    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParser;->skipS(C)C

    move-result v0

    .line 3346
    if-eq v0, v11, :cond_1de

    if-eq v0, v10, :cond_1de

    .line 3347
    new-instance v6, Ljavax/xml/stream/XMLStreamException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "expected apostrophe (\') or quotation mark (\") after encoding and not "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v6

    .line 3351
    :cond_1de
    move v4, v0

    .line 3352
    .restart local v4    # "quotChar":C
    iget v5, p0, Lcom/bea/xml/stream/MXParser;->pos:I

    .line 3353
    .local v5, "standaloneStart":I
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v0

    .line 3354
    const/16 v6, 0x79

    if-ne v0, v6, :cond_222

    .line 3355
    sget-object v6, Lcom/bea/xml/stream/MXParser;->YES:[C

    invoke-virtual {p0, v0, v6}, Lcom/bea/xml/stream/MXParser;->requireInput(C[C)C

    move-result v0

    .line 3356
    const/4 v6, 0x1

    iput-boolean v6, p0, Lcom/bea/xml/stream/MXParser;->standalone:Z

    .line 3365
    :goto_1f2
    const/4 v6, 0x1

    iput-boolean v6, p0, Lcom/bea/xml/stream/MXParser;->standaloneSet:Z

    .line 3366
    if-eq v0, v4, :cond_251

    .line 3367
    new-instance v6, Ljavax/xml/stream/XMLStreamException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "expected "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string v8, " after standalone value not "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v6

    .line 3357
    :cond_222
    const/16 v6, 0x6e

    if-ne v0, v6, :cond_230

    .line 3358
    sget-object v6, Lcom/bea/xml/stream/MXParser;->NO:[C

    invoke-virtual {p0, v0, v6}, Lcom/bea/xml/stream/MXParser;->requireInput(C[C)C

    move-result v0

    .line 3359
    const/4 v6, 0x0

    iput-boolean v6, p0, Lcom/bea/xml/stream/MXParser;->standalone:Z

    goto :goto_1f2

    .line 3361
    :cond_230
    new-instance v6, Ljavax/xml/stream/XMLStreamException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "expected \'yes\' or \'no\' after standalone and not "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v6

    .line 3371
    :cond_251
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v0

    .line 3374
    .end local v4    # "quotChar":C
    .end local v5    # "standaloneStart":I
    :cond_255
    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParser;->skipS(C)C

    move-result v0

    .line 3375
    if-eq v0, v9, :cond_27c

    .line 3376
    new-instance v6, Ljavax/xml/stream/XMLStreamException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "expected ?> as last part of <?xml not "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v6

    .line 3380
    :cond_27c
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C

    move-result v0

    .line 3381
    const/16 v6, 0x3e

    if-eq v0, v6, :cond_2a5

    .line 3382
    new-instance v6, Ljavax/xml/stream/XMLStreamException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "expected ?> as last part of <?xml not "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v6
    :try_end_2a5
    .catch Ljava/io/EOFException; {:try_start_62 .. :try_end_2a5} :catch_55

    .line 3390
    :cond_2a5
    return-void
.end method

.method protected printable(C)Ljava/lang/String;
    .registers 4
    .param p1, "ch"    # C

    .prologue
    .line 3728
    const/16 v0, 0xa

    if-ne p1, v0, :cond_7

    .line 3729
    const-string v0, "\\n"

    .line 3739
    :goto_6
    return-object v0

    .line 3730
    :cond_7
    const/16 v0, 0xd

    if-ne p1, v0, :cond_e

    .line 3731
    const-string v0, "\\r"

    goto :goto_6

    .line 3732
    :cond_e
    const/16 v0, 0x9

    if-ne p1, v0, :cond_15

    .line 3733
    const-string v0, "\\t"

    goto :goto_6

    .line 3734
    :cond_15
    const/16 v0, 0x27

    if-ne p1, v0, :cond_1c

    .line 3735
    const-string v0, "\\\'"

    goto :goto_6

    .line 3736
    :cond_1c
    const/16 v0, 0x7f

    if-gt p1, v0, :cond_24

    const/16 v0, 0x20

    if-ge p1, v0, :cond_3c

    .line 3737
    :cond_24
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "\\u"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_6

    .line 3739
    :cond_3c
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method

.method protected printable(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 3743
    if-nez p1, :cond_4

    const/4 v2, 0x0

    .line 3749
    :goto_3
    return-object v2

    .line 3744
    :cond_4
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 3745
    .local v0, "buf":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_a
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_1e

    .line 3746
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {p0, v2}, Lcom/bea/xml/stream/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 3745
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 3748
    :cond_1e
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    move-object v2, p1

    .line 3749
    goto :goto_3
.end method

.method protected processDTD()V
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 3515
    :try_start_0
    new-instance v6, Ljava/lang/String;

    iget-object v10, p0, Lcom/bea/xml/stream/MXParser;->buf:[C

    iget v11, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    iget v12, p0, Lcom/bea/xml/stream/MXParser;->posEnd:I

    iget v13, p0, Lcom/bea/xml/stream/MXParser;->posStart:I

    sub-int/2addr v12, v13

    invoke-direct {v6, v10, v11, v12}, Ljava/lang/String;-><init>([CII)V

    .line 3516
    .local v6, "internalDTD":Ljava/lang/String;
    new-instance v2, Lcom/wutka/dtd/DTDParser;

    new-instance v10, Ljava/io/StringReader;

    invoke-direct {v10, v6}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v10}, Lcom/wutka/dtd/DTDParser;-><init>(Ljava/io/Reader;)V

    .line 3517
    .local v2, "dtdParser":Lcom/wutka/dtd/DTDParser;
    invoke-virtual {v2}, Lcom/wutka/dtd/DTDParser;->parse()Lcom/wutka/dtd/DTD;

    move-result-object v10

    iput-object v10, p0, Lcom/bea/xml/stream/MXParser;->mDtdIntSubset:Lcom/wutka/dtd/DTD;

    .line 3519
    iget-object v11, p0, Lcom/bea/xml/stream/MXParser;->mDtdIntSubset:Lcom/wutka/dtd/DTD;

    sget-object v10, Lcom/bea/xml/stream/MXParser;->class$com$wutka$dtd$DTDEntity:Ljava/lang/Class;

    if-nez v10, :cond_59

    const-string v10, "com.wutka.dtd.DTDEntity"

    invoke-static {v10}, Lcom/bea/xml/stream/MXParser;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v10

    sput-object v10, Lcom/bea/xml/stream/MXParser;->class$com$wutka$dtd$DTDEntity:Ljava/lang/Class;

    :goto_2c
    invoke-virtual {v11, v10}, Lcom/wutka/dtd/DTD;->getItemsByType(Ljava/lang/Class;)Ljava/util/Vector;

    move-result-object v9

    .line 3520
    .local v9, "v":Ljava/util/Vector;
    invoke-virtual {v9}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v3

    .line 3521
    .local v3, "e":Ljava/util/Enumeration;
    :cond_34
    :goto_34
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v10

    if-eqz v10, :cond_5c

    .line 3522
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/wutka/dtd/DTDEntity;

    .line 3523
    .local v4, "entity":Lcom/wutka/dtd/DTDEntity;
    invoke-virtual {v4}, Lcom/wutka/dtd/DTDEntity;->isParsed()Z

    move-result v10

    if-nez v10, :cond_34

    .line 3524
    invoke-virtual {v4}, Lcom/wutka/dtd/DTDEntity;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4}, Lcom/wutka/dtd/DTDEntity;->getValue()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {p0, v10, v11}, Lcom/bea/xml/stream/MXParser;->defineEntityReplacementText(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_51
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_51} :catch_52

    goto :goto_34

    .line 3544
    .end local v2    # "dtdParser":Lcom/wutka/dtd/DTDParser;
    .end local v3    # "e":Ljava/util/Enumeration;
    .end local v4    # "entity":Lcom/wutka/dtd/DTDEntity;
    .end local v6    # "internalDTD":Ljava/lang/String;
    .end local v9    # "v":Ljava/util/Vector;
    :catch_52
    move-exception v7

    .line 3547
    .local v7, "ioe":Ljava/io/IOException;
    new-instance v10, Ljavax/xml/stream/XMLStreamException;

    invoke-direct {v10, v7}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/Throwable;)V

    throw v10

    .line 3519
    .end local v7    # "ioe":Ljava/io/IOException;
    .restart local v2    # "dtdParser":Lcom/wutka/dtd/DTDParser;
    .restart local v6    # "internalDTD":Ljava/lang/String;
    :cond_59
    :try_start_59
    sget-object v10, Lcom/bea/xml/stream/MXParser;->class$com$wutka$dtd$DTDEntity:Ljava/lang/Class;

    goto :goto_2c

    .line 3530
    .restart local v3    # "e":Ljava/util/Enumeration;
    .restart local v9    # "v":Ljava/util/Vector;
    :cond_5c
    iget-object v11, p0, Lcom/bea/xml/stream/MXParser;->mDtdIntSubset:Lcom/wutka/dtd/DTD;

    sget-object v10, Lcom/bea/xml/stream/MXParser;->class$com$wutka$dtd$DTDAttlist:Ljava/lang/Class;

    if-nez v10, :cond_a5

    const-string v10, "com.wutka.dtd.DTDAttlist"

    invoke-static {v10}, Lcom/bea/xml/stream/MXParser;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v10

    sput-object v10, Lcom/bea/xml/stream/MXParser;->class$com$wutka$dtd$DTDAttlist:Ljava/lang/Class;

    :goto_6a
    invoke-virtual {v11, v10}, Lcom/wutka/dtd/DTD;->getItemsByType(Ljava/lang/Class;)Ljava/util/Vector;

    move-result-object v9

    .line 3531
    invoke-virtual {v9}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v3

    .line 3532
    :cond_72
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v10

    if-eqz v10, :cond_a8

    .line 3533
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/wutka/dtd/DTDAttlist;

    .line 3534
    .local v8, "list":Lcom/wutka/dtd/DTDAttlist;
    invoke-virtual {v8}, Lcom/wutka/dtd/DTDAttlist;->getAttribute()[Lcom/wutka/dtd/DTDAttribute;

    move-result-object v1

    .line 3535
    .local v1, "atts":[Lcom/wutka/dtd/DTDAttribute;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_83
    array-length v10, v1

    if-ge v5, v10, :cond_72

    .line 3536
    aget-object v0, v1, v5

    .line 3537
    .local v0, "att":Lcom/wutka/dtd/DTDAttribute;
    invoke-virtual {v0}, Lcom/wutka/dtd/DTDAttribute;->getDefaultValue()Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_a2

    .line 3538
    iget-object v10, p0, Lcom/bea/xml/stream/MXParser;->defaultAttributes:Ljava/util/HashMap;

    if-nez v10, :cond_99

    .line 3539
    new-instance v10, Ljava/util/HashMap;

    invoke-direct {v10}, Ljava/util/HashMap;-><init>()V

    iput-object v10, p0, Lcom/bea/xml/stream/MXParser;->defaultAttributes:Ljava/util/HashMap;

    .line 3540
    :cond_99
    iget-object v10, p0, Lcom/bea/xml/stream/MXParser;->defaultAttributes:Ljava/util/HashMap;

    invoke-virtual {v8}, Lcom/wutka/dtd/DTDAttlist;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3535
    :cond_a2
    add-int/lit8 v5, v5, 0x1

    goto :goto_83

    .line 3530
    .end local v0    # "att":Lcom/wutka/dtd/DTDAttribute;
    .end local v1    # "atts":[Lcom/wutka/dtd/DTDAttribute;
    .end local v5    # "i":I
    .end local v8    # "list":Lcom/wutka/dtd/DTDAttlist;
    :cond_a5
    sget-object v10, Lcom/bea/xml/stream/MXParser;->class$com$wutka$dtd$DTDAttlist:Ljava/lang/Class;
    :try_end_a7
    .catch Ljava/io/IOException; {:try_start_59 .. :try_end_a7} :catch_52

    goto :goto_6a

    .line 3549
    :cond_a8
    return-void
.end method

.method public recycle()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 1503
    invoke-direct {p0}, Lcom/bea/xml/stream/MXParser;->reset()V

    .line 1504
    return-void
.end method

.method public require(ILjava/lang/String;Ljava/lang/String;)V
    .registers 11
    .param p1, "type"    # I
    .param p2, "namespace"    # Ljava/lang/String;
    .param p3, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 1213
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getEventType()I

    move-result v1

    .line 1214
    .local v1, "currType":I
    if-ne p1, v1, :cond_16d

    move v2, v3

    .line 1216
    .local v2, "ok":Z
    :goto_9
    if-eqz v2, :cond_1e

    if-eqz p3, :cond_1e

    .line 1217
    if-eq v1, v3, :cond_16

    const/4 v5, 0x2

    if-eq v1, v5, :cond_16

    const/16 v5, 0x9

    if-ne v1, v5, :cond_170

    .line 1219
    :cond_16
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocalName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 1228
    :cond_1e
    if-eqz v2, :cond_33

    if-eqz p2, :cond_33

    .line 1229
    if-eq v1, v3, :cond_26

    if-ne v1, v3, :cond_33

    .line 1234
    :cond_26
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getNamespaceURI()Ljava/lang/String;

    move-result-object v0

    .line 1235
    .local v0, "currNsUri":Ljava/lang/String;
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_19a

    .line 1236
    if-nez v0, :cond_197

    move v2, v3

    .line 1243
    .end local v0    # "currNsUri":Ljava/lang/String;
    :cond_33
    :goto_33
    if-nez v2, :cond_1bb

    .line 1244
    new-instance v4, Ljavax/xml/stream/XMLStreamException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "expected event "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-static {p1}, Lcom/bea/xml/stream/util/ElementTypeNames;->getEventTypeString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    if-eqz p3, :cond_1a0

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, " with name \'"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v6, "\'"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_65
    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    if-eqz p2, :cond_1a4

    if-eqz p3, :cond_1a4

    const-string v3, " and"

    :goto_6f
    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    if-eqz p2, :cond_1a8

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, " with namespace \'"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v6, "\'"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_8e
    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v5, " but got"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getEventType()I

    move-result v3

    if-eq p1, v3, :cond_1ac

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, " "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getEventType()I

    move-result v6

    invoke-static {v6}, Lcom/bea/xml/stream/util/ElementTypeNames;->getEventTypeString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_b9
    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    if-eqz p3, :cond_1b0

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocalName()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_1b0

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getName()Ljavax/xml/namespace/QName;

    move-result-object v3

    invoke-virtual {p3, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1b0

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, " name \'"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocalName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v6, "\'"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_ec
    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    if-eqz p2, :cond_1b4

    if-eqz p3, :cond_1b4

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocalName()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_1b4

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getName()Ljavax/xml/namespace/QName;

    move-result-object v3

    invoke-virtual {p3, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1b4

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getNamespaceURI()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_1b4

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getNamespaceURI()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1b4

    const-string v3, " and"

    :goto_116
    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    if-eqz p2, :cond_1b8

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getNamespaceURI()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_1b8

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getNamespaceURI()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1b8

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, " namespace \'"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getNamespaceURI()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v6, "\'"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_149
    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v5, " (position:"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getPositionDescription()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v5, ")"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v5

    invoke-direct {v4, v3, v5}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v4

    .end local v2    # "ok":Z
    :cond_16d
    move v2, v4

    .line 1214
    goto/16 :goto_9

    .line 1221
    .restart local v2    # "ok":Z
    :cond_170
    new-instance v3, Ljavax/xml/stream/XMLStreamException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Using non-null local name argument for require(); "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-static {v1}, Lcom/bea/xml/stream/util/ElementTypeNames;->getEventTypeString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, " event does not have local name"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v3

    .restart local v0    # "currNsUri":Ljava/lang/String;
    :cond_197
    move v2, v4

    .line 1236
    goto/16 :goto_33

    .line 1238
    :cond_19a
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    goto/16 :goto_33

    .line 1244
    .end local v0    # "currNsUri":Ljava/lang/String;
    :cond_1a0
    const-string v3, ""

    goto/16 :goto_65

    :cond_1a4
    const-string v3, ""

    goto/16 :goto_6f

    :cond_1a8
    const-string v3, ""

    goto/16 :goto_8e

    :cond_1ac
    const-string v3, ""

    goto/16 :goto_b9

    :cond_1b0
    const-string v3, ""

    goto/16 :goto_ec

    :cond_1b4
    const-string v3, ""

    goto/16 :goto_116

    :cond_1b8
    const-string v3, ""

    goto :goto_149

    .line 1262
    :cond_1bb
    return-void
.end method

.method protected requireInput(C[C)C
    .registers 8
    .param p1, "ch"    # C
    .param p2, "input"    # [C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 3174
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    array-length v2, p2

    if-ge v1, v2, :cond_5c

    .line 3176
    aget-char v2, p2, v1

    if-eq p1, v2, :cond_48

    .line 3177
    new-instance v2, Ljavax/xml/stream/XMLStreamException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "expected "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    aget-char v4, p2, v1

    invoke-virtual {p0, v4}, Lcom/bea/xml/stream/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " in "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, p2}, Ljava/lang/String;-><init>([C)V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " and not "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v2

    .line 3182
    :cond_48
    :try_start_48
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C
    :try_end_4b
    .catch Ljava/io/EOFException; {:try_start_48 .. :try_end_4b} :catch_4f

    move-result p1

    .line 3174
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 3183
    :catch_4f
    move-exception v0

    .line 3184
    .local v0, "eofe":Ljava/io/EOFException;
    new-instance v2, Ljavax/xml/stream/XMLStreamException;

    const-string v3, "Unexpected end of stream"

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v4

    invoke-direct {v2, v3, v4, v0}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;Ljava/lang/Throwable;)V

    throw v2

    .line 3187
    .end local v0    # "eofe":Ljava/io/EOFException;
    :cond_5c
    return p1
.end method

.method protected requireNextS()C
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 3196
    :try_start_0
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C
    :try_end_3
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_3} :catch_2b

    move-result v0

    .line 3200
    .local v0, "ch":C
    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParser;->isS(C)Z

    move-result v2

    if-nez v2, :cond_38

    .line 3201
    new-instance v2, Ljavax/xml/stream/XMLStreamException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "white space is required and not "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v2

    .line 3197
    .end local v0    # "ch":C
    :catch_2b
    move-exception v1

    .line 3198
    .local v1, "eofe":Ljava/io/EOFException;
    new-instance v2, Ljavax/xml/stream/XMLStreamException;

    const-string v3, "Unexpected end of stream"

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v4

    invoke-direct {v2, v3, v4, v1}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;Ljava/lang/Throwable;)V

    throw v2

    .line 3204
    .end local v1    # "eofe":Ljava/io/EOFException;
    .restart local v0    # "ch":C
    :cond_38
    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParser;->skipS(C)C

    move-result v2

    return v2
.end method

.method protected resetStringCache()V
    .registers 1

    .prologue
    .line 123
    return-void
.end method

.method public setConfigurationContext(Lcom/bea/xml/stream/ConfigurationContextBase;)V
    .registers 5
    .param p1, "c"    # Lcom/bea/xml/stream/ConfigurationContextBase;

    .prologue
    .line 3785
    iput-object p1, p0, Lcom/bea/xml/stream/MXParser;->configurationContext:Lcom/bea/xml/stream/ConfigurationContextBase;

    .line 3786
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v2, "javax.xml.stream.isCoalescing"

    invoke-virtual {p1, v2}, Lcom/bea/xml/stream/ConfigurationContextBase;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 3787
    .local v0, "isCoalescing":Z
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v2, "http://java.sun.com/xml/stream/properties/report-cdata-event"

    invoke-virtual {p1, v2}, Lcom/bea/xml/stream/ConfigurationContextBase;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/bea/xml/stream/MXParser;->reportCdataEvent:Z

    .line 3788
    return-void
.end method

.method public setFeature(Ljava/lang/String;Z)V
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "state"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 710
    if-nez p1, :cond_a

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "feature name should not be nulll"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 711
    :cond_a
    const-string v0, "http://xmlpull.org/v1/doc/features.html#process-namespaces"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_26

    .line 712
    iget v0, p0, Lcom/bea/xml/stream/MXParser;->eventType:I

    const/4 v1, 0x7

    if-eq v0, v1, :cond_23

    new-instance v0, Ljavax/xml/stream/XMLStreamException;

    const-string v1, "namespace processing feature can only be changed before parsing"

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;)V

    throw v0

    .line 715
    :cond_23
    iput-boolean p2, p0, Lcom/bea/xml/stream/MXParser;->processNamespaces:Z

    .line 741
    :cond_25
    return-void

    .line 721
    :cond_26
    const-string v0, "http://xmlpull.org/v1/doc/features.html#names-interned"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_38

    .line 722
    if-eqz p2, :cond_25

    .line 723
    new-instance v0, Ljavax/xml/stream/XMLStreamException;

    const-string v1, "interning names in this implementation is not supported"

    invoke-direct {v0, v1}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 726
    :cond_38
    const-string v0, "http://xmlpull.org/v1/doc/features.html#process-docdecl"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4a

    .line 727
    if-eqz p2, :cond_25

    .line 728
    new-instance v0, Ljavax/xml/stream/XMLStreamException;

    const-string v1, "processing DOCDECL is not supported"

    invoke-direct {v0, v1}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 733
    :cond_4a
    const-string v0, "http://xmlpull.org/v1/doc/features.html#xml-roundtrip"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5c

    .line 734
    if-nez p2, :cond_25

    .line 735
    new-instance v0, Ljavax/xml/stream/XMLStreamException;

    const-string v1, "roundtrip feature can not be switched off"

    invoke-direct {v0, v1}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 739
    :cond_5c
    new-instance v0, Ljavax/xml/stream/XMLStreamException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "unknown feature "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setInput(Ljava/io/InputStream;)V
    .registers 7
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 814
    :try_start_0
    invoke-static {p1}, Lcom/bea/xml/stream/reader/XmlReader;->createReader(Ljava/io/InputStream;)Ljava/io/Reader;

    move-result-object v3

    .line 819
    .local v3, "r":Ljava/io/Reader;
    const/4 v2, 0x0

    .line 820
    .local v2, "enc":Ljava/lang/String;
    instance-of v4, v3, Lcom/bea/xml/stream/reader/XmlReader$BaseReader;

    if-eqz v4, :cond_11

    .line 821
    move-object v0, v3

    check-cast v0, Lcom/bea/xml/stream/reader/XmlReader$BaseReader;

    move-object v4, v0

    invoke-virtual {v4}, Lcom/bea/xml/stream/reader/XmlReader$BaseReader;->getEncoding()Ljava/lang/String;

    move-result-object v2

    .line 823
    :cond_11
    invoke-virtual {p0, v3}, Lcom/bea/xml/stream/MXParser;->setInput(Ljava/io/Reader;)V

    .line 824
    if-eqz v2, :cond_18

    .line 825
    iput-object v2, p0, Lcom/bea/xml/stream/MXParser;->inputEncoding:Ljava/lang/String;
    :try_end_18
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_18} :catch_19

    .line 830
    :cond_18
    return-void

    .line 827
    .end local v2    # "enc":Ljava/lang/String;
    .end local v3    # "r":Ljava/io/Reader;
    :catch_19
    move-exception v1

    .line 828
    .local v1, "e":Ljava/io/IOException;
    new-instance v4, Ljavax/xml/stream/XMLStreamException;

    invoke-direct {v4, v1}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/Throwable;)V

    throw v4
.end method

.method public setInput(Ljava/io/InputStream;Ljava/lang/String;)V
    .registers 9
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .param p2, "inputEncoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 835
    if-nez p1, :cond_a

    .line 836
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "input stream can not be null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 840
    :cond_a
    if-eqz p2, :cond_18

    :try_start_c
    invoke-static {p1, p2}, Lcom/bea/xml/stream/reader/XmlReader;->createReader(Ljava/io/InputStream;Ljava/lang/String;)Ljava/io/Reader;
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_f} :catch_1d

    move-result-object v2

    .line 848
    .local v2, "reader":Ljava/io/Reader;
    :goto_10
    invoke-virtual {p0, v2}, Lcom/bea/xml/stream/MXParser;->setInput(Ljava/io/Reader;)V

    .line 850
    if-eqz p2, :cond_17

    .line 851
    iput-object p2, p0, Lcom/bea/xml/stream/MXParser;->inputEncoding:Ljava/lang/String;

    .line 853
    :cond_17
    return-void

    .line 840
    .end local v2    # "reader":Ljava/io/Reader;
    :cond_18
    :try_start_18
    invoke-static {p1}, Lcom/bea/xml/stream/reader/XmlReader;->createReader(Ljava/io/InputStream;)Ljava/io/Reader;
    :try_end_1b
    .catch Ljava/io/IOException; {:try_start_18 .. :try_end_1b} :catch_1d

    move-result-object v2

    goto :goto_10

    .line 843
    :catch_1d
    move-exception v1

    .line 844
    .local v1, "ioe":Ljava/io/IOException;
    if-nez p2, :cond_60

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "(for encoding \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\')"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 845
    .local v0, "encMsg":Ljava/lang/String;
    :goto_39
    new-instance v3, Ljavax/xml/stream/XMLStreamException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "could not create reader "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v5

    invoke-direct {v3, v4, v5, v1}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;Ljava/lang/Throwable;)V

    throw v3

    .line 844
    .end local v0    # "encMsg":Ljava/lang/String;
    :cond_60
    const-string v0, ""

    goto :goto_39
.end method

.method public setInput(Ljava/io/Reader;)V
    .registers 3
    .param p1, "in"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 804
    invoke-direct {p0}, Lcom/bea/xml/stream/MXParser;->reset()V

    .line 805
    iput-object p1, p0, Lcom/bea/xml/stream/MXParser;->reader:Ljava/io/Reader;

    .line 806
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->checkForXMLDecl()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 807
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->next()I

    .line 809
    :cond_e
    return-void
.end method

.method public setProperty(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 767
    new-instance v0, Ljavax/xml/stream/XMLStreamException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "unsupported property: \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public skip()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 1350
    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->nextToken()I

    .line 1351
    return-void
.end method

.method protected skipS(C)C
    .registers 6
    .param p1, "ch"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 3211
    :goto_0
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/MXParser;->isS(C)Z

    move-result v1

    if-eqz v1, :cond_18

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->more()C
    :try_end_9
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_9} :catch_b

    move-result p1

    goto :goto_0

    .line 3213
    :catch_b
    move-exception v0

    .line 3214
    .local v0, "eofe":Ljava/io/EOFException;
    new-instance v1, Ljavax/xml/stream/XMLStreamException;

    const-string v2, "Unexpected end of stream"

    invoke-virtual {p0}, Lcom/bea/xml/stream/MXParser;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v3

    invoke-direct {v1, v2, v3, v0}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;Ljavax/xml/stream/Location;Ljava/lang/Throwable;)V

    throw v1

    .line 3212
    .end local v0    # "eofe":Ljava/io/EOFException;
    :cond_18
    return p1
.end method

.method public standaloneSet()Z
    .registers 2

    .prologue
    .line 1687
    iget-boolean v0, p0, Lcom/bea/xml/stream/MXParser;->standaloneSet:Z

    return v0
.end method

.method public subReader()Ljavax/xml/stream/XMLStreamReader;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 1499
    new-instance v0, Lcom/bea/xml/stream/SubReader;

    invoke-direct {v0, p0}, Lcom/bea/xml/stream/SubReader;-><init>(Ljavax/xml/stream/XMLStreamReader;)V

    return-object v0
.end method
