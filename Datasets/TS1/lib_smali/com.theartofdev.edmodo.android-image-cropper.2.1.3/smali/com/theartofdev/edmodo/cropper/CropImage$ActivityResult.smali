.class public final Lcom/theartofdev/edmodo/cropper/CropImage$ActivityResult;
.super Ljava/lang/Object;
.source "CropImage.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/theartofdev/edmodo/cropper/CropImage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ActivityResult"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/theartofdev/edmodo/cropper/CropImage$ActivityResult;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mCropPoints:[F

.field private final mCropRect:Landroid/graphics/Rect;

.field private final mError:Ljava/lang/Exception;

.field private final mRotation:I

.field private final mUri:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 643
    new-instance v0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityResult$1;

    invoke-direct {v0}, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityResult$1;-><init>()V

    sput-object v0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityResult;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(Landroid/net/Uri;Ljava/lang/Exception;[FLandroid/graphics/Rect;I)V
    .registers 6
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "error"    # Ljava/lang/Exception;
    .param p3, "cropPoints"    # [F
    .param p4, "cropRect"    # Landroid/graphics/Rect;
    .param p5, "rotation"    # I

    .prologue
    .line 680
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 681
    iput-object p1, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityResult;->mUri:Landroid/net/Uri;

    .line 682
    iput-object p2, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityResult;->mError:Ljava/lang/Exception;

    .line 683
    iput-object p3, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityResult;->mCropPoints:[F

    .line 684
    iput-object p4, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityResult;->mCropRect:Landroid/graphics/Rect;

    .line 685
    iput p5, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityResult;->mRotation:I

    .line 686
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .registers 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 688
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 689
    const-class v0, Landroid/net/Uri;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/net/Uri;

    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityResult;->mUri:Landroid/net/Uri;

    .line 690
    invoke-virtual {p1}, Landroid/os/Parcel;->readSerializable()Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/lang/Exception;

    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityResult;->mError:Ljava/lang/Exception;

    .line 691
    invoke-virtual {p1}, Landroid/os/Parcel;->createFloatArray()[F

    move-result-object v0

    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityResult;->mCropPoints:[F

    .line 692
    const-class v0, Landroid/graphics/Rect;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/graphics/Rect;

    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityResult;->mCropRect:Landroid/graphics/Rect;

    .line 693
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityResult;->mRotation:I

    .line 694
    return-void
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    .prologue
    .line 707
    const/4 v0, 0x0

    return v0
.end method

.method public getCropPoints()[F
    .registers 2

    .prologue
    .line 735
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityResult;->mCropPoints:[F

    return-object v0
.end method

.method public getCropRect()Landroid/graphics/Rect;
    .registers 2

    .prologue
    .line 742
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityResult;->mCropRect:Landroid/graphics/Rect;

    return-object v0
.end method

.method public getError()Ljava/lang/Exception;
    .registers 2

    .prologue
    .line 728
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityResult;->mError:Ljava/lang/Exception;

    return-object v0
.end method

.method public getRotation()I
    .registers 2

    .prologue
    .line 749
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityResult;->mRotation:I

    return v0
.end method

.method public getUri()Landroid/net/Uri;
    .registers 2

    .prologue
    .line 721
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityResult;->mUri:Landroid/net/Uri;

    return-object v0
.end method

.method public isSuccessful()Z
    .registers 2

    .prologue
    .line 714
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityResult;->mError:Ljava/lang/Exception;

    if-nez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 698
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityResult;->mUri:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 699
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityResult;->mError:Ljava/lang/Exception;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeSerializable(Ljava/io/Serializable;)V

    .line 700
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityResult;->mCropPoints:[F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloatArray([F)V

    .line 701
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityResult;->mCropRect:Landroid/graphics/Rect;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 702
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityResult;->mRotation:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 703
    return-void
.end method
