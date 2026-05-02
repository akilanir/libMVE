.class Lfreemarker/core/Configurable$SettingStringParser;
.super Ljava/lang/Object;
.source "Configurable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/Configurable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SettingStringParser"
.end annotation


# instance fields
.field private ln:I

.field private p:I

.field private text:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 1313
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1314
    iput-object p1, p0, Lfreemarker/core/Configurable$SettingStringParser;->text:Ljava/lang/String;

    .line 1315
    const/4 v0, 0x0

    iput v0, p0, Lfreemarker/core/Configurable$SettingStringParser;->p:I

    .line 1316
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    iput v0, p0, Lfreemarker/core/Configurable$SettingStringParser;->ln:I

    .line 1317
    return-void
.end method

.method constructor <init>(Ljava/lang/String;Lfreemarker/core/Configurable$1;)V
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Lfreemarker/core/Configurable$1;

    .prologue
    .line 1308
    invoke-direct {p0, p1}, Lfreemarker/core/Configurable$SettingStringParser;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method private fetchWord()Ljava/lang/String;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/16 v6, 0x5c

    const/4 v7, 0x0

    .line 1429
    iget v4, p0, Lfreemarker/core/Configurable$SettingStringParser;->p:I

    iget v5, p0, Lfreemarker/core/Configurable$SettingStringParser;->ln:I

    if-ne v4, v5, :cond_11

    new-instance v4, Lfreemarker/core/ParseException;

    const-string v5, "Unexpeced end of text"

    invoke-direct {v4, v5, v7, v7}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;II)V

    throw v4

    .line 1432
    :cond_11
    iget-object v4, p0, Lfreemarker/core/Configurable$SettingStringParser;->text:Ljava/lang/String;

    iget v5, p0, Lfreemarker/core/Configurable$SettingStringParser;->p:I

    invoke-virtual {v4, v5}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 1433
    .local v1, "c":C
    iget v0, p0, Lfreemarker/core/Configurable$SettingStringParser;->p:I

    .line 1434
    .local v0, "b":I
    const/16 v4, 0x27

    if-eq v1, v4, :cond_23

    const/16 v4, 0x22

    if-ne v1, v4, :cond_77

    .line 1435
    :cond_23
    const/4 v2, 0x0

    .line 1436
    .local v2, "escaped":Z
    move v3, v1

    .line 1437
    .local v3, "q":C
    iget v4, p0, Lfreemarker/core/Configurable$SettingStringParser;->p:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lfreemarker/core/Configurable$SettingStringParser;->p:I

    .line 1438
    :goto_2b
    iget v4, p0, Lfreemarker/core/Configurable$SettingStringParser;->p:I

    iget v5, p0, Lfreemarker/core/Configurable$SettingStringParser;->ln:I

    if-ge v4, v5, :cond_47

    .line 1439
    iget-object v4, p0, Lfreemarker/core/Configurable$SettingStringParser;->text:Ljava/lang/String;

    iget v5, p0, Lfreemarker/core/Configurable$SettingStringParser;->p:I

    invoke-virtual {v4, v5}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 1440
    if-nez v2, :cond_66

    .line 1441
    if-ne v1, v6, :cond_45

    .line 1442
    const/4 v2, 0x1

    .line 1449
    :cond_3e
    :goto_3e
    iget v4, p0, Lfreemarker/core/Configurable$SettingStringParser;->p:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lfreemarker/core/Configurable$SettingStringParser;->p:I

    goto :goto_2b

    .line 1443
    :cond_45
    if-ne v1, v3, :cond_3e

    .line 1451
    :cond_47
    iget v4, p0, Lfreemarker/core/Configurable$SettingStringParser;->p:I

    iget v5, p0, Lfreemarker/core/Configurable$SettingStringParser;->ln:I

    if-ne v4, v5, :cond_68

    .line 1452
    new-instance v4, Lfreemarker/core/ParseException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Missing "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v7, v7}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;II)V

    throw v4

    .line 1447
    :cond_66
    const/4 v2, 0x0

    goto :goto_3e

    .line 1454
    :cond_68
    iget v4, p0, Lfreemarker/core/Configurable$SettingStringParser;->p:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lfreemarker/core/Configurable$SettingStringParser;->p:I

    .line 1455
    iget-object v4, p0, Lfreemarker/core/Configurable$SettingStringParser;->text:Ljava/lang/String;

    iget v5, p0, Lfreemarker/core/Configurable$SettingStringParser;->p:I

    invoke-virtual {v4, v0, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 1468
    .end local v2    # "escaped":Z
    .end local v3    # "q":C
    :goto_76
    return-object v4

    .line 1458
    :cond_77
    iget-object v4, p0, Lfreemarker/core/Configurable$SettingStringParser;->text:Ljava/lang/String;

    iget v5, p0, Lfreemarker/core/Configurable$SettingStringParser;->p:I

    invoke-virtual {v4, v5}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 1459
    invoke-static {v1}, Ljava/lang/Character;->isLetterOrDigit(C)Z

    move-result v4

    if-nez v4, :cond_c0

    const/16 v4, 0x2f

    if-eq v1, v4, :cond_c0

    if-eq v1, v6, :cond_c0

    const/16 v4, 0x5f

    if-eq v1, v4, :cond_c0

    const/16 v4, 0x2e

    if-eq v1, v4, :cond_c0

    const/16 v4, 0x2d

    if-eq v1, v4, :cond_c0

    const/16 v4, 0x21

    if-eq v1, v4, :cond_c0

    const/16 v4, 0x2a

    if-eq v1, v4, :cond_c0

    const/16 v4, 0x3f

    if-eq v1, v4, :cond_c0

    .line 1465
    :goto_a3
    iget v4, p0, Lfreemarker/core/Configurable$SettingStringParser;->p:I

    if-ne v0, v4, :cond_cd

    .line 1466
    new-instance v4, Lfreemarker/core/ParseException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Unexpected character: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v7, v7}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;II)V

    throw v4

    .line 1463
    :cond_c0
    iget v4, p0, Lfreemarker/core/Configurable$SettingStringParser;->p:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lfreemarker/core/Configurable$SettingStringParser;->p:I

    .line 1464
    iget v4, p0, Lfreemarker/core/Configurable$SettingStringParser;->p:I

    iget v5, p0, Lfreemarker/core/Configurable$SettingStringParser;->ln:I

    if-lt v4, v5, :cond_77

    goto :goto_a3

    .line 1468
    :cond_cd
    iget-object v4, p0, Lfreemarker/core/Configurable$SettingStringParser;->text:Ljava/lang/String;

    iget v5, p0, Lfreemarker/core/Configurable$SettingStringParser;->p:I

    invoke-virtual {v4, v0, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    goto :goto_76
.end method


# virtual methods
.method fetchKeyword()Ljava/lang/String;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 1410
    invoke-direct {p0}, Lfreemarker/core/Configurable$SettingStringParser;->fetchWord()Ljava/lang/String;

    move-result-object v0

    .line 1411
    .local v0, "w":Ljava/lang/String;
    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_15

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2e

    .line 1412
    :cond_15
    new-instance v1, Lfreemarker/core/ParseException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Keyword expected, but a string value found: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v4, v4}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;II)V

    throw v1

    .line 1415
    :cond_2e
    return-object v0
.end method

.method fetchStringValue()Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 1402
    invoke-direct {p0}, Lfreemarker/core/Configurable$SettingStringParser;->fetchWord()Ljava/lang/String;

    move-result-object v0

    .line 1403
    .local v0, "w":Ljava/lang/String;
    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_14

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1f

    .line 1404
    :cond_14
    const/4 v1, 0x1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 1406
    :cond_1f
    invoke-static {v0}, Lfreemarker/template/utility/StringUtil;->FTLStringLiteralDec(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method parseAsImportList()Ljava/util/HashMap;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/16 v6, 0x20

    const/4 v8, 0x0

    .line 1371
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 1373
    .local v2, "map":Ljava/util/HashMap;
    :goto_8
    invoke-virtual {p0}, Lfreemarker/core/Configurable$SettingStringParser;->skipWS()C

    move-result v0

    .line 1374
    .local v0, "c":C
    if-ne v0, v6, :cond_f

    .line 1398
    :cond_e
    return-object v2

    .line 1375
    :cond_f
    invoke-virtual {p0}, Lfreemarker/core/Configurable$SettingStringParser;->fetchStringValue()Ljava/lang/String;

    move-result-object v1

    .line 1377
    .local v1, "lib":Ljava/lang/String;
    invoke-virtual {p0}, Lfreemarker/core/Configurable$SettingStringParser;->skipWS()C

    move-result v0

    .line 1378
    if-ne v0, v6, :cond_21

    new-instance v5, Lfreemarker/core/ParseException;

    const-string v6, "Unexpected end of text: expected \"as\""

    invoke-direct {v5, v6, v8, v8}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;II)V

    throw v5

    .line 1380
    :cond_21
    invoke-virtual {p0}, Lfreemarker/core/Configurable$SettingStringParser;->fetchKeyword()Ljava/lang/String;

    move-result-object v4

    .line 1381
    .local v4, "s":Ljava/lang/String;
    const-string v5, "as"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_4a

    new-instance v5, Lfreemarker/core/ParseException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Expected \"as\", but found "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-static {v4}, Lfreemarker/template/utility/StringUtil;->jQuote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v8, v8}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;II)V

    throw v5

    .line 1384
    :cond_4a
    invoke-virtual {p0}, Lfreemarker/core/Configurable$SettingStringParser;->skipWS()C

    move-result v0

    .line 1385
    if-ne v0, v6, :cond_58

    new-instance v5, Lfreemarker/core/ParseException;

    const-string v6, "Unexpected end of text: expected gate hash name"

    invoke-direct {v5, v6, v8, v8}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;II)V

    throw v5

    .line 1387
    :cond_58
    invoke-virtual {p0}, Lfreemarker/core/Configurable$SettingStringParser;->fetchStringValue()Ljava/lang/String;

    move-result-object v3

    .line 1389
    .local v3, "ns":Ljava/lang/String;
    invoke-virtual {v2, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1391
    invoke-virtual {p0}, Lfreemarker/core/Configurable$SettingStringParser;->skipWS()C

    move-result v0

    .line 1392
    if-eq v0, v6, :cond_e

    .line 1393
    const/16 v5, 0x2c

    if-eq v0, v5, :cond_88

    new-instance v5, Lfreemarker/core/ParseException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Expected \",\" or the end of text but found \""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v8, v8}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;II)V

    throw v5

    .line 1396
    :cond_88
    iget v5, p0, Lfreemarker/core/Configurable$SettingStringParser;->p:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lfreemarker/core/Configurable$SettingStringParser;->p:I

    goto/16 :goto_8
.end method

.method parseAsList()Ljava/util/ArrayList;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/16 v3, 0x20

    const/4 v5, 0x0

    .line 1354
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1356
    .local v1, "seq":Ljava/util/ArrayList;
    :goto_8
    invoke-virtual {p0}, Lfreemarker/core/Configurable$SettingStringParser;->skipWS()C

    move-result v0

    .line 1357
    .local v0, "c":C
    if-ne v0, v3, :cond_f

    .line 1366
    :cond_e
    return-object v1

    .line 1358
    :cond_f
    invoke-virtual {p0}, Lfreemarker/core/Configurable$SettingStringParser;->fetchStringValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1359
    invoke-virtual {p0}, Lfreemarker/core/Configurable$SettingStringParser;->skipWS()C

    move-result v0

    .line 1360
    if-eq v0, v3, :cond_e

    .line 1361
    const/16 v2, 0x2c

    if-eq v0, v2, :cond_3f

    new-instance v2, Lfreemarker/core/ParseException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Expected \",\" or the end of text but found \""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v5, v5}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;II)V

    throw v2

    .line 1364
    :cond_3f
    iget v2, p0, Lfreemarker/core/Configurable$SettingStringParser;->p:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lfreemarker/core/Configurable$SettingStringParser;->p:I

    goto :goto_8
.end method

.method parseAsSegmentedList()Ljava/util/ArrayList;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/16 v6, 0x3a

    const/16 v5, 0x20

    const/4 v7, 0x0

    .line 1320
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 1321
    .local v3, "segments":Ljava/util/ArrayList;
    const/4 v1, 0x0

    .line 1325
    .local v1, "currentSegment":Ljava/util/ArrayList;
    :goto_b
    invoke-virtual {p0}, Lfreemarker/core/Configurable$SettingStringParser;->skipWS()C

    move-result v0

    .line 1326
    .local v0, "c":C
    if-ne v0, v5, :cond_12

    .line 1349
    :cond_11
    return-object v3

    .line 1327
    :cond_12
    invoke-virtual {p0}, Lfreemarker/core/Configurable$SettingStringParser;->fetchStringValue()Ljava/lang/String;

    move-result-object v2

    .line 1328
    .local v2, "item":Ljava/lang/String;
    invoke-virtual {p0}, Lfreemarker/core/Configurable$SettingStringParser;->skipWS()C

    move-result v0

    .line 1330
    if-ne v0, v6, :cond_50

    .line 1331
    new-instance v1, Ljava/util/ArrayList;

    .end local v1    # "currentSegment":Ljava/util/ArrayList;
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1332
    .restart local v1    # "currentSegment":Ljava/util/ArrayList;
    new-instance v4, Lfreemarker/core/Configurable$KeyValuePair;

    invoke-direct {v4, v2, v1}, Lfreemarker/core/Configurable$KeyValuePair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1343
    :goto_29
    if-eq v0, v5, :cond_11

    .line 1344
    const/16 v4, 0x2c

    if-eq v0, v4, :cond_5e

    if-eq v0, v6, :cond_5e

    new-instance v4, Lfreemarker/core/ParseException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Expected \",\" or \":\" or the end of text but found \""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "\""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v7, v7}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;II)V

    throw v4

    .line 1334
    :cond_50
    if-nez v1, :cond_5a

    .line 1335
    new-instance v4, Lfreemarker/core/ParseException;

    const-string v5, "The very first list item must be followed by \":\" so it will be the key for the following sub-list."

    invoke-direct {v4, v5, v7, v7}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;II)V

    throw v4

    .line 1340
    :cond_5a
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_29

    .line 1347
    :cond_5e
    iget v4, p0, Lfreemarker/core/Configurable$SettingStringParser;->p:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lfreemarker/core/Configurable$SettingStringParser;->p:I

    goto :goto_b
.end method

.method skipWS()C
    .registers 4

    .prologue
    .line 1420
    :goto_0
    iget v1, p0, Lfreemarker/core/Configurable$SettingStringParser;->p:I

    iget v2, p0, Lfreemarker/core/Configurable$SettingStringParser;->ln:I

    if-ge v1, v2, :cond_1c

    .line 1421
    iget-object v1, p0, Lfreemarker/core/Configurable$SettingStringParser;->text:Ljava/lang/String;

    iget v2, p0, Lfreemarker/core/Configurable$SettingStringParser;->p:I

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 1422
    .local v0, "c":C
    invoke-static {v0}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v1

    if-nez v1, :cond_15

    .line 1425
    .end local v0    # "c":C
    :goto_14
    return v0

    .line 1423
    .restart local v0    # "c":C
    :cond_15
    iget v1, p0, Lfreemarker/core/Configurable$SettingStringParser;->p:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lfreemarker/core/Configurable$SettingStringParser;->p:I

    goto :goto_0

    .line 1425
    .end local v0    # "c":C
    :cond_1c
    const/16 v0, 0x20

    goto :goto_14
.end method
