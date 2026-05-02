.class public Lorg/mozilla/javascript/ast/XmlPropRef;
.super Lorg/mozilla/javascript/ast/XmlRef;
.source "XmlPropRef.java"


# instance fields
.field private propName:Lorg/mozilla/javascript/ast/Name;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 36
    invoke-direct {p0}, Lorg/mozilla/javascript/ast/XmlRef;-><init>()V

    .line 33
    const/16 v0, 0x4f

    iput v0, p0, Lorg/mozilla/javascript/ast/XmlPropRef;->type:I

    .line 37
    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "pos"    # I

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/ast/XmlRef;-><init>(I)V

    .line 33
    const/16 v0, 0x4f

    iput v0, p0, Lorg/mozilla/javascript/ast/XmlPropRef;->type:I

    .line 41
    return-void
.end method

.method public constructor <init>(II)V
    .registers 4
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .prologue
    .line 44
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/ast/XmlRef;-><init>(II)V

    .line 33
    const/16 v0, 0x4f

    iput v0, p0, Lorg/mozilla/javascript/ast/XmlPropRef;->type:I

    .line 45
    return-void
.end method


# virtual methods
.method public getPropName()Lorg/mozilla/javascript/ast/Name;
    .registers 2

    .prologue
    .line 51
    iget-object v0, p0, Lorg/mozilla/javascript/ast/XmlPropRef;->propName:Lorg/mozilla/javascript/ast/Name;

    return-object v0
.end method

.method public setPropName(Lorg/mozilla/javascript/ast/Name;)V
    .registers 2
    .param p1, "propName"    # Lorg/mozilla/javascript/ast/Name;

    .prologue
    .line 59
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/XmlPropRef;->assertNotNull(Ljava/lang/Object;)V

    .line 60
    iput-object p1, p0, Lorg/mozilla/javascript/ast/XmlPropRef;->propName:Lorg/mozilla/javascript/ast/Name;

    .line 61
    invoke-virtual {p1, p0}, Lorg/mozilla/javascript/ast/Name;->setParent(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 62
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .registers 5
    .param p1, "depth"    # I

    .prologue
    const/4 v2, 0x0

    .line 66
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 67
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/XmlPropRef;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/XmlPropRef;->isAttributeAccess()Z

    move-result v1

    if-eqz v1, :cond_18

    .line 69
    const-string v1, "@"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    :cond_18
    iget-object v1, p0, Lorg/mozilla/javascript/ast/XmlPropRef;->namespace:Lorg/mozilla/javascript/ast/Name;

    if-eqz v1, :cond_2a

    .line 72
    iget-object v1, p0, Lorg/mozilla/javascript/ast/XmlPropRef;->namespace:Lorg/mozilla/javascript/ast/Name;

    invoke-virtual {v1, v2}, Lorg/mozilla/javascript/ast/Name;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    const-string v1, "::"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    :cond_2a
    iget-object v1, p0, Lorg/mozilla/javascript/ast/XmlPropRef;->propName:Lorg/mozilla/javascript/ast/Name;

    invoke-virtual {v1, v2}, Lorg/mozilla/javascript/ast/Name;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V
    .registers 3
    .param p1, "v"    # Lorg/mozilla/javascript/ast/NodeVisitor;

    .prologue
    .line 84
    invoke-interface {p1, p0}, Lorg/mozilla/javascript/ast/NodeVisitor;->visit(Lorg/mozilla/javascript/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 85
    iget-object v0, p0, Lorg/mozilla/javascript/ast/XmlPropRef;->namespace:Lorg/mozilla/javascript/ast/Name;

    if-eqz v0, :cond_f

    .line 86
    iget-object v0, p0, Lorg/mozilla/javascript/ast/XmlPropRef;->namespace:Lorg/mozilla/javascript/ast/Name;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/ast/Name;->visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V

    .line 88
    :cond_f
    iget-object v0, p0, Lorg/mozilla/javascript/ast/XmlPropRef;->propName:Lorg/mozilla/javascript/ast/Name;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/ast/Name;->visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V

    .line 90
    :cond_14
    return-void
.end method
