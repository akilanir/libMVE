.class Lorg/dmfs/android/view/ViewPager$SavedState$1;
.super Ljava/lang/Object;
.source "ViewPager.java"

# interfaces
.implements Landroid/support/v4/os/ParcelableCompatCreatorCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/android/view/ViewPager$SavedState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/support/v4/os/ParcelableCompatCreatorCallbacks",
        "<",
        "Lorg/dmfs/android/view/ViewPager$SavedState;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 1244
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public bridge synthetic createFromParcel(Landroid/os/Parcel;Ljava/lang/ClassLoader;)Ljava/lang/Object;
    .registers 4

    .prologue
    .line 1
    invoke-virtual {p0, p1, p2}, Lorg/dmfs/android/view/ViewPager$SavedState$1;->createFromParcel(Landroid/os/Parcel;Ljava/lang/ClassLoader;)Lorg/dmfs/android/view/ViewPager$SavedState;

    move-result-object v0

    return-object v0
.end method

.method public createFromParcel(Landroid/os/Parcel;Ljava/lang/ClassLoader;)Lorg/dmfs/android/view/ViewPager$SavedState;
    .registers 4
    .param p1, "in"    # Landroid/os/Parcel;
    .param p2, "loader"    # Ljava/lang/ClassLoader;

    .prologue
    .line 1247
    new-instance v0, Lorg/dmfs/android/view/ViewPager$SavedState;

    invoke-direct {v0, p1, p2}, Lorg/dmfs/android/view/ViewPager$SavedState;-><init>(Landroid/os/Parcel;Ljava/lang/ClassLoader;)V

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .registers 3

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lorg/dmfs/android/view/ViewPager$SavedState$1;->newArray(I)[Lorg/dmfs/android/view/ViewPager$SavedState;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lorg/dmfs/android/view/ViewPager$SavedState;
    .registers 3
    .param p1, "size"    # I

    .prologue
    .line 1251
    new-array v0, p1, [Lorg/dmfs/android/view/ViewPager$SavedState;

    return-object v0
.end method
