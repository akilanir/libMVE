.class Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;
.super Ljava/lang/Object;
.source "XmlNode.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/mozilla/javascript/xmlimpl/XmlNode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Namespace"
.end annotation


# static fields
.field static final GLOBAL:Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

.field private static final serialVersionUID:J = 0x38896a74952aade2L


# instance fields
.field private prefix:Ljava/lang/String;

.field private uri:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 597
    const-string v0, ""

    const-string v1, ""

    invoke-static {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->create(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    sput-object v0, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->GLOBAL:Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 602
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 603
    return-void
.end method

.method static synthetic access$000(Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    .prologue
    .line 563
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->prefix:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    .prologue
    .line 563
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->uri:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;Ljava/lang/String;)V
    .registers 2
    .param p0, "x0"    # Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 563
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->setPrefix(Ljava/lang/String;)V

    return-void
.end method

.method static create(Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;
    .registers 3
    .param p0, "uri"    # Ljava/lang/String;

    .prologue
    .line 586
    new-instance v0, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    invoke-direct {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;-><init>()V

    .line 587
    .local v0, "rv":Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;
    iput-object p0, v0, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->uri:Ljava/lang/String;

    .line 590
    if-eqz p0, :cond_f

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_13

    .line 591
    :cond_f
    const-string v1, ""

    iput-object v1, v0, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->prefix:Ljava/lang/String;

    .line 594
    :cond_13
    return-object v0
.end method

.method static create(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;
    .registers 5
    .param p0, "prefix"    # Ljava/lang/String;
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 571
    if-nez p0, :cond_a

    .line 572
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Empty string represents default namespace prefix"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 575
    :cond_a
    if-nez p1, :cond_14

    .line 576
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Namespace may not lack a URI"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 579
    :cond_14
    new-instance v0, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    invoke-direct {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;-><init>()V

    .line 580
    .local v0, "rv":Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;
    iput-object p0, v0, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->prefix:Ljava/lang/String;

    .line 581
    iput-object p1, v0, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->uri:Ljava/lang/String;

    .line 582
    return-object v0
.end method

.method private setPrefix(Ljava/lang/String;)V
    .registers 3
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 634
    if-nez p1, :cond_8

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 635
    :cond_8
    iput-object p1, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->prefix:Ljava/lang/String;

    .line 636
    return-void
.end method


# virtual methods
.method getPrefix()Ljava/lang/String;
    .registers 2

    .prologue
    .line 639
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->prefix:Ljava/lang/String;

    return-object v0
.end method

.method getUri()Ljava/lang/String;
    .registers 2

    .prologue
    .line 643
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->uri:Ljava/lang/String;

    return-object v0
.end method

.method is(Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;)Z
    .registers 4
    .param p1, "other"    # Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    .prologue
    .line 616
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->prefix:Ljava/lang/String;

    if-eqz v0, :cond_1e

    iget-object v0, p1, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->prefix:Ljava/lang/String;

    if-eqz v0, :cond_1e

    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->prefix:Ljava/lang/String;

    iget-object v1, p1, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->prefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->uri:Ljava/lang/String;

    iget-object v1, p1, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->uri:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    const/4 v0, 0x1

    :goto_1d
    return v0

    :cond_1e
    const/4 v0, 0x0

    goto :goto_1d
.end method

.method isDefault()Z
    .registers 3

    .prologue
    .line 624
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->prefix:Ljava/lang/String;

    if-eqz v0, :cond_10

    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->prefix:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method isEmpty()Z
    .registers 3

    .prologue
    .line 620
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->prefix:Ljava/lang/String;

    if-eqz v0, :cond_1a

    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->prefix:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1a

    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->uri:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1a

    const/4 v0, 0x1

    :goto_19
    return v0

    :cond_1a
    const/4 v0, 0x0

    goto :goto_19
.end method

.method isGlobal()Z
    .registers 3

    .prologue
    .line 628
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->uri:Ljava/lang/String;

    if-eqz v0, :cond_10

    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->uri:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method isUnspecifiedPrefix()Z
    .registers 2

    .prologue
    .line 612
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->prefix:Ljava/lang/String;

    if-nez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 607
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->prefix:Ljava/lang/String;

    if-nez v0, :cond_20

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "XmlNode.Namespace ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->uri:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 608
    :goto_1f
    return-object v0

    :cond_20
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "XmlNode.Namespace ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->prefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->uri:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1f
.end method
