package com.mikepenz.fastadapter.adapters;

import com.mikepenz.fastadapter.items.GenericAbstractItem;
import com.mikepenz.fastadapter.utils.Function;
import java.lang.reflect.Constructor;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/* loaded from: com.mikepenz.fastadapter.1.0.0.jar:com/mikepenz/fastadapter/adapters/GenericItemAdapter.class */
public class GenericItemAdapter<Model, Item extends GenericAbstractItem<Model, Item, ?>> extends ItemAdapter<Item> {
    private final Function<Model, Item> mItemFactory;
    private List<Model> mItems;

    public GenericItemAdapter(Class<? extends Item> itemClass, Class<? extends Model> modelClass) {
        this(new ReflectionBasedItemFactory(modelClass, itemClass));
    }

    public GenericItemAdapter(Function<Model, Item> itemFactory) {
        this.mItems = new ArrayList();
        this.mItemFactory = itemFactory;
    }

    public void setModel(List<Model> models) {
        super.set(toItems(models));
        this.mItems = models;
    }

    public void setNewModel(List<Model> models) {
        super.setNewList(toItems(models));
        this.mItems = models;
    }

    @SafeVarargs
    public final void addModel(Model... models) {
        addModel(Arrays.asList(models));
    }

    public void addModel(List<Model> models) {
        super.add(toItems(models));
        this.mItems.addAll(models);
    }

    @SafeVarargs
    public final void addModel(int position, Model... models) {
        addModel(position, Arrays.asList(models));
    }

    public void addModel(int position, List<Model> models) {
        super.add(position, toItems(models));
        this.mItems.addAll(position - getFastAdapter().getItemCount(getOrder()), models);
    }

    public void setModel(int position, Model model) {
        super.set(position, toItem(model));
        this.mItems.set(position - getFastAdapter().getItemCount(getOrder()), model);
    }

    public void clearModel() {
        super.clear();
        this.mItems.clear();
    }

    public void removeModelRange(int position, int itemCount) {
        super.removeRange(position, itemCount);
        int length = this.mItems.size();
        int saveItemCount = Math.min(itemCount, (length - position) + getFastAdapter().getItemCount(getOrder()));
        for (int i = 0; i < saveItemCount; i++) {
            this.mItems.remove(position - getFastAdapter().getItemCount(getOrder()));
        }
    }

    public void removeModel(int position) {
        super.remove(position);
        this.mItems.remove(position - getFastAdapter().getItemCount(getOrder()));
    }

    protected List<Item> toItems(List<Model> models) {
        ArrayList arrayList = new ArrayList();
        if (models != null) {
            for (Model model : models) {
                arrayList.add(toItem(model));
            }
        }
        return arrayList;
    }

    protected Item toItem(Model model) {
        return this.mItemFactory.apply(model);
    }

    /* loaded from: com.mikepenz.fastadapter.1.0.0.jar:com/mikepenz/fastadapter/adapters/GenericItemAdapter$ReflectionBasedItemFactory.class */
    protected static class ReflectionBasedItemFactory<Model, Item> implements Function<Model, Item> {
        private final Class<? extends Model> modelClass;
        private final Class<? extends Item> itemClass;

        public ReflectionBasedItemFactory(Class<? extends Model> modelClass, Class<? extends Item> itemClass) {
            this.modelClass = modelClass;
            this.itemClass = itemClass;
        }

        @Override // com.mikepenz.fastadapter.utils.Function
        public Item apply(Model model) {
            try {
                Constructor<? extends Item> constructor = this.itemClass.getDeclaredConstructor(this.modelClass);
                constructor.setAccessible(true);
                return constructor.newInstance(model);
            } catch (Exception e) {
                throw new RuntimeException("Please provide a constructor that takes a model as an argument");
            }
        }
    }
}
