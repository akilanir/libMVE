.class public Lorg/apache/commons/validator/ValidatorResources;
.super Ljava/lang/Object;
.source "ValidatorResources.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final ARGS_PATTERN:Ljava/lang/String; = "form-validation/formset/form/field/arg"

.field private static final REGISTRATIONS:[Ljava/lang/String;

.field private static final VALIDATOR_RULES:Ljava/lang/String; = "digester-rules.xml"

.field static class$org$apache$commons$validator$ValidatorResources:Ljava/lang/Class; = null

.field protected static defaultLocale:Ljava/util/Locale; = null

.field private static final serialVersionUID:J = -0x71d98f69f32d4d42L


# instance fields
.field protected defaultFormSet:Lorg/apache/commons/validator/FormSet;

.field protected hActions:Lorg/apache/commons/collections/FastHashMap;

.field protected hConstants:Lorg/apache/commons/collections/FastHashMap;

.field protected hFormSets:Lorg/apache/commons/collections/FastHashMap;

.field private transient log:Lorg/apache/commons/logging/Log;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 67
    const/16 v0, 0xe

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "-//Apache Software Foundation//DTD Commons Validator Rules Configuration 1.0//EN"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "/org/apache/commons/validator/resources/validator_1_0.dtd"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "-//Apache Software Foundation//DTD Commons Validator Rules Configuration 1.0.1//EN"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "/org/apache/commons/validator/resources/validator_1_0_1.dtd"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "-//Apache Software Foundation//DTD Commons Validator Rules Configuration 1.1//EN"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "/org/apache/commons/validator/resources/validator_1_1.dtd"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "-//Apache Software Foundation//DTD Commons Validator Rules Configuration 1.1.3//EN"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "/org/apache/commons/validator/resources/validator_1_1_3.dtd"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "-//Apache Software Foundation//DTD Commons Validator Rules Configuration 1.2.0//EN"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "/org/apache/commons/validator/resources/validator_1_2_0.dtd"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "-//Apache Software Foundation//DTD Commons Validator Rules Configuration 1.3.0//EN"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "/org/apache/commons/validator/resources/validator_1_3_0.dtd"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "-//Apache Software Foundation//DTD Commons Validator Rules Configuration 1.4.0//EN"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "/org/apache/commons/validator/resources/validator_1_4_0.dtd"

    aput-object v2, v0, v1

    sput-object v0, Lorg/apache/commons/validator/ValidatorResources;->REGISTRATIONS:[Ljava/lang/String;

    .line 110
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/validator/ValidatorResources;->defaultLocale:Ljava/util/Locale;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 116
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    sget-object v0, Lorg/apache/commons/validator/ValidatorResources;->class$org$apache$commons$validator$ValidatorResources:Ljava/lang/Class;

    if-nez v0, :cond_2b

    const-string v0, "org.apache.commons.validator.ValidatorResources"

    invoke-static {v0}, Lorg/apache/commons/validator/ValidatorResources;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/validator/ValidatorResources;->class$org$apache$commons$validator$ValidatorResources:Ljava/lang/Class;

    :goto_f
    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/validator/ValidatorResources;->log:Lorg/apache/commons/logging/Log;

    .line 91
    new-instance v0, Lorg/apache/commons/collections/FastHashMap;

    invoke-direct {v0}, Lorg/apache/commons/collections/FastHashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/validator/ValidatorResources;->hFormSets:Lorg/apache/commons/collections/FastHashMap;

    .line 98
    new-instance v0, Lorg/apache/commons/collections/FastHashMap;

    invoke-direct {v0}, Lorg/apache/commons/collections/FastHashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/validator/ValidatorResources;->hConstants:Lorg/apache/commons/collections/FastHashMap;

    .line 105
    new-instance v0, Lorg/apache/commons/collections/FastHashMap;

    invoke-direct {v0}, Lorg/apache/commons/collections/FastHashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/validator/ValidatorResources;->hActions:Lorg/apache/commons/collections/FastHashMap;

    .line 117
    return-void

    .line 84
    :cond_2b
    sget-object v0, Lorg/apache/commons/validator/ValidatorResources;->class$org$apache$commons$validator$ValidatorResources:Ljava/lang/Class;

    goto :goto_f
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 4
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 137
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/io/InputStream;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-direct {p0, v0}, Lorg/apache/commons/validator/ValidatorResources;-><init>([Ljava/io/InputStream;)V

    .line 138
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "uri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 180
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-direct {p0, v0}, Lorg/apache/commons/validator/ValidatorResources;-><init>([Ljava/lang/String;)V

    .line 181
    return-void
.end method

.method public constructor <init>(Ljava/net/URL;)V
    .registers 4
    .param p1, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 221
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/net/URL;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-direct {p0, v0}, Lorg/apache/commons/validator/ValidatorResources;-><init>([Ljava/net/URL;)V

    .line 222
    return-void
.end method

.method public constructor <init>([Ljava/io/InputStream;)V
    .registers 7
    .param p1, "streams"    # [Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 155
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    sget-object v2, Lorg/apache/commons/validator/ValidatorResources;->class$org$apache$commons$validator$ValidatorResources:Ljava/lang/Class;

    if-nez v2, :cond_55

    const-string v2, "org.apache.commons.validator.ValidatorResources"

    invoke-static {v2}, Lorg/apache/commons/validator/ValidatorResources;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/commons/validator/ValidatorResources;->class$org$apache$commons$validator$ValidatorResources:Ljava/lang/Class;

    :goto_f
    invoke-static {v2}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/commons/validator/ValidatorResources;->log:Lorg/apache/commons/logging/Log;

    .line 91
    new-instance v2, Lorg/apache/commons/collections/FastHashMap;

    invoke-direct {v2}, Lorg/apache/commons/collections/FastHashMap;-><init>()V

    iput-object v2, p0, Lorg/apache/commons/validator/ValidatorResources;->hFormSets:Lorg/apache/commons/collections/FastHashMap;

    .line 98
    new-instance v2, Lorg/apache/commons/collections/FastHashMap;

    invoke-direct {v2}, Lorg/apache/commons/collections/FastHashMap;-><init>()V

    iput-object v2, p0, Lorg/apache/commons/validator/ValidatorResources;->hConstants:Lorg/apache/commons/collections/FastHashMap;

    .line 105
    new-instance v2, Lorg/apache/commons/collections/FastHashMap;

    invoke-direct {v2}, Lorg/apache/commons/collections/FastHashMap;-><init>()V

    iput-object v2, p0, Lorg/apache/commons/validator/ValidatorResources;->hActions:Lorg/apache/commons/collections/FastHashMap;

    .line 157
    invoke-direct {p0}, Lorg/apache/commons/validator/ValidatorResources;->initDigester()Lorg/apache/commons/digester/Digester;

    move-result-object v0

    .line 158
    .local v0, "digester":Lorg/apache/commons/digester/Digester;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2f
    array-length v2, p1

    if-ge v1, v2, :cond_63

    .line 159
    aget-object v2, p1, v1

    if-nez v2, :cond_58

    .line 160
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Stream["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "] is null"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 84
    .end local v0    # "digester":Lorg/apache/commons/digester/Digester;
    .end local v1    # "i":I
    :cond_55
    sget-object v2, Lorg/apache/commons/validator/ValidatorResources;->class$org$apache$commons$validator$ValidatorResources:Ljava/lang/Class;

    goto :goto_f

    .line 162
    .restart local v0    # "digester":Lorg/apache/commons/digester/Digester;
    .restart local v1    # "i":I
    :cond_58
    invoke-virtual {v0, p0}, Lorg/apache/commons/digester/Digester;->push(Ljava/lang/Object;)V

    .line 163
    aget-object v2, p1, v1

    invoke-virtual {v0, v2}, Lorg/apache/commons/digester/Digester;->parse(Ljava/io/InputStream;)Ljava/lang/Object;

    .line 158
    add-int/lit8 v1, v1, 0x1

    goto :goto_2f

    .line 166
    :cond_63
    invoke-virtual {p0}, Lorg/apache/commons/validator/ValidatorResources;->process()V

    .line 167
    return-void
.end method

.method public constructor <init>([Ljava/lang/String;)V
    .registers 5
    .param p1, "uris"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 197
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    sget-object v2, Lorg/apache/commons/validator/ValidatorResources;->class$org$apache$commons$validator$ValidatorResources:Ljava/lang/Class;

    if-nez v2, :cond_3d

    const-string v2, "org.apache.commons.validator.ValidatorResources"

    invoke-static {v2}, Lorg/apache/commons/validator/ValidatorResources;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/commons/validator/ValidatorResources;->class$org$apache$commons$validator$ValidatorResources:Ljava/lang/Class;

    :goto_f
    invoke-static {v2}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/commons/validator/ValidatorResources;->log:Lorg/apache/commons/logging/Log;

    .line 91
    new-instance v2, Lorg/apache/commons/collections/FastHashMap;

    invoke-direct {v2}, Lorg/apache/commons/collections/FastHashMap;-><init>()V

    iput-object v2, p0, Lorg/apache/commons/validator/ValidatorResources;->hFormSets:Lorg/apache/commons/collections/FastHashMap;

    .line 98
    new-instance v2, Lorg/apache/commons/collections/FastHashMap;

    invoke-direct {v2}, Lorg/apache/commons/collections/FastHashMap;-><init>()V

    iput-object v2, p0, Lorg/apache/commons/validator/ValidatorResources;->hConstants:Lorg/apache/commons/collections/FastHashMap;

    .line 105
    new-instance v2, Lorg/apache/commons/collections/FastHashMap;

    invoke-direct {v2}, Lorg/apache/commons/collections/FastHashMap;-><init>()V

    iput-object v2, p0, Lorg/apache/commons/validator/ValidatorResources;->hActions:Lorg/apache/commons/collections/FastHashMap;

    .line 199
    invoke-direct {p0}, Lorg/apache/commons/validator/ValidatorResources;->initDigester()Lorg/apache/commons/digester/Digester;

    move-result-object v0

    .line 200
    .local v0, "digester":Lorg/apache/commons/digester/Digester;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2f
    array-length v2, p1

    if-ge v1, v2, :cond_40

    .line 201
    invoke-virtual {v0, p0}, Lorg/apache/commons/digester/Digester;->push(Ljava/lang/Object;)V

    .line 202
    aget-object v2, p1, v1

    invoke-virtual {v0, v2}, Lorg/apache/commons/digester/Digester;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 200
    add-int/lit8 v1, v1, 0x1

    goto :goto_2f

    .line 84
    .end local v0    # "digester":Lorg/apache/commons/digester/Digester;
    .end local v1    # "i":I
    :cond_3d
    sget-object v2, Lorg/apache/commons/validator/ValidatorResources;->class$org$apache$commons$validator$ValidatorResources:Ljava/lang/Class;

    goto :goto_f

    .line 205
    .restart local v0    # "digester":Lorg/apache/commons/digester/Digester;
    .restart local v1    # "i":I
    :cond_40
    invoke-virtual {p0}, Lorg/apache/commons/validator/ValidatorResources;->process()V

    .line 206
    return-void
.end method

.method public constructor <init>([Ljava/net/URL;)V
    .registers 5
    .param p1, "urls"    # [Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 238
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    sget-object v2, Lorg/apache/commons/validator/ValidatorResources;->class$org$apache$commons$validator$ValidatorResources:Ljava/lang/Class;

    if-nez v2, :cond_3d

    const-string v2, "org.apache.commons.validator.ValidatorResources"

    invoke-static {v2}, Lorg/apache/commons/validator/ValidatorResources;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/commons/validator/ValidatorResources;->class$org$apache$commons$validator$ValidatorResources:Ljava/lang/Class;

    :goto_f
    invoke-static {v2}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/commons/validator/ValidatorResources;->log:Lorg/apache/commons/logging/Log;

    .line 91
    new-instance v2, Lorg/apache/commons/collections/FastHashMap;

    invoke-direct {v2}, Lorg/apache/commons/collections/FastHashMap;-><init>()V

    iput-object v2, p0, Lorg/apache/commons/validator/ValidatorResources;->hFormSets:Lorg/apache/commons/collections/FastHashMap;

    .line 98
    new-instance v2, Lorg/apache/commons/collections/FastHashMap;

    invoke-direct {v2}, Lorg/apache/commons/collections/FastHashMap;-><init>()V

    iput-object v2, p0, Lorg/apache/commons/validator/ValidatorResources;->hConstants:Lorg/apache/commons/collections/FastHashMap;

    .line 105
    new-instance v2, Lorg/apache/commons/collections/FastHashMap;

    invoke-direct {v2}, Lorg/apache/commons/collections/FastHashMap;-><init>()V

    iput-object v2, p0, Lorg/apache/commons/validator/ValidatorResources;->hActions:Lorg/apache/commons/collections/FastHashMap;

    .line 240
    invoke-direct {p0}, Lorg/apache/commons/validator/ValidatorResources;->initDigester()Lorg/apache/commons/digester/Digester;

    move-result-object v0

    .line 241
    .local v0, "digester":Lorg/apache/commons/digester/Digester;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2f
    array-length v2, p1

    if-ge v1, v2, :cond_40

    .line 242
    invoke-virtual {v0, p0}, Lorg/apache/commons/digester/Digester;->push(Ljava/lang/Object;)V

    .line 243
    aget-object v2, p1, v1

    invoke-virtual {v0, v2}, Lorg/apache/commons/digester/Digester;->parse(Ljava/net/URL;)Ljava/lang/Object;

    .line 241
    add-int/lit8 v1, v1, 0x1

    goto :goto_2f

    .line 84
    .end local v0    # "digester":Lorg/apache/commons/digester/Digester;
    .end local v1    # "i":I
    :cond_3d
    sget-object v2, Lorg/apache/commons/validator/ValidatorResources;->class$org$apache$commons$validator$ValidatorResources:Ljava/lang/Class;

    goto :goto_f

    .line 246
    .restart local v0    # "digester":Lorg/apache/commons/digester/Digester;
    .restart local v1    # "i":I
    :cond_40
    invoke-virtual {p0}, Lorg/apache/commons/validator/ValidatorResources;->process()V

    .line 247
    return-void
.end method

.method static access$000(Lorg/apache/commons/validator/ValidatorResources;)Lorg/apache/commons/logging/Log;
    .registers 2
    .param p0, "x0"    # Lorg/apache/commons/validator/ValidatorResources;

    .prologue
    .line 55
    invoke-direct {p0}, Lorg/apache/commons/validator/ValidatorResources;->getLog()Lorg/apache/commons/logging/Log;

    move-result-object v0

    return-object v0
.end method

.method private addOldArgRules(Lorg/apache/commons/digester/Digester;)V
    .registers 4
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;

    .prologue
    .line 291
    new-instance v0, Lorg/apache/commons/validator/ValidatorResources$1;

    invoke-direct {v0, p0}, Lorg/apache/commons/validator/ValidatorResources$1;-><init>(Lorg/apache/commons/validator/ValidatorResources;)V

    .line 314
    .local v0, "rule":Lorg/apache/commons/digester/Rule;
    const-string v1, "form-validation/formset/form/field/arg0"

    invoke-virtual {p1, v1, v0}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 315
    const-string v1, "form-validation/formset/form/field/arg1"

    invoke-virtual {p1, v1, v0}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 316
    const-string v1, "form-validation/formset/form/field/arg2"

    invoke-virtual {p1, v1, v0}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 317
    const-string v1, "form-validation/formset/form/field/arg3"

    invoke-virtual {p1, v1, v0}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 319
    return-void
.end method

.method private buildLocale(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p1, "lang"    # Ljava/lang/String;
    .param p2, "country"    # Ljava/lang/String;
    .param p3, "variant"    # Ljava/lang/String;

    .prologue
    .line 414
    if-eqz p1, :cond_62

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_62

    move-object v0, p1

    .line 415
    .local v0, "key":Ljava/lang/String;
    :goto_9
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    if-eqz p2, :cond_65

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_65

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "_"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_2d
    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 416
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    if-eqz p3, :cond_68

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_68

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "_"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_59
    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 417
    return-object v0

    .line 414
    .end local v0    # "key":Ljava/lang/String;
    :cond_62
    const-string v0, ""

    goto :goto_9

    .line 415
    .restart local v0    # "key":Ljava/lang/String;
    :cond_65
    const-string v1, ""

    goto :goto_2d

    .line 416
    :cond_68
    const-string v1, ""

    goto :goto_59
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 3
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 84
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

    invoke-direct {v1}, Ljava/lang/NoClassDefFoundError;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/NoClassDefFoundError;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v1

    throw v1
.end method

.method private getLog()Lorg/apache/commons/logging/Log;
    .registers 2

    .prologue
    .line 653
    iget-object v0, p0, Lorg/apache/commons/validator/ValidatorResources;->log:Lorg/apache/commons/logging/Log;

    if-nez v0, :cond_16

    .line 654
    sget-object v0, Lorg/apache/commons/validator/ValidatorResources;->class$org$apache$commons$validator$ValidatorResources:Ljava/lang/Class;

    if-nez v0, :cond_19

    const-string v0, "org.apache.commons.validator.ValidatorResources"

    invoke-static {v0}, Lorg/apache/commons/validator/ValidatorResources;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/validator/ValidatorResources;->class$org$apache$commons$validator$ValidatorResources:Ljava/lang/Class;

    :goto_10
    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/validator/ValidatorResources;->log:Lorg/apache/commons/logging/Log;

    .line 656
    :cond_16
    iget-object v0, p0, Lorg/apache/commons/validator/ValidatorResources;->log:Lorg/apache/commons/logging/Log;

    return-object v0

    .line 654
    :cond_19
    sget-object v0, Lorg/apache/commons/validator/ValidatorResources;->class$org$apache$commons$validator$ValidatorResources:Ljava/lang/Class;

    goto :goto_10
.end method

.method private getParent(Lorg/apache/commons/validator/FormSet;)Lorg/apache/commons/validator/FormSet;
    .registers 7
    .param p1, "fs"    # Lorg/apache/commons/validator/FormSet;

    .prologue
    const/4 v4, 0x0

    .line 572
    const/4 v0, 0x0

    .line 573
    .local v0, "parent":Lorg/apache/commons/validator/FormSet;
    invoke-virtual {p1}, Lorg/apache/commons/validator/FormSet;->getType()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_c

    .line 574
    iget-object v0, p0, Lorg/apache/commons/validator/ValidatorResources;->defaultFormSet:Lorg/apache/commons/validator/FormSet;

    .line 592
    :cond_b
    :goto_b
    return-object v0

    .line 575
    :cond_c
    invoke-virtual {p1}, Lorg/apache/commons/validator/FormSet;->getType()I

    move-result v1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_28

    .line 576
    iget-object v1, p0, Lorg/apache/commons/validator/ValidatorResources;->hFormSets:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {p1}, Lorg/apache/commons/validator/FormSet;->getLanguage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2, v4, v4}, Lorg/apache/commons/validator/ValidatorResources;->buildLocale(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/commons/collections/FastHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "parent":Lorg/apache/commons/validator/FormSet;
    check-cast v0, Lorg/apache/commons/validator/FormSet;

    .line 578
    .restart local v0    # "parent":Lorg/apache/commons/validator/FormSet;
    if-nez v0, :cond_b

    .line 579
    iget-object v0, p0, Lorg/apache/commons/validator/ValidatorResources;->defaultFormSet:Lorg/apache/commons/validator/FormSet;

    goto :goto_b

    .line 581
    :cond_28
    invoke-virtual {p1}, Lorg/apache/commons/validator/FormSet;->getType()I

    move-result v1

    const/4 v2, 0x4

    if-ne v1, v2, :cond_b

    .line 582
    iget-object v1, p0, Lorg/apache/commons/validator/ValidatorResources;->hFormSets:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {p1}, Lorg/apache/commons/validator/FormSet;->getLanguage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lorg/apache/commons/validator/FormSet;->getCountry()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v2, v3, v4}, Lorg/apache/commons/validator/ValidatorResources;->buildLocale(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/commons/collections/FastHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "parent":Lorg/apache/commons/validator/FormSet;
    check-cast v0, Lorg/apache/commons/validator/FormSet;

    .line 584
    .restart local v0    # "parent":Lorg/apache/commons/validator/FormSet;
    if-nez v0, :cond_b

    .line 585
    iget-object v1, p0, Lorg/apache/commons/validator/ValidatorResources;->hFormSets:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {p1}, Lorg/apache/commons/validator/FormSet;->getLanguage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2, v4, v4}, Lorg/apache/commons/validator/ValidatorResources;->buildLocale(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/commons/collections/FastHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "parent":Lorg/apache/commons/validator/FormSet;
    check-cast v0, Lorg/apache/commons/validator/FormSet;

    .line 587
    .restart local v0    # "parent":Lorg/apache/commons/validator/FormSet;
    if-nez v0, :cond_b

    .line 588
    iget-object v0, p0, Lorg/apache/commons/validator/ValidatorResources;->defaultFormSet:Lorg/apache/commons/validator/FormSet;

    goto :goto_b
.end method

.method private initDigester()Lorg/apache/commons/digester/Digester;
    .registers 9

    .prologue
    const/4 v7, 0x1

    .line 253
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "digester-rules.xml"

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v2

    .line 254
    .local v2, "rulesUrl":Ljava/net/URL;
    if-nez v2, :cond_1f

    .line 256
    sget-object v4, Lorg/apache/commons/validator/ValidatorResources;->class$org$apache$commons$validator$ValidatorResources:Ljava/lang/Class;

    if-nez v4, :cond_7d

    const-string v4, "org.apache.commons.validator.ValidatorResources"

    invoke-static {v4}, Lorg/apache/commons/validator/ValidatorResources;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/commons/validator/ValidatorResources;->class$org$apache$commons$validator$ValidatorResources:Ljava/lang/Class;

    :goto_19
    const-string v5, "digester-rules.xml"

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v2

    .line 258
    :cond_1f
    invoke-direct {p0}, Lorg/apache/commons/validator/ValidatorResources;->getLog()Lorg/apache/commons/logging/Log;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v4

    if-eqz v4, :cond_49

    .line 259
    invoke-direct {p0}, Lorg/apache/commons/validator/ValidatorResources;->getLog()Lorg/apache/commons/logging/Log;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Loading rules from \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 261
    :cond_49
    invoke-static {v2}, Lorg/apache/commons/digester/xmlrules/DigesterLoader;->createDigester(Ljava/net/URL;)Lorg/apache/commons/digester/Digester;

    move-result-object v0

    .line 262
    .local v0, "digester":Lorg/apache/commons/digester/Digester;
    invoke-virtual {v0, v7}, Lorg/apache/commons/digester/Digester;->setNamespaceAware(Z)V

    .line 263
    invoke-virtual {v0, v7}, Lorg/apache/commons/digester/Digester;->setValidating(Z)V

    .line 264
    invoke-virtual {v0, v7}, Lorg/apache/commons/digester/Digester;->setUseContextClassLoader(Z)V

    .line 267
    invoke-direct {p0, v0}, Lorg/apache/commons/validator/ValidatorResources;->addOldArgRules(Lorg/apache/commons/digester/Digester;)V

    .line 270
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_5a
    sget-object v4, Lorg/apache/commons/validator/ValidatorResources;->REGISTRATIONS:[Ljava/lang/String;

    array-length v4, v4

    if-ge v1, v4, :cond_80

    .line 271
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    sget-object v5, Lorg/apache/commons/validator/ValidatorResources;->REGISTRATIONS:[Ljava/lang/String;

    add-int/lit8 v6, v1, 0x1

    aget-object v5, v5, v6

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v3

    .line 272
    .local v3, "url":Ljava/net/URL;
    if-eqz v3, :cond_7a

    .line 273
    sget-object v4, Lorg/apache/commons/validator/ValidatorResources;->REGISTRATIONS:[Ljava/lang/String;

    aget-object v4, v4, v1

    invoke-virtual {v3}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Lorg/apache/commons/digester/Digester;->register(Ljava/lang/String;Ljava/lang/String;)V

    .line 270
    :cond_7a
    add-int/lit8 v1, v1, 0x2

    goto :goto_5a

    .line 256
    .end local v0    # "digester":Lorg/apache/commons/digester/Digester;
    .end local v1    # "i":I
    .end local v3    # "url":Ljava/net/URL;
    :cond_7d
    sget-object v4, Lorg/apache/commons/validator/ValidatorResources;->class$org$apache$commons$validator$ValidatorResources:Ljava/lang/Class;

    goto :goto_19

    .line 276
    .restart local v0    # "digester":Lorg/apache/commons/digester/Digester;
    .restart local v1    # "i":I
    :cond_80
    return-object v0
.end method

.method private processForms()V
    .registers 6

    .prologue
    .line 539
    iget-object v3, p0, Lorg/apache/commons/validator/ValidatorResources;->defaultFormSet:Lorg/apache/commons/validator/FormSet;

    if-nez v3, :cond_b

    .line 541
    new-instance v3, Lorg/apache/commons/validator/FormSet;

    invoke-direct {v3}, Lorg/apache/commons/validator/FormSet;-><init>()V

    iput-object v3, p0, Lorg/apache/commons/validator/ValidatorResources;->defaultFormSet:Lorg/apache/commons/validator/FormSet;

    .line 543
    :cond_b
    iget-object v3, p0, Lorg/apache/commons/validator/ValidatorResources;->defaultFormSet:Lorg/apache/commons/validator/FormSet;

    iget-object v4, p0, Lorg/apache/commons/validator/ValidatorResources;->hConstants:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {v3, v4}, Lorg/apache/commons/validator/FormSet;->process(Ljava/util/Map;)V

    .line 545
    iget-object v3, p0, Lorg/apache/commons/validator/ValidatorResources;->hFormSets:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {v3}, Lorg/apache/commons/collections/FastHashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;
    :goto_1c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_38

    .line 546
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 547
    .local v2, "key":Ljava/lang/String;
    iget-object v3, p0, Lorg/apache/commons/validator/ValidatorResources;->hFormSets:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {v3, v2}, Lorg/apache/commons/collections/FastHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/validator/FormSet;

    .line 548
    .local v0, "fs":Lorg/apache/commons/validator/FormSet;
    invoke-direct {p0, v0}, Lorg/apache/commons/validator/ValidatorResources;->getParent(Lorg/apache/commons/validator/FormSet;)Lorg/apache/commons/validator/FormSet;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/apache/commons/validator/FormSet;->merge(Lorg/apache/commons/validator/FormSet;)V

    goto :goto_1c

    .line 552
    .end local v0    # "fs":Lorg/apache/commons/validator/FormSet;
    .end local v2    # "key":Ljava/lang/String;
    :cond_38
    iget-object v3, p0, Lorg/apache/commons/validator/ValidatorResources;->hFormSets:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {v3}, Lorg/apache/commons/collections/FastHashMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_42
    :goto_42
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5a

    .line 553
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/validator/FormSet;

    .line 554
    .restart local v0    # "fs":Lorg/apache/commons/validator/FormSet;
    invoke-virtual {v0}, Lorg/apache/commons/validator/FormSet;->isProcessed()Z

    move-result v3

    if-nez v3, :cond_42

    .line 555
    iget-object v3, p0, Lorg/apache/commons/validator/ValidatorResources;->hConstants:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {v0, v3}, Lorg/apache/commons/validator/FormSet;->process(Ljava/util/Map;)V

    goto :goto_42

    .line 558
    .end local v0    # "fs":Lorg/apache/commons/validator/FormSet;
    :cond_5a
    return-void
.end method


# virtual methods
.method public addConstant(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 358
    invoke-direct {p0}, Lorg/apache/commons/validator/ValidatorResources;->getLog()Lorg/apache/commons/logging/Log;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    if-eqz v0, :cond_2e

    .line 359
    invoke-direct {p0}, Lorg/apache/commons/validator/ValidatorResources;->getLog()Lorg/apache/commons/logging/Log;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Adding Global Constant: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 362
    :cond_2e
    iget-object v0, p0, Lorg/apache/commons/validator/ValidatorResources;->hConstants:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {v0, p1, p2}, Lorg/apache/commons/collections/FastHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 363
    return-void
.end method

.method public addFormSet(Lorg/apache/commons/validator/FormSet;)V
    .registers 7
    .param p1, "fs"    # Lorg/apache/commons/validator/FormSet;

    .prologue
    .line 329
    invoke-virtual {p0, p1}, Lorg/apache/commons/validator/ValidatorResources;->buildKey(Lorg/apache/commons/validator/FormSet;)Ljava/lang/String;

    move-result-object v1

    .line 330
    .local v1, "key":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_24

    .line 331
    invoke-direct {p0}, Lorg/apache/commons/validator/ValidatorResources;->getLog()Lorg/apache/commons/logging/Log;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/commons/logging/Log;->isWarnEnabled()Z

    move-result v2

    if-eqz v2, :cond_21

    iget-object v2, p0, Lorg/apache/commons/validator/ValidatorResources;->defaultFormSet:Lorg/apache/commons/validator/FormSet;

    if-eqz v2, :cond_21

    .line 333
    invoke-direct {p0}, Lorg/apache/commons/validator/ValidatorResources;->getLog()Lorg/apache/commons/logging/Log;

    move-result-object v2

    const-string v3, "Overriding default FormSet definition."

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    .line 335
    :cond_21
    iput-object p1, p0, Lorg/apache/commons/validator/ValidatorResources;->defaultFormSet:Lorg/apache/commons/validator/FormSet;

    .line 350
    :goto_23
    return-void

    .line 337
    :cond_24
    iget-object v2, p0, Lorg/apache/commons/validator/ValidatorResources;->hFormSets:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {v2, v1}, Lorg/apache/commons/collections/FastHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/validator/FormSet;

    .line 338
    .local v0, "formset":Lorg/apache/commons/validator/FormSet;
    if-nez v0, :cond_62

    .line 339
    invoke-direct {p0}, Lorg/apache/commons/validator/ValidatorResources;->getLog()Lorg/apache/commons/logging/Log;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_5c

    .line 340
    invoke-direct {p0}, Lorg/apache/commons/validator/ValidatorResources;->getLog()Lorg/apache/commons/logging/Log;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Adding FormSet \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p1}, Lorg/apache/commons/validator/FormSet;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\'."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 348
    :cond_5c
    :goto_5c
    iget-object v2, p0, Lorg/apache/commons/validator/ValidatorResources;->hFormSets:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {v2, v1, p1}, Lorg/apache/commons/collections/FastHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_23

    .line 342
    :cond_62
    invoke-direct {p0}, Lorg/apache/commons/validator/ValidatorResources;->getLog()Lorg/apache/commons/logging/Log;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/commons/logging/Log;->isWarnEnabled()Z

    move-result v2

    if-eqz v2, :cond_5c

    .line 344
    invoke-direct {p0}, Lorg/apache/commons/validator/ValidatorResources;->getLog()Lorg/apache/commons/logging/Log;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Overriding FormSet definition. Duplicate for locale: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    goto :goto_5c
.end method

.method public addValidatorAction(Lorg/apache/commons/validator/ValidatorAction;)V
    .registers 5
    .param p1, "va"    # Lorg/apache/commons/validator/ValidatorAction;

    .prologue
    .line 373
    invoke-virtual {p1}, Lorg/apache/commons/validator/ValidatorAction;->init()V

    .line 375
    iget-object v0, p0, Lorg/apache/commons/validator/ValidatorResources;->hActions:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {p1}, Lorg/apache/commons/validator/ValidatorAction;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lorg/apache/commons/collections/FastHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 377
    invoke-direct {p0}, Lorg/apache/commons/validator/ValidatorResources;->getLog()Lorg/apache/commons/logging/Log;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    if-eqz v0, :cond_42

    .line 378
    invoke-direct {p0}, Lorg/apache/commons/validator/ValidatorResources;->getLog()Lorg/apache/commons/logging/Log;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Add ValidatorAction: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p1}, Lorg/apache/commons/validator/ValidatorAction;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p1}, Lorg/apache/commons/validator/ValidatorAction;->getClassname()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 380
    :cond_42
    return-void
.end method

.method protected buildKey(Lorg/apache/commons/validator/FormSet;)Ljava/lang/String;
    .registers 5
    .param p1, "fs"    # Lorg/apache/commons/validator/FormSet;

    .prologue
    .line 406
    invoke-virtual {p1}, Lorg/apache/commons/validator/FormSet;->getLanguage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lorg/apache/commons/validator/FormSet;->getCountry()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lorg/apache/commons/validator/FormSet;->getVariant()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lorg/apache/commons/validator/ValidatorResources;->buildLocale(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getActions()Ljava/util/Map;
    .registers 2

    .prologue
    .line 639
    iget-object v0, p0, Lorg/apache/commons/validator/ValidatorResources;->hActions:Lorg/apache/commons/collections/FastHashMap;

    return-object v0
.end method

.method protected getConstants()Ljava/util/Map;
    .registers 2

    .prologue
    .line 630
    iget-object v0, p0, Lorg/apache/commons/validator/ValidatorResources;->hConstants:Lorg/apache/commons/collections/FastHashMap;

    return-object v0
.end method

.method public getForm(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/apache/commons/validator/Form;
    .registers 12
    .param p1, "language"    # Ljava/lang/String;
    .param p2, "country"    # Ljava/lang/String;
    .param p3, "variant"    # Ljava/lang/String;
    .param p4, "formKey"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 460
    const/4 v0, 0x0

    .line 463
    .local v0, "form":Lorg/apache/commons/validator/Form;
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/commons/validator/ValidatorResources;->buildLocale(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 464
    .local v2, "key":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_1a

    .line 465
    iget-object v4, p0, Lorg/apache/commons/validator/ValidatorResources;->hFormSets:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {v4, v2}, Lorg/apache/commons/collections/FastHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/validator/FormSet;

    .line 466
    .local v1, "formSet":Lorg/apache/commons/validator/FormSet;
    if-eqz v1, :cond_1a

    .line 467
    invoke-virtual {v1, p4}, Lorg/apache/commons/validator/FormSet;->getForm(Ljava/lang/String;)Lorg/apache/commons/validator/Form;

    move-result-object v0

    .line 470
    .end local v1    # "formSet":Lorg/apache/commons/validator/FormSet;
    :cond_1a
    move-object v3, v2

    .line 474
    .local v3, "localeKey":Ljava/lang/String;
    if-nez v0, :cond_35

    .line 475
    invoke-direct {p0, p1, p2, v5}, Lorg/apache/commons/validator/ValidatorResources;->buildLocale(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 476
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_35

    .line 477
    iget-object v4, p0, Lorg/apache/commons/validator/ValidatorResources;->hFormSets:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {v4, v2}, Lorg/apache/commons/collections/FastHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/validator/FormSet;

    .line 478
    .restart local v1    # "formSet":Lorg/apache/commons/validator/FormSet;
    if-eqz v1, :cond_35

    .line 479
    invoke-virtual {v1, p4}, Lorg/apache/commons/validator/FormSet;->getForm(Ljava/lang/String;)Lorg/apache/commons/validator/Form;

    move-result-object v0

    .line 485
    .end local v1    # "formSet":Lorg/apache/commons/validator/FormSet;
    :cond_35
    if-nez v0, :cond_4f

    .line 486
    invoke-direct {p0, p1, v5, v5}, Lorg/apache/commons/validator/ValidatorResources;->buildLocale(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 487
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_4f

    .line 488
    iget-object v4, p0, Lorg/apache/commons/validator/ValidatorResources;->hFormSets:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {v4, v2}, Lorg/apache/commons/collections/FastHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/validator/FormSet;

    .line 489
    .restart local v1    # "formSet":Lorg/apache/commons/validator/FormSet;
    if-eqz v1, :cond_4f

    .line 490
    invoke-virtual {v1, p4}, Lorg/apache/commons/validator/FormSet;->getForm(Ljava/lang/String;)Lorg/apache/commons/validator/Form;

    move-result-object v0

    .line 496
    .end local v1    # "formSet":Lorg/apache/commons/validator/FormSet;
    :cond_4f
    if-nez v0, :cond_59

    .line 497
    iget-object v4, p0, Lorg/apache/commons/validator/ValidatorResources;->defaultFormSet:Lorg/apache/commons/validator/FormSet;

    invoke-virtual {v4, p4}, Lorg/apache/commons/validator/FormSet;->getForm(Ljava/lang/String;)Lorg/apache/commons/validator/Form;

    move-result-object v0

    .line 498
    const-string v2, "default"

    .line 501
    :cond_59
    if-nez v0, :cond_90

    .line 502
    invoke-direct {p0}, Lorg/apache/commons/validator/ValidatorResources;->getLog()Lorg/apache/commons/logging/Log;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/commons/logging/Log;->isWarnEnabled()Z

    move-result v4

    if-eqz v4, :cond_8f

    .line 503
    invoke-direct {p0}, Lorg/apache/commons/validator/ValidatorResources;->getLog()Lorg/apache/commons/logging/Log;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Form \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "\' not found for locale \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    .line 513
    :cond_8f
    :goto_8f
    return-object v0

    .line 507
    :cond_90
    invoke-direct {p0}, Lorg/apache/commons/validator/ValidatorResources;->getLog()Lorg/apache/commons/logging/Log;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v4

    if-eqz v4, :cond_8f

    .line 508
    invoke-direct {p0}, Lorg/apache/commons/validator/ValidatorResources;->getLog()Lorg/apache/commons/logging/Log;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Form \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "\' found in formset \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "\' for locale \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto :goto_8f
.end method

.method public getForm(Ljava/util/Locale;Ljava/lang/String;)Lorg/apache/commons/validator/Form;
    .registers 6
    .param p1, "locale"    # Ljava/util/Locale;
    .param p2, "formKey"    # Ljava/lang/String;

    .prologue
    .line 436
    invoke-virtual {p1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Ljava/util/Locale;->getVariant()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v0, v1, v2, p2}, Lorg/apache/commons/validator/ValidatorResources;->getForm(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/apache/commons/validator/Form;

    move-result-object v0

    return-object v0
.end method

.method getFormSet(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/apache/commons/validator/FormSet;
    .registers 6
    .param p1, "language"    # Ljava/lang/String;
    .param p2, "country"    # Ljava/lang/String;
    .param p3, "variant"    # Ljava/lang/String;

    .prologue
    .line 606
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/commons/validator/ValidatorResources;->buildLocale(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 608
    .local v0, "key":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_d

    .line 609
    iget-object v1, p0, Lorg/apache/commons/validator/ValidatorResources;->defaultFormSet:Lorg/apache/commons/validator/FormSet;

    .line 612
    :goto_c
    return-object v1

    :cond_d
    iget-object v1, p0, Lorg/apache/commons/validator/ValidatorResources;->hFormSets:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {v1, v0}, Lorg/apache/commons/collections/FastHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/validator/FormSet;

    goto :goto_c
.end method

.method protected getFormSets()Ljava/util/Map;
    .registers 2

    .prologue
    .line 621
    iget-object v0, p0, Lorg/apache/commons/validator/ValidatorResources;->hFormSets:Lorg/apache/commons/collections/FastHashMap;

    return-object v0
.end method

.method public getValidatorAction(Ljava/lang/String;)Lorg/apache/commons/validator/ValidatorAction;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 388
    iget-object v0, p0, Lorg/apache/commons/validator/ValidatorResources;->hActions:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {v0, p1}, Lorg/apache/commons/collections/FastHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/validator/ValidatorAction;

    return-object v0
.end method

.method public getValidatorActions()Ljava/util/Map;
    .registers 2

    .prologue
    .line 396
    iget-object v0, p0, Lorg/apache/commons/validator/ValidatorResources;->hActions:Lorg/apache/commons/collections/FastHashMap;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public process()V
    .registers 3

    .prologue
    const/4 v1, 0x1

    .line 526
    iget-object v0, p0, Lorg/apache/commons/validator/ValidatorResources;->hFormSets:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {v0, v1}, Lorg/apache/commons/collections/FastHashMap;->setFast(Z)V

    .line 527
    iget-object v0, p0, Lorg/apache/commons/validator/ValidatorResources;->hConstants:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {v0, v1}, Lorg/apache/commons/collections/FastHashMap;->setFast(Z)V

    .line 528
    iget-object v0, p0, Lorg/apache/commons/validator/ValidatorResources;->hActions:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {v0, v1}, Lorg/apache/commons/collections/FastHashMap;->setFast(Z)V

    .line 530
    invoke-direct {p0}, Lorg/apache/commons/validator/ValidatorResources;->processForms()V

    .line 531
    return-void
.end method
