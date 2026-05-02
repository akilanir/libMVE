.class final Lyuku/ambilwarna/widget/AmbilWarnaPreference$SavedState$1;
.super Ljava/lang/Object;
.source "AmbilWarnaPreference.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lyuku/ambilwarna/widget/AmbilWarnaPreference$SavedState;
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
        "Lyuku/ambilwarna/widget/AmbilWarnaPreference$SavedState;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 124
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Landroid/os/Parcel;

    .prologue
    .line 124
    invoke-virtual {p0, p1}, Lyuku/ambilwarna/widget/AmbilWarnaPreference$SavedState$1;->createFromParcel(Landroid/os/Parcel;)Lyuku/ambilwarna/widget/AmbilWarnaPreference$SavedState;

    move-result-object v0

    return-object v0
.end method

.method public createFromParcel(Landroid/os/Parcel;)Lyuku/ambilwarna/widget/AmbilWarnaPreference$SavedState;
    .registers 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 126
    new-instance v0, Lyuku/ambilwarna/widget/AmbilWarnaPreference$SavedState;

    invoke-direct {v0, p1}, Lyuku/ambilwarna/widget/AmbilWarnaPreference$SavedState;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    .line 124
    invoke-virtual {p0, p1}, Lyuku/ambilwarna/widget/AmbilWarnaPreference$SavedState$1;->newArray(I)[Lyuku/ambilwarna/widget/AmbilWarnaPreference$SavedState;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lyuku/ambilwarna/widget/AmbilWarnaPreference$SavedState;
    .registers 3
    .param p1, "size"    # I

    .prologue
    .line 130
    new-array v0, p1, [Lyuku/ambilwarna/widget/AmbilWarnaPreference$SavedState;

    return-object v0
.end method
