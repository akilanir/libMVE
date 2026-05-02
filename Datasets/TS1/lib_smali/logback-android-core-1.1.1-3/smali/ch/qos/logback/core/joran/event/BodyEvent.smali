.class public Lch/qos/logback/core/joran/event/BodyEvent;
.super Lch/qos/logback/core/joran/event/SaxEvent;


# instance fields
.field private text:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Lorg/xml/sax/Locator;)V
    .registers 4

    const/4 v0, 0x0

    invoke-direct {p0, v0, v0, v0, p2}, Lch/qos/logback/core/joran/event/SaxEvent;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Locator;)V

    iput-object p1, p0, Lch/qos/logback/core/joran/event/BodyEvent;->text:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public append(Ljava/lang/String;)V
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lch/qos/logback/core/joran/event/BodyEvent;->text:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/core/joran/event/BodyEvent;->text:Ljava/lang/String;

    return-void
.end method

.method public getText()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/joran/event/BodyEvent;->text:Ljava/lang/String;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lch/qos/logback/core/joran/event/BodyEvent;->text:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    :goto_a
    return-object v0

    :cond_b
    iget-object v0, p0, Lch/qos/logback/core/joran/event/BodyEvent;->text:Ljava/lang/String;

    goto :goto_a
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "BodyEvent("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lch/qos/logback/core/joran/event/BodyEvent;->getText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/core/joran/event/BodyEvent;->locator:Lorg/xml/sax/Locator;

    invoke-interface {v1}, Lorg/xml/sax/Locator;->getLineNumber()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/core/joran/event/BodyEvent;->locator:Lorg/xml/sax/Locator;

    invoke-interface {v1}, Lorg/xml/sax/Locator;->getColumnNumber()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
