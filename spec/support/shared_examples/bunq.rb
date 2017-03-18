shared_examples_for "get" do
  let(:item) { described_class.find(1913) }

  it "returns an instance of #{described_class}" do
    expect(item).to be_instance_of(described_class)
  end

  it "returns an :id" do
    expect(item.id).not_to be_nil
  end
end

shared_examples_for "list" do
  let(:collection) { described_class.all }

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
    expect(item.id).not_to eq(0)
  end
end

# shared_examples_for "put" do |attrs|
#   let(:item) { described_class.find(1913) }
#   let(:attrs) { { status: "INACTIVE" }}
#   let(:item) { described_class.update(attrs) }
#
#   it "returns instances of #{described_class}" do
#     expect(item).to be_instance_of(described_class)
#   end
#
#   it "returns an :id" do
#     expect(item.id).not_to eq(0)
#   end
# end
