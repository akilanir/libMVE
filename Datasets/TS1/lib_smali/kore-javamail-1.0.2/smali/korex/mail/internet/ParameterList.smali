.class public Lkorex/mail/internet/ParameterList;
.super Ljava/lang/Object;
.source "ParameterList.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkorex/mail/internet/ParameterList$ToStringBuffer;,
        Lkorex/mail/internet/ParameterList$ParamEnum;,
        Lkorex/mail/internet/ParameterList$MultiValue;,
        Lkorex/mail/internet/ParameterList$Value;
    }
.end annotation


# static fields
.field private static final applehack:Z

.field private static final decodeParameters:Z

.field private static final decodeParametersStrict:Z

.field private static final encodeParameters:Z

.field private static final hex:[C

.field private static final parametersStrict:Z

.field private static final windowshack:Z


# instance fields
.field private lastName:Ljava/lang/String;

.field private list:Ljava/util/Map;

.field private multisegmentNames:Ljava/util/Set;

.field private slist:Ljava/util/Map;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 141
    const-string v0, "mail.mime.encodeparameters"

    .line 142
    invoke-static {v0, v2}, Lcom/sun/mail/util/PropUtil;->getBooleanSystemProperty(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lkorex/mail/internet/ParameterList;->encodeParameters:Z

    .line 143
    const-string v0, "mail.mime.decodeparameters"

    .line 144
    invoke-static {v0, v2}, Lcom/sun/mail/util/PropUtil;->getBooleanSystemProperty(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lkorex/mail/internet/ParameterList;->decodeParameters:Z

    .line 145
    const-string v0, "mail.mime.decodeparameters.strict"

    .line 146
    invoke-static {v0, v1}, Lcom/sun/mail/util/PropUtil;->getBooleanSystemProperty(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lkorex/mail/internet/ParameterList;->decodeParametersStrict:Z

    .line 148
    const-string v0, "mail.mime.applefilenames"

    .line 149
    invoke-static {v0, v1}, Lcom/sun/mail/util/PropUtil;->getBooleanSystemProperty(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lkorex/mail/internet/ParameterList;->applehack:Z

    .line 150
    const-string v0, "mail.mime.windowsfilenames"

    .line 151
    invoke-static {v0, v1}, Lcom/sun/mail/util/PropUtil;->getBooleanSystemProperty(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lkorex/mail/internet/ParameterList;->windowshack:Z

    .line 152
    const-string v0, "mail.mime.parameters.strict"

    .line 153
    invoke-static {v0, v2}, Lcom/sun/mail/util/PropUtil;->getBooleanSystemProperty(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lkorex/mail/internet/ParameterList;->parametersStrict:Z

    .line 694
    const/16 v0, 0x10

    new-array v0, v0, [C

    fill-array-data v0, :array_3c

    sput-object v0, Lkorex/mail/internet/ParameterList;->hex:[C

    return-void

    :array_3c
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x41s
        0x42s
        0x43s
        0x44s
        0x45s
        0x46s
    .end array-data
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 205
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lkorex/mail/internet/ParameterList;->list:Ljava/util/Map;

    .line 139
    const/4 v0, 0x0

    iput-object v0, p0, Lkorex/mail/internet/ParameterList;->lastName:Ljava/lang/String;

    .line 207
    sget-boolean v0, Lkorex/mail/internet/ParameterList;->decodeParameters:Z

    if-eqz v0, :cond_1f

    .line 208
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lkorex/mail/internet/ParameterList;->multisegmentNames:Ljava/util/Set;

    .line 209
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lkorex/mail/internet/ParameterList;->slist:Ljava/util/Map;

    .line 211
    :cond_1f
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 13
    .param p1, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/internet/ParseException;
        }
    .end annotation

    .prologue
    const/4 v10, -0x4

    const/16 v9, 0x3b

    const/4 v8, -0x1

    .line 224
    invoke-direct {p0}, Lkorex/mail/internet/ParameterList;-><init>()V

    .line 226
    new-instance v0, Lkorex/mail/internet/HeaderTokenizer;

    const-string v6, "()<>@,;:\\\"\t []/?="

    invoke-direct {v0, p1, v6}, Lkorex/mail/internet/HeaderTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 228
    .local v0, "h":Lkorex/mail/internet/HeaderTokenizer;
    :goto_e
    invoke-virtual {v0}, Lkorex/mail/internet/HeaderTokenizer;->next()Lkorex/mail/internet/HeaderTokenizer$Token;

    move-result-object v3

    .line 229
    .local v3, "tk":Lkorex/mail/internet/HeaderTokenizer$Token;
    invoke-virtual {v3}, Lkorex/mail/internet/HeaderTokenizer$Token;->getType()I

    move-result v4

    .line 232
    .local v4, "type":I
    if-ne v4, v10, :cond_21

    .line 302
    :cond_18
    sget-boolean v6, Lkorex/mail/internet/ParameterList;->decodeParameters:Z

    if-eqz v6, :cond_20

    .line 307
    const/4 v6, 0x0

    invoke-direct {p0, v6}, Lkorex/mail/internet/ParameterList;->combineMultisegmentNames(Z)V

    .line 309
    :cond_20
    return-void

    .line 235
    :cond_21
    int-to-char v6, v4

    if-ne v6, v9, :cond_13c

    .line 237
    invoke-virtual {v0}, Lkorex/mail/internet/HeaderTokenizer;->next()Lkorex/mail/internet/HeaderTokenizer$Token;

    move-result-object v3

    .line 239
    invoke-virtual {v3}, Lkorex/mail/internet/HeaderTokenizer$Token;->getType()I

    move-result v6

    if-eq v6, v10, :cond_18

    .line 242
    invoke-virtual {v3}, Lkorex/mail/internet/HeaderTokenizer$Token;->getType()I

    move-result v6

    if-eq v6, v8, :cond_6d

    .line 243
    new-instance v6, Lkorex/mail/internet/ParseException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "In parameter list <"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ">"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", expected parameter name, "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "got \""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 245
    invoke-virtual {v3}, Lkorex/mail/internet/HeaderTokenizer$Token;->getValue()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lkorex/mail/internet/ParseException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 246
    :cond_6d
    invoke-virtual {v3}, Lkorex/mail/internet/HeaderTokenizer$Token;->getValue()Ljava/lang/String;

    move-result-object v6

    sget-object v7, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v6, v7}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    .line 249
    .local v2, "name":Ljava/lang/String;
    invoke-virtual {v0}, Lkorex/mail/internet/HeaderTokenizer;->next()Lkorex/mail/internet/HeaderTokenizer$Token;

    move-result-object v3

    .line 250
    invoke-virtual {v3}, Lkorex/mail/internet/HeaderTokenizer$Token;->getType()I

    move-result v6

    int-to-char v6, v6

    const/16 v7, 0x3d

    if-eq v6, v7, :cond_bd

    .line 251
    new-instance v6, Lkorex/mail/internet/ParseException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "In parameter list <"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ">"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", expected \'=\', "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "got \""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 253
    invoke-virtual {v3}, Lkorex/mail/internet/HeaderTokenizer$Token;->getValue()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lkorex/mail/internet/ParseException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 256
    :cond_bd
    sget-boolean v6, Lkorex/mail/internet/ParameterList;->windowshack:Z

    if-eqz v6, :cond_118

    const-string v6, "name"

    .line 257
    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_d1

    const-string v6, "filename"

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_118

    .line 258
    :cond_d1
    const/4 v6, 0x1

    invoke-virtual {v0, v9, v6}, Lkorex/mail/internet/HeaderTokenizer;->next(CZ)Lkorex/mail/internet/HeaderTokenizer$Token;

    move-result-object v3

    .line 263
    :goto_d6
    invoke-virtual {v3}, Lkorex/mail/internet/HeaderTokenizer$Token;->getType()I

    move-result v4

    .line 265
    if-eq v4, v8, :cond_126

    const/4 v6, -0x2

    if-eq v4, v6, :cond_126

    .line 267
    new-instance v6, Lkorex/mail/internet/ParseException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "In parameter list <"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ">"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", expected parameter value, "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "got \""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 269
    invoke-virtual {v3}, Lkorex/mail/internet/HeaderTokenizer$Token;->getValue()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lkorex/mail/internet/ParseException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 259
    :cond_118
    sget-boolean v6, Lkorex/mail/internet/ParameterList;->parametersStrict:Z

    if-eqz v6, :cond_121

    .line 260
    invoke-virtual {v0}, Lkorex/mail/internet/HeaderTokenizer;->next()Lkorex/mail/internet/HeaderTokenizer$Token;

    move-result-object v3

    goto :goto_d6

    .line 262
    :cond_121
    invoke-virtual {v0, v9}, Lkorex/mail/internet/HeaderTokenizer;->next(C)Lkorex/mail/internet/HeaderTokenizer$Token;

    move-result-object v3

    goto :goto_d6

    .line 271
    :cond_126
    invoke-virtual {v3}, Lkorex/mail/internet/HeaderTokenizer$Token;->getValue()Ljava/lang/String;

    move-result-object v5

    .line 272
    .local v5, "value":Ljava/lang/String;
    iput-object v2, p0, Lkorex/mail/internet/ParameterList;->lastName:Ljava/lang/String;

    .line 273
    sget-boolean v6, Lkorex/mail/internet/ParameterList;->decodeParameters:Z

    if-eqz v6, :cond_135

    .line 274
    invoke-direct {p0, v2, v5}, Lkorex/mail/internet/ParameterList;->putEncodedName(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_e

    .line 276
    :cond_135
    iget-object v6, p0, Lkorex/mail/internet/ParameterList;->list:Ljava/util/Map;

    invoke-interface {v6, v2, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_e

    .line 284
    .end local v2    # "name":Ljava/lang/String;
    .end local v5    # "value":Ljava/lang/String;
    :cond_13c
    if-ne v4, v8, :cond_18c

    iget-object v6, p0, Lkorex/mail/internet/ParameterList;->lastName:Ljava/lang/String;

    if-eqz v6, :cond_18c

    sget-boolean v6, Lkorex/mail/internet/ParameterList;->applehack:Z

    if-eqz v6, :cond_15a

    iget-object v6, p0, Lkorex/mail/internet/ParameterList;->lastName:Ljava/lang/String;

    const-string v7, "name"

    .line 286
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_15e

    iget-object v6, p0, Lkorex/mail/internet/ParameterList;->lastName:Ljava/lang/String;

    const-string v7, "filename"

    .line 287
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_15e

    :cond_15a
    sget-boolean v6, Lkorex/mail/internet/ParameterList;->parametersStrict:Z

    if-nez v6, :cond_18c

    .line 291
    :cond_15e
    iget-object v6, p0, Lkorex/mail/internet/ParameterList;->list:Ljava/util/Map;

    iget-object v7, p0, Lkorex/mail/internet/ParameterList;->lastName:Ljava/lang/String;

    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 292
    .local v1, "lastValue":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v3}, Lkorex/mail/internet/HeaderTokenizer$Token;->getValue()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 293
    .restart local v5    # "value":Ljava/lang/String;
    iget-object v6, p0, Lkorex/mail/internet/ParameterList;->list:Ljava/util/Map;

    iget-object v7, p0, Lkorex/mail/internet/ParameterList;->lastName:Ljava/lang/String;

    invoke-interface {v6, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_e

    .line 295
    .end local v1    # "lastValue":Ljava/lang/String;
    .end local v5    # "value":Ljava/lang/String;
    :cond_18c
    new-instance v6, Lkorex/mail/internet/ParseException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "In parameter list <"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ">"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", expected \';\', got \""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 297
    invoke-virtual {v3}, Lkorex/mail/internet/HeaderTokenizer$Token;->getValue()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lkorex/mail/internet/ParseException;-><init>(Ljava/lang/String;)V

    throw v6
.end method

.method static synthetic access$200(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 76
    invoke-static {p0}, Lkorex/mail/internet/ParameterList;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private combineMultisegmentNames(Z)V
    .registers 19
    .param p1, "keepConsistentOnFailure"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/internet/ParseException;
        }
    .end annotation

    .prologue
    .line 402
    const/4 v10, 0x0

    .line 404
    .local v10, "success":Z
    :try_start_1
    move-object/from16 v0, p0

    iget-object v14, v0, Lkorex/mail/internet/ParameterList;->multisegmentNames:Ljava/util/Set;

    invoke-interface {v14}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 405
    .local v4, "it":Ljava/util/Iterator;
    :goto_9
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_10b

    .line 406
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 407
    .local v6, "name":Ljava/lang/String;
    new-instance v5, Lkorex/mail/internet/ParameterList$MultiValue;

    const/4 v14, 0x0

    invoke-direct {v5, v14}, Lkorex/mail/internet/ParameterList$MultiValue;-><init>(Lkorex/mail/internet/ParameterList$1;)V

    .line 412
    .local v5, "mv":Lkorex/mail/internet/ParameterList$MultiValue;
    const/4 v2, 0x0

    .line 413
    .local v2, "charset":Ljava/lang/String;
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 415
    .local v1, "bos":Ljava/io/ByteArrayOutputStream;
    const/4 v7, 0x0

    .line 416
    .local v7, "segment":I
    :goto_22
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "*"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 417
    .local v9, "sname":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v14, v0, Lkorex/mail/internet/ParameterList;->slist:Ljava/util/Map;

    invoke-interface {v14, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    .line 418
    .local v12, "v":Ljava/lang/Object;
    if-nez v12, :cond_95

    .line 444
    :goto_43
    if-nez v7, :cond_ca

    .line 446
    move-object/from16 v0, p0

    iget-object v14, v0, Lkorex/mail/internet/ParameterList;->list:Ljava/util/Map;

    invoke-interface {v14, v6}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4c
    .catchall {:try_start_1 .. :try_end_4c} :catchall_4d

    goto :goto_9

    .line 473
    .end local v1    # "bos":Ljava/io/ByteArrayOutputStream;
    .end local v2    # "charset":Ljava/lang/String;
    .end local v4    # "it":Ljava/util/Iterator;
    .end local v5    # "mv":Lkorex/mail/internet/ParameterList$MultiValue;
    .end local v6    # "name":Ljava/lang/String;
    .end local v7    # "segment":I
    .end local v9    # "sname":Ljava/lang/String;
    .end local v12    # "v":Ljava/lang/Object;
    :catchall_4d
    move-exception v14

    if-nez p1, :cond_52

    if-eqz v10, :cond_186

    .line 476
    :cond_52
    move-object/from16 v0, p0

    iget-object v15, v0, Lkorex/mail/internet/ParameterList;->slist:Ljava/util/Map;

    invoke-interface {v15}, Ljava/util/Map;->size()I

    move-result v15

    if-lez v15, :cond_178

    .line 478
    move-object/from16 v0, p0

    iget-object v15, v0, Lkorex/mail/internet/ParameterList;->slist:Ljava/util/Map;

    invoke-interface {v15}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v15

    invoke-interface {v15}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .line 479
    .local v8, "sit":Ljava/util/Iterator;
    :cond_68
    :goto_68
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_16b

    .line 480
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    .line 481
    .restart local v12    # "v":Ljava/lang/Object;
    instance-of v15, v12, Lkorex/mail/internet/ParameterList$Value;

    if-eqz v15, :cond_68

    move-object v13, v12

    .line 482
    check-cast v13, Lkorex/mail/internet/ParameterList$Value;

    .line 484
    .local v13, "vv":Lkorex/mail/internet/ParameterList$Value;
    :try_start_79
    iget-object v15, v13, Lkorex/mail/internet/ParameterList$Value;->value:Ljava/lang/String;

    iget-object v0, v13, Lkorex/mail/internet/ParameterList$Value;->charset:Ljava/lang/String;

    move-object/from16 v16, v0

    .line 485
    invoke-static/range {v15 .. v16}, Lkorex/mail/internet/ParameterList;->decodeBytes(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    iput-object v15, v13, Lkorex/mail/internet/ParameterList$Value;->value:Ljava/lang/String;
    :try_end_85
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_79 .. :try_end_85} :catch_86

    goto :goto_68

    .line 486
    :catch_86
    move-exception v3

    .line 487
    .local v3, "ex":Ljava/io/UnsupportedEncodingException;
    sget-boolean v15, Lkorex/mail/internet/ParameterList;->decodeParametersStrict:Z

    if-eqz v15, :cond_68

    .line 488
    new-instance v14, Lkorex/mail/internet/ParseException;

    invoke-virtual {v3}, Ljava/io/UnsupportedEncodingException;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Lkorex/mail/internet/ParseException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 420
    .end local v3    # "ex":Ljava/io/UnsupportedEncodingException;
    .end local v8    # "sit":Ljava/util/Iterator;
    .end local v13    # "vv":Lkorex/mail/internet/ParameterList$Value;
    .restart local v1    # "bos":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "charset":Ljava/lang/String;
    .restart local v4    # "it":Ljava/util/Iterator;
    .restart local v5    # "mv":Lkorex/mail/internet/ParameterList$MultiValue;
    .restart local v6    # "name":Ljava/lang/String;
    .restart local v7    # "segment":I
    .restart local v9    # "sname":Ljava/lang/String;
    :cond_95
    :try_start_95
    invoke-virtual {v5, v12}, Lkorex/mail/internet/ParameterList$MultiValue;->add(Ljava/lang/Object;)Z
    :try_end_98
    .catchall {:try_start_95 .. :try_end_98} :catchall_4d

    .line 422
    :try_start_98
    instance-of v14, v12, Lkorex/mail/internet/ParameterList$Value;

    if-eqz v14, :cond_c0

    .line 423
    move-object v0, v12

    check-cast v0, Lkorex/mail/internet/ParameterList$Value;

    move-object v13, v0

    .line 424
    .restart local v13    # "vv":Lkorex/mail/internet/ParameterList$Value;
    if-nez v7, :cond_b4

    .line 427
    iget-object v2, v13, Lkorex/mail/internet/ParameterList$Value;->charset:Ljava/lang/String;

    .line 435
    :cond_a4
    iget-object v14, v13, Lkorex/mail/internet/ParameterList$Value;->value:Ljava/lang/String;

    invoke-static {v14, v1}, Lkorex/mail/internet/ParameterList;->decodeBytes(Ljava/lang/String;Ljava/io/OutputStream;)V
    :try_end_a9
    .catch Ljava/io/IOException; {:try_start_98 .. :try_end_a9} :catch_be
    .catchall {:try_start_98 .. :try_end_a9} :catchall_4d

    .line 442
    .end local v12    # "v":Ljava/lang/Object;
    .end local v13    # "vv":Lkorex/mail/internet/ParameterList$Value;
    :goto_a9
    :try_start_a9
    move-object/from16 v0, p0

    iget-object v14, v0, Lkorex/mail/internet/ParameterList;->slist:Ljava/util/Map;

    invoke-interface {v14, v9}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_b0
    .catchall {:try_start_a9 .. :try_end_b0} :catchall_4d

    .line 415
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_22

    .line 429
    .restart local v12    # "v":Ljava/lang/Object;
    .restart local v13    # "vv":Lkorex/mail/internet/ParameterList$Value;
    :cond_b4
    if-nez v2, :cond_a4

    .line 431
    :try_start_b6
    move-object/from16 v0, p0

    iget-object v14, v0, Lkorex/mail/internet/ParameterList;->multisegmentNames:Ljava/util/Set;

    invoke-interface {v14, v6}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    goto :goto_43

    .line 439
    .end local v12    # "v":Ljava/lang/Object;
    .end local v13    # "vv":Lkorex/mail/internet/ParameterList$Value;
    :catch_be
    move-exception v14

    goto :goto_a9

    .line 437
    .restart local v12    # "v":Ljava/lang/Object;
    :cond_c0
    check-cast v12, Ljava/lang/String;

    .end local v12    # "v":Ljava/lang/Object;
    invoke-static {v12}, Lcom/sun/mail/util/ASCIIUtility;->getBytes(Ljava/lang/String;)[B

    move-result-object v14

    invoke-virtual {v1, v14}, Ljava/io/ByteArrayOutputStream;->write([B)V
    :try_end_c9
    .catch Ljava/io/IOException; {:try_start_b6 .. :try_end_c9} :catch_be
    .catchall {:try_start_b6 .. :try_end_c9} :catchall_4d

    goto :goto_a9

    .line 449
    .restart local v12    # "v":Ljava/lang/Object;
    :cond_ca
    if-eqz v2, :cond_d0

    .line 450
    :try_start_cc
    invoke-static {v2}, Lkorex/mail/internet/MimeUtility;->javaCharset(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 451
    :cond_d0
    if-eqz v2, :cond_d8

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v14

    if-nez v14, :cond_dc

    .line 452
    :cond_d8
    invoke-static {}, Lkorex/mail/internet/MimeUtility;->getDefaultJavaCharset()Ljava/lang/String;

    move-result-object v2

    .line 453
    :cond_dc
    if-eqz v2, :cond_ed

    .line 454
    invoke-virtual {v1, v2}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    iput-object v14, v5, Lkorex/mail/internet/ParameterList$MultiValue;->value:Ljava/lang/String;
    :try_end_e4
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_cc .. :try_end_e4} :catch_f4
    .catchall {:try_start_cc .. :try_end_e4} :catchall_4d

    .line 463
    :goto_e4
    :try_start_e4
    move-object/from16 v0, p0

    iget-object v14, v0, Lkorex/mail/internet/ParameterList;->list:Ljava/util/Map;

    invoke-interface {v14, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_eb
    .catchall {:try_start_e4 .. :try_end_eb} :catchall_4d

    goto/16 :goto_9

    .line 456
    :cond_ed
    :try_start_ed
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;

    move-result-object v14

    iput-object v14, v5, Lkorex/mail/internet/ParameterList$MultiValue;->value:Ljava/lang/String;
    :try_end_f3
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_ed .. :try_end_f3} :catch_f4
    .catchall {:try_start_ed .. :try_end_f3} :catchall_4d

    goto :goto_e4

    .line 457
    :catch_f4
    move-exception v11

    .line 458
    .local v11, "uex":Ljava/io/UnsupportedEncodingException;
    :try_start_f5
    sget-boolean v14, Lkorex/mail/internet/ParameterList;->decodeParametersStrict:Z

    if-eqz v14, :cond_103

    .line 459
    new-instance v14, Lkorex/mail/internet/ParseException;

    invoke-virtual {v11}, Ljava/io/UnsupportedEncodingException;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Lkorex/mail/internet/ParseException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 461
    :cond_103
    const/4 v14, 0x0

    invoke-virtual {v1, v14}, Ljava/io/ByteArrayOutputStream;->toString(I)Ljava/lang/String;

    move-result-object v14

    iput-object v14, v5, Lkorex/mail/internet/ParameterList$MultiValue;->value:Ljava/lang/String;
    :try_end_10a
    .catchall {:try_start_f5 .. :try_end_10a} :catchall_4d

    goto :goto_e4

    .line 466
    .end local v1    # "bos":Ljava/io/ByteArrayOutputStream;
    .end local v2    # "charset":Ljava/lang/String;
    .end local v5    # "mv":Lkorex/mail/internet/ParameterList$MultiValue;
    .end local v6    # "name":Ljava/lang/String;
    .end local v7    # "segment":I
    .end local v9    # "sname":Ljava/lang/String;
    .end local v11    # "uex":Ljava/io/UnsupportedEncodingException;
    .end local v12    # "v":Ljava/lang/Object;
    :cond_10b
    const/4 v10, 0x1

    .line 473
    if-nez p1, :cond_110

    if-eqz v10, :cond_16a

    .line 476
    :cond_110
    move-object/from16 v0, p0

    iget-object v14, v0, Lkorex/mail/internet/ParameterList;->slist:Ljava/util/Map;

    invoke-interface {v14}, Ljava/util/Map;->size()I

    move-result v14

    if-lez v14, :cond_15c

    .line 478
    move-object/from16 v0, p0

    iget-object v14, v0, Lkorex/mail/internet/ParameterList;->slist:Ljava/util/Map;

    invoke-interface {v14}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v14

    invoke-interface {v14}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .line 479
    .restart local v8    # "sit":Ljava/util/Iterator;
    :cond_126
    :goto_126
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_151

    .line 480
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    .line 481
    .restart local v12    # "v":Ljava/lang/Object;
    instance-of v14, v12, Lkorex/mail/internet/ParameterList$Value;

    if-eqz v14, :cond_126

    move-object v13, v12

    .line 482
    check-cast v13, Lkorex/mail/internet/ParameterList$Value;

    .line 484
    .restart local v13    # "vv":Lkorex/mail/internet/ParameterList$Value;
    :try_start_137
    iget-object v14, v13, Lkorex/mail/internet/ParameterList$Value;->value:Ljava/lang/String;

    iget-object v15, v13, Lkorex/mail/internet/ParameterList$Value;->charset:Ljava/lang/String;

    .line 485
    invoke-static {v14, v15}, Lkorex/mail/internet/ParameterList;->decodeBytes(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    iput-object v14, v13, Lkorex/mail/internet/ParameterList$Value;->value:Ljava/lang/String;
    :try_end_141
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_137 .. :try_end_141} :catch_142

    goto :goto_126

    .line 486
    :catch_142
    move-exception v3

    .line 487
    .restart local v3    # "ex":Ljava/io/UnsupportedEncodingException;
    sget-boolean v14, Lkorex/mail/internet/ParameterList;->decodeParametersStrict:Z

    if-eqz v14, :cond_126

    .line 488
    new-instance v14, Lkorex/mail/internet/ParseException;

    invoke-virtual {v3}, Ljava/io/UnsupportedEncodingException;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Lkorex/mail/internet/ParseException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 492
    .end local v3    # "ex":Ljava/io/UnsupportedEncodingException;
    .end local v12    # "v":Ljava/lang/Object;
    .end local v13    # "vv":Lkorex/mail/internet/ParameterList$Value;
    :cond_151
    move-object/from16 v0, p0

    iget-object v14, v0, Lkorex/mail/internet/ParameterList;->list:Ljava/util/Map;

    move-object/from16 v0, p0

    iget-object v15, v0, Lkorex/mail/internet/ParameterList;->slist:Ljava/util/Map;

    invoke-interface {v14, v15}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 496
    .end local v8    # "sit":Ljava/util/Iterator;
    :cond_15c
    move-object/from16 v0, p0

    iget-object v14, v0, Lkorex/mail/internet/ParameterList;->multisegmentNames:Ljava/util/Set;

    invoke-interface {v14}, Ljava/util/Set;->clear()V

    .line 497
    move-object/from16 v0, p0

    iget-object v14, v0, Lkorex/mail/internet/ParameterList;->slist:Ljava/util/Map;

    invoke-interface {v14}, Ljava/util/Map;->clear()V

    .line 500
    :cond_16a
    return-void

    .line 492
    .end local v4    # "it":Ljava/util/Iterator;
    .restart local v8    # "sit":Ljava/util/Iterator;
    :cond_16b
    move-object/from16 v0, p0

    iget-object v15, v0, Lkorex/mail/internet/ParameterList;->list:Ljava/util/Map;

    move-object/from16 v0, p0

    iget-object v0, v0, Lkorex/mail/internet/ParameterList;->slist:Ljava/util/Map;

    move-object/from16 v16, v0

    invoke-interface/range {v15 .. v16}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 496
    .end local v8    # "sit":Ljava/util/Iterator;
    :cond_178
    move-object/from16 v0, p0

    iget-object v15, v0, Lkorex/mail/internet/ParameterList;->multisegmentNames:Ljava/util/Set;

    invoke-interface {v15}, Ljava/util/Set;->clear()V

    .line 497
    move-object/from16 v0, p0

    iget-object v15, v0, Lkorex/mail/internet/ParameterList;->slist:Ljava/util/Map;

    invoke-interface {v15}, Ljava/util/Map;->clear()V

    :cond_186
    throw v14
.end method

.method private static decodeBytes(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 11
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/internet/ParseException;,
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 782
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v7

    new-array v0, v7, [B

    .line 784
    .local v0, "b":[B
    const/4 v6, 0x0

    .local v6, "i":I
    const/4 v1, 0x0

    .local v1, "bi":I
    :goto_8
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v7

    if-ge v6, v7, :cond_4e

    .line 785
    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 786
    .local v3, "c":C
    const/16 v7, 0x25

    if-ne v3, v7, :cond_27

    .line 788
    add-int/lit8 v7, v6, 0x1

    add-int/lit8 v8, v6, 0x3

    :try_start_1a
    invoke-virtual {p0, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 789
    .local v5, "hex":Ljava/lang/String;
    const/16 v7, 0x10

    invoke-static {v5, v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I
    :try_end_23
    .catch Ljava/lang/NumberFormatException; {:try_start_1a .. :try_end_23} :catch_30
    .catch Ljava/lang/StringIndexOutOfBoundsException; {:try_start_1a .. :try_end_23} :catch_3f

    move-result v7

    int-to-char v3, v7

    .line 790
    add-int/lit8 v6, v6, 0x2

    .line 799
    .end local v5    # "hex":Ljava/lang/String;
    :cond_27
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "bi":I
    .local v2, "bi":I
    int-to-byte v7, v3

    aput-byte v7, v0, v1

    .line 784
    add-int/lit8 v6, v6, 0x1

    move v1, v2

    .end local v2    # "bi":I
    .restart local v1    # "bi":I
    goto :goto_8

    .line 791
    :catch_30
    move-exception v4

    .line 792
    .local v4, "ex":Ljava/lang/NumberFormatException;
    sget-boolean v7, Lkorex/mail/internet/ParameterList;->decodeParametersStrict:Z

    if-eqz v7, :cond_27

    .line 793
    new-instance v7, Lkorex/mail/internet/ParseException;

    invoke-virtual {v4}, Ljava/lang/NumberFormatException;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lkorex/mail/internet/ParseException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 794
    .end local v4    # "ex":Ljava/lang/NumberFormatException;
    :catch_3f
    move-exception v4

    .line 795
    .local v4, "ex":Ljava/lang/StringIndexOutOfBoundsException;
    sget-boolean v7, Lkorex/mail/internet/ParameterList;->decodeParametersStrict:Z

    if-eqz v7, :cond_27

    .line 796
    new-instance v7, Lkorex/mail/internet/ParseException;

    invoke-virtual {v4}, Ljava/lang/StringIndexOutOfBoundsException;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lkorex/mail/internet/ParseException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 801
    .end local v3    # "c":C
    .end local v4    # "ex":Ljava/lang/StringIndexOutOfBoundsException;
    :cond_4e
    if-eqz p1, :cond_54

    .line 802
    invoke-static {p1}, Lkorex/mail/internet/MimeUtility;->javaCharset(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 803
    :cond_54
    if-eqz p1, :cond_5c

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v7

    if-nez v7, :cond_60

    .line 804
    :cond_5c
    invoke-static {}, Lkorex/mail/internet/MimeUtility;->getDefaultJavaCharset()Ljava/lang/String;

    move-result-object p1

    .line 805
    :cond_60
    new-instance v7, Ljava/lang/String;

    const/4 v8, 0x0

    invoke-direct {v7, v0, v8, v1, p1}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    return-object v7
.end method

.method private static decodeBytes(Ljava/lang/String;Ljava/io/OutputStream;)V
    .registers 8
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "os"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/internet/ParseException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 818
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v3, v4, :cond_45

    .line 819
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 820
    .local v0, "c":C
    const/16 v4, 0x25

    if-ne v0, v4, :cond_20

    .line 822
    add-int/lit8 v4, v3, 0x1

    add-int/lit8 v5, v3, 0x3

    :try_start_13
    invoke-virtual {p0, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 823
    .local v2, "hex":Ljava/lang/String;
    const/16 v4, 0x10

    invoke-static {v2, v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I
    :try_end_1c
    .catch Ljava/lang/NumberFormatException; {:try_start_13 .. :try_end_1c} :catch_27
    .catch Ljava/lang/StringIndexOutOfBoundsException; {:try_start_13 .. :try_end_1c} :catch_36

    move-result v4

    int-to-char v0, v4

    .line 824
    add-int/lit8 v3, v3, 0x2

    .line 833
    .end local v2    # "hex":Ljava/lang/String;
    :cond_20
    int-to-byte v4, v0

    invoke-virtual {p1, v4}, Ljava/io/OutputStream;->write(I)V

    .line 818
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 825
    :catch_27
    move-exception v1

    .line 826
    .local v1, "ex":Ljava/lang/NumberFormatException;
    sget-boolean v4, Lkorex/mail/internet/ParameterList;->decodeParametersStrict:Z

    if-eqz v4, :cond_20

    .line 827
    new-instance v4, Lkorex/mail/internet/ParseException;

    invoke-virtual {v1}, Ljava/lang/NumberFormatException;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lkorex/mail/internet/ParseException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 828
    .end local v1    # "ex":Ljava/lang/NumberFormatException;
    :catch_36
    move-exception v1

    .line 829
    .local v1, "ex":Ljava/lang/StringIndexOutOfBoundsException;
    sget-boolean v4, Lkorex/mail/internet/ParameterList;->decodeParametersStrict:Z

    if-eqz v4, :cond_20

    .line 830
    new-instance v4, Lkorex/mail/internet/ParseException;

    invoke-virtual {v1}, Ljava/lang/StringIndexOutOfBoundsException;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lkorex/mail/internet/ParseException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 835
    .end local v0    # "c":C
    .end local v1    # "ex":Ljava/lang/StringIndexOutOfBoundsException;
    :cond_45
    return-void
.end method

.method private static encodeValue(Ljava/lang/String;Ljava/lang/String;)Lkorex/mail/internet/ParameterList$Value;
    .registers 13
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/lang/String;

    .prologue
    const/16 v10, 0x25

    const/4 v6, 0x0

    .line 706
    invoke-static {p0}, Lkorex/mail/internet/MimeUtility;->checkAscii(Ljava/lang/String;)I

    move-result v7

    const/4 v8, 0x1

    if-ne v7, v8, :cond_c

    move-object v5, v6

    .line 730
    :goto_b
    return-object v5

    .line 711
    :cond_c
    :try_start_c
    invoke-static {p1}, Lkorex/mail/internet/MimeUtility;->javaCharset(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_13
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_c .. :try_end_13} :catch_67

    move-result-object v0

    .line 715
    .local v0, "b":[B
    new-instance v4, Ljava/lang/StringBuffer;

    array-length v7, v0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v8

    add-int/2addr v7, v8

    add-int/lit8 v7, v7, 0x2

    invoke-direct {v4, v7}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 716
    .local v4, "sb":Ljava/lang/StringBuffer;
    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string v8, "\'\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 717
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_2b
    array-length v7, v0

    if-ge v3, v7, :cond_6e

    .line 718
    aget-byte v7, v0, v3

    and-int/lit16 v7, v7, 0xff

    int-to-char v1, v7

    .line 720
    .local v1, "c":C
    const/16 v7, 0x20

    if-le v1, v7, :cond_4d

    const/16 v7, 0x7f

    if-ge v1, v7, :cond_4d

    const/16 v7, 0x2a

    if-eq v1, v7, :cond_4d

    const/16 v7, 0x27

    if-eq v1, v7, :cond_4d

    if-eq v1, v10, :cond_4d

    const-string v7, "()<>@,;:\\\"\t []/?="

    .line 721
    invoke-virtual {v7, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    if-ltz v7, :cond_6a

    .line 722
    :cond_4d
    invoke-virtual {v4, v10}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v7

    sget-object v8, Lkorex/mail/internet/ParameterList;->hex:[C

    shr-int/lit8 v9, v1, 0x4

    aget-char v8, v8, v9

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v7

    sget-object v8, Lkorex/mail/internet/ParameterList;->hex:[C

    and-int/lit8 v9, v1, 0xf

    aget-char v8, v8, v9

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 717
    :goto_64
    add-int/lit8 v3, v3, 0x1

    goto :goto_2b

    .line 712
    .end local v0    # "b":[B
    .end local v1    # "c":C
    .end local v3    # "i":I
    .end local v4    # "sb":Ljava/lang/StringBuffer;
    :catch_67
    move-exception v2

    .local v2, "ex":Ljava/io/UnsupportedEncodingException;
    move-object v5, v6

    .line 713
    goto :goto_b

    .line 724
    .end local v2    # "ex":Ljava/io/UnsupportedEncodingException;
    .restart local v0    # "b":[B
    .restart local v1    # "c":C
    .restart local v3    # "i":I
    .restart local v4    # "sb":Ljava/lang/StringBuffer;
    :cond_6a
    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_64

    .line 726
    .end local v1    # "c":C
    :cond_6e
    new-instance v5, Lkorex/mail/internet/ParameterList$Value;

    invoke-direct {v5, v6}, Lkorex/mail/internet/ParameterList$Value;-><init>(Lkorex/mail/internet/ParameterList$1;)V

    .line 727
    .local v5, "v":Lkorex/mail/internet/ParameterList$Value;
    iput-object p1, v5, Lkorex/mail/internet/ParameterList$Value;->charset:Ljava/lang/String;

    .line 728
    iput-object p0, v5, Lkorex/mail/internet/ParameterList$Value;->value:Ljava/lang/String;

    .line 729
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lkorex/mail/internet/ParameterList$Value;->encodedValue:Ljava/lang/String;

    goto :goto_b
.end method

.method private static extractCharset(Ljava/lang/String;)Lkorex/mail/internet/ParameterList$Value;
    .registers 10
    .param p0, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/internet/ParseException;
        }
    .end annotation

    .prologue
    .line 738
    new-instance v5, Lkorex/mail/internet/ParameterList$Value;

    const/4 v6, 0x0

    invoke-direct {v5, v6}, Lkorex/mail/internet/ParameterList$Value;-><init>(Lkorex/mail/internet/ParameterList$1;)V

    .line 739
    .local v5, "v":Lkorex/mail/internet/ParameterList$Value;
    iput-object p0, v5, Lkorex/mail/internet/ParameterList$Value;->encodedValue:Ljava/lang/String;

    iput-object p0, v5, Lkorex/mail/internet/ParameterList$Value;->value:Ljava/lang/String;

    .line 741
    const/16 v6, 0x27

    :try_start_c
    invoke-virtual {p0, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    .line 742
    .local v2, "i":I
    if-gez v2, :cond_3e

    .line 743
    sget-boolean v6, Lkorex/mail/internet/ParameterList;->decodeParametersStrict:Z

    if-eqz v6, :cond_83

    .line 744
    new-instance v6, Lkorex/mail/internet/ParseException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Missing charset in encoded value: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lkorex/mail/internet/ParseException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_2f
    .catch Ljava/lang/NumberFormatException; {:try_start_c .. :try_end_2f} :catch_2f
    .catch Ljava/lang/StringIndexOutOfBoundsException; {:try_start_c .. :try_end_2f} :catch_6a

    .line 759
    .end local v2    # "i":I
    :catch_2f
    move-exception v4

    .line 760
    .local v4, "nex":Ljava/lang/NumberFormatException;
    sget-boolean v6, Lkorex/mail/internet/ParameterList;->decodeParametersStrict:Z

    if-eqz v6, :cond_83

    .line 761
    new-instance v6, Lkorex/mail/internet/ParseException;

    invoke-virtual {v4}, Ljava/lang/NumberFormatException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lkorex/mail/internet/ParseException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 748
    .end local v4    # "nex":Ljava/lang/NumberFormatException;
    .restart local v2    # "i":I
    :cond_3e
    const/4 v6, 0x0

    :try_start_3f
    invoke-virtual {p0, v6, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 749
    .local v0, "charset":Ljava/lang/String;
    const/16 v6, 0x27

    add-int/lit8 v7, v2, 0x1

    invoke-virtual {p0, v6, v7}, Ljava/lang/String;->indexOf(II)I

    move-result v3

    .line 750
    .local v3, "li":I
    if-gez v3, :cond_79

    .line 751
    sget-boolean v6, Lkorex/mail/internet/ParameterList;->decodeParametersStrict:Z

    if-eqz v6, :cond_83

    .line 752
    new-instance v6, Lkorex/mail/internet/ParseException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Missing language in encoded value: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lkorex/mail/internet/ParseException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_6a
    .catch Ljava/lang/NumberFormatException; {:try_start_3f .. :try_end_6a} :catch_2f
    .catch Ljava/lang/StringIndexOutOfBoundsException; {:try_start_3f .. :try_end_6a} :catch_6a

    .line 762
    .end local v0    # "charset":Ljava/lang/String;
    .end local v2    # "i":I
    .end local v3    # "li":I
    :catch_6a
    move-exception v1

    .line 763
    .local v1, "ex":Ljava/lang/StringIndexOutOfBoundsException;
    sget-boolean v6, Lkorex/mail/internet/ParameterList;->decodeParametersStrict:Z

    if-eqz v6, :cond_83

    .line 764
    new-instance v6, Lkorex/mail/internet/ParseException;

    invoke-virtual {v1}, Ljava/lang/StringIndexOutOfBoundsException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lkorex/mail/internet/ParseException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 757
    .end local v1    # "ex":Ljava/lang/StringIndexOutOfBoundsException;
    .restart local v0    # "charset":Ljava/lang/String;
    .restart local v2    # "i":I
    .restart local v3    # "li":I
    :cond_79
    add-int/lit8 v6, v3, 0x1

    :try_start_7b
    invoke-virtual {p0, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lkorex/mail/internet/ParameterList$Value;->value:Ljava/lang/String;

    .line 758
    iput-object v0, v5, Lkorex/mail/internet/ParameterList$Value;->charset:Ljava/lang/String;
    :try_end_83
    .catch Ljava/lang/NumberFormatException; {:try_start_7b .. :try_end_83} :catch_2f
    .catch Ljava/lang/StringIndexOutOfBoundsException; {:try_start_7b .. :try_end_83} :catch_6a

    .line 766
    .end local v0    # "charset":Ljava/lang/String;
    .end local v2    # "i":I
    .end local v3    # "li":I
    :cond_83
    return-object v5
.end method

.method private putEncodedName(Ljava/lang/String;Ljava/lang/String;)V
    .registers 10
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/internet/ParseException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 353
    const/16 v4, 0x2a

    invoke-virtual {p1, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    .line 354
    .local v2, "star":I
    if-gez v2, :cond_f

    .line 356
    iget-object v4, p0, Lkorex/mail/internet/ParameterList;->list:Ljava/util/Map;

    invoke-interface {v4, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 391
    :goto_e
    return-void

    .line 357
    :cond_f
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    if-ne v2, v4, :cond_3e

    .line 359
    invoke-virtual {p1, v6, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 360
    invoke-static {p2}, Lkorex/mail/internet/ParameterList;->extractCharset(Ljava/lang/String;)Lkorex/mail/internet/ParameterList$Value;

    move-result-object v3

    .line 362
    .local v3, "v":Lkorex/mail/internet/ParameterList$Value;
    :try_start_1f
    iget-object v4, v3, Lkorex/mail/internet/ParameterList$Value;->value:Ljava/lang/String;

    iget-object v5, v3, Lkorex/mail/internet/ParameterList$Value;->charset:Ljava/lang/String;

    invoke-static {v4, v5}, Lkorex/mail/internet/ParameterList;->decodeBytes(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lkorex/mail/internet/ParameterList$Value;->value:Ljava/lang/String;
    :try_end_29
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1f .. :try_end_29} :catch_2f

    .line 367
    :cond_29
    iget-object v4, p0, Lkorex/mail/internet/ParameterList;->list:Ljava/util/Map;

    invoke-interface {v4, p1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_e

    .line 363
    :catch_2f
    move-exception v0

    .line 364
    .local v0, "ex":Ljava/io/UnsupportedEncodingException;
    sget-boolean v4, Lkorex/mail/internet/ParameterList;->decodeParametersStrict:Z

    if-eqz v4, :cond_29

    .line 365
    new-instance v4, Lkorex/mail/internet/ParseException;

    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lkorex/mail/internet/ParseException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 370
    .end local v0    # "ex":Ljava/io/UnsupportedEncodingException;
    .end local v3    # "v":Lkorex/mail/internet/ParameterList$Value;
    :cond_3e
    invoke-virtual {p1, v6, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 371
    .local v1, "rname":Ljava/lang/String;
    iget-object v4, p0, Lkorex/mail/internet/ParameterList;->multisegmentNames:Ljava/util/Set;

    invoke-interface {v4, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 372
    iget-object v4, p0, Lkorex/mail/internet/ParameterList;->list:Ljava/util/Map;

    const-string v5, ""

    invoke-interface {v4, v1, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 375
    const-string v4, "*"

    invoke-virtual {p1, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_83

    .line 377
    const-string v4, "*0*"

    invoke-virtual {p1, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_72

    .line 378
    invoke-static {p2}, Lkorex/mail/internet/ParameterList;->extractCharset(Ljava/lang/String;)Lkorex/mail/internet/ParameterList$Value;

    move-result-object v3

    .line 384
    .restart local v3    # "v":Lkorex/mail/internet/ParameterList$Value;
    :goto_62
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {p1, v6, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 389
    .end local v3    # "v":Lkorex/mail/internet/ParameterList$Value;
    :goto_6c
    iget-object v4, p0, Lkorex/mail/internet/ParameterList;->slist:Ljava/util/Map;

    invoke-interface {v4, p1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_e

    .line 380
    :cond_72
    new-instance v3, Lkorex/mail/internet/ParameterList$Value;

    const/4 v4, 0x0

    invoke-direct {v3, v4}, Lkorex/mail/internet/ParameterList$Value;-><init>(Lkorex/mail/internet/ParameterList$1;)V

    .restart local v3    # "v":Lkorex/mail/internet/ParameterList$Value;
    move-object v4, v3

    .line 381
    check-cast v4, Lkorex/mail/internet/ParameterList$Value;

    iput-object p2, v4, Lkorex/mail/internet/ParameterList$Value;->encodedValue:Ljava/lang/String;

    move-object v4, v3

    .line 382
    check-cast v4, Lkorex/mail/internet/ParameterList$Value;

    iput-object p2, v4, Lkorex/mail/internet/ParameterList$Value;->value:Ljava/lang/String;

    goto :goto_62

    .line 387
    .end local v3    # "v":Lkorex/mail/internet/ParameterList$Value;
    :cond_83
    move-object v3, p2

    .local v3, "v":Ljava/lang/String;
    goto :goto_6c
.end method

.method private static quote(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 691
    const-string v0, "()<>@,;:\\\"\t []/?="

    invoke-static {p0, v0}, Lkorex/mail/internet/MimeUtility;->quote(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public combineSegments()V
    .registers 2

    .prologue
    .line 332
    sget-boolean v0, Lkorex/mail/internet/ParameterList;->decodeParameters:Z

    if-eqz v0, :cond_10

    iget-object v0, p0, Lkorex/mail/internet/ParameterList;->multisegmentNames:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    if-lez v0, :cond_10

    .line 334
    const/4 v0, 0x1

    :try_start_d
    invoke-direct {p0, v0}, Lkorex/mail/internet/ParameterList;->combineMultisegmentNames(Z)V
    :try_end_10
    .catch Lkorex/mail/internet/ParseException; {:try_start_d .. :try_end_10} :catch_11

    .line 339
    :cond_10
    :goto_10
    return-void

    .line 335
    :catch_11
    move-exception v0

    goto :goto_10
.end method

.method public get(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 522
    iget-object v2, p0, Lkorex/mail/internet/ParameterList;->list:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v3, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 523
    .local v0, "v":Ljava/lang/Object;
    instance-of v2, v0, Lkorex/mail/internet/ParameterList$MultiValue;

    if-eqz v2, :cond_19

    .line 524
    check-cast v0, Lkorex/mail/internet/ParameterList$MultiValue;

    .end local v0    # "v":Ljava/lang/Object;
    iget-object v1, v0, Lkorex/mail/internet/ParameterList$MultiValue;->value:Ljava/lang/String;

    .line 529
    .local v1, "value":Ljava/lang/String;
    :goto_18
    return-object v1

    .line 525
    .end local v1    # "value":Ljava/lang/String;
    .restart local v0    # "v":Ljava/lang/Object;
    :cond_19
    instance-of v2, v0, Lkorex/mail/internet/ParameterList$Value;

    if-eqz v2, :cond_22

    .line 526
    check-cast v0, Lkorex/mail/internet/ParameterList$Value;

    .end local v0    # "v":Ljava/lang/Object;
    iget-object v1, v0, Lkorex/mail/internet/ParameterList$Value;->value:Ljava/lang/String;

    .restart local v1    # "value":Ljava/lang/String;
    goto :goto_18

    .end local v1    # "value":Ljava/lang/String;
    .restart local v0    # "v":Ljava/lang/Object;
    :cond_22
    move-object v1, v0

    .line 528
    check-cast v1, Ljava/lang/String;

    .restart local v1    # "value":Ljava/lang/String;
    goto :goto_18
.end method

.method public getNames()Ljava/util/Enumeration;
    .registers 3

    .prologue
    .line 593
    new-instance v0, Lkorex/mail/internet/ParameterList$ParamEnum;

    iget-object v1, p0, Lkorex/mail/internet/ParameterList;->list:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-direct {v0, v1}, Lkorex/mail/internet/ParameterList$ParamEnum;-><init>(Ljava/util/Iterator;)V

    return-object v0
.end method

.method public remove(Ljava/lang/String;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 583
    iget-object v0, p0, Lkorex/mail/internet/ParameterList;->list:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 584
    return-void
.end method

.method public set(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 540
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    .line 541
    sget-boolean v1, Lkorex/mail/internet/ParameterList;->decodeParameters:Z

    if-eqz v1, :cond_19

    .line 543
    :try_start_e
    invoke-direct {p0, p1, p2}, Lkorex/mail/internet/ParameterList;->putEncodedName(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_11
    .catch Lkorex/mail/internet/ParseException; {:try_start_e .. :try_end_11} :catch_12

    .line 550
    :goto_11
    return-void

    .line 544
    :catch_12
    move-exception v0

    .line 546
    .local v0, "pex":Lkorex/mail/internet/ParseException;
    iget-object v1, p0, Lkorex/mail/internet/ParameterList;->list:Ljava/util/Map;

    invoke-interface {v1, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_11

    .line 549
    .end local v0    # "pex":Lkorex/mail/internet/ParseException;
    :cond_19
    iget-object v1, p0, Lkorex/mail/internet/ParameterList;->list:Ljava/util/Map;

    invoke-interface {v1, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_11
.end method

.method public set(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 8
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "charset"    # Ljava/lang/String;

    .prologue
    .line 565
    sget-boolean v1, Lkorex/mail/internet/ParameterList;->encodeParameters:Z

    if-eqz v1, :cond_1e

    .line 566
    invoke-static {p2, p3}, Lkorex/mail/internet/ParameterList;->encodeValue(Ljava/lang/String;Ljava/lang/String;)Lkorex/mail/internet/ParameterList$Value;

    move-result-object v0

    .line 568
    .local v0, "ev":Lkorex/mail/internet/ParameterList$Value;
    if-eqz v0, :cond_1a

    .line 569
    iget-object v1, p0, Lkorex/mail/internet/ParameterList;->list:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 574
    .end local v0    # "ev":Lkorex/mail/internet/ParameterList$Value;
    :goto_19
    return-void

    .line 571
    .restart local v0    # "ev":Lkorex/mail/internet/ParameterList$Value;
    :cond_1a
    invoke-virtual {p0, p1, p2}, Lkorex/mail/internet/ParameterList;->set(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_19

    .line 573
    .end local v0    # "ev":Lkorex/mail/internet/ParameterList$Value;
    :cond_1e
    invoke-virtual {p0, p1, p2}, Lkorex/mail/internet/ParameterList;->set(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_19
.end method

.method public size()I
    .registers 2

    .prologue
    .line 508
    iget-object v0, p0, Lkorex/mail/internet/ParameterList;->list:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 603
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lkorex/mail/internet/ParameterList;->toString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString(I)Ljava/lang/String;
    .registers 12
    .param p1, "used"    # I

    .prologue
    .line 621
    new-instance v4, Lkorex/mail/internet/ParameterList$ToStringBuffer;

    invoke-direct {v4, p1}, Lkorex/mail/internet/ParameterList$ToStringBuffer;-><init>(I)V

    .line 622
    .local v4, "sb":Lkorex/mail/internet/ParameterList$ToStringBuffer;
    iget-object v8, p0, Lkorex/mail/internet/ParameterList;->list:Ljava/util/Map;

    invoke-interface {v8}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 624
    .local v0, "e":Ljava/util/Iterator;
    :cond_f
    :goto_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_a9

    .line 625
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 626
    .local v2, "name":Ljava/lang/String;
    iget-object v8, p0, Lkorex/mail/internet/ParameterList;->list:Ljava/util/Map;

    invoke-interface {v8, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 627
    .local v5, "v":Ljava/lang/Object;
    instance-of v8, v5, Lkorex/mail/internet/ParameterList$MultiValue;

    if-eqz v8, :cond_82

    move-object v7, v5

    .line 628
    check-cast v7, Lkorex/mail/internet/ParameterList$MultiValue;

    .line 629
    .local v7, "vv":Lkorex/mail/internet/ParameterList$MultiValue;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "*"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 630
    .local v3, "ns":Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_3c
    invoke-virtual {v7}, Lkorex/mail/internet/ParameterList$MultiValue;->size()I

    move-result v8

    if-ge v1, v8, :cond_f

    .line 631
    invoke-virtual {v7, v1}, Lkorex/mail/internet/ParameterList$MultiValue;->get(I)Ljava/lang/Object;

    move-result-object v6

    .line 632
    .local v6, "va":Ljava/lang/Object;
    instance-of v8, v6, Lkorex/mail/internet/ParameterList$Value;

    if-eqz v8, :cond_6b

    .line 633
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "*"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    check-cast v6, Lkorex/mail/internet/ParameterList$Value;

    .end local v6    # "va":Ljava/lang/Object;
    iget-object v9, v6, Lkorex/mail/internet/ParameterList$Value;->encodedValue:Ljava/lang/String;

    invoke-virtual {v4, v8, v9}, Lkorex/mail/internet/ParameterList$ToStringBuffer;->addNV(Ljava/lang/String;Ljava/lang/String;)V

    .line 630
    :goto_68
    add-int/lit8 v1, v1, 0x1

    goto :goto_3c

    .line 635
    .restart local v6    # "va":Ljava/lang/Object;
    :cond_6b
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    check-cast v6, Ljava/lang/String;

    .end local v6    # "va":Ljava/lang/Object;
    invoke-virtual {v4, v8, v6}, Lkorex/mail/internet/ParameterList$ToStringBuffer;->addNV(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_68

    .line 637
    .end local v1    # "i":I
    .end local v3    # "ns":Ljava/lang/String;
    .end local v7    # "vv":Lkorex/mail/internet/ParameterList$MultiValue;
    :cond_82
    instance-of v8, v5, Lkorex/mail/internet/ParameterList$Value;

    if-eqz v8, :cond_a2

    .line 638
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "*"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    check-cast v5, Lkorex/mail/internet/ParameterList$Value;

    .end local v5    # "v":Ljava/lang/Object;
    iget-object v9, v5, Lkorex/mail/internet/ParameterList$Value;->encodedValue:Ljava/lang/String;

    invoke-virtual {v4, v8, v9}, Lkorex/mail/internet/ParameterList$ToStringBuffer;->addNV(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_f

    .line 640
    .restart local v5    # "v":Ljava/lang/Object;
    :cond_a2
    check-cast v5, Ljava/lang/String;

    .end local v5    # "v":Ljava/lang/Object;
    invoke-virtual {v4, v2, v5}, Lkorex/mail/internet/ParameterList$ToStringBuffer;->addNV(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_f

    .line 642
    .end local v2    # "name":Ljava/lang/String;
    :cond_a9
    invoke-virtual {v4}, Lkorex/mail/internet/ParameterList$ToStringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    return-object v8
.end method
