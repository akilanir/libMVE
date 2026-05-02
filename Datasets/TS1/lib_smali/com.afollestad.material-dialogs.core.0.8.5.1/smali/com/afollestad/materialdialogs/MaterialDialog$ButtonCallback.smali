.class public abstract Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;
.super Ljava/lang/Object;
.source "MaterialDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/afollestad/materialdialogs/MaterialDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "ButtonCallback"
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 1893
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1894
    return-void
.end method


# virtual methods
.method protected final clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 1898
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 1903
    invoke-super {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method protected final finalize()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 1908
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 1909
    return-void
.end method

.method public final hashCode()I
    .registers 2

    .prologue
    .line 1913
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public onAny(Lcom/afollestad/materialdialogs/MaterialDialog;)V
    .registers 2
    .param p1, "dialog"    # Lcom/afollestad/materialdialogs/MaterialDialog;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1876
    return-void
.end method

.method public onNegative(Lcom/afollestad/materialdialogs/MaterialDialog;)V
    .registers 2
    .param p1, "dialog"    # Lcom/afollestad/materialdialogs/MaterialDialog;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1884
    return-void
.end method

.method public onNeutral(Lcom/afollestad/materialdialogs/MaterialDialog;)V
    .registers 2
    .param p1, "dialog"    # Lcom/afollestad/materialdialogs/MaterialDialog;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1888
    return-void
.end method

.method public onPositive(Lcom/afollestad/materialdialogs/MaterialDialog;)V
    .registers 2
    .param p1, "dialog"    # Lcom/afollestad/materialdialogs/MaterialDialog;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1880
    return-void
.end method

.method public final toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1918
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
