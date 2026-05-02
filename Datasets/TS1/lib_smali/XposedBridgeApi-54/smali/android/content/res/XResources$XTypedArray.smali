.class public Landroid/content/res/XResources$XTypedArray;
.super Landroid/content/res/TypedArray;
.source "XResources.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/content/res/XResources;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "XTypedArray"
.end annotation


# instance fields
.field private mIsObjectInited:Z

.field private mRes:Landroid/content/res/XResources;


# direct methods
.method private constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 854
    const/4 v0, 0x0

    invoke-direct {p0, v1, v1, v1, v0}, Landroid/content/res/TypedArray;-><init>(Landroid/content/res/Resources;[I[II)V

    .line 855
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method


# virtual methods
.method public getBoolean(IZ)Z
    .registers 8
    .param p1, "index"    # I
    .param p2, "defValue"    # Z

    .prologue
    .line 868
    iget-object v3, p0, Landroid/content/res/XResources$XTypedArray;->mRes:Landroid/content/res/XResources;

    const/4 v4, 0x0

    invoke-virtual {p0, p1, v4}, Landroid/content/res/XResources$XTypedArray;->getResourceId(II)I

    move-result v4

    # invokes: Landroid/content/res/XResources;->getReplacement(I)Ljava/lang/Object;
    invoke-static {v3, v4}, Landroid/content/res/XResources;->access$0(Landroid/content/res/XResources;I)Ljava/lang/Object;

    move-result-object v2

    .line 869
    .local v2, "replacement":Ljava/lang/Object;
    instance-of v3, v2, Ljava/lang/Boolean;

    if-eqz v3, :cond_16

    .line 870
    check-cast v2, Ljava/lang/Boolean;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    .line 876
    :goto_15
    return v3

    .line 871
    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_16
    instance-of v3, v2, Landroid/content/res/XResForwarder;

    if-eqz v3, :cond_2c

    move-object v3, v2

    .line 872
    check-cast v3, Landroid/content/res/XResForwarder;

    invoke-virtual {v3}, Landroid/content/res/XResForwarder;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 873
    .local v1, "repRes":Landroid/content/res/Resources;
    check-cast v2, Landroid/content/res/XResForwarder;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2}, Landroid/content/res/XResForwarder;->getId()I

    move-result v0

    .line 874
    .local v0, "repId":I
    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v3

    goto :goto_15

    .line 876
    .end local v0    # "repId":I
    .end local v1    # "repRes":Landroid/content/res/Resources;
    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_2c
    invoke-super {p0, p1, p2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v3

    goto :goto_15
.end method

.method public getColor(II)I
    .registers 8
    .param p1, "index"    # I
    .param p2, "defValue"    # I

    .prologue
    .line 881
    iget-object v3, p0, Landroid/content/res/XResources$XTypedArray;->mRes:Landroid/content/res/XResources;

    const/4 v4, 0x0

    invoke-virtual {p0, p1, v4}, Landroid/content/res/XResources$XTypedArray;->getResourceId(II)I

    move-result v4

    # invokes: Landroid/content/res/XResources;->getReplacement(I)Ljava/lang/Object;
    invoke-static {v3, v4}, Landroid/content/res/XResources;->access$0(Landroid/content/res/XResources;I)Ljava/lang/Object;

    move-result-object v2

    .line 882
    .local v2, "replacement":Ljava/lang/Object;
    instance-of v3, v2, Ljava/lang/Integer;

    if-eqz v3, :cond_16

    .line 883
    check-cast v2, Ljava/lang/Integer;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 889
    :goto_15
    return v3

    .line 884
    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_16
    instance-of v3, v2, Landroid/content/res/XResForwarder;

    if-eqz v3, :cond_2c

    move-object v3, v2

    .line 885
    check-cast v3, Landroid/content/res/XResForwarder;

    invoke-virtual {v3}, Landroid/content/res/XResForwarder;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 886
    .local v1, "repRes":Landroid/content/res/Resources;
    check-cast v2, Landroid/content/res/XResForwarder;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2}, Landroid/content/res/XResForwarder;->getId()I

    move-result v0

    .line 887
    .local v0, "repId":I
    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    goto :goto_15

    .line 889
    .end local v0    # "repId":I
    .end local v1    # "repRes":Landroid/content/res/Resources;
    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_2c
    invoke-super {p0, p1, p2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v3

    goto :goto_15
.end method

.method public getColorStateList(I)Landroid/content/res/ColorStateList;
    .registers 9
    .param p1, "index"    # I

    .prologue
    .line 894
    iget-object v5, p0, Landroid/content/res/XResources$XTypedArray;->mRes:Landroid/content/res/XResources;

    const/4 v6, 0x0

    invoke-virtual {p0, p1, v6}, Landroid/content/res/XResources$XTypedArray;->getResourceId(II)I

    move-result v6

    # invokes: Landroid/content/res/XResources;->getReplacement(I)Ljava/lang/Object;
    invoke-static {v5, v6}, Landroid/content/res/XResources;->access$0(Landroid/content/res/XResources;I)Ljava/lang/Object;

    move-result-object v3

    .line 895
    .local v3, "replacement":Ljava/lang/Object;
    instance-of v5, v3, Landroid/content/res/ColorStateList;

    if-eqz v5, :cond_12

    .line 896
    check-cast v3, Landroid/content/res/ColorStateList;

    .line 912
    .end local v3    # "replacement":Ljava/lang/Object;
    :goto_11
    return-object v3

    .line 897
    .restart local v3    # "replacement":Ljava/lang/Object;
    :cond_12
    instance-of v5, v3, Ljava/lang/Integer;

    if-eqz v5, :cond_3e

    .line 898
    check-cast v3, Ljava/lang/Integer;

    .end local v3    # "replacement":Ljava/lang/Object;
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 899
    .local v0, "color":I
    # getter for: Landroid/content/res/XResources;->sColorStateListCache:Landroid/util/SparseArray;
    invoke-static {}, Landroid/content/res/XResources;->access$1()Landroid/util/SparseArray;

    move-result-object v6

    monitor-enter v6

    .line 900
    :try_start_21
    # getter for: Landroid/content/res/XResources;->sColorStateListCache:Landroid/util/SparseArray;
    invoke-static {}, Landroid/content/res/XResources;->access$1()Landroid/util/SparseArray;

    move-result-object v5

    invoke-virtual {v5, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/res/ColorStateList;

    .line 901
    .local v4, "result":Landroid/content/res/ColorStateList;
    if-nez v4, :cond_38

    .line 902
    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v4

    .line 903
    # getter for: Landroid/content/res/XResources;->sColorStateListCache:Landroid/util/SparseArray;
    invoke-static {}, Landroid/content/res/XResources;->access$1()Landroid/util/SparseArray;

    move-result-object v5

    invoke-virtual {v5, v0, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 905
    :cond_38
    monitor-exit v6

    move-object v3, v4

    goto :goto_11

    .line 899
    .end local v4    # "result":Landroid/content/res/ColorStateList;
    :catchall_3b
    move-exception v5

    monitor-exit v6
    :try_end_3d
    .catchall {:try_start_21 .. :try_end_3d} :catchall_3b

    throw v5

    .line 907
    .end local v0    # "color":I
    .restart local v3    # "replacement":Ljava/lang/Object;
    :cond_3e
    instance-of v5, v3, Landroid/content/res/XResForwarder;

    if-eqz v5, :cond_54

    move-object v5, v3

    .line 908
    check-cast v5, Landroid/content/res/XResForwarder;

    invoke-virtual {v5}, Landroid/content/res/XResForwarder;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 909
    .local v2, "repRes":Landroid/content/res/Resources;
    check-cast v3, Landroid/content/res/XResForwarder;

    .end local v3    # "replacement":Ljava/lang/Object;
    invoke-virtual {v3}, Landroid/content/res/XResForwarder;->getId()I

    move-result v1

    .line 910
    .local v1, "repId":I
    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    goto :goto_11

    .line 912
    .end local v1    # "repId":I
    .end local v2    # "repRes":Landroid/content/res/Resources;
    .restart local v3    # "replacement":Ljava/lang/Object;
    :cond_54
    invoke-super {p0, p1}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    goto :goto_11
.end method

.method public getDimension(IF)F
    .registers 8
    .param p1, "index"    # I
    .param p2, "defValue"    # F

    .prologue
    .line 917
    iget-object v3, p0, Landroid/content/res/XResources$XTypedArray;->mRes:Landroid/content/res/XResources;

    const/4 v4, 0x0

    invoke-virtual {p0, p1, v4}, Landroid/content/res/XResources$XTypedArray;->getResourceId(II)I

    move-result v4

    # invokes: Landroid/content/res/XResources;->getReplacement(I)Ljava/lang/Object;
    invoke-static {v3, v4}, Landroid/content/res/XResources;->access$0(Landroid/content/res/XResources;I)Ljava/lang/Object;

    move-result-object v2

    .line 918
    .local v2, "replacement":Ljava/lang/Object;
    instance-of v3, v2, Landroid/content/res/XResForwarder;

    if-eqz v3, :cond_21

    move-object v3, v2

    .line 919
    check-cast v3, Landroid/content/res/XResForwarder;

    invoke-virtual {v3}, Landroid/content/res/XResForwarder;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 920
    .local v1, "repRes":Landroid/content/res/Resources;
    check-cast v2, Landroid/content/res/XResForwarder;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2}, Landroid/content/res/XResForwarder;->getId()I

    move-result v0

    .line 921
    .local v0, "repId":I
    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v3

    .line 923
    .end local v0    # "repId":I
    .end local v1    # "repRes":Landroid/content/res/Resources;
    :goto_20
    return v3

    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_21
    invoke-super {p0, p1, p2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v3

    goto :goto_20
.end method

.method public getDimensionPixelOffset(II)I
    .registers 8
    .param p1, "index"    # I
    .param p2, "defValue"    # I

    .prologue
    .line 928
    iget-object v3, p0, Landroid/content/res/XResources$XTypedArray;->mRes:Landroid/content/res/XResources;

    const/4 v4, 0x0

    invoke-virtual {p0, p1, v4}, Landroid/content/res/XResources$XTypedArray;->getResourceId(II)I

    move-result v4

    # invokes: Landroid/content/res/XResources;->getReplacement(I)Ljava/lang/Object;
    invoke-static {v3, v4}, Landroid/content/res/XResources;->access$0(Landroid/content/res/XResources;I)Ljava/lang/Object;

    move-result-object v2

    .line 929
    .local v2, "replacement":Ljava/lang/Object;
    instance-of v3, v2, Landroid/content/res/XResForwarder;

    if-eqz v3, :cond_21

    move-object v3, v2

    .line 930
    check-cast v3, Landroid/content/res/XResForwarder;

    invoke-virtual {v3}, Landroid/content/res/XResForwarder;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 931
    .local v1, "repRes":Landroid/content/res/Resources;
    check-cast v2, Landroid/content/res/XResForwarder;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2}, Landroid/content/res/XResForwarder;->getId()I

    move-result v0

    .line 932
    .local v0, "repId":I
    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v3

    .line 934
    .end local v0    # "repId":I
    .end local v1    # "repRes":Landroid/content/res/Resources;
    :goto_20
    return v3

    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_21
    invoke-super {p0, p1, p2}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v3

    goto :goto_20
.end method

.method public getDimensionPixelSize(II)I
    .registers 8
    .param p1, "index"    # I
    .param p2, "defValue"    # I

    .prologue
    .line 939
    iget-object v3, p0, Landroid/content/res/XResources$XTypedArray;->mRes:Landroid/content/res/XResources;

    const/4 v4, 0x0

    invoke-virtual {p0, p1, v4}, Landroid/content/res/XResources$XTypedArray;->getResourceId(II)I

    move-result v4

    # invokes: Landroid/content/res/XResources;->getReplacement(I)Ljava/lang/Object;
    invoke-static {v3, v4}, Landroid/content/res/XResources;->access$0(Landroid/content/res/XResources;I)Ljava/lang/Object;

    move-result-object v2

    .line 940
    .local v2, "replacement":Ljava/lang/Object;
    instance-of v3, v2, Landroid/content/res/XResForwarder;

    if-eqz v3, :cond_21

    move-object v3, v2

    .line 941
    check-cast v3, Landroid/content/res/XResForwarder;

    invoke-virtual {v3}, Landroid/content/res/XResForwarder;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 942
    .local v1, "repRes":Landroid/content/res/Resources;
    check-cast v2, Landroid/content/res/XResForwarder;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2}, Landroid/content/res/XResForwarder;->getId()I

    move-result v0

    .line 943
    .local v0, "repId":I
    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    .line 945
    .end local v0    # "repId":I
    .end local v1    # "repRes":Landroid/content/res/Resources;
    :goto_20
    return v3

    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_21
    invoke-super {p0, p1, p2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    goto :goto_20
.end method

.method public getDrawable(I)Landroid/graphics/drawable/Drawable;
    .registers 9
    .param p1, "index"    # I

    .prologue
    .line 950
    const/4 v6, 0x0

    invoke-virtual {p0, p1, v6}, Landroid/content/res/XResources$XTypedArray;->getResourceId(II)I

    move-result v3

    .line 951
    .local v3, "resId":I
    iget-object v6, p0, Landroid/content/res/XResources$XTypedArray;->mRes:Landroid/content/res/XResources;

    # invokes: Landroid/content/res/XResources;->getReplacement(I)Ljava/lang/Object;
    invoke-static {v6, v3}, Landroid/content/res/XResources;->access$0(Landroid/content/res/XResources;I)Ljava/lang/Object;

    move-result-object v2

    .line 952
    .local v2, "replacement":Ljava/lang/Object;
    instance-of v6, v2, Landroid/content/res/XResources$DrawableLoader;

    if-eqz v6, :cond_23

    .line 954
    :try_start_f
    check-cast v2, Landroid/content/res/XResources$DrawableLoader;

    .end local v2    # "replacement":Ljava/lang/Object;
    iget-object v6, p0, Landroid/content/res/XResources$XTypedArray;->mRes:Landroid/content/res/XResources;

    invoke-virtual {v2, v6, v3}, Landroid/content/res/XResources$DrawableLoader;->newDrawable(Landroid/content/res/XResources;I)Landroid/graphics/drawable/Drawable;
    :try_end_16
    .catch Ljava/lang/Throwable; {:try_start_f .. :try_end_16} :catch_1a

    move-result-object v4

    .line 955
    .local v4, "result":Landroid/graphics/drawable/Drawable;
    if-eqz v4, :cond_1e

    .line 965
    .end local v4    # "result":Landroid/graphics/drawable/Drawable;
    :goto_19
    return-object v4

    .line 957
    :catch_1a
    move-exception v5

    .local v5, "t":Ljava/lang/Throwable;
    invoke-static {v5}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 965
    .end local v5    # "t":Ljava/lang/Throwable;
    :cond_1e
    invoke-super {p0, p1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    goto :goto_19

    .line 958
    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_23
    instance-of v6, v2, Ljava/lang/Integer;

    if-eqz v6, :cond_33

    .line 959
    new-instance v4, Landroid/graphics/drawable/ColorDrawable;

    check-cast v2, Ljava/lang/Integer;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-direct {v4, v6}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    goto :goto_19

    .line 960
    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_33
    instance-of v6, v2, Landroid/content/res/XResForwarder;

    if-eqz v6, :cond_1e

    move-object v6, v2

    .line 961
    check-cast v6, Landroid/content/res/XResForwarder;

    invoke-virtual {v6}, Landroid/content/res/XResForwarder;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 962
    .local v1, "repRes":Landroid/content/res/Resources;
    check-cast v2, Landroid/content/res/XResForwarder;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2}, Landroid/content/res/XResForwarder;->getId()I

    move-result v0

    .line 963
    .local v0, "repId":I
    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    goto :goto_19
.end method

.method public getFloat(IF)F
    .registers 8
    .param p1, "index"    # I
    .param p2, "defValue"    # F

    .prologue
    .line 970
    iget-object v3, p0, Landroid/content/res/XResources$XTypedArray;->mRes:Landroid/content/res/XResources;

    const/4 v4, 0x0

    invoke-virtual {p0, p1, v4}, Landroid/content/res/XResources$XTypedArray;->getResourceId(II)I

    move-result v4

    # invokes: Landroid/content/res/XResources;->getReplacement(I)Ljava/lang/Object;
    invoke-static {v3, v4}, Landroid/content/res/XResources;->access$0(Landroid/content/res/XResources;I)Ljava/lang/Object;

    move-result-object v2

    .line 971
    .local v2, "replacement":Ljava/lang/Object;
    instance-of v3, v2, Landroid/content/res/XResForwarder;

    if-eqz v3, :cond_21

    move-object v3, v2

    .line 972
    check-cast v3, Landroid/content/res/XResForwarder;

    invoke-virtual {v3}, Landroid/content/res/XResForwarder;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 973
    .local v1, "repRes":Landroid/content/res/Resources;
    check-cast v2, Landroid/content/res/XResForwarder;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2}, Landroid/content/res/XResForwarder;->getId()I

    move-result v0

    .line 975
    .local v0, "repId":I
    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v3

    .line 977
    .end local v0    # "repId":I
    .end local v1    # "repRes":Landroid/content/res/Resources;
    :goto_20
    return v3

    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_21
    invoke-super {p0, p1, p2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v3

    goto :goto_20
.end method

.method public getFraction(IIIF)F
    .registers 10
    .param p1, "index"    # I
    .param p2, "base"    # I
    .param p3, "pbase"    # I
    .param p4, "defValue"    # F

    .prologue
    .line 982
    iget-object v3, p0, Landroid/content/res/XResources$XTypedArray;->mRes:Landroid/content/res/XResources;

    const/4 v4, 0x0

    invoke-virtual {p0, p1, v4}, Landroid/content/res/XResources$XTypedArray;->getResourceId(II)I

    move-result v4

    # invokes: Landroid/content/res/XResources;->getReplacement(I)Ljava/lang/Object;
    invoke-static {v3, v4}, Landroid/content/res/XResources;->access$0(Landroid/content/res/XResources;I)Ljava/lang/Object;

    move-result-object v2

    .line 983
    .local v2, "replacement":Ljava/lang/Object;
    instance-of v3, v2, Landroid/content/res/XResForwarder;

    if-eqz v3, :cond_21

    move-object v3, v2

    .line 984
    check-cast v3, Landroid/content/res/XResForwarder;

    invoke-virtual {v3}, Landroid/content/res/XResForwarder;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 985
    .local v1, "repRes":Landroid/content/res/Resources;
    check-cast v2, Landroid/content/res/XResForwarder;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2}, Landroid/content/res/XResForwarder;->getId()I

    move-result v0

    .line 987
    .local v0, "repId":I
    invoke-virtual {v1, v0, p2, p3}, Landroid/content/res/Resources;->getFraction(III)F

    move-result v3

    .line 989
    .end local v0    # "repId":I
    .end local v1    # "repRes":Landroid/content/res/Resources;
    :goto_20
    return v3

    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_21
    invoke-super {p0, p1, p2, p3, p4}, Landroid/content/res/TypedArray;->getFraction(IIIF)F

    move-result v3

    goto :goto_20
.end method

.method public getInt(II)I
    .registers 8
    .param p1, "index"    # I
    .param p2, "defValue"    # I

    .prologue
    .line 994
    iget-object v3, p0, Landroid/content/res/XResources$XTypedArray;->mRes:Landroid/content/res/XResources;

    const/4 v4, 0x0

    invoke-virtual {p0, p1, v4}, Landroid/content/res/XResources$XTypedArray;->getResourceId(II)I

    move-result v4

    # invokes: Landroid/content/res/XResources;->getReplacement(I)Ljava/lang/Object;
    invoke-static {v3, v4}, Landroid/content/res/XResources;->access$0(Landroid/content/res/XResources;I)Ljava/lang/Object;

    move-result-object v2

    .line 995
    .local v2, "replacement":Ljava/lang/Object;
    instance-of v3, v2, Ljava/lang/Integer;

    if-eqz v3, :cond_16

    .line 996
    check-cast v2, Ljava/lang/Integer;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 1002
    :goto_15
    return v3

    .line 997
    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_16
    instance-of v3, v2, Landroid/content/res/XResForwarder;

    if-eqz v3, :cond_2c

    move-object v3, v2

    .line 998
    check-cast v3, Landroid/content/res/XResForwarder;

    invoke-virtual {v3}, Landroid/content/res/XResForwarder;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 999
    .local v1, "repRes":Landroid/content/res/Resources;
    check-cast v2, Landroid/content/res/XResForwarder;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2}, Landroid/content/res/XResForwarder;->getId()I

    move-result v0

    .line 1000
    .local v0, "repId":I
    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v3

    goto :goto_15

    .line 1002
    .end local v0    # "repId":I
    .end local v1    # "repRes":Landroid/content/res/Resources;
    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_2c
    invoke-super {p0, p1, p2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v3

    goto :goto_15
.end method

.method public getInteger(II)I
    .registers 8
    .param p1, "index"    # I
    .param p2, "defValue"    # I

    .prologue
    .line 1007
    iget-object v3, p0, Landroid/content/res/XResources$XTypedArray;->mRes:Landroid/content/res/XResources;

    const/4 v4, 0x0

    invoke-virtual {p0, p1, v4}, Landroid/content/res/XResources$XTypedArray;->getResourceId(II)I

    move-result v4

    # invokes: Landroid/content/res/XResources;->getReplacement(I)Ljava/lang/Object;
    invoke-static {v3, v4}, Landroid/content/res/XResources;->access$0(Landroid/content/res/XResources;I)Ljava/lang/Object;

    move-result-object v2

    .line 1008
    .local v2, "replacement":Ljava/lang/Object;
    instance-of v3, v2, Ljava/lang/Integer;

    if-eqz v3, :cond_16

    .line 1009
    check-cast v2, Ljava/lang/Integer;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 1015
    :goto_15
    return v3

    .line 1010
    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_16
    instance-of v3, v2, Landroid/content/res/XResForwarder;

    if-eqz v3, :cond_2c

    move-object v3, v2

    .line 1011
    check-cast v3, Landroid/content/res/XResForwarder;

    invoke-virtual {v3}, Landroid/content/res/XResForwarder;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 1012
    .local v1, "repRes":Landroid/content/res/Resources;
    check-cast v2, Landroid/content/res/XResForwarder;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2}, Landroid/content/res/XResForwarder;->getId()I

    move-result v0

    .line 1013
    .local v0, "repId":I
    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v3

    goto :goto_15

    .line 1015
    .end local v0    # "repId":I
    .end local v1    # "repRes":Landroid/content/res/Resources;
    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_2c
    invoke-super {p0, p1, p2}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v3

    goto :goto_15
.end method

.method public getLayoutDimension(II)I
    .registers 8
    .param p1, "index"    # I
    .param p2, "defValue"    # I

    .prologue
    .line 1020
    iget-object v3, p0, Landroid/content/res/XResources$XTypedArray;->mRes:Landroid/content/res/XResources;

    const/4 v4, 0x0

    invoke-virtual {p0, p1, v4}, Landroid/content/res/XResources$XTypedArray;->getResourceId(II)I

    move-result v4

    # invokes: Landroid/content/res/XResources;->getReplacement(I)Ljava/lang/Object;
    invoke-static {v3, v4}, Landroid/content/res/XResources;->access$0(Landroid/content/res/XResources;I)Ljava/lang/Object;

    move-result-object v2

    .line 1021
    .local v2, "replacement":Ljava/lang/Object;
    instance-of v3, v2, Landroid/content/res/XResForwarder;

    if-eqz v3, :cond_21

    move-object v3, v2

    .line 1022
    check-cast v3, Landroid/content/res/XResForwarder;

    invoke-virtual {v3}, Landroid/content/res/XResForwarder;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 1023
    .local v1, "repRes":Landroid/content/res/Resources;
    check-cast v2, Landroid/content/res/XResForwarder;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2}, Landroid/content/res/XResForwarder;->getId()I

    move-result v0

    .line 1024
    .local v0, "repId":I
    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    .line 1026
    .end local v0    # "repId":I
    .end local v1    # "repRes":Landroid/content/res/Resources;
    :goto_20
    return v3

    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_21
    invoke-super {p0, p1, p2}, Landroid/content/res/TypedArray;->getLayoutDimension(II)I

    move-result v3

    goto :goto_20
.end method

.method public getLayoutDimension(ILjava/lang/String;)I
    .registers 8
    .param p1, "index"    # I
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 1031
    iget-object v3, p0, Landroid/content/res/XResources$XTypedArray;->mRes:Landroid/content/res/XResources;

    const/4 v4, 0x0

    invoke-virtual {p0, p1, v4}, Landroid/content/res/XResources$XTypedArray;->getResourceId(II)I

    move-result v4

    # invokes: Landroid/content/res/XResources;->getReplacement(I)Ljava/lang/Object;
    invoke-static {v3, v4}, Landroid/content/res/XResources;->access$0(Landroid/content/res/XResources;I)Ljava/lang/Object;

    move-result-object v2

    .line 1032
    .local v2, "replacement":Ljava/lang/Object;
    instance-of v3, v2, Landroid/content/res/XResForwarder;

    if-eqz v3, :cond_21

    move-object v3, v2

    .line 1033
    check-cast v3, Landroid/content/res/XResForwarder;

    invoke-virtual {v3}, Landroid/content/res/XResForwarder;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 1034
    .local v1, "repRes":Landroid/content/res/Resources;
    check-cast v2, Landroid/content/res/XResForwarder;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2}, Landroid/content/res/XResForwarder;->getId()I

    move-result v0

    .line 1035
    .local v0, "repId":I
    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    .line 1037
    .end local v0    # "repId":I
    .end local v1    # "repRes":Landroid/content/res/Resources;
    :goto_20
    return v3

    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_21
    invoke-super {p0, p1, p2}, Landroid/content/res/TypedArray;->getLayoutDimension(ILjava/lang/String;)I

    move-result v3

    goto :goto_20
.end method

.method public getString(I)Ljava/lang/String;
    .registers 7
    .param p1, "index"    # I

    .prologue
    .line 1042
    iget-object v3, p0, Landroid/content/res/XResources$XTypedArray;->mRes:Landroid/content/res/XResources;

    const/4 v4, 0x0

    invoke-virtual {p0, p1, v4}, Landroid/content/res/XResources$XTypedArray;->getResourceId(II)I

    move-result v4

    # invokes: Landroid/content/res/XResources;->getReplacement(I)Ljava/lang/Object;
    invoke-static {v3, v4}, Landroid/content/res/XResources;->access$0(Landroid/content/res/XResources;I)Ljava/lang/Object;

    move-result-object v2

    .line 1043
    .local v2, "replacement":Ljava/lang/Object;
    instance-of v3, v2, Ljava/lang/CharSequence;

    if-eqz v3, :cond_14

    .line 1044
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1050
    .end local v2    # "replacement":Ljava/lang/Object;
    :goto_13
    return-object v3

    .line 1045
    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_14
    instance-of v3, v2, Landroid/content/res/XResForwarder;

    if-eqz v3, :cond_2a

    move-object v3, v2

    .line 1046
    check-cast v3, Landroid/content/res/XResForwarder;

    invoke-virtual {v3}, Landroid/content/res/XResForwarder;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 1047
    .local v1, "repRes":Landroid/content/res/Resources;
    check-cast v2, Landroid/content/res/XResForwarder;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2}, Landroid/content/res/XResForwarder;->getId()I

    move-result v0

    .line 1048
    .local v0, "repId":I
    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    goto :goto_13

    .line 1050
    .end local v0    # "repId":I
    .end local v1    # "repRes":Landroid/content/res/Resources;
    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_2a
    invoke-super {p0, p1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    goto :goto_13
.end method

.method public getText(I)Ljava/lang/CharSequence;
    .registers 7
    .param p1, "index"    # I

    .prologue
    .line 1055
    iget-object v3, p0, Landroid/content/res/XResources$XTypedArray;->mRes:Landroid/content/res/XResources;

    const/4 v4, 0x0

    invoke-virtual {p0, p1, v4}, Landroid/content/res/XResources$XTypedArray;->getResourceId(II)I

    move-result v4

    # invokes: Landroid/content/res/XResources;->getReplacement(I)Ljava/lang/Object;
    invoke-static {v3, v4}, Landroid/content/res/XResources;->access$0(Landroid/content/res/XResources;I)Ljava/lang/Object;

    move-result-object v2

    .line 1056
    .local v2, "replacement":Ljava/lang/Object;
    instance-of v3, v2, Ljava/lang/CharSequence;

    if-eqz v3, :cond_12

    .line 1057
    check-cast v2, Ljava/lang/CharSequence;

    .line 1063
    .end local v2    # "replacement":Ljava/lang/Object;
    :goto_11
    return-object v2

    .line 1058
    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_12
    instance-of v3, v2, Landroid/content/res/XResForwarder;

    if-eqz v3, :cond_28

    move-object v3, v2

    .line 1059
    check-cast v3, Landroid/content/res/XResForwarder;

    invoke-virtual {v3}, Landroid/content/res/XResForwarder;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 1060
    .local v1, "repRes":Landroid/content/res/Resources;
    check-cast v2, Landroid/content/res/XResForwarder;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2}, Landroid/content/res/XResForwarder;->getId()I

    move-result v0

    .line 1061
    .local v0, "repId":I
    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    goto :goto_11

    .line 1063
    .end local v0    # "repId":I
    .end local v1    # "repRes":Landroid/content/res/Resources;
    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_28
    invoke-super {p0, p1}, Landroid/content/res/TypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    goto :goto_11
.end method

.method public getTextArray(I)[Ljava/lang/CharSequence;
    .registers 7
    .param p1, "index"    # I

    .prologue
    .line 1068
    iget-object v3, p0, Landroid/content/res/XResources$XTypedArray;->mRes:Landroid/content/res/XResources;

    const/4 v4, 0x0

    invoke-virtual {p0, p1, v4}, Landroid/content/res/XResources$XTypedArray;->getResourceId(II)I

    move-result v4

    # invokes: Landroid/content/res/XResources;->getReplacement(I)Ljava/lang/Object;
    invoke-static {v3, v4}, Landroid/content/res/XResources;->access$0(Landroid/content/res/XResources;I)Ljava/lang/Object;

    move-result-object v2

    .line 1069
    .local v2, "replacement":Ljava/lang/Object;
    instance-of v3, v2, [Ljava/lang/CharSequence;

    if-eqz v3, :cond_12

    .line 1070
    check-cast v2, [Ljava/lang/CharSequence;

    .line 1076
    .end local v2    # "replacement":Ljava/lang/Object;
    :goto_11
    return-object v2

    .line 1071
    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_12
    instance-of v3, v2, Landroid/content/res/XResForwarder;

    if-eqz v3, :cond_28

    move-object v3, v2

    .line 1072
    check-cast v3, Landroid/content/res/XResForwarder;

    invoke-virtual {v3}, Landroid/content/res/XResForwarder;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 1073
    .local v1, "repRes":Landroid/content/res/Resources;
    check-cast v2, Landroid/content/res/XResForwarder;

    .end local v2    # "replacement":Ljava/lang/Object;
    invoke-virtual {v2}, Landroid/content/res/XResForwarder;->getId()I

    move-result v0

    .line 1074
    .local v0, "repId":I
    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getTextArray(I)[Ljava/lang/CharSequence;

    move-result-object v2

    goto :goto_11

    .line 1076
    .end local v0    # "repId":I
    .end local v1    # "repRes":Landroid/content/res/Resources;
    .restart local v2    # "replacement":Ljava/lang/Object;
    :cond_28
    invoke-super {p0, p1}, Landroid/content/res/TypedArray;->getTextArray(I)[Ljava/lang/CharSequence;

    move-result-object v2

    goto :goto_11
.end method

.method public initObject(Landroid/content/res/XResources;)V
    .registers 4
    .param p1, "res"    # Landroid/content/res/XResources;

    .prologue
    .line 859
    iget-boolean v0, p0, Landroid/content/res/XResources$XTypedArray;->mIsObjectInited:Z

    if-eqz v0, :cond_c

    .line 860
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Object has already been initialized"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 862
    :cond_c
    iput-object p1, p0, Landroid/content/res/XResources$XTypedArray;->mRes:Landroid/content/res/XResources;

    .line 863
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/content/res/XResources$XTypedArray;->mIsObjectInited:Z

    .line 864
    return-void
.end method
