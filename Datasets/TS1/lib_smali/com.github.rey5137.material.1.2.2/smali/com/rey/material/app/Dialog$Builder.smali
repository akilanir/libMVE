.class public Lcom/rey/material/app/Dialog$Builder;
.super Ljava/lang/Object;
.source "Dialog.java"

# interfaces
.implements Lcom/rey/material/app/DialogFragment$Builder;
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/rey/material/app/Dialog$Builder;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field protected mContentViewId:I

.field protected mDialog:Lcom/rey/material/app/Dialog;

.field protected mNegative:Ljava/lang/CharSequence;

.field protected mNeutral:Ljava/lang/CharSequence;

.field protected mPositive:Ljava/lang/CharSequence;

.field protected mStyleId:I

.field protected mTitle:Ljava/lang/CharSequence;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 1569
    new-instance v0, Lcom/rey/material/app/Dialog$Builder$1;

    invoke-direct {v0}, Lcom/rey/material/app/Dialog$Builder$1;-><init>()V

    sput-object v0, Lcom/rey/material/app/Dialog$Builder;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 1433
    sget v0, Lcom/rey/material/R$style;->Material_App_Dialog_Light:I

    invoke-direct {p0, v0}, Lcom/rey/material/app/Dialog$Builder;-><init>(I)V

    .line 1434
    return-void
.end method

.method public constructor <init>(I)V
    .registers 2
    .param p1, "styleId"    # I

    .prologue
    .line 1436
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1437
    iput p1, p0, Lcom/rey/material/app/Dialog$Builder;->mStyleId:I

    .line 1438
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .registers 4
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    const/4 v1, 0x0

    .line 1530
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1531
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/rey/material/app/Dialog$Builder;->mStyleId:I

    .line 1532
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/rey/material/app/Dialog$Builder;->mContentViewId:I

    .line 1533
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    iput-object v0, p0, Lcom/rey/material/app/Dialog$Builder;->mTitle:Ljava/lang/CharSequence;

    .line 1534
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    iput-object v0, p0, Lcom/rey/material/app/Dialog$Builder;->mPositive:Ljava/lang/CharSequence;

    .line 1535
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    iput-object v0, p0, Lcom/rey/material/app/Dialog$Builder;->mNegative:Ljava/lang/CharSequence;

    .line 1536
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    iput-object v0, p0, Lcom/rey/material/app/Dialog$Builder;->mNeutral:Ljava/lang/CharSequence;

    .line 1538
    invoke-virtual {p0, p1}, Lcom/rey/material/app/Dialog$Builder;->onReadFromParcel(Landroid/os/Parcel;)V

    .line 1539
    return-void
.end method


# virtual methods
.method public build(Landroid/content/Context;)Lcom/rey/material/app/Dialog;
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 1497
    iget v0, p0, Lcom/rey/material/app/Dialog$Builder;->mStyleId:I

    invoke-virtual {p0, p1, v0}, Lcom/rey/material/app/Dialog$Builder;->onBuild(Landroid/content/Context;I)Lcom/rey/material/app/Dialog;

    move-result-object v0

    iput-object v0, p0, Lcom/rey/material/app/Dialog$Builder;->mDialog:Lcom/rey/material/app/Dialog;

    .line 1499
    iget-object v0, p0, Lcom/rey/material/app/Dialog$Builder;->mDialog:Lcom/rey/material/app/Dialog;

    iget-object v1, p0, Lcom/rey/material/app/Dialog$Builder;->mTitle:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Lcom/rey/material/app/Dialog;->title(Ljava/lang/CharSequence;)Lcom/rey/material/app/Dialog;

    move-result-object v0

    iget-object v1, p0, Lcom/rey/material/app/Dialog$Builder;->mPositive:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Lcom/rey/material/app/Dialog;->positiveAction(Ljava/lang/CharSequence;)Lcom/rey/material/app/Dialog;

    move-result-object v0

    iget-object v1, p0, Lcom/rey/material/app/Dialog$Builder;->mNegative:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Lcom/rey/material/app/Dialog;->negativeAction(Ljava/lang/CharSequence;)Lcom/rey/material/app/Dialog;

    move-result-object v0

    iget-object v1, p0, Lcom/rey/material/app/Dialog$Builder;->mNeutral:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Lcom/rey/material/app/Dialog;->neutralAction(Ljava/lang/CharSequence;)Lcom/rey/material/app/Dialog;

    .line 1504
    iget v0, p0, Lcom/rey/material/app/Dialog$Builder;->mContentViewId:I

    if-eqz v0, :cond_2c

    .line 1505
    iget-object v0, p0, Lcom/rey/material/app/Dialog$Builder;->mDialog:Lcom/rey/material/app/Dialog;

    iget v1, p0, Lcom/rey/material/app/Dialog$Builder;->mContentViewId:I

    invoke-virtual {v0, v1}, Lcom/rey/material/app/Dialog;->contentView(I)Lcom/rey/material/app/Dialog;

    .line 1507
    :cond_2c
    iget-object v0, p0, Lcom/rey/material/app/Dialog$Builder;->mDialog:Lcom/rey/material/app/Dialog;

    invoke-virtual {p0, v0}, Lcom/rey/material/app/Dialog$Builder;->onBuildDone(Lcom/rey/material/app/Dialog;)V

    .line 1509
    iget-object v0, p0, Lcom/rey/material/app/Dialog$Builder;->mDialog:Lcom/rey/material/app/Dialog;

    return-object v0
.end method

.method public contentView(I)Lcom/rey/material/app/Dialog$Builder;
    .registers 2
    .param p1, "layoutId"    # I

    .prologue
    .line 1446
    iput p1, p0, Lcom/rey/material/app/Dialog$Builder;->mContentViewId:I

    .line 1447
    return-object p0
.end method

.method public describeContents()I
    .registers 2

    .prologue
    .line 1566
    const/4 v0, 0x0

    return v0
.end method

.method public getDialog()Lcom/rey/material/app/Dialog;
    .registers 2

    .prologue
    .line 1471
    iget-object v0, p0, Lcom/rey/material/app/Dialog$Builder;->mDialog:Lcom/rey/material/app/Dialog;

    return-object v0
.end method

.method public negativeAction(Ljava/lang/CharSequence;)Lcom/rey/material/app/Dialog$Builder;
    .registers 2
    .param p1, "action"    # Ljava/lang/CharSequence;

    .prologue
    .line 1461
    iput-object p1, p0, Lcom/rey/material/app/Dialog$Builder;->mNegative:Ljava/lang/CharSequence;

    .line 1462
    return-object p0
.end method

.method public neutralAction(Ljava/lang/CharSequence;)Lcom/rey/material/app/Dialog$Builder;
    .registers 2
    .param p1, "action"    # Ljava/lang/CharSequence;

    .prologue
    .line 1466
    iput-object p1, p0, Lcom/rey/material/app/Dialog$Builder;->mNeutral:Ljava/lang/CharSequence;

    .line 1467
    return-object p0
.end method

.method protected onBuild(Landroid/content/Context;I)Lcom/rey/material/app/Dialog;
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "styleId"    # I

    .prologue
    .line 1521
    new-instance v0, Lcom/rey/material/app/Dialog;

    invoke-direct {v0, p1, p2}, Lcom/rey/material/app/Dialog;-><init>(Landroid/content/Context;I)V

    return-object v0
.end method

.method protected onBuildDone(Lcom/rey/material/app/Dialog;)V
    .registers 2
    .param p1, "dialog"    # Lcom/rey/material/app/Dialog;

    .prologue
    .line 1528
    return-void
.end method

.method public onCancel(Landroid/content/DialogInterface;)V
    .registers 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 1490
    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .registers 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 1493
    return-void
.end method

.method public onNegativeActionClicked(Lcom/rey/material/app/DialogFragment;)V
    .registers 2
    .param p1, "fragment"    # Lcom/rey/material/app/DialogFragment;

    .prologue
    .line 1481
    invoke-virtual {p1}, Lcom/rey/material/app/DialogFragment;->dismiss()V

    .line 1482
    return-void
.end method

.method public onNeutralActionClicked(Lcom/rey/material/app/DialogFragment;)V
    .registers 2
    .param p1, "fragment"    # Lcom/rey/material/app/DialogFragment;

    .prologue
    .line 1486
    invoke-virtual {p1}, Lcom/rey/material/app/DialogFragment;->dismiss()V

    .line 1487
    return-void
.end method

.method public onPositiveActionClicked(Lcom/rey/material/app/DialogFragment;)V
    .registers 2
    .param p1, "fragment"    # Lcom/rey/material/app/DialogFragment;

    .prologue
    .line 1476
    invoke-virtual {p1}, Lcom/rey/material/app/DialogFragment;->dismiss()V

    .line 1477
    return-void
.end method

.method protected onReadFromParcel(Landroid/os/Parcel;)V
    .registers 2
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 1545
    return-void
.end method

.method protected onWriteToParcel(Landroid/os/Parcel;I)V
    .registers 3
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 1551
    return-void
.end method

.method public positiveAction(Ljava/lang/CharSequence;)Lcom/rey/material/app/Dialog$Builder;
    .registers 2
    .param p1, "action"    # Ljava/lang/CharSequence;

    .prologue
    .line 1456
    iput-object p1, p0, Lcom/rey/material/app/Dialog$Builder;->mPositive:Ljava/lang/CharSequence;

    .line 1457
    return-object p0
.end method

.method public style(I)Lcom/rey/material/app/Dialog$Builder;
    .registers 2
    .param p1, "styleId"    # I

    .prologue
    .line 1441
    iput p1, p0, Lcom/rey/material/app/Dialog$Builder;->mStyleId:I

    .line 1442
    return-object p0
.end method

.method public title(Ljava/lang/CharSequence;)Lcom/rey/material/app/Dialog$Builder;
    .registers 2
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 1451
    iput-object p1, p0, Lcom/rey/material/app/Dialog$Builder;->mTitle:Ljava/lang/CharSequence;

    .line 1452
    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 1555
    iget v0, p0, Lcom/rey/material/app/Dialog$Builder;->mStyleId:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 1556
    iget v0, p0, Lcom/rey/material/app/Dialog$Builder;->mContentViewId:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 1557
    iget-object v0, p0, Lcom/rey/material/app/Dialog$Builder;->mTitle:Ljava/lang/CharSequence;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeValue(Ljava/lang/Object;)V

    .line 1558
    iget-object v0, p0, Lcom/rey/material/app/Dialog$Builder;->mPositive:Ljava/lang/CharSequence;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeValue(Ljava/lang/Object;)V

    .line 1559
    iget-object v0, p0, Lcom/rey/material/app/Dialog$Builder;->mNegative:Ljava/lang/CharSequence;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeValue(Ljava/lang/Object;)V

    .line 1560
    iget-object v0, p0, Lcom/rey/material/app/Dialog$Builder;->mNeutral:Ljava/lang/CharSequence;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeValue(Ljava/lang/Object;)V

    .line 1561
    invoke-virtual {p0, p1, p2}, Lcom/rey/material/app/Dialog$Builder;->onWriteToParcel(Landroid/os/Parcel;I)V

    .line 1562
    return-void
.end method
