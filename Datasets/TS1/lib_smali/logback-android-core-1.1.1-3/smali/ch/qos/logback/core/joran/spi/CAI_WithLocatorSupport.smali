.class Lch/qos/logback/core/joran/spi/CAI_WithLocatorSupport;
.super Lch/qos/logback/core/spi/ContextAwareImpl;


# direct methods
.method constructor <init>(Lch/qos/logback/core/Context;Lch/qos/logback/core/joran/spi/Interpreter;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lch/qos/logback/core/spi/ContextAwareImpl;-><init>(Lch/qos/logback/core/Context;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method protected getOrigin()Ljava/lang/Object;
    .registers 4

    invoke-super {p0}, Lch/qos/logback/core/spi/ContextAwareImpl;->getOrigin()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/joran/spi/Interpreter;

    iget-object v0, v0, Lch/qos/logback/core/joran/spi/Interpreter;->locator:Lorg/xml/sax/Locator;

    if-eqz v0, :cond_3a

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-class v2, Lch/qos/logback/core/joran/spi/Interpreter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "@"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v0}, Lorg/xml/sax/Locator;->getLineNumber()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v0}, Lorg/xml/sax/Locator;->getColumnNumber()I

    move-result v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_39
    return-object v0

    :cond_3a
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-class v1, Lch/qos/logback/core/joran/spi/Interpreter;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "@NA:NA"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_39
.end method
