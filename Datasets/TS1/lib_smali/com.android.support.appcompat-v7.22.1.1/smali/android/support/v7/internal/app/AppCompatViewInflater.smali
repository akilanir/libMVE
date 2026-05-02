.class public Landroid/support/v7/internal/app/AppCompatViewInflater;
.super Ljava/lang/Object;
.source "AppCompatViewInflater.java"


# static fields
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

.field static final sConstructorSignature:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field


# instance fields
.field private final mConstructorArgs:[Ljava/lang/Object;

.field private final mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 52
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Class;

    const/4 v1, 0x0

    const-class v2, Landroid/content/Context;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-class v2, Landroid/util/AttributeSet;

    aput-object v2, v0, v1

    sput-object v0, Landroid/support/v7/internal/app/AppCompatViewInflater;->sConstructorSignature:[Ljava/lang/Class;

    .line 55
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Landroid/support/v7/internal/app/AppCompatViewInflater;->sConstructorMap:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    iput-object v0, p0, Landroid/support/v7/internal/app/AppCompatViewInflater;->mConstructorArgs:[Ljava/lang/Object;

    .line 61
    iput-object p1, p0, Landroid/support/v7/internal/app/AppCompatViewInflater;->mContext:Landroid/content/Context;

    .line 62
    return-void
.end method

.method private createView(Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;
    .registers 8
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "prefix"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;,
            Landroid/view/InflateException;
        }
    .end annotation

    .prologue
    .line 139
    sget-object v3, Landroid/support/v7/internal/app/AppCompatViewInflater;->sConstructorMap:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/reflect/Constructor;

    .line 142
    .local v1, "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<+Landroid/view/View;>;"
    if-nez v1, :cond_38

    .line 144
    :try_start_a
    iget-object v3, p0, Landroid/support/v7/internal/app/AppCompatViewInflater;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v4

    if-eqz p2, :cond_45

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_23
    invoke-virtual {v4, v3}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    const-class v4, Landroid/view/View;

    invoke-virtual {v3, v4}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v0

    .line 147
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/view/View;>;"
    sget-object v3, Landroid/support/v7/internal/app/AppCompatViewInflater;->sConstructorSignature:[Ljava/lang/Class;

    invoke-virtual {v0, v3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    .line 148
    sget-object v3, Landroid/support/v7/internal/app/AppCompatViewInflater;->sConstructorMap:Ljava/util/Map;

    invoke-interface {v3, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    .end local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/view/View;>;"
    :cond_38
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    .line 151
    iget-object v3, p0, Landroid/support/v7/internal/app/AppCompatViewInflater;->mConstructorArgs:[Ljava/lang/Object;

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;
    :try_end_44
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_44} :catch_47

    .line 155
    :goto_44
    return-object v3

    :cond_45
    move-object v3, p1

    .line 144
    goto :goto_23

    .line 152
    :catch_47
    move-exception v2

    .line 155
    .local v2, "e":Ljava/lang/Exception;
    const/4 v3, 0x0

    goto :goto_44
.end method

.method private createViewFromTag(Landroid/content/Context;Ljava/lang/String;Landroid/util/AttributeSet;)Landroid/view/View;
    .registers 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    const/4 v2, 0x0

    .line 112
    const-string v1, "view"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_11

    .line 113
    const-string v1, "class"

    invoke-interface {p3, v2, v1}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 117
    :cond_11
    :try_start_11
    iget-object v1, p0, Landroid/support/v7/internal/app/AppCompatViewInflater;->mConstructorArgs:[Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v1, v3

    .line 118
    iget-object v1, p0, Landroid/support/v7/internal/app/AppCompatViewInflater;->mConstructorArgs:[Ljava/lang/Object;

    const/4 v3, 0x1

    aput-object p3, v1, v3

    .line 120
    const/4 v1, -0x1

    const/16 v3, 0x2e

    invoke-virtual {p2, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    if-ne v1, v3, :cond_33

    .line 122
    const-string v1, "android.widget."

    invoke-direct {p0, p2, v1}, Landroid/support/v7/internal/app/AppCompatViewInflater;->createView(Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;
    :try_end_29
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_29} :catch_41
    .catchall {:try_start_11 .. :try_end_29} :catchall_4c

    move-result-object v1

    .line 132
    iget-object v3, p0, Landroid/support/v7/internal/app/AppCompatViewInflater;->mConstructorArgs:[Ljava/lang/Object;

    aput-object v2, v3, v4

    .line 133
    iget-object v3, p0, Landroid/support/v7/internal/app/AppCompatViewInflater;->mConstructorArgs:[Ljava/lang/Object;

    aput-object v2, v3, v5

    :goto_32
    return-object v1

    .line 124
    :cond_33
    const/4 v1, 0x0

    :try_start_34
    invoke-direct {p0, p2, v1}, Landroid/support/v7/internal/app/AppCompatViewInflater;->createView(Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_34 .. :try_end_37} :catch_41
    .catchall {:try_start_34 .. :try_end_37} :catchall_4c

    move-result-object v1

    .line 132
    iget-object v3, p0, Landroid/support/v7/internal/app/AppCompatViewInflater;->mConstructorArgs:[Ljava/lang/Object;

    aput-object v2, v3, v4

    .line 133
    iget-object v3, p0, Landroid/support/v7/internal/app/AppCompatViewInflater;->mConstructorArgs:[Ljava/lang/Object;

    aput-object v2, v3, v5

    goto :goto_32

    .line 126
    :catch_41
    move-exception v0

    .line 132
    .local v0, "e":Ljava/lang/Exception;
    iget-object v1, p0, Landroid/support/v7/internal/app/AppCompatViewInflater;->mConstructorArgs:[Ljava/lang/Object;

    aput-object v2, v1, v4

    .line 133
    iget-object v1, p0, Landroid/support/v7/internal/app/AppCompatViewInflater;->mConstructorArgs:[Ljava/lang/Object;

    aput-object v2, v1, v5

    move-object v1, v2

    goto :goto_32

    .line 132
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_4c
    move-exception v1

    iget-object v3, p0, Landroid/support/v7/internal/app/AppCompatViewInflater;->mConstructorArgs:[Ljava/lang/Object;

    aput-object v2, v3, v4

    .line 133
    iget-object v3, p0, Landroid/support/v7/internal/app/AppCompatViewInflater;->mConstructorArgs:[Ljava/lang/Object;

    aput-object v2, v3, v5

    throw v1
.end method


# virtual methods
.method public final createView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;ZZ)Landroid/view/View;
    .registers 11
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
    .param p6, "themeContext"    # Z

    .prologue
    const/4 v2, 0x1

    .line 66
    move-object v0, p3

    .line 70
    .local v0, "originalContext":Landroid/content/Context;
    if-eqz p5, :cond_a

    if-eqz p1, :cond_a

    .line 71
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p3

    .line 73
    :cond_a
    if-eqz p6, :cond_10

    .line 75
    invoke-static {p3, p4, v2, v2}, Landroid/support/v7/internal/widget/ViewUtils;->themifyContext(Landroid/content/Context;Landroid/util/AttributeSet;ZZ)Landroid/content/Context;

    move-result-object p3

    .line 79
    :cond_10
    const/4 v1, -0x1

    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    move-result v3

    sparse-switch v3, :sswitch_data_ce

    :cond_18
    :goto_18
    packed-switch v1, :pswitch_data_f8

    .line 102
    if-eq v0, p3, :cond_ca

    .line 105
    invoke-direct {p0, p3, p2, p4}, Landroid/support/v7/internal/app/AppCompatViewInflater;->createViewFromTag(Landroid/content/Context;Ljava/lang/String;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object v1

    .line 108
    :goto_21
    return-object v1

    .line 79
    :sswitch_22
    const-string v2, "EditText"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_18

    const/4 v1, 0x0

    goto :goto_18

    :sswitch_2c
    const-string v3, "Spinner"

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_18

    move v1, v2

    goto :goto_18

    :sswitch_36
    const-string v2, "CheckBox"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_18

    const/4 v1, 0x2

    goto :goto_18

    :sswitch_40
    const-string v2, "RadioButton"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_18

    const/4 v1, 0x3

    goto :goto_18

    :sswitch_4a
    const-string v2, "CheckedTextView"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_18

    const/4 v1, 0x4

    goto :goto_18

    :sswitch_54
    const-string v2, "AutoCompleteTextView"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_18

    const/4 v1, 0x5

    goto :goto_18

    :sswitch_5e
    const-string v2, "MultiAutoCompleteTextView"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_18

    const/4 v1, 0x6

    goto :goto_18

    :sswitch_68
    const-string v2, "RatingBar"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_18

    const/4 v1, 0x7

    goto :goto_18

    :sswitch_72
    const-string v2, "Button"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_18

    const/16 v1, 0x8

    goto :goto_18

    :sswitch_7d
    const-string v2, "TextView"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_18

    const/16 v1, 0x9

    goto :goto_18

    .line 81
    :pswitch_88
    new-instance v1, Landroid/support/v7/widget/AppCompatEditText;

    invoke-direct {v1, p3, p4}, Landroid/support/v7/widget/AppCompatEditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto :goto_21

    .line 83
    :pswitch_8e
    new-instance v1, Landroid/support/v7/widget/AppCompatSpinner;

    invoke-direct {v1, p3, p4}, Landroid/support/v7/widget/AppCompatSpinner;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto :goto_21

    .line 85
    :pswitch_94
    new-instance v1, Landroid/support/v7/widget/AppCompatCheckBox;

    invoke-direct {v1, p3, p4}, Landroid/support/v7/widget/AppCompatCheckBox;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto :goto_21

    .line 87
    :pswitch_9a
    new-instance v1, Landroid/support/v7/widget/AppCompatRadioButton;

    invoke-direct {v1, p3, p4}, Landroid/support/v7/widget/AppCompatRadioButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto :goto_21

    .line 89
    :pswitch_a0
    new-instance v1, Landroid/support/v7/widget/AppCompatCheckedTextView;

    invoke-direct {v1, p3, p4}, Landroid/support/v7/widget/AppCompatCheckedTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto/16 :goto_21

    .line 91
    :pswitch_a7
    new-instance v1, Landroid/support/v7/widget/AppCompatAutoCompleteTextView;

    invoke-direct {v1, p3, p4}, Landroid/support/v7/widget/AppCompatAutoCompleteTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto/16 :goto_21

    .line 93
    :pswitch_ae
    new-instance v1, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;

    invoke-direct {v1, p3, p4}, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto/16 :goto_21

    .line 95
    :pswitch_b5
    new-instance v1, Landroid/support/v7/widget/AppCompatRatingBar;

    invoke-direct {v1, p3, p4}, Landroid/support/v7/widget/AppCompatRatingBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto/16 :goto_21

    .line 97
    :pswitch_bc
    new-instance v1, Landroid/support/v7/widget/AppCompatButton;

    invoke-direct {v1, p3, p4}, Landroid/support/v7/widget/AppCompatButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto/16 :goto_21

    .line 99
    :pswitch_c3
    new-instance v1, Landroid/support/v7/widget/AppCompatTextView;

    invoke-direct {v1, p3, p4}, Landroid/support/v7/widget/AppCompatTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto/16 :goto_21

    .line 108
    :cond_ca
    const/4 v1, 0x0

    goto/16 :goto_21

    .line 79
    nop

    :sswitch_data_ce
    .sparse-switch
        -0x7404ceea -> :sswitch_68
        -0x56c015e7 -> :sswitch_4a
        -0x503aa7ad -> :sswitch_5e
        -0x37f7066e -> :sswitch_7d
        -0x1440b607 -> :sswitch_2c
        0x2e46a6ed -> :sswitch_40
        0x5445f9ba -> :sswitch_54
        0x5f7507c3 -> :sswitch_36
        0x63577677 -> :sswitch_22
        0x77471352 -> :sswitch_72
    .end sparse-switch

    :pswitch_data_f8
    .packed-switch 0x0
        :pswitch_88
        :pswitch_8e
        :pswitch_94
        :pswitch_9a
        :pswitch_a0
        :pswitch_a7
        :pswitch_ae
        :pswitch_b5
        :pswitch_bc
        :pswitch_c3
    .end packed-switch
.end method
