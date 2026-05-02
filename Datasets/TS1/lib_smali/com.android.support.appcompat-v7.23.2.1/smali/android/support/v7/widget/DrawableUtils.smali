.class Landroid/support/v7/widget/DrawableUtils;
.super Ljava/lang/Object;
.source "DrawableUtils.java"


# static fields
.field public static final INSETS_NONE:Landroid/graphics/Rect;

.field private static final TAG:Ljava/lang/String; = "DrawableUtils"

.field private static final VECTOR_DRAWABLE_CLAZZ_NAME:Ljava/lang/String; = "android.graphics.drawable.VectorDrawable"

.field private static sInsetsClazz:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 39
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    sput-object v0, Landroid/support/v7/widget/DrawableUtils;->INSETS_NONE:Landroid/graphics/Rect;

    .line 46
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x12

    if-lt v0, v1, :cond_15

    .line 48
    :try_start_d
    const-string v0, "android.graphics.Insets"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Landroid/support/v7/widget/DrawableUtils;->sInsetsClazz:Ljava/lang/Class;
    :try_end_15
    .catch Ljava/lang/ClassNotFoundException; {:try_start_d .. :try_end_15} :catch_16

    .line 53
    :cond_15
    :goto_15
    return-void

    .line 49
    :catch_16
    move-exception v0

    goto :goto_15
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static canSafelyMutateDrawable(Landroid/graphics/drawable/Drawable;)Z
    .registers 11
    .param p0, "drawable"    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/16 v9, 0xe

    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 122
    instance-of v8, p0, Landroid/graphics/drawable/LayerDrawable;

    if-eqz v8, :cond_11

    .line 123
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v9, 0x10

    if-lt v8, v9, :cond_f

    .line 154
    .end local p0    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_e
    :goto_e
    return v6

    .restart local p0    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_f
    move v6, v7

    .line 123
    goto :goto_e

    .line 124
    :cond_11
    instance-of v8, p0, Landroid/graphics/drawable/InsetDrawable;

    if-eqz v8, :cond_1b

    .line 125
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge v8, v9, :cond_e

    move v6, v7

    goto :goto_e

    .line 126
    :cond_1b
    instance-of v8, p0, Landroid/graphics/drawable/StateListDrawable;

    if-eqz v8, :cond_27

    .line 128
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v9, 0x8

    if-ge v8, v9, :cond_e

    move v6, v7

    goto :goto_e

    .line 129
    :cond_27
    instance-of v8, p0, Landroid/graphics/drawable/GradientDrawable;

    if-eqz v8, :cond_31

    .line 132
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge v8, v9, :cond_e

    move v6, v7

    goto :goto_e

    .line 133
    :cond_31
    instance-of v8, p0, Landroid/graphics/drawable/DrawableContainer;

    if-eqz v8, :cond_55

    .line 135
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v5

    .line 136
    .local v5, "state":Landroid/graphics/drawable/Drawable$ConstantState;
    instance-of v8, v5, Landroid/graphics/drawable/DrawableContainer$DrawableContainerState;

    if-eqz v8, :cond_e

    move-object v2, v5

    .line 137
    check-cast v2, Landroid/graphics/drawable/DrawableContainer$DrawableContainerState;

    .line 139
    .local v2, "containerState":Landroid/graphics/drawable/DrawableContainer$DrawableContainerState;
    invoke-virtual {v2}, Landroid/graphics/drawable/DrawableContainer$DrawableContainerState;->getChildren()[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .local v0, "arr$":[Landroid/graphics/drawable/Drawable;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_46
    if-ge v3, v4, :cond_e

    aget-object v1, v0, v3

    .line 140
    .local v1, "child":Landroid/graphics/drawable/Drawable;
    invoke-static {v1}, Landroid/support/v7/widget/DrawableUtils;->canSafelyMutateDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result v8

    if-nez v8, :cond_52

    move v6, v7

    .line 141
    goto :goto_e

    .line 139
    :cond_52
    add-int/lit8 v3, v3, 0x1

    goto :goto_46

    .line 145
    .end local v0    # "arr$":[Landroid/graphics/drawable/Drawable;
    .end local v1    # "child":Landroid/graphics/drawable/Drawable;
    .end local v2    # "containerState":Landroid/graphics/drawable/DrawableContainer$DrawableContainerState;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    .end local v5    # "state":Landroid/graphics/drawable/Drawable$ConstantState;
    :cond_55
    instance-of v7, p0, Landroid/support/v4/graphics/drawable/DrawableWrapper;

    if-eqz v7, :cond_64

    .line 146
    check-cast p0, Landroid/support/v4/graphics/drawable/DrawableWrapper;

    .end local p0    # "drawable":Landroid/graphics/drawable/Drawable;
    invoke-interface {p0}, Landroid/support/v4/graphics/drawable/DrawableWrapper;->getWrappedDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-static {v6}, Landroid/support/v7/widget/DrawableUtils;->canSafelyMutateDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result v6

    goto :goto_e

    .line 149
    .restart local p0    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_64
    instance-of v7, p0, Landroid/support/v7/graphics/drawable/DrawableWrapper;

    if-eqz v7, :cond_e

    .line 150
    check-cast p0, Landroid/support/v7/graphics/drawable/DrawableWrapper;

    .end local p0    # "drawable":Landroid/graphics/drawable/Drawable;
    invoke-virtual {p0}, Landroid/support/v7/graphics/drawable/DrawableWrapper;->getWrappedDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-static {v6}, Landroid/support/v7/widget/DrawableUtils;->canSafelyMutateDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result v6

    goto :goto_e
.end method

.method static fixDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p0, "drawable"    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 111
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-ne v0, v1, :cond_19

    const-string v0, "android.graphics.drawable.VectorDrawable"

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_19

    .line 113
    invoke-static {p0}, Landroid/support/v7/widget/DrawableUtils;->fixVectorDrawableTinting(Landroid/graphics/drawable/Drawable;)V

    .line 115
    :cond_19
    return-void
.end method

.method private static fixVectorDrawableTinting(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p0, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 162
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object v0

    .line 163
    .local v0, "originalState":[I
    if-eqz v0, :cond_9

    array-length v1, v0

    if-nez v1, :cond_12

    .line 165
    :cond_9
    sget-object v1, Landroid/support/v7/widget/ThemeUtils;->CHECKED_STATE_SET:[I

    invoke-virtual {p0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 171
    :goto_e
    invoke-virtual {p0, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 172
    return-void

    .line 168
    :cond_12
    sget-object v1, Landroid/support/v7/widget/ThemeUtils;->EMPTY_STATE_SET:[I

    invoke-virtual {p0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    goto :goto_e
.end method

.method public static getOpticalBounds(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Rect;
    .registers 13
    .param p0, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    const/4 v9, 0x0

    .line 62
    sget-object v8, Landroid/support/v7/widget/DrawableUtils;->sInsetsClazz:Ljava/lang/Class;

    if-eqz v8, :cond_79

    .line 66
    :try_start_5
    invoke-static {p0}, Landroid/support/v4/graphics/drawable/DrawableCompat;->unwrap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    .line 68
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    const-string v10, "getOpticalInsets"

    const/4 v11, 0x0

    new-array v11, v11, [Ljava/lang/Class;

    invoke-virtual {v8, v10, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 70
    .local v3, "getOpticalInsetsMethod":Ljava/lang/reflect/Method;
    const/4 v8, 0x0

    new-array v8, v8, [Ljava/lang/Object;

    invoke-virtual {v3, p0, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 72
    .local v5, "insets":Ljava/lang/Object;
    if-eqz v5, :cond_79

    .line 74
    new-instance v7, Landroid/graphics/Rect;

    invoke-direct {v7}, Landroid/graphics/Rect;-><init>()V

    .line 76
    .local v7, "result":Landroid/graphics/Rect;
    sget-object v8, Landroid/support/v7/widget/DrawableUtils;->sInsetsClazz:Ljava/lang/Class;

    invoke-virtual {v8}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/reflect/Field;
    array-length v6, v0

    .local v6, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_2c
    if-ge v4, v6, :cond_7b

    aget-object v2, v0, v4

    .line 77
    .local v2, "field":Ljava/lang/reflect/Field;
    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v10

    const/4 v8, -0x1

    invoke-virtual {v10}, Ljava/lang/String;->hashCode()I

    move-result v11

    sparse-switch v11, :sswitch_data_92

    :cond_3c
    :goto_3c
    packed-switch v8, :pswitch_data_a4

    .line 76
    :goto_3f
    add-int/lit8 v4, v4, 0x1

    goto :goto_2c

    .line 77
    :sswitch_42
    const-string v11, "left"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_3c

    move v8, v9

    goto :goto_3c

    :sswitch_4c
    const-string v11, "top"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_3c

    const/4 v8, 0x1

    goto :goto_3c

    :sswitch_56
    const-string v11, "right"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_3c

    const/4 v8, 0x2

    goto :goto_3c

    :sswitch_60
    const-string v11, "bottom"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_3c

    const/4 v8, 0x3

    goto :goto_3c

    .line 79
    :pswitch_6a
    invoke-virtual {v2, v5}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v8

    iput v8, v7, Landroid/graphics/Rect;->left:I
    :try_end_70
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_70} :catch_71

    goto :goto_3f

    .line 94
    .end local v0    # "arr$":[Ljava/lang/reflect/Field;
    .end local v2    # "field":Ljava/lang/reflect/Field;
    .end local v3    # "getOpticalInsetsMethod":Ljava/lang/reflect/Method;
    .end local v4    # "i$":I
    .end local v5    # "insets":Ljava/lang/Object;
    .end local v6    # "len$":I
    .end local v7    # "result":Landroid/graphics/Rect;
    :catch_71
    move-exception v1

    .line 96
    .local v1, "e":Ljava/lang/Exception;
    const-string v8, "DrawableUtils"

    const-string v9, "Couldn\'t obtain the optical insets. Ignoring."

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_79
    sget-object v7, Landroid/support/v7/widget/DrawableUtils;->INSETS_NONE:Landroid/graphics/Rect;

    :cond_7b
    return-object v7

    .line 82
    .restart local v0    # "arr$":[Ljava/lang/reflect/Field;
    .restart local v2    # "field":Ljava/lang/reflect/Field;
    .restart local v3    # "getOpticalInsetsMethod":Ljava/lang/reflect/Method;
    .restart local v4    # "i$":I
    .restart local v5    # "insets":Ljava/lang/Object;
    .restart local v6    # "len$":I
    .restart local v7    # "result":Landroid/graphics/Rect;
    :pswitch_7c
    :try_start_7c
    invoke-virtual {v2, v5}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v8

    iput v8, v7, Landroid/graphics/Rect;->top:I

    goto :goto_3f

    .line 85
    :pswitch_83
    invoke-virtual {v2, v5}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v8

    iput v8, v7, Landroid/graphics/Rect;->right:I

    goto :goto_3f

    .line 88
    :pswitch_8a
    invoke-virtual {v2, v5}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v8

    iput v8, v7, Landroid/graphics/Rect;->bottom:I
    :try_end_90
    .catch Ljava/lang/Exception; {:try_start_7c .. :try_end_90} :catch_71

    goto :goto_3f

    .line 77
    nop

    :sswitch_data_92
    .sparse-switch
        -0x527265d5 -> :sswitch_60
        0x1c155 -> :sswitch_4c
        0x32a007 -> :sswitch_42
        0x677c21c -> :sswitch_56
    .end sparse-switch

    :pswitch_data_a4
    .packed-switch 0x0
        :pswitch_6a
        :pswitch_7c
        :pswitch_83
        :pswitch_8a
    .end packed-switch
.end method

.method static parseTintMode(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;
    .registers 4
    .param p0, "value"    # I
    .param p1, "defaultMode"    # Landroid/graphics/PorterDuff$Mode;

    .prologue
    .line 175
    packed-switch p0, :pswitch_data_20

    .line 184
    .end local p1    # "defaultMode":Landroid/graphics/PorterDuff$Mode;
    :cond_3
    :goto_3
    :pswitch_3
    return-object p1

    .line 176
    .restart local p1    # "defaultMode":Landroid/graphics/PorterDuff$Mode;
    :pswitch_4
    sget-object p1, Landroid/graphics/PorterDuff$Mode;->SRC_OVER:Landroid/graphics/PorterDuff$Mode;

    goto :goto_3

    .line 177
    :pswitch_7
    sget-object p1, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    goto :goto_3

    .line 178
    :pswitch_a
    sget-object p1, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    goto :goto_3

    .line 179
    :pswitch_d
    sget-object p1, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    goto :goto_3

    .line 180
    :pswitch_10
    sget-object p1, Landroid/graphics/PorterDuff$Mode;->SCREEN:Landroid/graphics/PorterDuff$Mode;

    goto :goto_3

    .line 181
    :pswitch_13
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_3

    const-string v0, "ADD"

    invoke-static {v0}, Landroid/graphics/PorterDuff$Mode;->valueOf(Ljava/lang/String;)Landroid/graphics/PorterDuff$Mode;

    move-result-object p1

    goto :goto_3

    .line 175
    :pswitch_data_20
    .packed-switch 0x3
        :pswitch_4
        :pswitch_3
        :pswitch_7
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_a
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_d
        :pswitch_10
        :pswitch_13
    .end packed-switch
.end method
