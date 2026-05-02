.class public abstract Lcom/drew/metadata/Directory;
.super Ljava/lang/Object;
.source "Directory.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final _floatFormat:Ljava/text/DecimalFormat;


# instance fields
.field protected final _definedTagList:Ljava/util/Collection;
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Lcom/drew/metadata/Tag;",
            ">;"
        }
    .end annotation
.end field

.field protected _descriptor:Lcom/drew/metadata/TagDescriptor;

.field private final _errorList:Ljava/util/Collection;
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private _parent:Lcom/drew/metadata/Directory;
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation
.end field

.field protected final _tagMap:Ljava/util/Map;
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 44
    const-class v0, Lcom/drew/metadata/Directory;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_15

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/drew/metadata/Directory;->$assertionsDisabled:Z

    .line 46
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v1, "0.###"

    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/drew/metadata/Directory;->_floatFormat:Ljava/text/DecimalFormat;

    return-void

    .line 44
    :cond_15
    const/4 v0, 0x0

    goto :goto_9
.end method

.method protected constructor <init>()V
    .registers 3

    .prologue
    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/drew/metadata/Directory;->_tagMap:Ljava/util/Map;

    .line 57
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/drew/metadata/Directory;->_definedTagList:Ljava/util/Collection;

    .line 60
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/drew/metadata/Directory;->_errorList:Ljava/util/Collection;

    .line 88
    return-void
.end method


# virtual methods
.method public addError(Ljava/lang/String;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 153
    iget-object v0, p0, Lcom/drew/metadata/Directory;->_errorList:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 154
    return-void
.end method

.method public containsTag(I)Z
    .registers 4
    .param p1, "tagType"    # I

    .prologue
    .line 109
    iget-object v0, p0, Lcom/drew/metadata/Directory;->_tagMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public getBoolean(I)Z
    .registers 7
    .param p1, "tagType"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/drew/metadata/MetadataException;
        }
    .end annotation

    .prologue
    .line 711
    invoke-virtual {p0, p1}, Lcom/drew/metadata/Directory;->getBooleanObject(I)Ljava/lang/Boolean;

    move-result-object v1

    .line 712
    .local v1, "value":Ljava/lang/Boolean;
    if-eqz v1, :cond_b

    .line 713
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    return v2

    .line 714
    :cond_b
    invoke-virtual {p0, p1}, Lcom/drew/metadata/Directory;->getObject(I)Ljava/lang/Object;

    move-result-object v0

    .line 715
    .local v0, "o":Ljava/lang/Object;
    if-nez v0, :cond_34

    .line 716
    new-instance v2, Lcom/drew/metadata/MetadataException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Tag \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0, p1}, Lcom/drew/metadata/Directory;->getTagName(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' has not been set -- check using containsTag() first"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/drew/metadata/MetadataException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 717
    :cond_34
    new-instance v2, Lcom/drew/metadata/MetadataException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Tag \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' cannot be converted to a boolean.  It is of type \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\'."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/drew/metadata/MetadataException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public getBooleanObject(I)Ljava/lang/Boolean;
    .registers 8
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .annotation build Lcom/drew/lang/annotations/SuppressWarnings;
        justification = "keep API interface consistent"
        value = "NP_BOOLEAN_RETURN_NULL"
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 725
    invoke-virtual {p0, p1}, Lcom/drew/metadata/Directory;->getObject(I)Ljava/lang/Object;

    move-result-object v1

    .line 726
    .local v1, "o":Ljava/lang/Object;
    if-nez v1, :cond_9

    move-object v1, v2

    .line 739
    .end local v1    # "o":Ljava/lang/Object;
    :goto_8
    return-object v1

    .line 728
    .restart local v1    # "o":Ljava/lang/Object;
    :cond_9
    instance-of v3, v1, Ljava/lang/Boolean;

    if-eqz v3, :cond_10

    .line 729
    check-cast v1, Ljava/lang/Boolean;

    goto :goto_8

    .line 730
    :cond_10
    instance-of v3, v1, Ljava/lang/String;

    if-eqz v3, :cond_22

    .line 732
    :try_start_14
    check-cast v1, Ljava/lang/String;

    .end local v1    # "o":Ljava/lang/Object;
    invoke-static {v1}, Ljava/lang/Boolean;->getBoolean(Ljava/lang/String;)Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_1d
    .catch Ljava/lang/NumberFormatException; {:try_start_14 .. :try_end_1d} :catch_1f

    move-result-object v1

    goto :goto_8

    .line 733
    :catch_1f
    move-exception v0

    .local v0, "nfe":Ljava/lang/NumberFormatException;
    move-object v1, v2

    .line 734
    goto :goto_8

    .line 737
    .end local v0    # "nfe":Ljava/lang/NumberFormatException;
    .restart local v1    # "o":Ljava/lang/Object;
    :cond_22
    instance-of v3, v1, Ljava/lang/Number;

    if-eqz v3, :cond_3a

    .line 738
    check-cast v1, Ljava/lang/Number;

    .end local v1    # "o":Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmpl-double v2, v2, v4

    if-eqz v2, :cond_38

    const/4 v2, 0x1

    :goto_33
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    goto :goto_8

    :cond_38
    const/4 v2, 0x0

    goto :goto_33

    .restart local v1    # "o":Ljava/lang/Object;
    :cond_3a
    move-object v1, v2

    .line 739
    goto :goto_8
.end method

.method public getByteArray(I)[B
    .registers 11
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 575
    invoke-virtual {p0, p1}, Lcom/drew/metadata/Directory;->getObject(I)Ljava/lang/Object;

    move-result-object v3

    .line 576
    .local v3, "o":Ljava/lang/Object;
    if-nez v3, :cond_8

    .line 612
    .end local v3    # "o":Ljava/lang/Object;
    :cond_7
    :goto_7
    return-object v0

    .line 578
    .restart local v3    # "o":Ljava/lang/Object;
    :cond_8
    instance-of v7, v3, [Lcom/drew/lang/Rational;

    if-eqz v7, :cond_23

    .line 579
    check-cast v3, [Lcom/drew/lang/Rational;

    .end local v3    # "o":Ljava/lang/Object;
    move-object v4, v3

    check-cast v4, [Lcom/drew/lang/Rational;

    .line 580
    .local v4, "rationals":[Lcom/drew/lang/Rational;
    array-length v7, v4

    new-array v0, v7, [B

    .line 581
    .local v0, "bytes":[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_15
    array-length v7, v0

    if-ge v1, v7, :cond_7

    .line 582
    aget-object v7, v4, v1

    invoke-virtual {v7}, Lcom/drew/lang/Rational;->byteValue()B

    move-result v7

    aput-byte v7, v0, v1

    .line 581
    add-int/lit8 v1, v1, 0x1

    goto :goto_15

    .line 585
    .end local v0    # "bytes":[B
    .end local v1    # "i":I
    .end local v4    # "rationals":[Lcom/drew/lang/Rational;
    .restart local v3    # "o":Ljava/lang/Object;
    :cond_23
    instance-of v7, v3, [B

    if-eqz v7, :cond_2d

    .line 586
    check-cast v3, [B

    .end local v3    # "o":Ljava/lang/Object;
    check-cast v3, [B

    move-object v0, v3

    goto :goto_7

    .line 587
    .restart local v3    # "o":Ljava/lang/Object;
    :cond_2d
    instance-of v7, v3, [I

    if-eqz v7, :cond_45

    .line 588
    check-cast v3, [I

    .end local v3    # "o":Ljava/lang/Object;
    move-object v2, v3

    check-cast v2, [I

    .line 589
    .local v2, "ints":[I
    array-length v7, v2

    new-array v0, v7, [B

    .line 590
    .restart local v0    # "bytes":[B
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_3a
    array-length v7, v2

    if-ge v1, v7, :cond_7

    .line 591
    aget v7, v2, v1

    int-to-byte v7, v7

    aput-byte v7, v0, v1

    .line 590
    add-int/lit8 v1, v1, 0x1

    goto :goto_3a

    .line 594
    .end local v0    # "bytes":[B
    .end local v1    # "i":I
    .end local v2    # "ints":[I
    .restart local v3    # "o":Ljava/lang/Object;
    :cond_45
    instance-of v7, v3, [S

    if-eqz v7, :cond_5d

    .line 595
    check-cast v3, [S

    .end local v3    # "o":Ljava/lang/Object;
    move-object v5, v3

    check-cast v5, [S

    .line 596
    .local v5, "shorts":[S
    array-length v7, v5

    new-array v0, v7, [B

    .line 597
    .restart local v0    # "bytes":[B
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_52
    array-length v7, v5

    if-ge v1, v7, :cond_7

    .line 598
    aget-short v7, v5, v1

    int-to-byte v7, v7

    aput-byte v7, v0, v1

    .line 597
    add-int/lit8 v1, v1, 0x1

    goto :goto_52

    .line 601
    .end local v0    # "bytes":[B
    .end local v1    # "i":I
    .end local v5    # "shorts":[S
    .restart local v3    # "o":Ljava/lang/Object;
    :cond_5d
    instance-of v7, v3, Ljava/lang/CharSequence;

    if-eqz v7, :cond_7b

    move-object v6, v3

    .line 602
    check-cast v6, Ljava/lang/CharSequence;

    .line 603
    .local v6, "str":Ljava/lang/CharSequence;
    invoke-interface {v6}, Ljava/lang/CharSequence;->length()I

    move-result v7

    new-array v0, v7, [B

    .line 604
    .restart local v0    # "bytes":[B
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_6b
    invoke-interface {v6}, Ljava/lang/CharSequence;->length()I

    move-result v7

    if-ge v1, v7, :cond_7

    .line 605
    invoke-interface {v6, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v7

    int-to-byte v7, v7

    aput-byte v7, v0, v1

    .line 604
    add-int/lit8 v1, v1, 0x1

    goto :goto_6b

    .line 609
    .end local v0    # "bytes":[B
    .end local v1    # "i":I
    .end local v6    # "str":Ljava/lang/CharSequence;
    :cond_7b
    instance-of v7, v3, Ljava/lang/Integer;

    if-eqz v7, :cond_7

    .line 610
    const/4 v7, 0x1

    new-array v0, v7, [B

    const/4 v7, 0x0

    check-cast v3, Ljava/lang/Integer;

    .end local v3    # "o":Ljava/lang/Object;
    invoke-virtual {v3}, Ljava/lang/Integer;->byteValue()B

    move-result v8

    aput-byte v8, v0, v7

    goto/16 :goto_7
.end method

.method public getDate(I)Ljava/util/Date;
    .registers 3
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 751
    invoke-virtual {p0, p1, v0, v0}, Lcom/drew/metadata/Directory;->getDate(ILjava/lang/String;Ljava/util/TimeZone;)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public getDate(ILjava/lang/String;Ljava/util/TimeZone;)Ljava/util/Date;
    .registers 26
    .param p1, "tagType"    # I
    .param p2, "subsecond"    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/Nullable;
        .end annotation
    .end param
    .param p3, "timeZone"    # Ljava/util/TimeZone;
        .annotation build Lcom/drew/lang/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 785
    invoke-virtual/range {p0 .. p1}, Lcom/drew/metadata/Directory;->getObject(I)Ljava/lang/Object;

    move-result-object v12

    .line 787
    .local v12, "o":Ljava/lang/Object;
    instance-of v0, v12, Ljava/util/Date;

    move/from16 v18, v0

    if-eqz v18, :cond_e

    .line 788
    check-cast v12, Ljava/util/Date;

    .end local v12    # "o":Ljava/lang/Object;
    move-object v4, v12

    .line 857
    :cond_d
    :goto_d
    return-object v4

    .line 790
    .restart local v12    # "o":Ljava/lang/Object;
    :cond_e
    const/4 v4, 0x0

    .line 792
    .local v4, "date":Ljava/util/Date;
    instance-of v0, v12, Ljava/lang/String;

    move/from16 v18, v0

    if-eqz v18, :cond_dc

    .line 795
    const/16 v18, 0xb

    move/from16 v0, v18

    new-array v6, v0, [Ljava/lang/String;

    const/16 v18, 0x0

    const-string v19, "yyyy:MM:dd HH:mm:ss"

    aput-object v19, v6, v18

    const/16 v18, 0x1

    const-string v19, "yyyy:MM:dd HH:mm"

    aput-object v19, v6, v18

    const/16 v18, 0x2

    const-string v19, "yyyy-MM-dd HH:mm:ss"

    aput-object v19, v6, v18

    const/16 v18, 0x3

    const-string v19, "yyyy-MM-dd HH:mm"

    aput-object v19, v6, v18

    const/16 v18, 0x4

    const-string v19, "yyyy.MM.dd HH:mm:ss"

    aput-object v19, v6, v18

    const/16 v18, 0x5

    const-string v19, "yyyy.MM.dd HH:mm"

    aput-object v19, v6, v18

    const/16 v18, 0x6

    const-string v19, "yyyy-MM-dd\'T\'HH:mm:ss"

    aput-object v19, v6, v18

    const/16 v18, 0x7

    const-string v19, "yyyy-MM-dd\'T\'HH:mm"

    aput-object v19, v6, v18

    const/16 v18, 0x8

    const-string v19, "yyyy-MM-dd"

    aput-object v19, v6, v18

    const/16 v18, 0x9

    const-string v19, "yyyy-MM"

    aput-object v19, v6, v18

    const/16 v18, 0xa

    const-string v19, "yyyy"

    aput-object v19, v6, v18

    .local v6, "datePatterns":[Ljava/lang/String;
    move-object v7, v12

    .line 807
    check-cast v7, Ljava/lang/String;

    .line 810
    .local v7, "dateString":Ljava/lang/String;
    const-string v18, "(\\d\\d:\\d\\d:\\d\\d)(\\.\\d+)"

    invoke-static/range {v18 .. v18}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v15

    .line 811
    .local v15, "subsecondPattern":Ljava/util/regex/Pattern;
    invoke-virtual {v15, v7}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v14

    .line 812
    .local v14, "subsecondMatcher":Ljava/util/regex/Matcher;
    invoke-virtual {v14}, Ljava/util/regex/Matcher;->find()Z

    move-result v18

    if-eqz v18, :cond_86

    .line 813
    const/16 v18, 0x2

    move/from16 v0, v18

    invoke-virtual {v14, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v18

    const/16 v19, 0x1

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p2

    .line 814
    const-string v18, "$1"

    move-object/from16 v0, v18

    invoke-virtual {v14, v0}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 818
    :cond_86
    const-string v18, "(Z|[+-]\\d\\d:\\d\\d)$"

    invoke-static/range {v18 .. v18}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v17

    .line 819
    .local v17, "timeZonePattern":Ljava/util/regex/Pattern;
    move-object/from16 v0, v17

    invoke-virtual {v0, v7}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v16

    .line 820
    .local v16, "timeZoneMatcher":Ljava/util/regex/Matcher;
    invoke-virtual/range {v16 .. v16}, Ljava/util/regex/Matcher;->find()Z

    move-result v18

    if-eqz v18, :cond_c5

    .line 821
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "GMT"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v16 .. v16}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v19

    const-string v20, "Z"

    const-string v21, ""

    invoke-virtual/range {v19 .. v21}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object p3

    .line 822
    const-string v18, ""

    move-object/from16 v0, v16

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 825
    :cond_c5
    move-object v2, v6

    .local v2, "arr$":[Ljava/lang/String;
    array-length v10, v2

    .local v10, "len$":I
    const/4 v9, 0x0

    .local v9, "i$":I
    :goto_c8
    if-ge v9, v10, :cond_dc

    aget-object v5, v2, v9

    .line 827
    .local v5, "datePattern":Ljava/lang/String;
    :try_start_cc
    new-instance v13, Ljava/text/SimpleDateFormat;

    invoke-direct {v13, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 828
    .local v13, "parser":Ljava/text/DateFormat;
    if-eqz p3, :cond_e1

    .line 829
    move-object/from16 v0, p3

    invoke-virtual {v13, v0}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 833
    :goto_d8
    invoke-virtual {v13, v7}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v4

    .line 841
    .end local v2    # "arr$":[Ljava/lang/String;
    .end local v5    # "datePattern":Ljava/lang/String;
    .end local v6    # "datePatterns":[Ljava/lang/String;
    .end local v7    # "dateString":Ljava/lang/String;
    .end local v9    # "i$":I
    .end local v10    # "len$":I
    .end local v13    # "parser":Ljava/text/DateFormat;
    .end local v14    # "subsecondMatcher":Ljava/util/regex/Matcher;
    .end local v15    # "subsecondPattern":Ljava/util/regex/Pattern;
    .end local v16    # "timeZoneMatcher":Ljava/util/regex/Matcher;
    .end local v17    # "timeZonePattern":Ljava/util/regex/Pattern;
    :cond_dc
    if-nez v4, :cond_f1

    .line 842
    const/4 v4, 0x0

    goto/16 :goto_d

    .line 831
    .restart local v2    # "arr$":[Ljava/lang/String;
    .restart local v5    # "datePattern":Ljava/lang/String;
    .restart local v6    # "datePatterns":[Ljava/lang/String;
    .restart local v7    # "dateString":Ljava/lang/String;
    .restart local v9    # "i$":I
    .restart local v10    # "len$":I
    .restart local v13    # "parser":Ljava/text/DateFormat;
    .restart local v14    # "subsecondMatcher":Ljava/util/regex/Matcher;
    .restart local v15    # "subsecondPattern":Ljava/util/regex/Pattern;
    .restart local v16    # "timeZoneMatcher":Ljava/util/regex/Matcher;
    .restart local v17    # "timeZonePattern":Ljava/util/regex/Pattern;
    :cond_e1
    const-string v18, "GMT"

    invoke-static/range {v18 .. v18}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v13, v0}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V
    :try_end_ec
    .catch Ljava/text/ParseException; {:try_start_cc .. :try_end_ec} :catch_ed

    goto :goto_d8

    .line 835
    .end local v13    # "parser":Ljava/text/DateFormat;
    :catch_ed
    move-exception v18

    .line 825
    add-int/lit8 v9, v9, 0x1

    goto :goto_c8

    .line 844
    .end local v2    # "arr$":[Ljava/lang/String;
    .end local v5    # "datePattern":Ljava/lang/String;
    .end local v6    # "datePatterns":[Ljava/lang/String;
    .end local v7    # "dateString":Ljava/lang/String;
    .end local v9    # "i$":I
    .end local v10    # "len$":I
    .end local v14    # "subsecondMatcher":Ljava/util/regex/Matcher;
    .end local v15    # "subsecondPattern":Ljava/util/regex/Pattern;
    .end local v16    # "timeZoneMatcher":Ljava/util/regex/Matcher;
    .end local v17    # "timeZonePattern":Ljava/util/regex/Pattern;
    :cond_f1
    if-eqz p2, :cond_d

    .line 848
    :try_start_f3
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "."

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v18

    const-wide v20, 0x408f400000000000L    # 1000.0

    mul-double v18, v18, v20

    move-wide/from16 v0, v18

    double-to-int v11, v0

    .line 849
    .local v11, "millisecond":I
    if-ltz v11, :cond_d

    const/16 v18, 0x3e8

    move/from16 v0, v18

    if-ge v11, v0, :cond_d

    .line 850
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v3

    .line 851
    .local v3, "calendar":Ljava/util/Calendar;
    invoke-virtual {v3, v4}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 852
    const/16 v18, 0xe

    move/from16 v0, v18

    invoke-virtual {v3, v0, v11}, Ljava/util/Calendar;->set(II)V

    .line 853
    invoke-virtual {v3}, Ljava/util/Calendar;->getTime()Ljava/util/Date;
    :try_end_131
    .catch Ljava/lang/NumberFormatException; {:try_start_f3 .. :try_end_131} :catch_134

    move-result-object v4

    goto/16 :goto_d

    .line 856
    .end local v3    # "calendar":Ljava/util/Calendar;
    .end local v11    # "millisecond":I
    :catch_134
    move-exception v8

    .line 857
    .local v8, "e":Ljava/lang/NumberFormatException;
    goto/16 :goto_d
.end method

.method public getDate(ILjava/util/TimeZone;)Ljava/util/Date;
    .registers 4
    .param p1, "tagType"    # I
    .param p2, "timeZone"    # Ljava/util/TimeZone;
        .annotation build Lcom/drew/lang/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 764
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lcom/drew/metadata/Directory;->getDate(ILjava/lang/String;Ljava/util/TimeZone;)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public getDescription(I)Ljava/lang/String;
    .registers 3
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 1052
    sget-boolean v0, Lcom/drew/metadata/Directory;->$assertionsDisabled:Z

    if-nez v0, :cond_e

    iget-object v0, p0, Lcom/drew/metadata/Directory;->_descriptor:Lcom/drew/metadata/TagDescriptor;

    if-nez v0, :cond_e

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 1053
    :cond_e
    iget-object v0, p0, Lcom/drew/metadata/Directory;->_descriptor:Lcom/drew/metadata/TagDescriptor;

    invoke-virtual {v0, p1}, Lcom/drew/metadata/TagDescriptor;->getDescription(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDouble(I)D
    .registers 7
    .param p1, "tagType"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/drew/metadata/MetadataException;
        }
    .end annotation

    .prologue
    .line 618
    invoke-virtual {p0, p1}, Lcom/drew/metadata/Directory;->getDoubleObject(I)Ljava/lang/Double;

    move-result-object v1

    .line 619
    .local v1, "value":Ljava/lang/Double;
    if-eqz v1, :cond_b

    .line 620
    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    return-wide v2

    .line 621
    :cond_b
    invoke-virtual {p0, p1}, Lcom/drew/metadata/Directory;->getObject(I)Ljava/lang/Object;

    move-result-object v0

    .line 622
    .local v0, "o":Ljava/lang/Object;
    if-nez v0, :cond_34

    .line 623
    new-instance v2, Lcom/drew/metadata/MetadataException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Tag \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0, p1}, Lcom/drew/metadata/Directory;->getTagName(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' has not been set -- check using containsTag() first"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/drew/metadata/MetadataException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 624
    :cond_34
    new-instance v2, Lcom/drew/metadata/MetadataException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Tag \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' cannot be converted to a double.  It is of type \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\'."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/drew/metadata/MetadataException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public getDoubleObject(I)Ljava/lang/Double;
    .registers 7
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 630
    invoke-virtual {p0, p1}, Lcom/drew/metadata/Directory;->getObject(I)Ljava/lang/Object;

    move-result-object v1

    .line 631
    .local v1, "o":Ljava/lang/Object;
    if-nez v1, :cond_8

    .line 643
    .end local v1    # "o":Ljava/lang/Object;
    :cond_7
    :goto_7
    return-object v2

    .line 633
    .restart local v1    # "o":Ljava/lang/Object;
    :cond_8
    instance-of v3, v1, Ljava/lang/String;

    if-eqz v3, :cond_19

    .line 635
    :try_start_c
    check-cast v1, Ljava/lang/String;

    .end local v1    # "o":Ljava/lang/Object;
    invoke-static {v1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;
    :try_end_15
    .catch Ljava/lang/NumberFormatException; {:try_start_c .. :try_end_15} :catch_17

    move-result-object v2

    goto :goto_7

    .line 636
    :catch_17
    move-exception v0

    .line 637
    .local v0, "nfe":Ljava/lang/NumberFormatException;
    goto :goto_7

    .line 640
    .end local v0    # "nfe":Ljava/lang/NumberFormatException;
    .restart local v1    # "o":Ljava/lang/Object;
    :cond_19
    instance-of v3, v1, Ljava/lang/Number;

    if-eqz v3, :cond_7

    .line 641
    check-cast v1, Ljava/lang/Number;

    .end local v1    # "o":Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    goto :goto_7
.end method

.method public getErrorCount()I
    .registers 2

    .prologue
    .line 180
    iget-object v0, p0, Lcom/drew/metadata/Directory;->_errorList:Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v0

    return v0
.end method

.method public getErrors()Ljava/lang/Iterable;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Iterable",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 174
    iget-object v0, p0, Lcom/drew/metadata/Directory;->_errorList:Ljava/util/Collection;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public getFloat(I)F
    .registers 7
    .param p1, "tagType"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/drew/metadata/MetadataException;
        }
    .end annotation

    .prologue
    .line 649
    invoke-virtual {p0, p1}, Lcom/drew/metadata/Directory;->getFloatObject(I)Ljava/lang/Float;

    move-result-object v1

    .line 650
    .local v1, "value":Ljava/lang/Float;
    if-eqz v1, :cond_b

    .line 651
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v2

    return v2

    .line 652
    :cond_b
    invoke-virtual {p0, p1}, Lcom/drew/metadata/Directory;->getObject(I)Ljava/lang/Object;

    move-result-object v0

    .line 653
    .local v0, "o":Ljava/lang/Object;
    if-nez v0, :cond_34

    .line 654
    new-instance v2, Lcom/drew/metadata/MetadataException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Tag \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0, p1}, Lcom/drew/metadata/Directory;->getTagName(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' has not been set -- check using containsTag() first"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/drew/metadata/MetadataException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 655
    :cond_34
    new-instance v2, Lcom/drew/metadata/MetadataException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Tag \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' cannot be converted to a float.  It is of type \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\'."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/drew/metadata/MetadataException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public getFloatObject(I)Ljava/lang/Float;
    .registers 6
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 662
    invoke-virtual {p0, p1}, Lcom/drew/metadata/Directory;->getObject(I)Ljava/lang/Object;

    move-result-object v1

    .line 663
    .local v1, "o":Ljava/lang/Object;
    if-nez v1, :cond_8

    .line 674
    .end local v1    # "o":Ljava/lang/Object;
    :cond_7
    :goto_7
    return-object v2

    .line 665
    .restart local v1    # "o":Ljava/lang/Object;
    :cond_8
    instance-of v3, v1, Ljava/lang/String;

    if-eqz v3, :cond_19

    .line 667
    :try_start_c
    check-cast v1, Ljava/lang/String;

    .end local v1    # "o":Ljava/lang/Object;
    invoke-static {v1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;
    :try_end_15
    .catch Ljava/lang/NumberFormatException; {:try_start_c .. :try_end_15} :catch_17

    move-result-object v2

    goto :goto_7

    .line 668
    :catch_17
    move-exception v0

    .line 669
    .local v0, "nfe":Ljava/lang/NumberFormatException;
    goto :goto_7

    .line 672
    .end local v0    # "nfe":Ljava/lang/NumberFormatException;
    .restart local v1    # "o":Ljava/lang/Object;
    :cond_19
    instance-of v3, v1, Ljava/lang/Number;

    if-eqz v3, :cond_7

    .line 673
    check-cast v1, Ljava/lang/Number;

    .end local v1    # "o":Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/lang/Number;->floatValue()F

    move-result v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    goto :goto_7
.end method

.method public getInt(I)I
    .registers 7
    .param p1, "tagType"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/drew/metadata/MetadataException;
        }
    .end annotation

    .prologue
    .line 408
    invoke-virtual {p0, p1}, Lcom/drew/metadata/Directory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 409
    .local v0, "integer":Ljava/lang/Integer;
    if-eqz v0, :cond_b

    .line 410
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    return v2

    .line 412
    :cond_b
    invoke-virtual {p0, p1}, Lcom/drew/metadata/Directory;->getObject(I)Ljava/lang/Object;

    move-result-object v1

    .line 413
    .local v1, "o":Ljava/lang/Object;
    if-nez v1, :cond_34

    .line 414
    new-instance v2, Lcom/drew/metadata/MetadataException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Tag \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0, p1}, Lcom/drew/metadata/Directory;->getTagName(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' has not been set -- check using containsTag() first"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/drew/metadata/MetadataException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 415
    :cond_34
    new-instance v2, Lcom/drew/metadata/MetadataException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Tag \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' cannot be converted to int.  It is of type \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\'."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/drew/metadata/MetadataException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public getIntArray(I)[I
    .registers 11
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 522
    invoke-virtual {p0, p1}, Lcom/drew/metadata/Directory;->getObject(I)Ljava/lang/Object;

    move-result-object v3

    .line 523
    .local v3, "o":Ljava/lang/Object;
    if-nez v3, :cond_8

    .line 562
    .end local v3    # "o":Ljava/lang/Object;
    :cond_7
    :goto_7
    return-object v2

    .line 525
    .restart local v3    # "o":Ljava/lang/Object;
    :cond_8
    instance-of v7, v3, [I

    if-eqz v7, :cond_12

    .line 526
    check-cast v3, [I

    .end local v3    # "o":Ljava/lang/Object;
    check-cast v3, [I

    move-object v2, v3

    goto :goto_7

    .line 527
    .restart local v3    # "o":Ljava/lang/Object;
    :cond_12
    instance-of v7, v3, [Lcom/drew/lang/Rational;

    if-eqz v7, :cond_2d

    .line 528
    check-cast v3, [Lcom/drew/lang/Rational;

    .end local v3    # "o":Ljava/lang/Object;
    move-object v4, v3

    check-cast v4, [Lcom/drew/lang/Rational;

    .line 529
    .local v4, "rationals":[Lcom/drew/lang/Rational;
    array-length v7, v4

    new-array v2, v7, [I

    .line 530
    .local v2, "ints":[I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1f
    array-length v7, v2

    if-ge v1, v7, :cond_7

    .line 531
    aget-object v7, v4, v1

    invoke-virtual {v7}, Lcom/drew/lang/Rational;->intValue()I

    move-result v7

    aput v7, v2, v1

    .line 530
    add-int/lit8 v1, v1, 0x1

    goto :goto_1f

    .line 535
    .end local v1    # "i":I
    .end local v2    # "ints":[I
    .end local v4    # "rationals":[Lcom/drew/lang/Rational;
    .restart local v3    # "o":Ljava/lang/Object;
    :cond_2d
    instance-of v7, v3, [S

    if-eqz v7, :cond_44

    .line 536
    check-cast v3, [S

    .end local v3    # "o":Ljava/lang/Object;
    move-object v5, v3

    check-cast v5, [S

    .line 537
    .local v5, "shorts":[S
    array-length v7, v5

    new-array v2, v7, [I

    .line 538
    .restart local v2    # "ints":[I
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_3a
    array-length v7, v5

    if-ge v1, v7, :cond_7

    .line 539
    aget-short v7, v5, v1

    aput v7, v2, v1

    .line 538
    add-int/lit8 v1, v1, 0x1

    goto :goto_3a

    .line 543
    .end local v1    # "i":I
    .end local v2    # "ints":[I
    .end local v5    # "shorts":[S
    .restart local v3    # "o":Ljava/lang/Object;
    :cond_44
    instance-of v7, v3, [B

    if-eqz v7, :cond_5b

    .line 544
    check-cast v3, [B

    .end local v3    # "o":Ljava/lang/Object;
    move-object v0, v3

    check-cast v0, [B

    .line 545
    .local v0, "bytes":[B
    array-length v7, v0

    new-array v2, v7, [I

    .line 546
    .restart local v2    # "ints":[I
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_51
    array-length v7, v0

    if-ge v1, v7, :cond_7

    .line 547
    aget-byte v7, v0, v1

    aput v7, v2, v1

    .line 546
    add-int/lit8 v1, v1, 0x1

    goto :goto_51

    .line 551
    .end local v0    # "bytes":[B
    .end local v1    # "i":I
    .end local v2    # "ints":[I
    .restart local v3    # "o":Ljava/lang/Object;
    :cond_5b
    instance-of v7, v3, Ljava/lang/CharSequence;

    if-eqz v7, :cond_78

    move-object v6, v3

    .line 552
    check-cast v6, Ljava/lang/CharSequence;

    .line 553
    .local v6, "str":Ljava/lang/CharSequence;
    invoke-interface {v6}, Ljava/lang/CharSequence;->length()I

    move-result v7

    new-array v2, v7, [I

    .line 554
    .restart local v2    # "ints":[I
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_69
    invoke-interface {v6}, Ljava/lang/CharSequence;->length()I

    move-result v7

    if-ge v1, v7, :cond_7

    .line 555
    invoke-interface {v6, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v7

    aput v7, v2, v1

    .line 554
    add-int/lit8 v1, v1, 0x1

    goto :goto_69

    .line 559
    .end local v1    # "i":I
    .end local v2    # "ints":[I
    .end local v6    # "str":Ljava/lang/CharSequence;
    :cond_78
    instance-of v7, v3, Ljava/lang/Integer;

    if-eqz v7, :cond_7

    .line 560
    const/4 v7, 0x1

    new-array v2, v7, [I

    const/4 v7, 0x0

    check-cast v3, Ljava/lang/Integer;

    .end local v3    # "o":Ljava/lang/Object;
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v8

    aput v8, v2, v7

    goto/16 :goto_7
.end method

.method public getInteger(I)Ljava/lang/Integer;
    .registers 17
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 436
    invoke-virtual/range {p0 .. p1}, Lcom/drew/metadata/Directory;->getObject(I)Ljava/lang/Object;

    move-result-object v8

    .line 438
    .local v8, "o":Ljava/lang/Object;
    if-nez v8, :cond_8

    .line 439
    const/4 v13, 0x0

    .line 470
    .end local v8    # "o":Ljava/lang/Object;
    :goto_7
    return-object v13

    .line 441
    .restart local v8    # "o":Ljava/lang/Object;
    :cond_8
    instance-of v13, v8, Ljava/lang/Number;

    if-eqz v13, :cond_17

    .line 442
    check-cast v8, Ljava/lang/Number;

    .end local v8    # "o":Ljava/lang/Object;
    invoke-virtual {v8}, Ljava/lang/Number;->intValue()I

    move-result v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    goto :goto_7

    .line 443
    .restart local v8    # "o":Ljava/lang/Object;
    :cond_17
    instance-of v13, v8, Ljava/lang/String;

    if-eqz v13, :cond_49

    .line 445
    :try_start_1b
    move-object v0, v8

    check-cast v0, Ljava/lang/String;

    move-object v13, v0

    invoke-static {v13}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    :try_end_26
    .catch Ljava/lang/NumberFormatException; {:try_start_1b .. :try_end_26} :catch_28

    move-result-object v13

    goto :goto_7

    .line 446
    :catch_28
    move-exception v7

    .local v7, "nfe":Ljava/lang/NumberFormatException;
    move-object v10, v8

    .line 448
    check-cast v10, Ljava/lang/String;

    .line 449
    .local v10, "s":Ljava/lang/String;
    invoke-virtual {v10}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    .line 450
    .local v3, "bytes":[B
    const-wide/16 v11, 0x0

    .line 451
    .local v11, "val":J
    move-object v2, v3

    .local v2, "arr$":[B
    array-length v6, v2

    .local v6, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_35
    if-ge v4, v6, :cond_43

    aget-byte v1, v2, v4

    .line 452
    .local v1, "aByte":B
    const/16 v13, 0x8

    shl-long/2addr v11, v13

    .line 453
    and-int/lit16 v13, v1, 0xff

    int-to-long v13, v13

    add-long/2addr v11, v13

    .line 451
    add-int/lit8 v4, v4, 0x1

    goto :goto_35

    .line 455
    .end local v1    # "aByte":B
    :cond_43
    long-to-int v13, v11

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    goto :goto_7

    .line 457
    .end local v2    # "arr$":[B
    .end local v3    # "bytes":[B
    .end local v4    # "i$":I
    .end local v6    # "len$":I
    .end local v7    # "nfe":Ljava/lang/NumberFormatException;
    .end local v10    # "s":Ljava/lang/String;
    .end local v11    # "val":J
    :cond_49
    instance-of v13, v8, [Lcom/drew/lang/Rational;

    if-eqz v13, :cond_62

    .line 458
    check-cast v8, [Lcom/drew/lang/Rational;

    .end local v8    # "o":Ljava/lang/Object;
    move-object v9, v8

    check-cast v9, [Lcom/drew/lang/Rational;

    .line 459
    .local v9, "rationals":[Lcom/drew/lang/Rational;
    array-length v13, v9

    const/4 v14, 0x1

    if-ne v13, v14, :cond_8d

    .line 460
    const/4 v13, 0x0

    aget-object v13, v9, v13

    invoke-virtual {v13}, Lcom/drew/lang/Rational;->intValue()I

    move-result v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    goto :goto_7

    .line 461
    .end local v9    # "rationals":[Lcom/drew/lang/Rational;
    .restart local v8    # "o":Ljava/lang/Object;
    :cond_62
    instance-of v13, v8, [B

    if-eqz v13, :cond_77

    .line 462
    check-cast v8, [B

    .end local v8    # "o":Ljava/lang/Object;
    move-object v3, v8

    check-cast v3, [B

    .line 463
    .restart local v3    # "bytes":[B
    array-length v13, v3

    const/4 v14, 0x1

    if-ne v13, v14, :cond_8d

    .line 464
    const/4 v13, 0x0

    aget-byte v13, v3, v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    goto :goto_7

    .line 465
    .end local v3    # "bytes":[B
    .restart local v8    # "o":Ljava/lang/Object;
    :cond_77
    instance-of v13, v8, [I

    if-eqz v13, :cond_8d

    .line 466
    check-cast v8, [I

    .end local v8    # "o":Ljava/lang/Object;
    move-object v5, v8

    check-cast v5, [I

    .line 467
    .local v5, "ints":[I
    array-length v13, v5

    const/4 v14, 0x1

    if-ne v13, v14, :cond_8d

    .line 468
    const/4 v13, 0x0

    aget v13, v5, v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    goto/16 :goto_7

    .line 470
    .end local v5    # "ints":[I
    :cond_8d
    const/4 v13, 0x0

    goto/16 :goto_7
.end method

.method public getLong(I)J
    .registers 7
    .param p1, "tagType"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/drew/metadata/MetadataException;
        }
    .end annotation

    .prologue
    .line 680
    invoke-virtual {p0, p1}, Lcom/drew/metadata/Directory;->getLongObject(I)Ljava/lang/Long;

    move-result-object v1

    .line 681
    .local v1, "value":Ljava/lang/Long;
    if-eqz v1, :cond_b

    .line 682
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    return-wide v2

    .line 683
    :cond_b
    invoke-virtual {p0, p1}, Lcom/drew/metadata/Directory;->getObject(I)Ljava/lang/Object;

    move-result-object v0

    .line 684
    .local v0, "o":Ljava/lang/Object;
    if-nez v0, :cond_34

    .line 685
    new-instance v2, Lcom/drew/metadata/MetadataException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Tag \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0, p1}, Lcom/drew/metadata/Directory;->getTagName(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' has not been set -- check using containsTag() first"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/drew/metadata/MetadataException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 686
    :cond_34
    new-instance v2, Lcom/drew/metadata/MetadataException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Tag \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' cannot be converted to a long.  It is of type \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\'."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/drew/metadata/MetadataException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public getLongObject(I)Ljava/lang/Long;
    .registers 7
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 693
    invoke-virtual {p0, p1}, Lcom/drew/metadata/Directory;->getObject(I)Ljava/lang/Object;

    move-result-object v1

    .line 694
    .local v1, "o":Ljava/lang/Object;
    if-nez v1, :cond_8

    .line 705
    .end local v1    # "o":Ljava/lang/Object;
    :cond_7
    :goto_7
    return-object v2

    .line 696
    .restart local v1    # "o":Ljava/lang/Object;
    :cond_8
    instance-of v3, v1, Ljava/lang/String;

    if-eqz v3, :cond_19

    .line 698
    :try_start_c
    check-cast v1, Ljava/lang/String;

    .end local v1    # "o":Ljava/lang/Object;
    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    :try_end_15
    .catch Ljava/lang/NumberFormatException; {:try_start_c .. :try_end_15} :catch_17

    move-result-object v2

    goto :goto_7

    .line 699
    :catch_17
    move-exception v0

    .line 700
    .local v0, "nfe":Ljava/lang/NumberFormatException;
    goto :goto_7

    .line 703
    .end local v0    # "nfe":Ljava/lang/NumberFormatException;
    .restart local v1    # "o":Ljava/lang/Object;
    :cond_19
    instance-of v3, v1, Ljava/lang/Number;

    if-eqz v3, :cond_7

    .line 704
    check-cast v1, Ljava/lang/Number;

    .end local v1    # "o":Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/lang/Number;->longValue()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    goto :goto_7
.end method

.method public abstract getName()Ljava/lang/String;
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation
.end method

.method public getObject(I)Ljava/lang/Object;
    .registers 4
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 1006
    iget-object v0, p0, Lcom/drew/metadata/Directory;->_tagMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getParent()Lcom/drew/metadata/Directory;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 186
    iget-object v0, p0, Lcom/drew/metadata/Directory;->_parent:Lcom/drew/metadata/Directory;

    return-object v0
.end method

.method public getRational(I)Lcom/drew/lang/Rational;
    .registers 8
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const-wide/16 v4, 0x1

    const/4 v1, 0x0

    .line 865
    invoke-virtual {p0, p1}, Lcom/drew/metadata/Directory;->getObject(I)Ljava/lang/Object;

    move-result-object v0

    .line 867
    .local v0, "o":Ljava/lang/Object;
    if-nez v0, :cond_b

    move-object v0, v1

    .line 879
    .end local v0    # "o":Ljava/lang/Object;
    :goto_a
    return-object v0

    .line 870
    .restart local v0    # "o":Ljava/lang/Object;
    :cond_b
    instance-of v2, v0, Lcom/drew/lang/Rational;

    if-eqz v2, :cond_12

    .line 871
    check-cast v0, Lcom/drew/lang/Rational;

    goto :goto_a

    .line 872
    :cond_12
    instance-of v2, v0, Ljava/lang/Integer;

    if-eqz v2, :cond_24

    .line 873
    new-instance v1, Lcom/drew/lang/Rational;

    check-cast v0, Ljava/lang/Integer;

    .end local v0    # "o":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    int-to-long v2, v2

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/drew/lang/Rational;-><init>(JJ)V

    move-object v0, v1

    goto :goto_a

    .line 874
    .restart local v0    # "o":Ljava/lang/Object;
    :cond_24
    instance-of v2, v0, Ljava/lang/Long;

    if-eqz v2, :cond_35

    .line 875
    new-instance v1, Lcom/drew/lang/Rational;

    check-cast v0, Ljava/lang/Long;

    .end local v0    # "o":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/drew/lang/Rational;-><init>(JJ)V

    move-object v0, v1

    goto :goto_a

    .restart local v0    # "o":Ljava/lang/Object;
    :cond_35
    move-object v0, v1

    .line 879
    goto :goto_a
.end method

.method public getRationalArray(I)[Lcom/drew/lang/Rational;
    .registers 5
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 886
    invoke-virtual {p0, p1}, Lcom/drew/metadata/Directory;->getObject(I)Ljava/lang/Object;

    move-result-object v0

    .line 887
    .local v0, "o":Ljava/lang/Object;
    if-nez v0, :cond_9

    move-object v0, v1

    .line 893
    .end local v0    # "o":Ljava/lang/Object;
    :goto_8
    return-object v0

    .line 890
    .restart local v0    # "o":Ljava/lang/Object;
    :cond_9
    instance-of v2, v0, [Lcom/drew/lang/Rational;

    if-eqz v2, :cond_12

    .line 891
    check-cast v0, [Lcom/drew/lang/Rational;

    .end local v0    # "o":Ljava/lang/Object;
    check-cast v0, [Lcom/drew/lang/Rational;

    goto :goto_8

    .restart local v0    # "o":Ljava/lang/Object;
    :cond_12
    move-object v0, v1

    .line 893
    goto :goto_8
.end method

.method public getString(I)Ljava/lang/String;
    .registers 11
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/16 v8, 0x20

    .line 906
    invoke-virtual {p0, p1}, Lcom/drew/metadata/Directory;->getObject(I)Ljava/lang/Object;

    move-result-object v3

    .line 907
    .local v3, "o":Ljava/lang/Object;
    if-nez v3, :cond_a

    .line 908
    const/4 v5, 0x0

    .line 980
    .end local v3    # "o":Ljava/lang/Object;
    :goto_9
    return-object v5

    .line 910
    .restart local v3    # "o":Ljava/lang/Object;
    :cond_a
    instance-of v5, v3, Lcom/drew/lang/Rational;

    if-eqz v5, :cond_16

    .line 911
    check-cast v3, Lcom/drew/lang/Rational;

    .end local v3    # "o":Ljava/lang/Object;
    const/4 v5, 0x1

    invoke-virtual {v3, v5}, Lcom/drew/lang/Rational;->toSimpleString(Z)Ljava/lang/String;

    move-result-object v5

    goto :goto_9

    .line 913
    .restart local v3    # "o":Ljava/lang/Object;
    :cond_16
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->isArray()Z

    move-result v5

    if-eqz v5, :cond_132

    .line 915
    invoke-static {v3}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v0

    .line 916
    .local v0, "arrayLength":I
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v1

    .line 918
    .local v1, "componentType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 920
    .local v4, "string":Ljava/lang/StringBuilder;
    const-class v5, Ljava/lang/Object;

    invoke-virtual {v5, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v5

    if-eqz v5, :cond_4f

    .line 922
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_3a
    if-ge v2, v0, :cond_12c

    .line 923
    if-eqz v2, :cond_41

    .line 924
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 925
    :cond_41
    invoke-static {v3, v2}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 922
    add-int/lit8 v2, v2, 0x1

    goto :goto_3a

    .line 927
    .end local v2    # "i":I
    :cond_4f
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "int"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6d

    .line 928
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_5c
    if-ge v2, v0, :cond_12c

    .line 929
    if-eqz v2, :cond_63

    .line 930
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 931
    :cond_63
    invoke-static {v3, v2}, Ljava/lang/reflect/Array;->getInt(Ljava/lang/Object;I)I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 928
    add-int/lit8 v2, v2, 0x1

    goto :goto_5c

    .line 933
    .end local v2    # "i":I
    :cond_6d
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "short"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8b

    .line 934
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_7a
    if-ge v2, v0, :cond_12c

    .line 935
    if-eqz v2, :cond_81

    .line 936
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 937
    :cond_81
    invoke-static {v3, v2}, Ljava/lang/reflect/Array;->getShort(Ljava/lang/Object;I)S

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 934
    add-int/lit8 v2, v2, 0x1

    goto :goto_7a

    .line 939
    .end local v2    # "i":I
    :cond_8b
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "long"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_a9

    .line 940
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_98
    if-ge v2, v0, :cond_12c

    .line 941
    if-eqz v2, :cond_9f

    .line 942
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 943
    :cond_9f
    invoke-static {v3, v2}, Ljava/lang/reflect/Array;->getLong(Ljava/lang/Object;I)J

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 940
    add-int/lit8 v2, v2, 0x1

    goto :goto_98

    .line 945
    .end local v2    # "i":I
    :cond_a9
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "float"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_ce

    .line 946
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_b6
    if-ge v2, v0, :cond_12c

    .line 947
    if-eqz v2, :cond_bd

    .line 948
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 949
    :cond_bd
    sget-object v5, Lcom/drew/metadata/Directory;->_floatFormat:Ljava/text/DecimalFormat;

    invoke-static {v3, v2}, Ljava/lang/reflect/Array;->getFloat(Ljava/lang/Object;I)F

    move-result v6

    float-to-double v6, v6

    invoke-virtual {v5, v6, v7}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 946
    add-int/lit8 v2, v2, 0x1

    goto :goto_b6

    .line 951
    .end local v2    # "i":I
    :cond_ce
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "double"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_f2

    .line 952
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_db
    if-ge v2, v0, :cond_12c

    .line 953
    if-eqz v2, :cond_e2

    .line 954
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 955
    :cond_e2
    sget-object v5, Lcom/drew/metadata/Directory;->_floatFormat:Ljava/text/DecimalFormat;

    invoke-static {v3, v2}, Ljava/lang/reflect/Array;->getDouble(Ljava/lang/Object;I)D

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 952
    add-int/lit8 v2, v2, 0x1

    goto :goto_db

    .line 957
    .end local v2    # "i":I
    :cond_f2
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "byte"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_112

    .line 958
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_ff
    if-ge v2, v0, :cond_12c

    .line 959
    if-eqz v2, :cond_106

    .line 960
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 961
    :cond_106
    invoke-static {v3, v2}, Ljava/lang/reflect/Array;->getByte(Ljava/lang/Object;I)B

    move-result v5

    and-int/lit16 v5, v5, 0xff

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 958
    add-int/lit8 v2, v2, 0x1

    goto :goto_ff

    .line 964
    .end local v2    # "i":I
    :cond_112
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unexpected array component type: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/drew/metadata/Directory;->addError(Ljava/lang/String;)V

    .line 967
    :cond_12c
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto/16 :goto_9

    .line 970
    .end local v0    # "arrayLength":I
    .end local v1    # "componentType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "string":Ljava/lang/StringBuilder;
    :cond_132
    instance-of v5, v3, Ljava/lang/Double;

    if-eqz v5, :cond_144

    .line 971
    sget-object v5, Lcom/drew/metadata/Directory;->_floatFormat:Ljava/text/DecimalFormat;

    check-cast v3, Ljava/lang/Double;

    .end local v3    # "o":Ljava/lang/Object;
    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v5

    goto/16 :goto_9

    .line 973
    .restart local v3    # "o":Ljava/lang/Object;
    :cond_144
    instance-of v5, v3, Ljava/lang/Float;

    if-eqz v5, :cond_157

    .line 974
    sget-object v5, Lcom/drew/metadata/Directory;->_floatFormat:Ljava/text/DecimalFormat;

    check-cast v3, Ljava/lang/Float;

    .end local v3    # "o":Ljava/lang/Object;
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v6

    float-to-double v6, v6

    invoke-virtual {v5, v6, v7}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v5

    goto/16 :goto_9

    .line 980
    .restart local v3    # "o":Ljava/lang/Object;
    :cond_157
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    goto/16 :goto_9
.end method

.method public getString(ILjava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p1, "tagType"    # I
    .param p2, "charset"    # Ljava/lang/String;
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 986
    invoke-virtual {p0, p1}, Lcom/drew/metadata/Directory;->getByteArray(I)[B

    move-result-object v0

    .line 987
    .local v0, "bytes":[B
    if-nez v0, :cond_8

    .line 992
    :goto_7
    return-object v2

    .line 990
    :cond_8
    :try_start_8
    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v0, p2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_d
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_8 .. :try_end_d} :catch_f

    move-object v2, v3

    goto :goto_7

    .line 991
    :catch_f
    move-exception v1

    .line 992
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    goto :goto_7
.end method

.method public getStringArray(I)[Ljava/lang/String;
    .registers 10
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v5, 0x0

    const/4 v7, 0x0

    .line 483
    invoke-virtual {p0, p1}, Lcom/drew/metadata/Directory;->getObject(I)Ljava/lang/Object;

    move-result-object v3

    .line 484
    .local v3, "o":Ljava/lang/Object;
    if-nez v3, :cond_9

    .line 509
    .end local v3    # "o":Ljava/lang/Object;
    :cond_8
    :goto_8
    return-object v5

    .line 486
    .restart local v3    # "o":Ljava/lang/Object;
    :cond_9
    instance-of v6, v3, [Ljava/lang/String;

    if-eqz v6, :cond_13

    .line 487
    check-cast v3, [Ljava/lang/String;

    .end local v3    # "o":Ljava/lang/Object;
    check-cast v3, [Ljava/lang/String;

    move-object v5, v3

    goto :goto_8

    .line 488
    .restart local v3    # "o":Ljava/lang/Object;
    :cond_13
    instance-of v6, v3, Ljava/lang/String;

    if-eqz v6, :cond_1f

    .line 489
    const/4 v6, 0x1

    new-array v5, v6, [Ljava/lang/String;

    check-cast v3, Ljava/lang/String;

    .end local v3    # "o":Ljava/lang/Object;
    aput-object v3, v5, v7

    goto :goto_8

    .line 490
    .restart local v3    # "o":Ljava/lang/Object;
    :cond_1f
    instance-of v6, v3, [I

    if-eqz v6, :cond_3a

    .line 491
    check-cast v3, [I

    .end local v3    # "o":Ljava/lang/Object;
    move-object v2, v3

    check-cast v2, [I

    .line 492
    .local v2, "ints":[I
    array-length v6, v2

    new-array v5, v6, [Ljava/lang/String;

    .line 493
    .local v5, "strings":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2c
    array-length v6, v5

    if-ge v1, v6, :cond_8

    .line 494
    aget v6, v2, v1

    invoke-static {v6}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v1

    .line 493
    add-int/lit8 v1, v1, 0x1

    goto :goto_2c

    .line 496
    .end local v1    # "i":I
    .end local v2    # "ints":[I
    .end local v5    # "strings":[Ljava/lang/String;
    .restart local v3    # "o":Ljava/lang/Object;
    :cond_3a
    instance-of v6, v3, [B

    if-eqz v6, :cond_55

    .line 497
    check-cast v3, [B

    .end local v3    # "o":Ljava/lang/Object;
    move-object v0, v3

    check-cast v0, [B

    .line 498
    .local v0, "bytes":[B
    array-length v6, v0

    new-array v5, v6, [Ljava/lang/String;

    .line 499
    .restart local v5    # "strings":[Ljava/lang/String;
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_47
    array-length v6, v5

    if-ge v1, v6, :cond_8

    .line 500
    aget-byte v6, v0, v1

    invoke-static {v6}, Ljava/lang/Byte;->toString(B)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v1

    .line 499
    add-int/lit8 v1, v1, 0x1

    goto :goto_47

    .line 502
    .end local v0    # "bytes":[B
    .end local v1    # "i":I
    .end local v5    # "strings":[Ljava/lang/String;
    .restart local v3    # "o":Ljava/lang/Object;
    :cond_55
    instance-of v6, v3, [Lcom/drew/lang/Rational;

    if-eqz v6, :cond_8

    .line 503
    check-cast v3, [Lcom/drew/lang/Rational;

    .end local v3    # "o":Ljava/lang/Object;
    move-object v4, v3

    check-cast v4, [Lcom/drew/lang/Rational;

    .line 504
    .local v4, "rationals":[Lcom/drew/lang/Rational;
    array-length v6, v4

    new-array v5, v6, [Ljava/lang/String;

    .line 505
    .restart local v5    # "strings":[Ljava/lang/String;
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_62
    array-length v6, v5

    if-ge v1, v6, :cond_8

    .line 506
    aget-object v6, v4, v1

    invoke-virtual {v6, v7}, Lcom/drew/lang/Rational;->toSimpleString(Z)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v1

    .line 505
    add-int/lit8 v1, v1, 0x1

    goto :goto_62
.end method

.method public getTagCount()I
    .registers 2

    .prologue
    .line 130
    iget-object v0, p0, Lcom/drew/metadata/Directory;->_definedTagList:Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v0

    return v0
.end method

.method public getTagName(I)Ljava/lang/String;
    .registers 6
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 1020
    invoke-virtual {p0}, Lcom/drew/metadata/Directory;->getTagNameMap()Ljava/util/HashMap;

    move-result-object v1

    .line 1021
    .local v1, "nameMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/String;>;"
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_47

    .line 1022
    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    .line 1023
    .local v0, "hex":Ljava/lang/String;
    :goto_12
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x4

    if-ge v2, v3, :cond_2d

    .line 1024
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "0"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_12

    .line 1026
    :cond_2d
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unknown tag (0x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1028
    .end local v0    # "hex":Ljava/lang/String;
    :goto_46
    return-object v2

    :cond_47
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    goto :goto_46
.end method

.method protected abstract getTagNameMap()Ljava/util/HashMap;
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public getTags()Ljava/util/Collection;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lcom/drew/metadata/Tag;",
            ">;"
        }
    .end annotation

    .prologue
    .line 120
    iget-object v0, p0, Lcom/drew/metadata/Directory;->_definedTagList:Ljava/util/Collection;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public hasErrors()Z
    .registers 2

    .prologue
    .line 163
    iget-object v0, p0, Lcom/drew/metadata/Directory;->_errorList:Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v0

    if-lez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public hasTagName(I)Z
    .registers 4
    .param p1, "tagType"    # I

    .prologue
    .line 1039
    invoke-virtual {p0}, Lcom/drew/metadata/Directory;->getTagNameMap()Ljava/util/HashMap;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 97
    iget-object v0, p0, Lcom/drew/metadata/Directory;->_errorList:Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_12

    iget-object v0, p0, Lcom/drew/metadata/Directory;->_definedTagList:Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public setBoolean(IZ)V
    .registers 4
    .param p1, "tagType"    # I
    .param p2, "value"    # Z

    .prologue
    .line 295
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/drew/metadata/Directory;->setObject(ILjava/lang/Object;)V

    .line 296
    return-void
.end method

.method public setByteArray(I[B)V
    .registers 3
    .param p1, "tagType"    # I
    .param p2, "bytes"    # [B
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 350
    invoke-virtual {p0, p1, p2}, Lcom/drew/metadata/Directory;->setObjectArray(ILjava/lang/Object;)V

    .line 351
    return-void
.end method

.method public setDate(ILjava/util/Date;)V
    .registers 3
    .param p1, "tagType"    # I
    .param p2, "value"    # Ljava/util/Date;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 317
    invoke-virtual {p0, p1, p2}, Lcom/drew/metadata/Directory;->setObject(ILjava/lang/Object;)V

    .line 318
    return-void
.end method

.method public setDescriptor(Lcom/drew/metadata/TagDescriptor;)V
    .registers 4
    .param p1, "descriptor"    # Lcom/drew/metadata/TagDescriptor;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 141
    if-nez p1, :cond_a

    .line 142
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "cannot set a null descriptor"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 143
    :cond_a
    iput-object p1, p0, Lcom/drew/metadata/Directory;->_descriptor:Lcom/drew/metadata/TagDescriptor;

    .line 144
    return-void
.end method

.method public setDouble(ID)V
    .registers 5
    .param p1, "tagType"    # I
    .param p2, "value"    # D

    .prologue
    .line 248
    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/drew/metadata/Directory;->setObject(ILjava/lang/Object;)V

    .line 249
    return-void
.end method

.method public setDoubleArray(I[D)V
    .registers 3
    .param p1, "tagType"    # I
    .param p2, "doubles"    # [D
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 259
    invoke-virtual {p0, p1, p2}, Lcom/drew/metadata/Directory;->setObjectArray(ILjava/lang/Object;)V

    .line 260
    return-void
.end method

.method public setFloat(IF)V
    .registers 4
    .param p1, "tagType"    # I
    .param p2, "value"    # F

    .prologue
    .line 226
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/drew/metadata/Directory;->setObject(ILjava/lang/Object;)V

    .line 227
    return-void
.end method

.method public setFloatArray(I[F)V
    .registers 3
    .param p1, "tagType"    # I
    .param p2, "floats"    # [F
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 237
    invoke-virtual {p0, p1, p2}, Lcom/drew/metadata/Directory;->setObjectArray(ILjava/lang/Object;)V

    .line 238
    return-void
.end method

.method public setInt(II)V
    .registers 4
    .param p1, "tagType"    # I
    .param p2, "value"    # I

    .prologue
    .line 204
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/drew/metadata/Directory;->setObject(ILjava/lang/Object;)V

    .line 205
    return-void
.end method

.method public setIntArray(I[I)V
    .registers 3
    .param p1, "tagType"    # I
    .param p2, "ints"    # [I
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 215
    invoke-virtual {p0, p1, p2}, Lcom/drew/metadata/Directory;->setObjectArray(ILjava/lang/Object;)V

    .line 216
    return-void
.end method

.method public setLong(IJ)V
    .registers 5
    .param p1, "tagType"    # I
    .param p2, "value"    # J

    .prologue
    .line 306
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/drew/metadata/Directory;->setObject(ILjava/lang/Object;)V

    .line 307
    return-void
.end method

.method public setObject(ILjava/lang/Object;)V
    .registers 5
    .param p1, "tagType"    # I
    .param p2, "value"    # Ljava/lang/Object;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 363
    if-nez p2, :cond_a

    .line 364
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "cannot set a null object"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 366
    :cond_a
    iget-object v0, p0, Lcom/drew/metadata/Directory;->_tagMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_20

    .line 367
    iget-object v0, p0, Lcom/drew/metadata/Directory;->_definedTagList:Ljava/util/Collection;

    new-instance v1, Lcom/drew/metadata/Tag;

    invoke-direct {v1, p1, p0}, Lcom/drew/metadata/Tag;-><init>(ILcom/drew/metadata/Directory;)V

    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 374
    :cond_20
    iget-object v0, p0, Lcom/drew/metadata/Directory;->_tagMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 375
    return-void
.end method

.method public setObjectArray(ILjava/lang/Object;)V
    .registers 3
    .param p1, "tagType"    # I
    .param p2, "array"    # Ljava/lang/Object;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 386
    invoke-virtual {p0, p1, p2}, Lcom/drew/metadata/Directory;->setObject(ILjava/lang/Object;)V

    .line 387
    return-void
.end method

.method public setParent(Lcom/drew/metadata/Directory;)V
    .registers 2
    .param p1, "parent"    # Lcom/drew/metadata/Directory;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 191
    iput-object p1, p0, Lcom/drew/metadata/Directory;->_parent:Lcom/drew/metadata/Directory;

    .line 192
    return-void
.end method

.method public setRational(ILcom/drew/lang/Rational;)V
    .registers 3
    .param p1, "tagType"    # I
    .param p2, "rational"    # Lcom/drew/lang/Rational;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 328
    invoke-virtual {p0, p1, p2}, Lcom/drew/metadata/Directory;->setObject(ILjava/lang/Object;)V

    .line 329
    return-void
.end method

.method public setRationalArray(I[Lcom/drew/lang/Rational;)V
    .registers 3
    .param p1, "tagType"    # I
    .param p2, "rationals"    # [Lcom/drew/lang/Rational;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 339
    invoke-virtual {p0, p1, p2}, Lcom/drew/metadata/Directory;->setObjectArray(ILjava/lang/Object;)V

    .line 340
    return-void
.end method

.method public setString(ILjava/lang/String;)V
    .registers 5
    .param p1, "tagType"    # I
    .param p2, "value"    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 271
    if-nez p2, :cond_a

    .line 272
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "cannot set a null String"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 273
    :cond_a
    invoke-virtual {p0, p1, p2}, Lcom/drew/metadata/Directory;->setObject(ILjava/lang/Object;)V

    .line 274
    return-void
.end method

.method public setStringArray(I[Ljava/lang/String;)V
    .registers 3
    .param p1, "tagType"    # I
    .param p2, "strings"    # [Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 284
    invoke-virtual {p0, p1, p2}, Lcom/drew/metadata/Directory;->setObjectArray(ILjava/lang/Object;)V

    .line 285
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 6

    .prologue
    const/4 v4, 0x1

    .line 1059
    const-string v1, "%s Directory (%d %s)"

    const/4 v0, 0x3

    new-array v2, v0, [Ljava/lang/Object;

    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/drew/metadata/Directory;->getName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v0

    iget-object v0, p0, Lcom/drew/metadata/Directory;->_tagMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v2, v4

    const/4 v3, 0x2

    iget-object v0, p0, Lcom/drew/metadata/Directory;->_tagMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-ne v0, v4, :cond_2b

    const-string v0, "tag"

    :goto_24
    aput-object v0, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_2b
    const-string v0, "tags"

    goto :goto_24
.end method
