.class public Lcom/joanzapata/iconify/Iconify;
.super Ljava/lang/Object;
.source "Iconify.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/joanzapata/iconify/Iconify$IconifyInitializer;
    }
.end annotation


# static fields
.field private static iconFontDescriptors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 14
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/joanzapata/iconify/Iconify;->iconFontDescriptors:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    return-void
.end method

.method static synthetic access$000(Lcom/joanzapata/iconify/IconFontDescriptor;)V
    .registers 1
    .param p0, "x0"    # Lcom/joanzapata/iconify/IconFontDescriptor;

    .prologue
    .line 11
    invoke-static {p0}, Lcom/joanzapata/iconify/Iconify;->addIconFontDescriptor(Lcom/joanzapata/iconify/IconFontDescriptor;)V

    return-void
.end method

.method private static addIconFontDescriptor(Lcom/joanzapata/iconify/IconFontDescriptor;)V
    .registers 5
    .param p0, "iconFontDescriptor"    # Lcom/joanzapata/iconify/IconFontDescriptor;

    .prologue
    .line 42
    sget-object v1, Lcom/joanzapata/iconify/Iconify;->iconFontDescriptors:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_25

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;

    .line 43
    .local v0, "wrapper":Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;
    invoke-virtual {v0}, Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;->getIconFontDescriptor()Lcom/joanzapata/iconify/IconFontDescriptor;

    move-result-object v2

    invoke-interface {v2}, Lcom/joanzapata/iconify/IconFontDescriptor;->ttfFileName()Ljava/lang/String;

    move-result-object v2

    .line 44
    invoke-interface {p0}, Lcom/joanzapata/iconify/IconFontDescriptor;->ttfFileName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 52
    .end local v0    # "wrapper":Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;
    :goto_24
    return-void

    .line 50
    :cond_25
    sget-object v1, Lcom/joanzapata/iconify/Iconify;->iconFontDescriptors:Ljava/util/List;

    new-instance v2, Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;

    invoke-direct {v2, p0}, Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;-><init>(Lcom/joanzapata/iconify/IconFontDescriptor;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_24
.end method

.method public static varargs addIcons([Landroid/widget/TextView;)V
    .registers 6
    .param p0, "textViews"    # [Landroid/widget/TextView;

    .prologue
    .line 33
    array-length v2, p0

    const/4 v1, 0x0

    :goto_2
    if-ge v1, v2, :cond_1b

    aget-object v0, p0, v1

    .line 34
    .local v0, "textView":Landroid/widget/TextView;
    if-nez v0, :cond_b

    .line 33
    :goto_8
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 35
    :cond_b
    invoke-virtual {v0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-static {v3, v4, v0}, Lcom/joanzapata/iconify/Iconify;->compute(Landroid/content/Context;Ljava/lang/CharSequence;Landroid/widget/TextView;)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_8

    .line 37
    .end local v0    # "textView":Landroid/widget/TextView;
    :cond_1b
    return-void
.end method

.method public static compute(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 55
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/joanzapata/iconify/Iconify;->compute(Landroid/content/Context;Ljava/lang/CharSequence;Landroid/widget/TextView;)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public static compute(Landroid/content/Context;Ljava/lang/CharSequence;Landroid/widget/TextView;)Ljava/lang/CharSequence;
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "target"    # Landroid/widget/TextView;

    .prologue
    .line 59
    sget-object v0, Lcom/joanzapata/iconify/Iconify;->iconFontDescriptors:Ljava/util/List;

    invoke-static {p0, v0, p1, p2}, Lcom/joanzapata/iconify/internal/ParsingUtil;->parse(Landroid/content/Context;Ljava/util/List;Ljava/lang/CharSequence;Landroid/widget/TextView;)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method static findIconForKey(Ljava/lang/String;)Lcom/joanzapata/iconify/Icon;
    .registers 6
    .param p0, "iconKey"    # Ljava/lang/String;

    .prologue
    .line 104
    const/4 v0, 0x0

    .local v0, "i":I
    sget-object v4, Lcom/joanzapata/iconify/Iconify;->iconFontDescriptors:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v3

    .local v3, "iconFontDescriptorsSize":I
    :goto_7
    if-ge v0, v3, :cond_1b

    .line 105
    sget-object v4, Lcom/joanzapata/iconify/Iconify;->iconFontDescriptors:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;

    .line 106
    .local v2, "iconFontDescriptor":Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;
    invoke-virtual {v2, p0}, Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;->getIcon(Ljava/lang/String;)Lcom/joanzapata/iconify/Icon;

    move-result-object v1

    .line 107
    .local v1, "icon":Lcom/joanzapata/iconify/Icon;
    if-eqz v1, :cond_18

    .line 109
    .end local v1    # "icon":Lcom/joanzapata/iconify/Icon;
    .end local v2    # "iconFontDescriptor":Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;
    :goto_17
    return-object v1

    .line 104
    .restart local v1    # "icon":Lcom/joanzapata/iconify/Icon;
    .restart local v2    # "iconFontDescriptor":Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;
    :cond_18
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 109
    .end local v1    # "icon":Lcom/joanzapata/iconify/Icon;
    .end local v2    # "iconFontDescriptor":Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;
    :cond_1b
    const/4 v1, 0x0

    goto :goto_17
.end method

.method public static findTypefaceOf(Lcom/joanzapata/iconify/Icon;)Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;
    .registers 4
    .param p0, "icon"    # Lcom/joanzapata/iconify/Icon;

    .prologue
    .line 90
    sget-object v1, Lcom/joanzapata/iconify/Iconify;->iconFontDescriptors:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_19

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;

    .line 91
    .local v0, "iconFontDescriptor":Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;
    invoke-virtual {v0, p0}, Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;->hasIcon(Lcom/joanzapata/iconify/Icon;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 95
    .end local v0    # "iconFontDescriptor":Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;
    :goto_18
    return-object v0

    :cond_19
    const/4 v0, 0x0

    goto :goto_18
.end method

.method public static with(Lcom/joanzapata/iconify/IconFontDescriptor;)Lcom/joanzapata/iconify/Iconify$IconifyInitializer;
    .registers 2
    .param p0, "iconFontDescriptor"    # Lcom/joanzapata/iconify/IconFontDescriptor;

    .prologue
    .line 22
    new-instance v0, Lcom/joanzapata/iconify/Iconify$IconifyInitializer;

    invoke-direct {v0, p0}, Lcom/joanzapata/iconify/Iconify$IconifyInitializer;-><init>(Lcom/joanzapata/iconify/IconFontDescriptor;)V

    return-object v0
.end method
