.class public Lezvcard/property/SimpleProperty;
.super Lezvcard/property/VCardProperty;
.source "SimpleProperty.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lezvcard/property/VCardProperty;"
    }
.end annotation


# instance fields
.field protected value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 50
    .local p0, "this":Lezvcard/property/SimpleProperty;, "Lezvcard/property/SimpleProperty<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    invoke-direct {p0}, Lezvcard/property/VCardProperty;-><init>()V

    .line 51
    iput-object p1, p0, Lezvcard/property/SimpleProperty;->value:Ljava/lang/Object;

    .line 52
    return-void
.end method


# virtual methods
.method protected _validate(Ljava/util/List;Lezvcard/VCardVersion;Lezvcard/VCard;)V
    .registers 7
    .param p2, "version"    # Lezvcard/VCardVersion;
    .param p3, "vcard"    # Lezvcard/VCard;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lezvcard/Warning;",
            ">;",
            "Lezvcard/VCardVersion;",
            "Lezvcard/VCard;",
            ")V"
        }
    .end annotation

    .prologue
    .line 72
    .local p0, "this":Lezvcard/property/SimpleProperty;, "Lezvcard/property/SimpleProperty<TT;>;"
    .local p1, "warnings":Ljava/util/List;, "Ljava/util/List<Lezvcard/Warning;>;"
    iget-object v0, p0, Lezvcard/property/SimpleProperty;->value:Ljava/lang/Object;

    if-nez v0, :cond_11

    .line 73
    new-instance v0, Lezvcard/Warning;

    const/16 v1, 0x8

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-direct {v0, v1, v2}, Lezvcard/Warning;-><init>(I[Ljava/lang/Object;)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 75
    :cond_11
    return-void
.end method

.method public getValue()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 59
    .local p0, "this":Lezvcard/property/SimpleProperty;, "Lezvcard/property/SimpleProperty<TT;>;"
    iget-object v0, p0, Lezvcard/property/SimpleProperty;->value:Ljava/lang/Object;

    return-object v0
.end method

.method public setValue(Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 67
    .local p0, "this":Lezvcard/property/SimpleProperty;, "Lezvcard/property/SimpleProperty<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    iput-object p1, p0, Lezvcard/property/SimpleProperty;->value:Ljava/lang/Object;

    .line 68
    return-void
.end method
