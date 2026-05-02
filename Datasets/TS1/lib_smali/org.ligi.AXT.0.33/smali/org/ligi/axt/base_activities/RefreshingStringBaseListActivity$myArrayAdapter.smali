.class Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity$myArrayAdapter;
.super Landroid/widget/BaseAdapter;
.source "RefreshingStringBaseListActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "myArrayAdapter"
.end annotation


# instance fields
.field private context:Landroid/app/Activity;

.field private count:I

.field final synthetic this$0:Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity;


# direct methods
.method public constructor <init>(Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity;Landroid/app/Activity;)V
    .registers 5
    .param p1, "this$0"    # Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity;
    .param p2, "context"    # Landroid/app/Activity;

    .prologue
    .line 57
    iput-object p1, p0, Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity$myArrayAdapter;->this$0:Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity;

    .line 58
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 55
    const/4 v0, 0x0

    iput v0, p0, Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity$myArrayAdapter;->count:I

    .line 60
    iput-object p2, p0, Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity$myArrayAdapter;->context:Landroid/app/Activity;

    .line 61
    :cond_a
    iget v0, p0, Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity$myArrayAdapter;->count:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity$myArrayAdapter;->count:I

    invoke-virtual {p1, v0}, Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity;->getStringByPosition(I)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_a

    .line 62
    return-void
.end method


# virtual methods
.method public getCount()I
    .registers 2

    .prologue
    .line 73
    iget v0, p0, Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity$myArrayAdapter;->count:I

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .registers 3
    .param p1, "arg0"    # I

    .prologue
    .line 80
    const/4 v0, 0x0

    return-object v0
.end method

.method public getItemId(I)J
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 87
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 9
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 65
    iget-object v3, p0, Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity$myArrayAdapter;->context:Landroid/app/Activity;

    const-string v4, "layout_inflater"

    invoke-virtual {v3, v4}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/LayoutInflater;

    .line 66
    .local v2, "vi":Landroid/view/LayoutInflater;
    const v3, 0x1090003

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 67
    .local v1, "row":Landroid/view/View;
    const v3, 0x1020014

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 68
    .local v0, "label":Landroid/widget/TextView;
    iget-object v3, p0, Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity$myArrayAdapter;->this$0:Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity;

    invoke-virtual {v3, p1}, Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity;->getStringByPosition(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    return-object v1
.end method
