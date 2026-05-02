.class public Lcom/actionbarsherlock/view/MenuInflater;
.super Ljava/lang/Object;
.source "MenuInflater.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/actionbarsherlock/view/MenuInflater$MenuState;,
        Lcom/actionbarsherlock/view/MenuInflater$InflatedOnMenuItemClickListener;
    }
.end annotation


# static fields
.field private static final ACTION_PROVIDER_CONSTRUCTOR_SIGNATURE:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private static final ACTION_VIEW_CONSTRUCTOR_SIGNATURE:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private static final LOG_TAG:Ljava/lang/String; = "MenuInflater"

.field private static final NO_ID:I = 0x0

.field private static final XML_GROUP:Ljava/lang/String; = "group"

.field private static final XML_ITEM:Ljava/lang/String; = "item"

.field private static final XML_MENU:Ljava/lang/String; = "menu"


# instance fields
.field private final mActionProviderConstructorArguments:[Ljava/lang/Object;

.field private final mActionViewConstructorArguments:[Ljava/lang/Object;

.field private mContext:Landroid/content/Context;

.field private mRealOwner:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 61
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Class;

    const/4 v1, 0x0

    const-class v2, Landroid/content/Context;

    aput-object v2, v0, v1

    sput-object v0, Lcom/actionbarsherlock/view/MenuInflater;->ACTION_VIEW_CONSTRUCTOR_SIGNATURE:[Ljava/lang/Class;

    .line 63
    sget-object v0, Lcom/actionbarsherlock/view/MenuInflater;->ACTION_VIEW_CONSTRUCTOR_SIGNATURE:[Ljava/lang/Class;

    sput-object v0, Lcom/actionbarsherlock/view/MenuInflater;->ACTION_PROVIDER_CONSTRUCTOR_SIGNATURE:[Ljava/lang/Class;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    iput-object p1, p0, Lcom/actionbarsherlock/view/MenuInflater;->mContext:Landroid/content/Context;

    .line 79
    iput-object p1, p0, Lcom/actionbarsherlock/view/MenuInflater;->mRealOwner:Ljava/lang/Object;

    .line 80
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    iput-object v0, p0, Lcom/actionbarsherlock/view/MenuInflater;->mActionViewConstructorArguments:[Ljava/lang/Object;

    .line 81
    iget-object v0, p0, Lcom/actionbarsherlock/view/MenuInflater;->mActionViewConstructorArguments:[Ljava/lang/Object;

    iput-object v0, p0, Lcom/actionbarsherlock/view/MenuInflater;->mActionProviderConstructorArguments:[Ljava/lang/Object;

    .line 82
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/Object;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "realOwner"    # Ljava/lang/Object;

    .prologue
    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    iput-object p1, p0, Lcom/actionbarsherlock/view/MenuInflater;->mContext:Landroid/content/Context;

    .line 92
    iput-object p2, p0, Lcom/actionbarsherlock/view/MenuInflater;->mRealOwner:Ljava/lang/Object;

    .line 93
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    iput-object v0, p0, Lcom/actionbarsherlock/view/MenuInflater;->mActionViewConstructorArguments:[Ljava/lang/Object;

    .line 94
    iget-object v0, p0, Lcom/actionbarsherlock/view/MenuInflater;->mActionViewConstructorArguments:[Ljava/lang/Object;

    iput-object v0, p0, Lcom/actionbarsherlock/view/MenuInflater;->mActionProviderConstructorArguments:[Ljava/lang/Object;

    .line 95
    return-void
.end method

.method static synthetic access$100(Lcom/actionbarsherlock/view/MenuInflater;)Landroid/content/Context;
    .registers 2
    .param p0, "x0"    # Lcom/actionbarsherlock/view/MenuInflater;

    .prologue
    .line 47
    iget-object v0, p0, Lcom/actionbarsherlock/view/MenuInflater;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$200()[Ljava/lang/Class;
    .registers 1

    .prologue
    .line 47
    sget-object v0, Lcom/actionbarsherlock/view/MenuInflater;->ACTION_PROVIDER_CONSTRUCTOR_SIGNATURE:[Ljava/lang/Class;

    return-object v0
.end method

.method static synthetic access$300(Lcom/actionbarsherlock/view/MenuInflater;)[Ljava/lang/Object;
    .registers 2
    .param p0, "x0"    # Lcom/actionbarsherlock/view/MenuInflater;

    .prologue
    .line 47
    iget-object v0, p0, Lcom/actionbarsherlock/view/MenuInflater;->mActionProviderConstructorArguments:[Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$400(Lcom/actionbarsherlock/view/MenuInflater;)Ljava/lang/Object;
    .registers 2
    .param p0, "x0"    # Lcom/actionbarsherlock/view/MenuInflater;

    .prologue
    .line 47
    iget-object v0, p0, Lcom/actionbarsherlock/view/MenuInflater;->mRealOwner:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$500()[Ljava/lang/Class;
    .registers 1

    .prologue
    .line 47
    sget-object v0, Lcom/actionbarsherlock/view/MenuInflater;->ACTION_VIEW_CONSTRUCTOR_SIGNATURE:[Ljava/lang/Class;

    return-object v0
.end method

.method static synthetic access$600(Lcom/actionbarsherlock/view/MenuInflater;)[Ljava/lang/Object;
    .registers 2
    .param p0, "x0"    # Lcom/actionbarsherlock/view/MenuInflater;

    .prologue
    .line 47
    iget-object v0, p0, Lcom/actionbarsherlock/view/MenuInflater;->mActionViewConstructorArguments:[Ljava/lang/Object;

    return-object v0
.end method

.method private parseMenu(Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Lcom/actionbarsherlock/view/Menu;)V
    .registers 14
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "menu"    # Lcom/actionbarsherlock/view/Menu;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 128
    new-instance v2, Lcom/actionbarsherlock/view/MenuInflater$MenuState;

    invoke-direct {v2, p0, p3}, Lcom/actionbarsherlock/view/MenuInflater$MenuState;-><init>(Lcom/actionbarsherlock/view/MenuInflater;Lcom/actionbarsherlock/view/Menu;)V

    .line 130
    .local v2, "menuState":Lcom/actionbarsherlock/view/MenuInflater$MenuState;
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v0

    .line 132
    .local v0, "eventType":I
    const/4 v1, 0x0

    .line 133
    .local v1, "lookingForEndOfUnknownTag":Z
    const/4 v6, 0x0

    .line 137
    .local v6, "unknownTagName":Ljava/lang/String;
    :cond_b
    const/4 v7, 0x2

    if-ne v0, v7, :cond_42

    .line 138
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v5

    .line 139
    .local v5, "tagName":Ljava/lang/String;
    const-string v7, "menu"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_29

    .line 141
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v0

    .line 150
    .end local v5    # "tagName":Ljava/lang/String;
    :goto_1e
    const/4 v3, 0x0

    .line 151
    .local v3, "reachedEndOfMenu":Z
    :goto_1f
    if-nez v3, :cond_d1

    .line 152
    packed-switch v0, :pswitch_data_d2

    .line 202
    :cond_24
    :goto_24
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v0

    goto :goto_1f

    .line 145
    .end local v3    # "reachedEndOfMenu":Z
    .restart local v5    # "tagName":Ljava/lang/String;
    :cond_29
    new-instance v7, Ljava/lang/RuntimeException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Expecting menu, got "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 147
    .end local v5    # "tagName":Ljava/lang/String;
    :cond_42
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v0

    .line 148
    const/4 v7, 0x1

    if-ne v0, v7, :cond_b

    goto :goto_1e

    .line 154
    .restart local v3    # "reachedEndOfMenu":Z
    :pswitch_4a
    if-nez v1, :cond_24

    .line 158
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v5

    .line 159
    .restart local v5    # "tagName":Ljava/lang/String;
    const-string v7, "group"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5c

    .line 160
    invoke-virtual {v2, p2}, Lcom/actionbarsherlock/view/MenuInflater$MenuState;->readGroup(Landroid/util/AttributeSet;)V

    goto :goto_24

    .line 161
    :cond_5c
    const-string v7, "item"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_68

    .line 162
    invoke-virtual {v2, p2}, Lcom/actionbarsherlock/view/MenuInflater$MenuState;->readItem(Landroid/util/AttributeSet;)V

    goto :goto_24

    .line 163
    :cond_68
    const-string v7, "menu"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_78

    .line 165
    invoke-virtual {v2}, Lcom/actionbarsherlock/view/MenuInflater$MenuState;->addSubMenuItem()Lcom/actionbarsherlock/view/SubMenu;

    move-result-object v4

    .line 168
    .local v4, "subMenu":Lcom/actionbarsherlock/view/SubMenu;
    invoke-direct {p0, p1, p2, v4}, Lcom/actionbarsherlock/view/MenuInflater;->parseMenu(Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Lcom/actionbarsherlock/view/Menu;)V

    goto :goto_24

    .line 170
    .end local v4    # "subMenu":Lcom/actionbarsherlock/view/SubMenu;
    :cond_78
    const/4 v1, 0x1

    .line 171
    move-object v6, v5

    .line 173
    goto :goto_24

    .line 176
    .end local v5    # "tagName":Ljava/lang/String;
    :pswitch_7b
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v5

    .line 177
    .restart local v5    # "tagName":Ljava/lang/String;
    if-eqz v1, :cond_8a

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_8a

    .line 178
    const/4 v1, 0x0

    .line 179
    const/4 v6, 0x0

    goto :goto_24

    .line 180
    :cond_8a
    const-string v7, "group"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_96

    .line 181
    invoke-virtual {v2}, Lcom/actionbarsherlock/view/MenuInflater$MenuState;->resetGroup()V

    goto :goto_24

    .line 182
    :cond_96
    const-string v7, "item"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_be

    .line 185
    invoke-virtual {v2}, Lcom/actionbarsherlock/view/MenuInflater$MenuState;->hasAddedItem()Z

    move-result v7

    if-nez v7, :cond_24

    .line 186
    # getter for: Lcom/actionbarsherlock/view/MenuInflater$MenuState;->itemActionProvider:Lcom/actionbarsherlock/view/ActionProvider;
    invoke-static {v2}, Lcom/actionbarsherlock/view/MenuInflater$MenuState;->access$000(Lcom/actionbarsherlock/view/MenuInflater$MenuState;)Lcom/actionbarsherlock/view/ActionProvider;

    move-result-object v7

    if-eqz v7, :cond_b9

    .line 187
    # getter for: Lcom/actionbarsherlock/view/MenuInflater$MenuState;->itemActionProvider:Lcom/actionbarsherlock/view/ActionProvider;
    invoke-static {v2}, Lcom/actionbarsherlock/view/MenuInflater$MenuState;->access$000(Lcom/actionbarsherlock/view/MenuInflater$MenuState;)Lcom/actionbarsherlock/view/ActionProvider;

    move-result-object v7

    invoke-virtual {v7}, Lcom/actionbarsherlock/view/ActionProvider;->hasSubMenu()Z

    move-result v7

    if-eqz v7, :cond_b9

    .line 188
    invoke-virtual {v2}, Lcom/actionbarsherlock/view/MenuInflater$MenuState;->addSubMenuItem()Lcom/actionbarsherlock/view/SubMenu;

    goto/16 :goto_24

    .line 190
    :cond_b9
    invoke-virtual {v2}, Lcom/actionbarsherlock/view/MenuInflater$MenuState;->addItem()V

    goto/16 :goto_24

    .line 193
    :cond_be
    const-string v7, "menu"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_24

    .line 194
    const/4 v3, 0x1

    goto/16 :goto_24

    .line 199
    .end local v5    # "tagName":Ljava/lang/String;
    :pswitch_c9
    new-instance v7, Ljava/lang/RuntimeException;

    const-string v8, "Unexpected end of document"

    invoke-direct {v7, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 204
    :cond_d1
    return-void

    .line 152
    :pswitch_data_d2
    .packed-switch 0x1
        :pswitch_c9
        :pswitch_4a
        :pswitch_7b
    .end packed-switch
.end method


# virtual methods
.method public inflate(ILcom/actionbarsherlock/view/Menu;)V
    .registers 8
    .param p1, "menuRes"    # I
    .param p2, "menu"    # Lcom/actionbarsherlock/view/Menu;

    .prologue
    .line 107
    const/4 v2, 0x0

    .line 109
    .local v2, "parser":Landroid/content/res/XmlResourceParser;
    :try_start_1
    iget-object v3, p0, Lcom/actionbarsherlock/view/MenuInflater;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, p1}, Landroid/content/res/Resources;->getLayout(I)Landroid/content/res/XmlResourceParser;

    move-result-object v2

    .line 110
    invoke-static {v2}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v0

    .line 112
    .local v0, "attrs":Landroid/util/AttributeSet;
    invoke-direct {p0, v2, v0, p2}, Lcom/actionbarsherlock/view/MenuInflater;->parseMenu(Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Lcom/actionbarsherlock/view/Menu;)V
    :try_end_12
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_12} :catch_18
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_12} :catch_28
    .catchall {:try_start_1 .. :try_end_12} :catchall_21

    .line 118
    if-eqz v2, :cond_17

    invoke-interface {v2}, Landroid/content/res/XmlResourceParser;->close()V

    .line 120
    :cond_17
    return-void

    .line 113
    .end local v0    # "attrs":Landroid/util/AttributeSet;
    :catch_18
    move-exception v1

    .line 114
    .local v1, "e":Lorg/xmlpull/v1/XmlPullParserException;
    :try_start_19
    new-instance v3, Landroid/view/InflateException;

    const-string v4, "Error inflating menu XML"

    invoke-direct {v3, v4, v1}, Landroid/view/InflateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
    :try_end_21
    .catchall {:try_start_19 .. :try_end_21} :catchall_21

    .line 118
    .end local v1    # "e":Lorg/xmlpull/v1/XmlPullParserException;
    :catchall_21
    move-exception v3

    if-eqz v2, :cond_27

    invoke-interface {v2}, Landroid/content/res/XmlResourceParser;->close()V

    :cond_27
    throw v3

    .line 115
    :catch_28
    move-exception v1

    .line 116
    .local v1, "e":Ljava/io/IOException;
    :try_start_29
    new-instance v3, Landroid/view/InflateException;

    const-string v4, "Error inflating menu XML"

    invoke-direct {v3, v4, v1}, Landroid/view/InflateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
    :try_end_31
    .catchall {:try_start_29 .. :try_end_31} :catchall_21
.end method
