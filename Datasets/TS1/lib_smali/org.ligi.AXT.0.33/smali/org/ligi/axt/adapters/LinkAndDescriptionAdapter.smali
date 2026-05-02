.class public Lorg/ligi/axt/adapters/LinkAndDescriptionAdapter;
.super Landroid/widget/SimpleCursorAdapter;
.source "LinkAndDescriptionAdapter.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;ILandroid/database/Cursor;[Ljava/lang/String;[I)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "layout"    # I
    .param p3, "c"    # Landroid/database/Cursor;
    .param p4, "from"    # [Ljava/lang/String;
    .param p5, "to"    # [I

    .prologue
    .line 33
    invoke-direct/range {p0 .. p5}, Landroid/widget/SimpleCursorAdapter;-><init>(Landroid/content/Context;ILandroid/database/Cursor;[Ljava/lang/String;[I)V

    .line 34
    return-void
.end method

.method public static createByArray(Landroid/content/Context;[Lorg/ligi/axt/adapters/LinkWithDescription;)Landroid/widget/SimpleCursorAdapter;
    .registers 3
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "links"    # [Lorg/ligi/axt/adapters/LinkWithDescription;

    .prologue
    .line 12
    const v0, 0x109000d

    invoke-static {p0, p1, v0}, Lorg/ligi/axt/adapters/LinkAndDescriptionAdapter;->createByArray(Landroid/content/Context;[Lorg/ligi/axt/adapters/LinkWithDescription;I)Landroid/widget/SimpleCursorAdapter;

    move-result-object v0

    return-object v0
.end method

.method public static createByArray(Landroid/content/Context;[Lorg/ligi/axt/adapters/LinkWithDescription;I)Landroid/widget/SimpleCursorAdapter;
    .registers 15
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "links"    # [Lorg/ligi/axt/adapters/LinkWithDescription;
    .param p2, "resid"    # I

    .prologue
    .line 16
    const/4 v0, 0x3

    new-array v9, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "_id"

    aput-object v1, v9, v0

    const/4 v0, 0x1

    const-string v1, "name"

    aput-object v1, v9, v0

    const/4 v0, 0x2

    const-string v1, "value"

    aput-object v1, v9, v0

    .line 17
    .local v9, "matrix":[Ljava/lang/String;
    const/4 v0, 0x2

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "name"

    aput-object v1, v4, v0

    const/4 v0, 0x1

    const-string v1, "value"

    aput-object v1, v4, v0

    .line 18
    .local v4, "columns":[Ljava/lang/String;
    const/4 v0, 0x2

    new-array v5, v0, [I

    fill-array-data v5, :array_84

    .line 19
    .local v5, "layouts":[I
    new-instance v3, Landroid/database/MatrixCursor;

    invoke-direct {v3, v9}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    .line 21
    .local v3, "cursor":Landroid/database/MatrixCursor;
    const/4 v6, 0x0

    .line 22
    .local v6, "i":I
    array-length v2, p1

    const/4 v0, 0x0

    move v1, v0

    move v7, v6

    .end local v6    # "i":I
    .local v7, "i":I
    :goto_2f
    if-ge v1, v2, :cond_7c

    aget-object v8, p1, v1

    .line 23
    .local v8, "link":Lorg/ligi/axt/adapters/LinkWithDescription;
    instance-of v0, v8, Lorg/ligi/axt/adapters/LinkWithDescriptionAndTitle;

    if-eqz v0, :cond_5e

    .line 24
    const/4 v0, 0x3

    new-array v10, v0, [Ljava/lang/Object;

    const/4 v0, 0x0

    add-int/lit8 v6, v7, 0x1

    .end local v7    # "i":I
    .restart local v6    # "i":I
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v10, v0

    const/4 v11, 0x1

    move-object v0, v8

    check-cast v0, Lorg/ligi/axt/adapters/LinkWithDescriptionAndTitle;

    invoke-virtual {v0}, Lorg/ligi/axt/adapters/LinkWithDescriptionAndTitle;->getTitle()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v10, v11

    const/4 v0, 0x2

    check-cast v8, Lorg/ligi/axt/adapters/LinkWithDescriptionAndTitle;

    .end local v8    # "link":Lorg/ligi/axt/adapters/LinkWithDescription;
    invoke-virtual {v8}, Lorg/ligi/axt/adapters/LinkWithDescriptionAndTitle;->getDescription()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v10, v0

    invoke-virtual {v3, v10}, Landroid/database/MatrixCursor;->addRow([Ljava/lang/Object;)V

    .line 22
    :goto_59
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    move v7, v6

    .end local v6    # "i":I
    .restart local v7    # "i":I
    goto :goto_2f

    .line 25
    .restart local v8    # "link":Lorg/ligi/axt/adapters/LinkWithDescription;
    :cond_5e
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v10, 0x0

    add-int/lit8 v6, v7, 0x1

    .end local v7    # "i":I
    .restart local v6    # "i":I
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v0, v10

    const/4 v10, 0x1

    invoke-virtual {v8}, Lorg/ligi/axt/adapters/LinkWithDescription;->getDescription()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v0, v10

    const/4 v10, 0x2

    invoke-virtual {v8}, Lorg/ligi/axt/adapters/LinkWithDescription;->getURL()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v0, v10

    invoke-virtual {v3, v0}, Landroid/database/MatrixCursor;->addRow([Ljava/lang/Object;)V

    goto :goto_59

    .line 29
    .end local v6    # "i":I
    .end local v8    # "link":Lorg/ligi/axt/adapters/LinkWithDescription;
    .restart local v7    # "i":I
    :cond_7c
    new-instance v0, Landroid/widget/SimpleCursorAdapter;

    move-object v1, p0

    move v2, p2

    invoke-direct/range {v0 .. v5}, Landroid/widget/SimpleCursorAdapter;-><init>(Landroid/content/Context;ILandroid/database/Cursor;[Ljava/lang/String;[I)V

    return-object v0

    .line 18
    :array_84
    .array-data 4
        0x1020014
        0x1020015
    .end array-data
.end method
