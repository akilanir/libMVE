.class public Lch/qos/logback/classic/util/CopyOnInheritThreadLocal;
.super Ljava/lang/InheritableThreadLocal;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/InheritableThreadLocal",
        "<",
        "Ljava/util/HashMap",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        ">;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/InheritableThreadLocal;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic childValue(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    check-cast p1, Ljava/util/HashMap;

    invoke-virtual {p0, p1}, Lch/qos/logback/classic/util/CopyOnInheritThreadLocal;->childValue(Ljava/util/HashMap;)Ljava/util/HashMap;

    move-result-object v0

    return-object v0
.end method

.method protected childValue(Ljava/util/HashMap;)Ljava/util/HashMap;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    if-nez p1, :cond_4

    const/4 v0, 0x0

    :goto_3
    return-object v0

    :cond_4
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    goto :goto_3
.end method
