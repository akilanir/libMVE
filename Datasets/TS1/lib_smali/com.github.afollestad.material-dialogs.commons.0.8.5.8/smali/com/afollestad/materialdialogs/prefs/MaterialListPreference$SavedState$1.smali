.class final Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$SavedState$1;
.super Ljava/lang/Object;
.source "MaterialListPreference.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$SavedState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator",
        "<",
        "Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$SavedState;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 210
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$SavedState;
    .registers 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 212
    new-instance v0, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$SavedState;

    invoke-direct {v0, p1}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$SavedState;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Landroid/os/Parcel;

    .prologue
    .line 210
    invoke-virtual {p0, p1}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$SavedState$1;->createFromParcel(Landroid/os/Parcel;)Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$SavedState;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$SavedState;
    .registers 3
    .param p1, "size"    # I

    .prologue
    .line 216
    new-array v0, p1, [Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$SavedState;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    .line 210
    invoke-virtual {p0, p1}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$SavedState$1;->newArray(I)[Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$SavedState;

    move-result-object v0

    return-object v0
.end method
