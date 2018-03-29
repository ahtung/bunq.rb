shared_examples_for "get" do |attrs|
  let(:item) { described_class.find(*attrs) }

  it "returns an instance of #{described_class}" do
    expect(item).to be_instance_of(described_class)
  end

  it "returns an :id" do
    attribute = item.try(:id) || item.uuid
    expect(attribute).not_to be_nil
  end
end

shared_examples_for "list" do |attrs|
  let(:collection) { described_class.all(*attrs) }

  it "returns instances of #{described_class}" do
    expect(collection.first).to be_instance_of(described_class)
  end

  it "returns multiple" do
    expect(collection.count).not_to eq(0)
  end
end

shared_examples_for "post" do |attrs|
  let(:item) { described_class.create(attrs) }

  it "returns instances of #{described_class}" do
    expect(item).to be_instance_of(described_class)
  end

  it "returns an :id" do
    attribute = item.try(:id) || item.uuid
    expect(attribute).not_to be_nil
  end
end

shared_examples_for "delete" do |attrs|
  let(:item) { described_class.delete(*attrs) }

  it "returns an empty array" do
    expect(item).to be_empty
  end
end
