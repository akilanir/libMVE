.class public Lch/qos/logback/core/joran/action/PropertyAction;
.super Lch/qos/logback/core/joran/action/Action;


# static fields
.field static INVALID_ATTRIBUTES:Ljava/lang/String; = null

.field static final RESOURCE_ATTRIBUTE:Ljava/lang/String; = "resource"


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-string v0, "In <property> element, either the \"file\" attribute alone, or the \"resource\" element alone, or both the \"name\" and \"value\" attributes must be set."

    sput-object v0, Lch/qos/logback/core/joran/action/PropertyAction;->INVALID_ATTRIBUTES:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lch/qos/logback/core/joran/action/Action;-><init>()V

    return-void
.end method


# virtual methods
.method public begin(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .registers 8

    const-string v0, "substitutionProperty"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    const-string v0, "[substitutionProperty] element has been deprecated. Please use the [property] element instead."

    invoke-virtual {p0, v0}, Lch/qos/logback/core/joran/action/PropertyAction;->addWarn(Ljava/lang/String;)V

    :cond_d
    const-string v0, "name"

    invoke-interface {p3, v0}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "value"

    invoke-interface {p3, v1}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "scope"

    invoke-interface {p3, v2}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lch/qos/logback/core/joran/action/ActionUtil;->stringToScope(Ljava/lang/String;)Lch/qos/logback/core/joran/action/ActionUtil$Scope;

    move-result-object v2

    invoke-virtual {p0, p3}, Lch/qos/logback/core/joran/action/PropertyAction;->checkFileAttributeSanity(Lorg/xml/sax/Attributes;)Z

    move-result v3

    if-eqz v3, :cond_78

    const-string v0, "file"

    invoke-interface {p3, v0}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lch/qos/logback/core/joran/spi/InterpretationContext;->subst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :try_start_33
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1, v0, v2}, Lch/qos/logback/core/joran/action/PropertyAction;->loadAndSetProperties(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/io/InputStream;Lch/qos/logback/core/joran/action/ActionUtil$Scope;)V
    :try_end_3b
    .catch Ljava/io/FileNotFoundException; {:try_start_33 .. :try_end_3b} :catch_3c
    .catch Ljava/io/IOException; {:try_start_33 .. :try_end_3b} :catch_5a

    :goto_3b
    return-void

    :catch_3c
    move-exception v0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Could not find properties file ["

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/joran/action/PropertyAction;->addError(Ljava/lang/String;)V

    goto :goto_3b

    :catch_5a
    move-exception v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not read properties file ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lch/qos/logback/core/joran/action/PropertyAction;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3b

    :cond_78
    invoke-virtual {p0, p3}, Lch/qos/logback/core/joran/action/PropertyAction;->checkResourceAttributeSanity(Lorg/xml/sax/Attributes;)Z

    move-result v3

    if-eqz v3, :cond_d2

    const-string v0, "resource"

    invoke-interface {p3, v0}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lch/qos/logback/core/joran/spi/InterpretationContext;->subst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lch/qos/logback/core/util/Loader;->getResourceBySelfClassLoader(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    if-nez v0, :cond_ab

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Could not find resource ["

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/joran/action/PropertyAction;->addError(Ljava/lang/String;)V

    goto :goto_3b

    :cond_ab
    :try_start_ab
    invoke-virtual {v0}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {p0, p1, v0, v2}, Lch/qos/logback/core/joran/action/PropertyAction;->loadAndSetProperties(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/io/InputStream;Lch/qos/logback/core/joran/action/ActionUtil$Scope;)V
    :try_end_b2
    .catch Ljava/io/IOException; {:try_start_ab .. :try_end_b2} :catch_b3

    goto :goto_3b

    :catch_b3
    move-exception v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not read resource file ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lch/qos/logback/core/joran/action/PropertyAction;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3b

    :cond_d2
    invoke-virtual {p0, p3}, Lch/qos/logback/core/joran/action/PropertyAction;->checkValueNameAttributesSanity(Lorg/xml/sax/Attributes;)Z

    move-result v3

    if-eqz v3, :cond_e9

    invoke-static {v1}, Lch/qos/logback/core/pattern/util/RegularEscapeUtil;->basicEscape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lch/qos/logback/core/joran/spi/InterpretationContext;->subst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v0, v1, v2}, Lch/qos/logback/core/joran/action/ActionUtil;->setProperty(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/lang/String;Ljava/lang/String;Lch/qos/logback/core/joran/action/ActionUtil$Scope;)V

    goto/16 :goto_3b

    :cond_e9
    sget-object v0, Lch/qos/logback/core/joran/action/PropertyAction;->INVALID_ATTRIBUTES:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lch/qos/logback/core/joran/action/PropertyAction;->addError(Ljava/lang/String;)V

    goto/16 :goto_3b
.end method

.method checkFileAttributeSanity(Lorg/xml/sax/Attributes;)Z
    .registers 6

    const-string v0, "file"

    invoke-interface {p1, v0}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "name"

    invoke-interface {p1, v1}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "value"

    invoke-interface {p1, v2}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "resource"

    invoke-interface {p1, v3}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0}, Lch/qos/logback/core/util/OptionHelper;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_32

    invoke-static {v1}, Lch/qos/logback/core/util/OptionHelper;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_32

    invoke-static {v2}, Lch/qos/logback/core/util/OptionHelper;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_32

    invoke-static {v3}, Lch/qos/logback/core/util/OptionHelper;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_32

    const/4 v0, 0x1

    :goto_31
    return v0

    :cond_32
    const/4 v0, 0x0

    goto :goto_31
.end method

.method checkResourceAttributeSanity(Lorg/xml/sax/Attributes;)Z
    .registers 6

    const-string v0, "file"

    invoke-interface {p1, v0}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "name"

    invoke-interface {p1, v1}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "value"

    invoke-interface {p1, v2}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "resource"

    invoke-interface {p1, v3}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lch/qos/logback/core/util/OptionHelper;->isEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_32

    invoke-static {v1}, Lch/qos/logback/core/util/OptionHelper;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_32

    invoke-static {v2}, Lch/qos/logback/core/util/OptionHelper;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_32

    invoke-static {v0}, Lch/qos/logback/core/util/OptionHelper;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_32

    const/4 v0, 0x1

    :goto_31
    return v0

    :cond_32
    const/4 v0, 0x0

    goto :goto_31
.end method

.method checkValueNameAttributesSanity(Lorg/xml/sax/Attributes;)Z
    .registers 6

    const-string v0, "file"

    invoke-interface {p1, v0}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "name"

    invoke-interface {p1, v1}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "value"

    invoke-interface {p1, v2}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "resource"

    invoke-interface {p1, v3}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1}, Lch/qos/logback/core/util/OptionHelper;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_32

    invoke-static {v2}, Lch/qos/logback/core/util/OptionHelper;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_32

    invoke-static {v0}, Lch/qos/logback/core/util/OptionHelper;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_32

    invoke-static {v3}, Lch/qos/logback/core/util/OptionHelper;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_32

    const/4 v0, 0x1

    :goto_31
    return v0

    :cond_32
    const/4 v0, 0x0

    goto :goto_31
.end method

.method public end(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/lang/String;)V
    .registers 3

    return-void
.end method

.method public finish(Lch/qos/logback/core/joran/spi/InterpretationContext;)V
    .registers 2

    return-void
.end method

.method loadAndSetProperties(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/io/InputStream;Lch/qos/logback/core/joran/action/ActionUtil$Scope;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Ljava/util/Properties;

    invoke-direct {v0}, Ljava/util/Properties;-><init>()V

    invoke-virtual {v0, p2}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    invoke-virtual {p2}, Ljava/io/InputStream;->close()V

    invoke-static {p1, v0, p3}, Lch/qos/logback/core/joran/action/ActionUtil;->setProperties(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/util/Properties;Lch/qos/logback/core/joran/action/ActionUtil$Scope;)V

    return-void
.end method
