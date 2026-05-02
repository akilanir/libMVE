.class public Lcom/rey/material/app/SimpleDialog$Builder;
.super Lcom/rey/material/app/Dialog$Builder;
.source "SimpleDialog.java"

# interfaces
.implements Lcom/rey/material/app/SimpleDialog$OnSelectionChangedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/app/SimpleDialog;
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
            "Lcom/rey/material/app/SimpleDialog$Builder;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field protected mItems:[Ljava/lang/CharSequence;

.field protected mMessage:Ljava/lang/CharSequence;

.field protected mMode:I

.field protected mSelectedIndexes:[I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 761
    new-instance v0, Lcom/rey/material/app/SimpleDialog$Builder$1;

    invoke-direct {v0}, Lcom/rey/material/app/SimpleDialog$Builder$1;-><init>()V

    sput-object v0, Lcom/rey/material/app/SimpleDialog$Builder;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 604
    sget v0, Lcom/rey/material/R$style;->Material_App_Dialog_Simple_Light:I

    invoke-direct {p0, v0}, Lcom/rey/material/app/Dialog$Builder;-><init>(I)V

    .line 605
    return-void
.end method

.method public constructor <init>(I)V
    .registers 2
    .param p1, "styleId"    # I

    .prologue
    .line 608
    invoke-direct {p0, p1}, Lcom/rey/material/app/Dialog$Builder;-><init>(I)V

    .line 609
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .registers 2
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 701
    invoke-direct {p0, p1}, Lcom/rey/material/app/Dialog$Builder;-><init>(Landroid/os/Parcel;)V

    .line 702
    return-void
.end method


# virtual methods
.method public getSelectedIndex()I
    .registers 3

    .prologue
    .line 632
    iget v0, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mMode:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_a

    iget v0, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mMode:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_10

    .line 633
    :cond_a
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mSelectedIndexes:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    .line 635
    :goto_f
    return v0

    :cond_10
    const/4 v0, -0x1

    goto :goto_f
.end method

.method public getSelectedIndexes()[I
    .registers 3

    .prologue
    .line 644
    iget v0, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mMode:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_a

    iget v0, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mMode:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_d

    .line 645
    :cond_a
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mSelectedIndexes:[I

    .line 647
    :goto_c
    return-object v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public getSelectedValue()Ljava/lang/CharSequence;
    .registers 3

    .prologue
    .line 639
    invoke-virtual {p0}, Lcom/rey/material/app/SimpleDialog$Builder;->getSelectedIndex()I

    move-result v0

    .line 640
    .local v0, "index":I
    if-ltz v0, :cond_b

    iget-object v1, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mItems:[Ljava/lang/CharSequence;

    aget-object v1, v1, v0

    :goto_a
    return-object v1

    :cond_b
    const/4 v1, 0x0

    goto :goto_a
.end method

.method public getSelectedValues()[Ljava/lang/CharSequence;
    .registers 6

    .prologue
    .line 651
    invoke-virtual {p0}, Lcom/rey/material/app/SimpleDialog$Builder;->getSelectedIndexes()[I

    move-result-object v1

    .line 652
    .local v1, "indexes":[I
    if-eqz v1, :cond_9

    array-length v3, v1

    if-nez v3, :cond_b

    .line 653
    :cond_9
    const/4 v2, 0x0

    .line 659
    :cond_a
    return-object v2

    .line 655
    :cond_b
    array-length v3, v1

    new-array v2, v3, [Ljava/lang/CharSequence;

    .line 656
    .local v2, "result":[Ljava/lang/CharSequence;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_f
    array-length v3, v1

    if-ge v0, v3, :cond_a

    .line 657
    iget-object v3, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mItems:[Ljava/lang/CharSequence;

    aget v4, v1, v0

    aget-object v3, v3, v4

    aput-object v3, v2, v0

    .line 656
    add-int/lit8 v0, v0, 0x1

    goto :goto_f
.end method

.method public items([Ljava/lang/CharSequence;I)Lcom/rey/material/app/SimpleDialog$Builder;
    .registers 5
    .param p1, "items"    # [Ljava/lang/CharSequence;
    .param p2, "selectedIndex"    # I

    .prologue
    .line 618
    const/4 v0, 0x2

    iput v0, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mMode:I

    .line 619
    iput-object p1, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mItems:[Ljava/lang/CharSequence;

    .line 620
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    aput p2, v0, v1

    iput-object v0, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mSelectedIndexes:[I

    .line 621
    return-object p0
.end method

.method public message(Ljava/lang/CharSequence;)Lcom/rey/material/app/SimpleDialog$Builder;
    .registers 3
    .param p1, "message"    # Ljava/lang/CharSequence;

    .prologue
    .line 612
    const/4 v0, 0x1

    iput v0, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mMode:I

    .line 613
    iput-object p1, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mMessage:Ljava/lang/CharSequence;

    .line 614
    return-object p0
.end method

.method public varargs multiChoiceItems([Ljava/lang/CharSequence;[I)Lcom/rey/material/app/SimpleDialog$Builder;
    .registers 4
    .param p1, "items"    # [Ljava/lang/CharSequence;
    .param p2, "selectedIndexes"    # [I

    .prologue
    .line 625
    const/4 v0, 0x3

    iput v0, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mMode:I

    .line 626
    iput-object p1, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mItems:[Ljava/lang/CharSequence;

    .line 627
    iput-object p2, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mSelectedIndexes:[I

    .line 628
    return-object p0
.end method

.method protected onBuild(Landroid/content/Context;I)Lcom/rey/material/app/Dialog;
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "styleId"    # I

    .prologue
    const/4 v1, 0x0

    .line 664
    new-instance v0, Lcom/rey/material/app/SimpleDialog;

    invoke-direct {v0, p1, p2}, Lcom/rey/material/app/SimpleDialog;-><init>(Landroid/content/Context;I)V

    .line 666
    .local v0, "dialog":Lcom/rey/material/app/SimpleDialog;
    iget v2, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mMode:I

    packed-switch v2, :pswitch_data_30

    .line 680
    :goto_b
    return-object v0

    .line 668
    :pswitch_c
    iget-object v1, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mMessage:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Lcom/rey/material/app/SimpleDialog;->message(Ljava/lang/CharSequence;)Lcom/rey/material/app/SimpleDialog;

    goto :goto_b

    .line 671
    :pswitch_12
    iget-object v2, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mItems:[Ljava/lang/CharSequence;

    iget-object v3, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mSelectedIndexes:[I

    if-nez v3, :cond_1f

    :goto_18
    invoke-virtual {v0, v2, v1}, Lcom/rey/material/app/SimpleDialog;->items([Ljava/lang/CharSequence;I)Lcom/rey/material/app/SimpleDialog;

    .line 672
    invoke-virtual {v0, p0}, Lcom/rey/material/app/SimpleDialog;->onSelectionChangedListener(Lcom/rey/material/app/SimpleDialog$OnSelectionChangedListener;)Lcom/rey/material/app/SimpleDialog;

    goto :goto_b

    .line 671
    :cond_1f
    iget-object v3, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mSelectedIndexes:[I

    aget v1, v3, v1

    goto :goto_18

    .line 675
    :pswitch_24
    iget-object v1, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mItems:[Ljava/lang/CharSequence;

    iget-object v2, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mSelectedIndexes:[I

    invoke-virtual {v0, v1, v2}, Lcom/rey/material/app/SimpleDialog;->multiChoiceItems([Ljava/lang/CharSequence;[I)Lcom/rey/material/app/SimpleDialog;

    .line 676
    invoke-virtual {v0, p0}, Lcom/rey/material/app/SimpleDialog;->onSelectionChangedListener(Lcom/rey/material/app/SimpleDialog$OnSelectionChangedListener;)Lcom/rey/material/app/SimpleDialog;

    goto :goto_b

    .line 666
    nop

    :pswitch_data_30
    .packed-switch 0x1
        :pswitch_c
        :pswitch_12
        :pswitch_24
    .end packed-switch
.end method

.method protected onReadFromParcel(Landroid/os/Parcel;)V
    .registers 8
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    const/4 v4, 0x0

    .line 706
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    iput v3, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mMode:I

    .line 707
    iget v3, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mMode:I

    packed-switch v3, :pswitch_data_76

    .line 738
    :cond_c
    :goto_c
    return-void

    .line 709
    :pswitch_d
    invoke-virtual {p1, v4}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v3

    check-cast v3, Ljava/lang/CharSequence;

    iput-object v3, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mMessage:Ljava/lang/CharSequence;

    goto :goto_c

    .line 712
    :pswitch_16
    invoke-virtual {p1, v4}, Landroid/os/Parcel;->readParcelableArray(Ljava/lang/ClassLoader;)[Landroid/os/Parcelable;

    move-result-object v2

    .line 713
    .local v2, "values":[Landroid/os/Parcelable;
    if-eqz v2, :cond_35

    array-length v3, v2

    if-lez v3, :cond_35

    .line 714
    array-length v3, v2

    new-array v3, v3, [Ljava/lang/CharSequence;

    iput-object v3, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mItems:[Ljava/lang/CharSequence;

    .line 715
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_25
    iget-object v3, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mItems:[Ljava/lang/CharSequence;

    array-length v3, v3

    if-ge v0, v3, :cond_37

    .line 716
    iget-object v4, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mItems:[Ljava/lang/CharSequence;

    aget-object v3, v2, v0

    check-cast v3, Ljava/lang/CharSequence;

    aput-object v3, v4, v0

    .line 715
    add-int/lit8 v0, v0, 0x1

    goto :goto_25

    .line 718
    .end local v0    # "i":I
    :cond_35
    iput-object v4, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mItems:[Ljava/lang/CharSequence;

    .line 719
    :cond_37
    const/4 v3, 0x1

    new-array v3, v3, [I

    const/4 v4, 0x0

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v5

    aput v5, v3, v4

    iput-object v3, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mSelectedIndexes:[I

    goto :goto_c

    .line 723
    .end local v2    # "values":[Landroid/os/Parcelable;
    :pswitch_44
    invoke-virtual {p1, v4}, Landroid/os/Parcel;->readParcelableArray(Ljava/lang/ClassLoader;)[Landroid/os/Parcelable;

    move-result-object v2

    .line 724
    .restart local v2    # "values":[Landroid/os/Parcelable;
    if-eqz v2, :cond_63

    array-length v3, v2

    if-lez v3, :cond_63

    .line 725
    array-length v3, v2

    new-array v3, v3, [Ljava/lang/CharSequence;

    iput-object v3, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mItems:[Ljava/lang/CharSequence;

    .line 726
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_53
    iget-object v3, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mItems:[Ljava/lang/CharSequence;

    array-length v3, v3

    if-ge v0, v3, :cond_65

    .line 727
    iget-object v4, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mItems:[Ljava/lang/CharSequence;

    aget-object v3, v2, v0

    check-cast v3, Ljava/lang/CharSequence;

    aput-object v3, v4, v0

    .line 726
    add-int/lit8 v0, v0, 0x1

    goto :goto_53

    .line 729
    .end local v0    # "i":I
    :cond_63
    iput-object v4, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mItems:[Ljava/lang/CharSequence;

    .line 730
    :cond_65
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 731
    .local v1, "length":I
    if-lez v1, :cond_c

    .line 732
    new-array v3, v1, [I

    iput-object v3, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mSelectedIndexes:[I

    .line 733
    iget-object v3, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mSelectedIndexes:[I

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->readIntArray([I)V

    goto :goto_c

    .line 707
    nop

    :pswitch_data_76
    .packed-switch 0x1
        :pswitch_d
        :pswitch_16
        :pswitch_44
    .end packed-switch
.end method

.method public onSelectionChanged(IZ)V
    .registers 5
    .param p1, "index"    # I
    .param p2, "selected"    # Z

    .prologue
    const/4 v1, 0x0

    .line 685
    iget v0, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mMode:I

    packed-switch v0, :pswitch_data_26

    .line 698
    :cond_6
    :goto_6
    return-void

    .line 687
    :pswitch_7
    if-eqz p2, :cond_6

    .line 688
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mSelectedIndexes:[I

    if-nez v0, :cond_15

    .line 689
    const/4 v0, 0x1

    new-array v0, v0, [I

    aput p1, v0, v1

    iput-object v0, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mSelectedIndexes:[I

    goto :goto_6

    .line 691
    :cond_15
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mSelectedIndexes:[I

    aput p1, v0, v1

    goto :goto_6

    .line 695
    :pswitch_1a
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mDialog:Lcom/rey/material/app/Dialog;

    check-cast v0, Lcom/rey/material/app/SimpleDialog;

    invoke-virtual {v0}, Lcom/rey/material/app/SimpleDialog;->getSelectedIndexes()[I

    move-result-object v0

    iput-object v0, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mSelectedIndexes:[I

    goto :goto_6

    .line 685
    nop

    :pswitch_data_26
    .packed-switch 0x2
        :pswitch_7
        :pswitch_1a
    .end packed-switch
.end method

.method protected onWriteToParcel(Landroid/os/Parcel;I)V
    .registers 6
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    const/4 v1, 0x0

    .line 742
    iget v2, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mMode:I

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 743
    iget v2, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mMode:I

    packed-switch v2, :pswitch_data_3e

    .line 759
    :cond_b
    :goto_b
    return-void

    .line 745
    :pswitch_c
    iget-object v1, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mMessage:Ljava/lang/CharSequence;

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeValue(Ljava/lang/Object;)V

    goto :goto_b

    .line 748
    :pswitch_12
    iget-object v2, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mItems:[Ljava/lang/CharSequence;

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeArray([Ljava/lang/Object;)V

    .line 749
    iget-object v2, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mSelectedIndexes:[I

    if-nez v2, :cond_1f

    :goto_1b
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_b

    :cond_1f
    iget-object v2, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mSelectedIndexes:[I

    aget v1, v2, v1

    goto :goto_1b

    .line 752
    :pswitch_24
    iget-object v2, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mItems:[Ljava/lang/CharSequence;

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeArray([Ljava/lang/Object;)V

    .line 753
    iget-object v2, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mSelectedIndexes:[I

    if-nez v2, :cond_39

    move v0, v1

    .line 754
    .local v0, "length":I
    :goto_2e
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 755
    if-lez v0, :cond_b

    .line 756
    iget-object v1, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mSelectedIndexes:[I

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeIntArray([I)V

    goto :goto_b

    .line 753
    .end local v0    # "length":I
    :cond_39
    iget-object v1, p0, Lcom/rey/material/app/SimpleDialog$Builder;->mSelectedIndexes:[I

    array-length v0, v1

    goto :goto_2e

    .line 743
    nop

    :pswitch_data_3e
    .packed-switch 0x1
        :pswitch_c
        :pswitch_12
        :pswitch_24
    .end packed-switch
.end method
