.class Lcom/rey/material/widget/Spinner$DropDownAdapter;
.super Ljava/lang/Object;
.source "Spinner.java"

# interfaces
.implements Landroid/widget/ListAdapter;
.implements Landroid/widget/SpinnerAdapter;
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/widget/Spinner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DropDownAdapter"
.end annotation


# instance fields
.field private mAdapter:Landroid/widget/SpinnerAdapter;

.field private mListAdapter:Landroid/widget/ListAdapter;

.field private mOnItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;


# direct methods
.method public constructor <init>(Landroid/widget/SpinnerAdapter;)V
    .registers 3
    .param p1, "adapter"    # Landroid/widget/SpinnerAdapter;

    .prologue
    .line 1080
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1081
    iput-object p1, p0, Lcom/rey/material/widget/Spinner$DropDownAdapter;->mAdapter:Landroid/widget/SpinnerAdapter;

    .line 1082
    instance-of v0, p1, Landroid/widget/ListAdapter;

    if-eqz v0, :cond_d

    .line 1083
    check-cast p1, Landroid/widget/ListAdapter;

    .end local p1    # "adapter":Landroid/widget/SpinnerAdapter;
    iput-object p1, p0, Lcom/rey/material/widget/Spinner$DropDownAdapter;->mListAdapter:Landroid/widget/ListAdapter;

    .line 1084
    :cond_d
    return-void
.end method


# virtual methods
.method public areAllItemsEnabled()Z
    .registers 3

    .prologue
    .line 1129
    iget-object v0, p0, Lcom/rey/material/widget/Spinner$DropDownAdapter;->mListAdapter:Landroid/widget/ListAdapter;

    .line 1130
    .local v0, "adapter":Landroid/widget/ListAdapter;
    if-eqz v0, :cond_a

    invoke-interface {v0}, Landroid/widget/ListAdapter;->areAllItemsEnabled()Z

    move-result v1

    if-eqz v1, :cond_c

    :cond_a
    const/4 v1, 0x1

    :goto_b
    return v1

    :cond_c
    const/4 v1, 0x0

    goto :goto_b
.end method

.method public getCount()I
    .registers 2

    .prologue
    .line 1098
    iget-object v0, p0, Lcom/rey/material/widget/Spinner$DropDownAdapter;->mAdapter:Landroid/widget/SpinnerAdapter;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lcom/rey/material/widget/Spinner$DropDownAdapter;->mAdapter:Landroid/widget/SpinnerAdapter;

    invoke-interface {v0}, Landroid/widget/SpinnerAdapter;->getCount()I

    move-result v0

    goto :goto_5
.end method

.method public getDropDownView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 5
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 1117
    iget-object v0, p0, Lcom/rey/material/widget/Spinner$DropDownAdapter;->mAdapter:Landroid/widget/SpinnerAdapter;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lcom/rey/material/widget/Spinner$DropDownAdapter;->mAdapter:Landroid/widget/SpinnerAdapter;

    invoke-interface {v0, p1, p2, p3}, Landroid/widget/SpinnerAdapter;->getDropDownView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    goto :goto_5
.end method

.method public getItem(I)Ljava/lang/Object;
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 1102
    iget-object v0, p0, Lcom/rey/material/widget/Spinner$DropDownAdapter;->mAdapter:Landroid/widget/SpinnerAdapter;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lcom/rey/material/widget/Spinner$DropDownAdapter;->mAdapter:Landroid/widget/SpinnerAdapter;

    invoke-interface {v0, p1}, Landroid/widget/SpinnerAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    goto :goto_5
.end method

.method public getItemId(I)J
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 1106
    iget-object v0, p0, Lcom/rey/material/widget/Spinner$DropDownAdapter;->mAdapter:Landroid/widget/SpinnerAdapter;

    if-nez v0, :cond_7

    const-wide/16 v0, -0x1

    :goto_6
    return-wide v0

    :cond_7
    iget-object v0, p0, Lcom/rey/material/widget/Spinner$DropDownAdapter;->mAdapter:Landroid/widget/SpinnerAdapter;

    invoke-interface {v0, p1}, Landroid/widget/SpinnerAdapter;->getItemId(I)J

    move-result-wide v0

    goto :goto_6
.end method

.method public getItemViewType(I)I
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 1143
    iget-object v0, p0, Lcom/rey/material/widget/Spinner$DropDownAdapter;->mListAdapter:Landroid/widget/ListAdapter;

    .line 1144
    .local v0, "adapter":Landroid/widget/ListAdapter;
    if-eqz v0, :cond_9

    .line 1145
    invoke-interface {v0, p1}, Landroid/widget/ListAdapter;->getItemViewType(I)I

    move-result v1

    .line 1147
    :goto_8
    return v1

    :cond_9
    const/4 v1, 0x0

    goto :goto_8
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 6
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 1110
    invoke-virtual {p0, p1, p2, p3}, Lcom/rey/material/widget/Spinner$DropDownAdapter;->getDropDownView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 1111
    .local v0, "v":Landroid/view/View;
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1112
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 1113
    return-object v0
.end method

.method public getViewTypeCount()I
    .registers 3

    .prologue
    .line 1151
    iget-object v0, p0, Lcom/rey/material/widget/Spinner$DropDownAdapter;->mListAdapter:Landroid/widget/ListAdapter;

    .line 1152
    .local v0, "adapter":Landroid/widget/ListAdapter;
    if-eqz v0, :cond_9

    .line 1153
    invoke-interface {v0}, Landroid/widget/ListAdapter;->getViewTypeCount()I

    move-result v1

    .line 1155
    :goto_8
    return v1

    :cond_9
    const/4 v1, 0x1

    goto :goto_8
.end method

.method public hasStableIds()Z
    .registers 2

    .prologue
    .line 1121
    iget-object v0, p0, Lcom/rey/material/widget/Spinner$DropDownAdapter;->mAdapter:Landroid/widget/SpinnerAdapter;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/rey/material/widget/Spinner$DropDownAdapter;->mAdapter:Landroid/widget/SpinnerAdapter;

    invoke-interface {v0}, Landroid/widget/SpinnerAdapter;->hasStableIds()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 1159
    invoke-virtual {p0}, Lcom/rey/material/widget/Spinner$DropDownAdapter;->getCount()I

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isEnabled(I)Z
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 1138
    iget-object v0, p0, Lcom/rey/material/widget/Spinner$DropDownAdapter;->mListAdapter:Landroid/widget/ListAdapter;

    .line 1139
    .local v0, "adapter":Landroid/widget/ListAdapter;
    if-eqz v0, :cond_a

    invoke-interface {v0, p1}, Landroid/widget/ListAdapter;->isEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_c

    :cond_a
    const/4 v1, 0x1

    :goto_b
    return v1

    :cond_c
    const/4 v1, 0x0

    goto :goto_b
.end method

.method public onClick(Landroid/view/View;)V
    .registers 8
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1092
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 1093
    .local v3, "position":I
    iget-object v0, p0, Lcom/rey/material/widget/Spinner$DropDownAdapter;->mOnItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    if-eqz v0, :cond_17

    .line 1094
    iget-object v0, p0, Lcom/rey/material/widget/Spinner$DropDownAdapter;->mOnItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    const/4 v1, 0x0

    const-wide/16 v4, 0x0

    move-object v2, p1

    invoke-interface/range {v0 .. v5}, Landroid/widget/AdapterView$OnItemClickListener;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    .line 1095
    :cond_17
    return-void
.end method

.method public registerDataSetObserver(Landroid/database/DataSetObserver;)V
    .registers 3
    .param p1, "observer"    # Landroid/database/DataSetObserver;

    .prologue
    .line 1164
    iget-object v0, p0, Lcom/rey/material/widget/Spinner$DropDownAdapter;->mAdapter:Landroid/widget/SpinnerAdapter;

    if-eqz v0, :cond_9

    .line 1165
    iget-object v0, p0, Lcom/rey/material/widget/Spinner$DropDownAdapter;->mAdapter:Landroid/widget/SpinnerAdapter;

    invoke-interface {v0, p1}, Landroid/widget/SpinnerAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 1166
    :cond_9
    return-void
.end method

.method public setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V
    .registers 2
    .param p1, "listener"    # Landroid/widget/AdapterView$OnItemClickListener;

    .prologue
    .line 1087
    iput-object p1, p0, Lcom/rey/material/widget/Spinner$DropDownAdapter;->mOnItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    .line 1088
    return-void
.end method

.method public unregisterDataSetObserver(Landroid/database/DataSetObserver;)V
    .registers 3
    .param p1, "observer"    # Landroid/database/DataSetObserver;

    .prologue
    .line 1170
    iget-object v0, p0, Lcom/rey/material/widget/Spinner$DropDownAdapter;->mAdapter:Landroid/widget/SpinnerAdapter;

    if-eqz v0, :cond_9

    .line 1171
    iget-object v0, p0, Lcom/rey/material/widget/Spinner$DropDownAdapter;->mAdapter:Landroid/widget/SpinnerAdapter;

    invoke-interface {v0, p1}, Landroid/widget/SpinnerAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 1172
    :cond_9
    return-void
.end method
