.class public abstract Lch/qos/logback/core/pattern/Converter;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field next:Lch/qos/logback/core/pattern/Converter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lch/qos/logback/core/pattern/Converter",
            "<TE;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract convert(Ljava/lang/Object;)Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)",
            "Ljava/lang/String;"
        }
    .end annotation
.end method

.method public final getNext()Lch/qos/logback/core/pattern/Converter;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lch/qos/logback/core/pattern/Converter",
            "<TE;>;"
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/pattern/Converter;->next:Lch/qos/logback/core/pattern/Converter;

    return-object v0
.end method

.method public final setNext(Lch/qos/logback/core/pattern/Converter;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lch/qos/logback/core/pattern/Converter",
            "<TE;>;)V"
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/pattern/Converter;->next:Lch/qos/logback/core/pattern/Converter;

    if-eqz v0, :cond_c

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Next converter has been already set"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_c
    iput-object p1, p0, Lch/qos/logback/core/pattern/Converter;->next:Lch/qos/logback/core/pattern/Converter;

    return-void
.end method

.method public write(Ljava/lang/StringBuilder;Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "TE;)V"
        }
    .end annotation

    invoke-virtual {p0, p2}, Lch/qos/logback/core/pattern/Converter;->convert(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method
