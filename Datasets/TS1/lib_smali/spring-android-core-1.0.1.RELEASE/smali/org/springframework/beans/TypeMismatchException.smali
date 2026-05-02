.class public Lorg/springframework/beans/TypeMismatchException;
.super Lorg/springframework/beans/PropertyAccessException;
.source "TypeMismatchException.java"


# static fields
.field public static final ERROR_CODE:Ljava/lang/String; = "typeMismatch"

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private requiredType:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private transient value:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/beans/PropertyChangeEvent;Ljava/lang/Class;)V
    .registers 4
    .param p1, "propertyChangeEvent"    # Ljava/beans/PropertyChangeEvent;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/beans/PropertyChangeEvent;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 52
    .local p2, "requiredType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/springframework/beans/TypeMismatchException;-><init>(Ljava/beans/PropertyChangeEvent;Ljava/lang/Class;Ljava/lang/Throwable;)V

    .line 53
    return-void
.end method

.method public constructor <init>(Ljava/beans/PropertyChangeEvent;Ljava/lang/Class;Ljava/lang/Throwable;)V
    .registers 7
    .param p1, "propertyChangeEvent"    # Ljava/beans/PropertyChangeEvent;
    .param p3, "cause"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/beans/PropertyChangeEvent;",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    .prologue
    .line 62
    .local p2, "requiredType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Failed to convert property value of type \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/beans/PropertyChangeEvent;->getNewValue()Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lorg/springframework/util/ClassUtils;->getDescriptiveType(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    if-eqz p2, :cond_77

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " to required type \'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p2}, Lorg/springframework/util/ClassUtils;->getQualifiedName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_3c
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/beans/PropertyChangeEvent;->getPropertyName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_7a

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " for property \'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/beans/PropertyChangeEvent;->getPropertyName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_63
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0, p3}, Lorg/springframework/beans/PropertyAccessException;-><init>(Ljava/beans/PropertyChangeEvent;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 70
    invoke-virtual {p1}, Ljava/beans/PropertyChangeEvent;->getNewValue()Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lorg/springframework/beans/TypeMismatchException;->value:Ljava/lang/Object;

    .line 71
    iput-object p2, p0, Lorg/springframework/beans/TypeMismatchException;->requiredType:Ljava/lang/Class;

    .line 72
    return-void

    .line 62
    :cond_77
    const-string v0, ""

    goto :goto_3c

    :cond_7a
    const-string v0, ""

    goto :goto_63
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Class;)V
    .registers 4
    .param p1, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 80
    .local p2, "requiredType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/springframework/beans/TypeMismatchException;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/Throwable;)V

    .line 81
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/Throwable;)V
    .registers 7
    .param p1, "value"    # Ljava/lang/Object;
    .param p3, "cause"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    .prologue
    .line 90
    .local p2, "requiredType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Failed to convert value of type \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1}, Lorg/springframework/util/ClassUtils;->getDescriptiveType(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    if-eqz p2, :cond_48

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " to required type \'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p2}, Lorg/springframework/util/ClassUtils;->getQualifiedName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_38
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p3}, Lorg/springframework/beans/PropertyAccessException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 93
    iput-object p1, p0, Lorg/springframework/beans/TypeMismatchException;->value:Ljava/lang/Object;

    .line 94
    iput-object p2, p0, Lorg/springframework/beans/TypeMismatchException;->requiredType:Ljava/lang/Class;

    .line 95
    return-void

    .line 90
    :cond_48
    const-string v0, ""

    goto :goto_38
.end method


# virtual methods
.method public getErrorCode()Ljava/lang/String;
    .registers 2

    .prologue
    .line 114
    const-string v0, "typeMismatch"

    return-object v0
.end method

.method public getRequiredType()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 110
    iget-object v0, p0, Lorg/springframework/beans/TypeMismatchException;->requiredType:Ljava/lang/Class;

    return-object v0
.end method

.method public getValue()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 103
    iget-object v0, p0, Lorg/springframework/beans/TypeMismatchException;->value:Ljava/lang/Object;

    return-object v0
.end method
