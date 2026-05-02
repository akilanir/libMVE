.class Landroid/support/v7/app/AppCompatViewInflater;
.super Ljava/lang/Object;
.source "AppCompatViewInflater.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/app/AppCompatViewInflater$DeclaredOnClickListener;
    }
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "AppCompatViewInflater"

.field private static final sClassPrefixList:[Ljava/lang/String;

.field private static final sConstructorMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Constructor",
            "<+",
            "Landroid/view/View;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final sConstructorSignature:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private static final sOnClickAttrs:[I


# instance fields
.field private final mConstructorArgs:[Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 62
    new-array v0, v4, [Ljava/lang/Class;

    const-class v1, Landroid/content/Context;

    aput-object v1, v0, v2

    const-class v1, Landroid/util/AttributeSet;

    aput-object v1, v0, v3

    sput-object v0, Landroid/support/v7/app/AppCompatViewInflater;->sConstructorSignature:[Ljava/lang/Class;

    .line 64
    new-array v0, v3, [I

    const v1, 0x101026f

    aput v1, v0, v2

    sput-object v0, Landroid/support/v7/app/AppCompatViewInflater;->sOnClickAttrs:[I

    .line 66
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "android.widget."

    aput-object v1, v0, v2

    const-string v1, "android.view."

    aput-object v1, v0, v3

    const-string v1, "android.webkit."

    aput-object v1, v0, v4

    sput-object v0, Landroid/support/v7/app/AppCompatViewInflater;->sClassPrefixList:[Ljava/lang/String;

    .line 74
    new-instance v0, Landroid/support/v4/util/ArrayMap;

    invoke-direct {v0}, Landroid/support/v4/util/ArrayMap;-><init>()V

    sput-object v0, Landroid/support/v7/app/AppCompatViewInflater;->sConstructorMap:Ljava/util/Map;

    return-void
.end method

.method constructor <init>()V
    .registers 2

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    iput-object v0, p0, Landroid/support/v7/app/AppCompatViewInflater;->mConstructorArgs:[Ljava/lang/Object;

    .line 265
    return-void
.end method

.method private checkOnClickListener(Landroid/view/View;Landroid/util/AttributeSet;)V
    .registers 8
    .param p1, "view"    # Landroid/view/View;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 190
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 192
    .local v1, "context":Landroid/content/Context;
    instance-of v3, v1, Landroid/content/ContextWrapper;

    if-eqz v3, :cond_14

    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0xf

    if-lt v3, v4, :cond_15

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->hasOnClickListeners(Landroid/view/View;)Z

    move-result v3

    if-nez v3, :cond_15

    .line 206
    :cond_14
    :goto_14
    return-void

    .line 200
    :cond_15
    sget-object v3, Landroid/support/v7/app/AppCompatViewInflater;->sOnClickAttrs:[I

    invoke-virtual {v1, p2, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 201
    .local v0, "a":Landroid/content/res/TypedArray;
    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 202
    .local v2, "handlerName":Ljava/lang/String;
    if-eqz v2, :cond_2a

    .line 203
    new-instance v3, Landroid/support/v7/app/AppCompatViewInflater$DeclaredOnClickListener;

    invoke-direct {v3, p1, v2}, Landroid/support/v7/app/AppCompatViewInflater$DeclaredOnClickListener;-><init>(Landroid/view/View;Ljava/lang/String;)V

    invoke-virtual {p1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 205
    :cond_2a
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    goto :goto_14
.end method

.method private createView(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "prefix"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;,
            Landroid/view/InflateException;
        }
    .end annotation

    .prologue
    .line 210
    sget-object v3, Landroid/support/v7/app/AppCompatViewInflater;->sConstructorMap:Ljava/util/Map;

    invoke-interface {v3, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/reflect/Constructor;

    .line 213
    .local v1, "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<+Landroid/view/View;>;"
    if-nez v1, :cond_36

    .line 215
    :try_start_a
    invoke-virtual {p1}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v4

    if-eqz p3, :cond_43

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_21
    invoke-virtual {v4, v3}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    const-class v4, Landroid/view/View;

    invoke-virtual {v3, v4}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v0

    .line 218
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/view/View;>;"
    sget-object v3, Landroid/support/v7/app/AppCompatViewInflater;->sConstructorSignature:[Ljava/lang/Class;

    invoke-virtual {v0, v3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    .line 219
    sget-object v3, Landroid/support/v7/app/AppCompatViewInflater;->sConstructorMap:Ljava/util/Map;

    invoke-interface {v3, p2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 221
    .end local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/view/View;>;"
    :cond_36
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    .line 222
    iget-object v3, p0, Landroid/support/v7/app/AppCompatViewInflater;->mConstructorArgs:[Ljava/lang/Object;

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;
    :try_end_42
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_42} :catch_45

    .line 226
    :goto_42
    return-object v3

    :cond_43
    move-object v3, p2

    .line 215
    goto :goto_21

    .line 223
    :catch_45
    move-exception v2

    .line 226
    .local v2, "e":Ljava/lang/Exception;
    const/4 v3, 0x0

    goto :goto_42
.end method

.method private createViewFromTag(Landroid/content/Context;Ljava/lang/String;Landroid/util/AttributeSet;)Landroid/view/View;
    .registers 12
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    const/4 v3, 0x0

    .line 154
    const-string v4, "view"

    invoke-virtual {p2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_11

    .line 155
    const-string v4, "class"

    invoke-interface {p3, v3, v4}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 159
    :cond_11
    :try_start_11
    iget-object v4, p0, Landroid/support/v7/app/AppCompatViewInflater;->mConstructorArgs:[Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    .line 160
    iget-object v4, p0, Landroid/support/v7/app/AppCompatViewInflater;->mConstructorArgs:[Ljava/lang/Object;

    const/4 v5, 0x1

    aput-object p3, v4, v5

    .line 162
    const/4 v4, -0x1

    const/16 v5, 0x2e

    invoke-virtual {p2, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    if-ne v4, v5, :cond_4a

    .line 163
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_25
    sget-object v4, Landroid/support/v7/app/AppCompatViewInflater;->sClassPrefixList:[Ljava/lang/String;

    array-length v4, v4

    if-ge v1, v4, :cond_40

    .line 164
    sget-object v4, Landroid/support/v7/app/AppCompatViewInflater;->sClassPrefixList:[Ljava/lang/String;

    aget-object v4, v4, v1

    invoke-direct {p0, p1, p2, v4}, Landroid/support/v7/app/AppCompatViewInflater;->createView(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;
    :try_end_31
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_31} :catch_58
    .catchall {:try_start_11 .. :try_end_31} :catchall_63

    move-result-object v2

    .line 165
    .local v2, "view":Landroid/view/View;
    if-eqz v2, :cond_3d

    .line 179
    iget-object v4, p0, Landroid/support/v7/app/AppCompatViewInflater;->mConstructorArgs:[Ljava/lang/Object;

    aput-object v3, v4, v6

    .line 180
    iget-object v4, p0, Landroid/support/v7/app/AppCompatViewInflater;->mConstructorArgs:[Ljava/lang/Object;

    aput-object v3, v4, v7

    .end local v1    # "i":I
    .end local v2    # "view":Landroid/view/View;
    :goto_3c
    return-object v2

    .line 163
    .restart local v1    # "i":I
    .restart local v2    # "view":Landroid/view/View;
    :cond_3d
    add-int/lit8 v1, v1, 0x1

    goto :goto_25

    .line 179
    .end local v2    # "view":Landroid/view/View;
    :cond_40
    iget-object v4, p0, Landroid/support/v7/app/AppCompatViewInflater;->mConstructorArgs:[Ljava/lang/Object;

    aput-object v3, v4, v6

    .line 180
    iget-object v4, p0, Landroid/support/v7/app/AppCompatViewInflater;->mConstructorArgs:[Ljava/lang/Object;

    aput-object v3, v4, v7

    move-object v2, v3

    goto :goto_3c

    .line 171
    .end local v1    # "i":I
    :cond_4a
    const/4 v4, 0x0

    :try_start_4b
    invoke-direct {p0, p1, p2, v4}, Landroid/support/v7/app/AppCompatViewInflater;->createView(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;
    :try_end_4e
    .catch Ljava/lang/Exception; {:try_start_4b .. :try_end_4e} :catch_58
    .catchall {:try_start_4b .. :try_end_4e} :catchall_63

    move-result-object v2

    .line 179
    iget-object v4, p0, Landroid/support/v7/app/AppCompatViewInflater;->mConstructorArgs:[Ljava/lang/Object;

    aput-object v3, v4, v6

    .line 180
    iget-object v4, p0, Landroid/support/v7/app/AppCompatViewInflater;->mConstructorArgs:[Ljava/lang/Object;

    aput-object v3, v4, v7

    goto :goto_3c

    .line 173
    :catch_58
    move-exception v0

    .line 179
    .local v0, "e":Ljava/lang/Exception;
    iget-object v4, p0, Landroid/support/v7/app/AppCompatViewInflater;->mConstructorArgs:[Ljava/lang/Object;

    aput-object v3, v4, v6

    .line 180
    iget-object v4, p0, Landroid/support/v7/app/AppCompatViewInflater;->mConstructorArgs:[Ljava/lang/Object;

    aput-object v3, v4, v7

    move-object v2, v3

    goto :goto_3c

    .line 179
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_63
    move-exception v4

    iget-object v5, p0, Landroid/support/v7/app/AppCompatViewInflater;->mConstructorArgs:[Ljava/lang/Object;

    aput-object v3, v5, v6

    .line 180
    iget-object v5, p0, Landroid/support/v7/app/AppCompatViewInflater;->mConstructorArgs:[Ljava/lang/Object;

    aput-object v3, v5, v7

    throw v4
.end method

.method private static themifyContext(Landroid/content/Context;Landroid/util/AttributeSet;ZZ)Landroid/content/Context;
    .registers 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "attrs"    # Landroid/util/AttributeSet;
    .param p2, "useAndroidTheme"    # Z
    .param p3, "useAppTheme"    # Z

    .prologue
    const/4 v4, 0x0

    .line 235
    sget-object v3, Landroid/support/v7/appcompat/R$styleable;->View:[I

    invoke-virtual {p0, p1, v3, v4, v4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 236
    .local v0, "a":Landroid/content/res/TypedArray;
    const/4 v2, 0x0

    .line 237
    .local v2, "themeId":I
    if-eqz p2, :cond_10

    .line 239
    sget v3, Landroid/support/v7/appcompat/R$styleable;->View_android_theme:I

    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    .line 241
    :cond_10
    if-eqz p3, :cond_23

    if-nez v2, :cond_23

    .line 243
    sget v3, Landroid/support/v7/appcompat/R$styleable;->View_theme:I

    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    .line 245
    if-eqz v2, :cond_23

    .line 246
    const-string v3, "AppCompatViewInflater"

    const-string v4, "app:theme is now deprecated. Please move to using android:theme instead."

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 250
    :cond_23
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 252
    if-eqz v2, :cond_3b

    instance-of v3, p0, Landroid/support/v7/view/ContextThemeWrapper;

    if-eqz v3, :cond_35

    move-object v3, p0

    check-cast v3, Landroid/support/v7/view/ContextThemeWrapper;

    invoke-virtual {v3}, Landroid/support/v7/view/ContextThemeWrapper;->getThemeResId()I

    move-result v3

    if-eq v3, v2, :cond_3b

    .line 256
    :cond_35
    new-instance v1, Landroid/support/v7/view/ContextThemeWrapper;

    invoke-direct {v1, p0, v2}, Landroid/support/v7/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    .end local p0    # "context":Landroid/content/Context;
    .local v1, "context":Landroid/content/Context;
    move-object p0, v1

    .line 258
    .end local v1    # "context":Landroid/content/Context;
    .restart local p0    # "context":Landroid/content/Context;
    :cond_3b
    return-object p0
.end method


# virtual methods
.method public final createView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;ZZZ)Landroid/view/View;
    .registers 12
    .param p1, "parent"    # Landroid/view/View;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p5, "inheritContext"    # Z
    .param p6, "readAndroidTheme"    # Z
    .param p7, "readAppTheme"    # Z

    .prologue
    .line 82
    move-object v0, p3

    .line 86
    .local v0, "originalContext":Landroid/content/Context;
    if-eqz p5, :cond_9

    if-eqz p1, :cond_9

    .line 87
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p3

    .line 89
    :cond_9
    if-nez p6, :cond_d

    if-eqz p7, :cond_11

    .line 91
    :cond_d
    invoke-static {p3, p4, p6, p7}, Landroid/support/v7/app/AppCompatViewInflater;->themifyContext(Landroid/content/Context;Landroid/util/AttributeSet;ZZ)Landroid/content/Context;

    move-result-object p3

    .line 94
    :cond_11
    const/4 v1, 0x0

    .line 97
    .local v1, "view":Landroid/view/View;
    const/4 v2, -0x1

    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    move-result v3

    sparse-switch v3, :sswitch_data_110

    :cond_1a
    :goto_1a
    packed-switch v2, :pswitch_data_146

    .line 139
    :goto_1d
    if-nez v1, :cond_25

    if-eq v0, p3, :cond_25

    .line 142
    invoke-direct {p0, p3, p2, p4}, Landroid/support/v7/app/AppCompatViewInflater;->createViewFromTag(Landroid/content/Context;Ljava/lang/String;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object v1

    .line 145
    :cond_25
    if-eqz v1, :cond_2a

    .line 147
    invoke-direct {p0, v1, p4}, Landroid/support/v7/app/AppCompatViewInflater;->checkOnClickListener(Landroid/view/View;Landroid/util/AttributeSet;)V

    .line 150
    :cond_2a
    return-object v1

    .line 97
    :sswitch_2b
    const-string v3, "TextView"

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1a

    const/4 v2, 0x0

    goto :goto_1a

    :sswitch_35
    const-string v3, "ImageView"

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1a

    const/4 v2, 0x1

    goto :goto_1a

    :sswitch_3f
    const-string v3, "Button"

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1a

    const/4 v2, 0x2

    goto :goto_1a

    :sswitch_49
    const-string v3, "EditText"

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1a

    const/4 v2, 0x3

    goto :goto_1a

    :sswitch_53
    const-string v3, "Spinner"

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1a

    const/4 v2, 0x4

    goto :goto_1a

    :sswitch_5d
    const-string v3, "ImageButton"

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1a

    const/4 v2, 0x5

    goto :goto_1a

    :sswitch_67
    const-string v3, "CheckBox"

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1a

    const/4 v2, 0x6

    goto :goto_1a

    :sswitch_71
    const-string v3, "RadioButton"

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1a

    const/4 v2, 0x7

    goto :goto_1a

    :sswitch_7b
    const-string v3, "CheckedTextView"

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1a

    const/16 v2, 0x8

    goto :goto_1a

    :sswitch_86
    const-string v3, "AutoCompleteTextView"

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1a

    const/16 v2, 0x9

    goto :goto_1a

    :sswitch_91
    const-string v3, "MultiAutoCompleteTextView"

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1a

    const/16 v2, 0xa

    goto/16 :goto_1a

    :sswitch_9d
    const-string v3, "RatingBar"

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1a

    const/16 v2, 0xb

    goto/16 :goto_1a

    :sswitch_a9
    const-string v3, "SeekBar"

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1a

    const/16 v2, 0xc

    goto/16 :goto_1a

    .line 99
    :pswitch_b5
    new-instance v1, Landroid/support/v7/widget/AppCompatTextView;

    .end local v1    # "view":Landroid/view/View;
    invoke-direct {v1, p3, p4}, Landroid/support/v7/widget/AppCompatTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 100
    .restart local v1    # "view":Landroid/view/View;
    goto/16 :goto_1d

    .line 102
    :pswitch_bc
    new-instance v1, Landroid/support/v7/widget/AppCompatImageView;

    .end local v1    # "view":Landroid/view/View;
    invoke-direct {v1, p3, p4}, Landroid/support/v7/widget/AppCompatImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 103
    .restart local v1    # "view":Landroid/view/View;
    goto/16 :goto_1d

    .line 105
    :pswitch_c3
    new-instance v1, Landroid/support/v7/widget/AppCompatButton;

    .end local v1    # "view":Landroid/view/View;
    invoke-direct {v1, p3, p4}, Landroid/support/v7/widget/AppCompatButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 106
    .restart local v1    # "view":Landroid/view/View;
    goto/16 :goto_1d

    .line 108
    :pswitch_ca
    new-instance v1, Landroid/support/v7/widget/AppCompatEditText;

    .end local v1    # "view":Landroid/view/View;
    invoke-direct {v1, p3, p4}, Landroid/support/v7/widget/AppCompatEditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 109
    .restart local v1    # "view":Landroid/view/View;
    goto/16 :goto_1d

    .line 111
    :pswitch_d1
    new-instance v1, Landroid/support/v7/widget/AppCompatSpinner;

    .end local v1    # "view":Landroid/view/View;
    invoke-direct {v1, p3, p4}, Landroid/support/v7/widget/AppCompatSpinner;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 112
    .restart local v1    # "view":Landroid/view/View;
    goto/16 :goto_1d

    .line 114
    :pswitch_d8
    new-instance v1, Landroid/support/v7/widget/AppCompatImageButton;

    .end local v1    # "view":Landroid/view/View;
    invoke-direct {v1, p3, p4}, Landroid/support/v7/widget/AppCompatImageButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 115
    .restart local v1    # "view":Landroid/view/View;
    goto/16 :goto_1d

    .line 117
    :pswitch_df
    new-instance v1, Landroid/support/v7/widget/AppCompatCheckBox;

    .end local v1    # "view":Landroid/view/View;
    invoke-direct {v1, p3, p4}, Landroid/support/v7/widget/AppCompatCheckBox;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 118
    .restart local v1    # "view":Landroid/view/View;
    goto/16 :goto_1d

    .line 120
    :pswitch_e6
    new-instance v1, Landroid/support/v7/widget/AppCompatRadioButton;

    .end local v1    # "view":Landroid/view/View;
    invoke-direct {v1, p3, p4}, Landroid/support/v7/widget/AppCompatRadioButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 121
    .restart local v1    # "view":Landroid/view/View;
    goto/16 :goto_1d

    .line 123
    :pswitch_ed
    new-instance v1, Landroid/support/v7/widget/AppCompatCheckedTextView;

    .end local v1    # "view":Landroid/view/View;
    invoke-direct {v1, p3, p4}, Landroid/support/v7/widget/AppCompatCheckedTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 124
    .restart local v1    # "view":Landroid/view/View;
    goto/16 :goto_1d

    .line 126
    :pswitch_f4
    new-instance v1, Landroid/support/v7/widget/AppCompatAutoCompleteTextView;

    .end local v1    # "view":Landroid/view/View;
    invoke-direct {v1, p3, p4}, Landroid/support/v7/widget/AppCompatAutoCompleteTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 127
    .restart local v1    # "view":Landroid/view/View;
    goto/16 :goto_1d

    .line 129
    :pswitch_fb
    new-instance v1, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;

    .end local v1    # "view":Landroid/view/View;
    invoke-direct {v1, p3, p4}, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 130
    .restart local v1    # "view":Landroid/view/View;
    goto/16 :goto_1d

    .line 132
    :pswitch_102
    new-instance v1, Landroid/support/v7/widget/AppCompatRatingBar;

    .end local v1    # "view":Landroid/view/View;
    invoke-direct {v1, p3, p4}, Landroid/support/v7/widget/AppCompatRatingBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 133
    .restart local v1    # "view":Landroid/view/View;
    goto/16 :goto_1d

    .line 135
    :pswitch_109
    new-instance v1, Landroid/support/v7/widget/AppCompatSeekBar;

    .end local v1    # "view":Landroid/view/View;
    invoke-direct {v1, p3, p4}, Landroid/support/v7/widget/AppCompatSeekBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .restart local v1    # "view":Landroid/view/View;
    goto/16 :goto_1d

    .line 97
    :sswitch_data_110
    .sparse-switch
        -0x7404ceea -> :sswitch_9d
        -0x56c015e7 -> :sswitch_7b
        -0x503aa7ad -> :sswitch_91
        -0x37f7066e -> :sswitch_2b
        -0x37e04bb3 -> :sswitch_5d
        -0x274065a5 -> :sswitch_a9
        -0x1440b607 -> :sswitch_53
        0x2e46a6ed -> :sswitch_71
        0x431b5280 -> :sswitch_35
        0x5445f9ba -> :sswitch_86
        0x5f7507c3 -> :sswitch_67
        0x63577677 -> :sswitch_49
        0x77471352 -> :sswitch_3f
    .end sparse-switch

    :pswitch_data_146
    .packed-switch 0x0
        :pswitch_b5
        :pswitch_bc
        :pswitch_c3
        :pswitch_ca
        :pswitch_d1
        :pswitch_d8
        :pswitch_df
        :pswitch_e6
        :pswitch_ed
        :pswitch_f4
        :pswitch_fb
        :pswitch_102
        :pswitch_109
    .end packed-switch
.end method
