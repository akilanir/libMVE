.class public abstract Lorg/apache/commons/codec/language/bm/Languages$LanguageSet;
.super Ljava/lang/Object;
.source "Languages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/codec/language/bm/Languages;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "LanguageSet"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static from(Ljava/util/Set;)Lorg/apache/commons/codec/language/bm/Languages$LanguageSet;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lorg/apache/commons/codec/language/bm/Languages$LanguageSet;"
        }
    .end annotation

    .prologue
    .line 66
    .local p0, "langs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {p0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_9

    sget-object v0, Lorg/apache/commons/codec/language/bm/Languages;->NO_LANGUAGES:Lorg/apache/commons/codec/language/bm/Languages$LanguageSet;

    :goto_8
    return-object v0

    :cond_9
    new-instance v0, Lorg/apache/commons/codec/language/bm/Languages$SomeLanguages;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/apache/commons/codec/language/bm/Languages$SomeLanguages;-><init>(Ljava/util/Set;Lorg/apache/commons/codec/language/bm/Languages$1;)V

    goto :goto_8
.end method


# virtual methods
.method public abstract contains(Ljava/lang/String;)Z
.end method

.method public abstract getAny()Ljava/lang/String;
.end method

.method public abstract isEmpty()Z
.end method

.method public abstract isSingleton()Z
.end method

.method public abstract restrictTo(Lorg/apache/commons/codec/language/bm/Languages$LanguageSet;)Lorg/apache/commons/codec/language/bm/Languages$LanguageSet;
.end method
