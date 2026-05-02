.class Lorg/junit/internal/runners/rules/ValidationError;
.super Ljava/lang/Exception;
.source "ValidationError.java"


# direct methods
.method public constructor <init>(Lorg/junit/runners/model/FrameworkMember;Ljava/lang/Class;Ljava/lang/String;)V
    .registers 8
    .param p3, "suffix"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/runners/model/FrameworkMember",
            "<*>;",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/annotation/Annotation;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 9
    .local p1, "member":Lorg/junit/runners/model/FrameworkMember;, "Lorg/junit/runners/model/FrameworkMember<*>;"
    .local p2, "annotation":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;"
    const-string v0, "The @%s \'%s\' %s"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-virtual {p1}, Lorg/junit/runners/model/FrameworkMember;->getName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    aput-object p3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 10
    return-void
.end method
