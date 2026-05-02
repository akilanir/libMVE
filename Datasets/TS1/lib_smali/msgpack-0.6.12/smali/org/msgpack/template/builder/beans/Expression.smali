.class public Lorg/msgpack/template/builder/beans/Expression;
.super Lorg/msgpack/template/builder/beans/Statement;
.source "Expression.java"


# instance fields
.field value:Ljava/lang/Object;

.field valueIsDefined:Z


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 6
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "target"    # Ljava/lang/Object;
    .param p3, "methodName"    # Ljava/lang/String;
    .param p4, "arguments"    # [Ljava/lang/Object;

    .prologue
    .line 30
    invoke-direct {p0, p2, p3, p4}, Lorg/msgpack/template/builder/beans/Statement;-><init>(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 24
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/msgpack/template/builder/beans/Expression;->valueIsDefined:Z

    .line 31
    iput-object p1, p0, Lorg/msgpack/template/builder/beans/Expression;->value:Ljava/lang/Object;

    .line 32
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/msgpack/template/builder/beans/Expression;->valueIsDefined:Z

    .line 33
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 6
    .param p1, "target"    # Ljava/lang/Object;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "arguments"    # [Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 36
    invoke-direct {p0, p1, p2, p3}, Lorg/msgpack/template/builder/beans/Statement;-><init>(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 24
    iput-boolean v1, p0, Lorg/msgpack/template/builder/beans/Expression;->valueIsDefined:Z

    .line 37
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/msgpack/template/builder/beans/Expression;->value:Ljava/lang/Object;

    .line 38
    iput-boolean v1, p0, Lorg/msgpack/template/builder/beans/Expression;->valueIsDefined:Z

    .line 39
    return-void
.end method


# virtual methods
.method public getValue()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 66
    iget-boolean v0, p0, Lorg/msgpack/template/builder/beans/Expression;->valueIsDefined:Z

    if-nez v0, :cond_d

    .line 67
    invoke-virtual {p0}, Lorg/msgpack/template/builder/beans/Expression;->invokeMethod()Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lorg/msgpack/template/builder/beans/Expression;->value:Ljava/lang/Object;

    .line 68
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/msgpack/template/builder/beans/Expression;->valueIsDefined:Z

    .line 70
    :cond_d
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/Expression;->value:Ljava/lang/Object;

    return-object v0
.end method

.method public setValue(Ljava/lang/Object;)V
    .registers 3
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 61
    iput-object p1, p0, Lorg/msgpack/template/builder/beans/Expression;->value:Ljava/lang/Object;

    .line 62
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/msgpack/template/builder/beans/Expression;->valueIsDefined:Z

    .line 63
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 43
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 44
    .local v1, "sb":Ljava/lang/StringBuilder;
    iget-boolean v2, p0, Lorg/msgpack/template/builder/beans/Expression;->valueIsDefined:Z

    if-nez v2, :cond_1f

    .line 45
    const-string v2, "<unbound>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    :goto_e
    const/16 v2, 0x3d

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 56
    invoke-super {p0}, Lorg/msgpack/template/builder/beans/Statement;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 47
    :cond_1f
    iget-object v2, p0, Lorg/msgpack/template/builder/beans/Expression;->value:Ljava/lang/Object;

    if-nez v2, :cond_29

    .line 48
    const-string v2, "null"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_e

    .line 50
    :cond_29
    iget-object v2, p0, Lorg/msgpack/template/builder/beans/Expression;->value:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 51
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v2, Ljava/lang/String;

    if-ne v0, v2, :cond_39

    const-string v2, "\"\""

    :goto_35
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_e

    :cond_39
    invoke-static {v0}, Lorg/apache/harmony/beans/BeansUtils;->idOfClass(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v2

    goto :goto_35
.end method
