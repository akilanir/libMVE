.class public Lorg/apache/harmony/beans/Argument;
.super Ljava/lang/Object;
.source "Argument.java"


# instance fields
.field private interfaces:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private type:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private value:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Class;Ljava/lang/Object;)V
    .registers 4
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .prologue
    .line 36
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p1, p0, Lorg/apache/harmony/beans/Argument;->type:Ljava/lang/Class;

    .line 38
    iput-object p2, p0, Lorg/apache/harmony/beans/Argument;->value:Ljava/lang/Object;

    .line 39
    invoke-virtual {p1}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/harmony/beans/Argument;->interfaces:[Ljava/lang/Class;

    .line 40
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .registers 3
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lorg/apache/harmony/beans/Argument;->value:Ljava/lang/Object;

    .line 30
    iget-object v0, p0, Lorg/apache/harmony/beans/Argument;->value:Ljava/lang/Object;

    if-eqz v0, :cond_17

    .line 31
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/harmony/beans/Argument;->type:Ljava/lang/Class;

    .line 32
    iget-object v0, p0, Lorg/apache/harmony/beans/Argument;->type:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/harmony/beans/Argument;->interfaces:[Ljava/lang/Class;

    .line 34
    :cond_17
    return-void
.end method


# virtual methods
.method public getInterfaces()[Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 51
    iget-object v0, p0, Lorg/apache/harmony/beans/Argument;->interfaces:[Ljava/lang/Class;

    return-object v0
.end method

.method public getType()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 43
    iget-object v0, p0, Lorg/apache/harmony/beans/Argument;->type:Ljava/lang/Class;

    return-object v0
.end method

.method public getValue()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 47
    iget-object v0, p0, Lorg/apache/harmony/beans/Argument;->value:Ljava/lang/Object;

    return-object v0
.end method

.method public setInterfaces([Ljava/lang/Class;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 60
    .local p1, "interfaces":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    iput-object p1, p0, Lorg/apache/harmony/beans/Argument;->interfaces:[Ljava/lang/Class;

    .line 61
    return-void
.end method

.method public setType(Ljava/lang/Class;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 55
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iput-object p1, p0, Lorg/apache/harmony/beans/Argument;->type:Ljava/lang/Class;

    .line 56
    invoke-virtual {p1}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/harmony/beans/Argument;->interfaces:[Ljava/lang/Class;

    .line 57
    return-void
.end method
