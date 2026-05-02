.class final Lezvcard/io/scribe/VCardPropertyScribe$2;
.super Ljava/lang/Object;
.source "VCardPropertyScribe.java"

# interfaces
.implements Lezvcard/util/StringUtils$JoinCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lezvcard/io/scribe/VCardPropertyScribe;->structured([Ljava/lang/Object;)Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lezvcard/util/StringUtils$JoinCallback",
        "<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 890
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handle(Ljava/lang/StringBuilder;Ljava/lang/Object;)V
    .registers 5
    .param p1, "sb"    # Ljava/lang/StringBuilder;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 892
    if-nez p2, :cond_3

    .line 903
    :goto_2
    return-void

    .line 896
    :cond_3
    instance-of v1, p2, Ljava/util/Collection;

    if-eqz v1, :cond_12

    move-object v0, p2

    .line 897
    check-cast v0, Ljava/util/Collection;

    .line 898
    .local v0, "list":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    invoke-static {v0}, Lezvcard/io/scribe/VCardPropertyScribe;->list(Ljava/util/Collection;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 902
    .end local v0    # "list":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    :cond_12
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lezvcard/io/scribe/VCardPropertyScribe;->escape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2
.end method
