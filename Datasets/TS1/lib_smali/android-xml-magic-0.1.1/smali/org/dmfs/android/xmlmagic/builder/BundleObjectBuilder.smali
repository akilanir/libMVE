.class public Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder;
.super Lorg/dmfs/xmlobjects/builder/AbstractObjectBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/dmfs/xmlobjects/builder/AbstractObjectBuilder",
        "<",
        "Landroid/os/Bundle;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder;

.field public static final VALUE:Lorg/dmfs/xmlobjects/ElementDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder;

    invoke-direct {v0}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder;-><init>()V

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder;->INSTANCE:Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder;

    const-string v0, "http://dmfs.org/ns/android-xml-magic"

    const-string v1, "bundle-value"

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    new-instance v1, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$1;

    invoke-direct {v1}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$1;-><init>()V

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/ElementDescriptor;->register(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder;->VALUE:Lorg/dmfs/xmlobjects/ElementDescriptor;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lorg/dmfs/xmlobjects/builder/AbstractObjectBuilder;-><init>()V

    return-void
.end method


# virtual methods
.method public get(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/os/Bundle;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/os/Bundle;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Landroid/os/Bundle;",
            ">;",
            "Landroid/os/Bundle;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Landroid/os/Bundle;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    if-eqz p2, :cond_6

    invoke-virtual {p2}, Landroid/os/Bundle;->clear()V

    :goto_5
    return-object p2

    :cond_6
    new-instance p2, Landroid/os/Bundle;

    invoke-direct {p2}, Landroid/os/Bundle;-><init>()V

    goto :goto_5
.end method

.method public bridge synthetic get(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    check-cast p2, Landroid/os/Bundle;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder;->get(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/os/Bundle;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method public update(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/os/Bundle;Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/os/Bundle;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Landroid/os/Bundle;",
            ">;",
            "Landroid/os/Bundle;",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TV;>;TV;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Landroid/os/Bundle;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    instance-of v0, p4, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;

    if-eqz v0, :cond_4b

    move-object v0, p4

    check-cast v0, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;

    # getter for: Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->value:Ljava/lang/Object;
    invoke-static {v0}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->access$100(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Ljava/lang/String;

    if-eqz v1, :cond_1c

    # getter for: Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->key:Ljava/lang/String;
    invoke-static {v0}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->access$000(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;)Ljava/lang/String;

    move-result-object v2

    # getter for: Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->value:Ljava/lang/Object;
    invoke-static {v0}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->access$100(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p2, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1c
    # getter for: Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->value:Ljava/lang/Object;
    invoke-static {v0}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->access$100(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Ljava/lang/CharSequence;

    if-eqz v1, :cond_4c

    # getter for: Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->key:Ljava/lang/String;
    invoke-static {v0}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->access$000(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;)Ljava/lang/String;

    move-result-object v2

    # getter for: Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->value:Ljava/lang/Object;
    invoke-static {v0}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->access$100(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-virtual {p2, v2, v1}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    :cond_31
    :goto_31
    # getter for: Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->value:Ljava/lang/Object;
    invoke-static {v0}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->access$100(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, [Ljava/lang/CharSequence;

    if-eqz v1, :cond_c5

    # getter for: Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->key:Ljava/lang/String;
    invoke-static {v0}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->access$000(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;)Ljava/lang/String;

    move-result-object v1

    # getter for: Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->value:Ljava/lang/Object;
    invoke-static {v0}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->access$100(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/CharSequence;

    check-cast v0, [Ljava/lang/CharSequence;

    invoke-virtual {p2, v1, v0}, Landroid/os/Bundle;->putCharSequenceArray(Ljava/lang/String;[Ljava/lang/CharSequence;)V

    :cond_48
    :goto_48
    invoke-virtual {p5, p3, p4}, Lorg/dmfs/xmlobjects/pull/ParserContext;->recycle(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;)V

    :cond_4b
    return-object p2

    :cond_4c
    # getter for: Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->value:Ljava/lang/Object;
    invoke-static {v0}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->access$100(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Ljava/lang/Integer;

    if-eqz v1, :cond_66

    # getter for: Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->key:Ljava/lang/String;
    invoke-static {v0}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->access$000(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;)Ljava/lang/String;

    move-result-object v2

    # getter for: Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->value:Ljava/lang/Object;
    invoke-static {v0}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->access$100(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p2, v2, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    goto :goto_31

    :cond_66
    # getter for: Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->value:Ljava/lang/Object;
    invoke-static {v0}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->access$100(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Ljava/lang/Boolean;

    if-eqz v1, :cond_80

    # getter for: Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->key:Ljava/lang/String;
    invoke-static {v0}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->access$000(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;)Ljava/lang/String;

    move-result-object v2

    # getter for: Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->value:Ljava/lang/Object;
    invoke-static {v0}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->access$100(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {p2, v2, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    goto :goto_31

    :cond_80
    # getter for: Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->value:Ljava/lang/Object;
    invoke-static {v0}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->access$100(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Landroid/os/Bundle;

    if-eqz v1, :cond_96

    # getter for: Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->key:Ljava/lang/String;
    invoke-static {v0}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->access$000(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;)Ljava/lang/String;

    move-result-object v2

    # getter for: Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->value:Ljava/lang/Object;
    invoke-static {v0}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->access$100(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Bundle;

    invoke-virtual {p2, v2, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    goto :goto_31

    :cond_96
    # getter for: Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->value:Ljava/lang/Object;
    invoke-static {v0}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->access$100(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Landroid/os/Parcelable;

    if-eqz v1, :cond_ac

    # getter for: Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->key:Ljava/lang/String;
    invoke-static {v0}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->access$000(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;)Ljava/lang/String;

    move-result-object v2

    # getter for: Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->value:Ljava/lang/Object;
    invoke-static {v0}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->access$100(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Parcelable;

    invoke-virtual {p2, v2, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    goto :goto_31

    :cond_ac
    # getter for: Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->value:Ljava/lang/Object;
    invoke-static {v0}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->access$100(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, [Ljava/lang/String;

    if-eqz v1, :cond_31

    # getter for: Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->key:Ljava/lang/String;
    invoke-static {v0}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->access$000(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;)Ljava/lang/String;

    move-result-object v2

    # getter for: Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->value:Ljava/lang/Object;
    invoke-static {v0}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->access$100(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    check-cast v1, [Ljava/lang/String;

    invoke-virtual {p2, v2, v1}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    goto/16 :goto_31

    :cond_c5
    # getter for: Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->value:Ljava/lang/Object;
    invoke-static {v0}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->access$100(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, [I

    if-eqz v1, :cond_de

    # getter for: Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->key:Ljava/lang/String;
    invoke-static {v0}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->access$000(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;)Ljava/lang/String;

    move-result-object v1

    # getter for: Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->value:Ljava/lang/Object;
    invoke-static {v0}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->access$100(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    check-cast v0, [I

    invoke-virtual {p2, v1, v0}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    goto/16 :goto_48

    :cond_de
    # getter for: Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->value:Ljava/lang/Object;
    invoke-static {v0}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->access$100(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, [Z

    if-eqz v1, :cond_f7

    # getter for: Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->key:Ljava/lang/String;
    invoke-static {v0}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->access$000(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;)Ljava/lang/String;

    move-result-object v1

    # getter for: Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->value:Ljava/lang/Object;
    invoke-static {v0}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->access$100(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Z

    check-cast v0, [Z

    invoke-virtual {p2, v1, v0}, Landroid/os/Bundle;->putBooleanArray(Ljava/lang/String;[Z)V

    goto/16 :goto_48

    :cond_f7
    # getter for: Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->value:Ljava/lang/Object;
    invoke-static {v0}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->access$100(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, [Landroid/os/Parcelable;

    if-eqz v1, :cond_110

    # getter for: Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->key:Ljava/lang/String;
    invoke-static {v0}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->access$000(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;)Ljava/lang/String;

    move-result-object v1

    # getter for: Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->value:Ljava/lang/Object;
    invoke-static {v0}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->access$100(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/os/Parcelable;

    check-cast v0, [Landroid/os/Parcelable;

    invoke-virtual {p2, v1, v0}, Landroid/os/Bundle;->putParcelableArray(Ljava/lang/String;[Landroid/os/Parcelable;)V

    goto/16 :goto_48

    :cond_110
    # getter for: Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->value:Ljava/lang/Object;
    invoke-static {v0}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->access$100(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;)Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Ljava/util/ArrayList;

    if-eqz v0, :cond_48

    goto/16 :goto_48
.end method

.method public bridge synthetic update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    move-object v2, p2

    check-cast v2, Landroid/os/Bundle;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder;->update(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/os/Bundle;Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method
