<?php


namespace Entity;


class Product
{

    /**
     * @var int
     */
    private $id;

    /**
     * @var string
     */
    private $code;

    /**
     * @var string
     */
    private $photo_url;

    /**
     * @var string
     */
    private $name;

    /**
     * @var float
     */
    private $unit_price;

    /**
     * @var int
     */
    private $type;

    /**
     * @var \DateTime
     */
    private $date_added;

    /**
     * @var int
     */
    private $review_count;

    /**
     * @var float
     */
    private $review_avg;

    /**
     * @var string
     */
    private $description;

    /**
     * @var string
     */
    private $small_description;

    /**
     * @var int
     */
    private $stock_count;


    private $category_info;

    /**
     * @return int
     */
    public function getId(): int
    {
        return $this->id;
    }



    /**
     * @param int $id
     */
    public function setId(int $id): void
    {
        $this->id = $id;
    }

    /**
     * @return string
     */
    public function getCode(): string
    {
        return $this->code;
    }

    /**
     * @param string $code
     */
    public function setCode(string $code): void
    {
        $this->code = $code;
    }

    /**
     * @return string
     */
    public function getPhotoUrl(): string
    {
        return $this->photo_url;
    }

    /**
     * @param string $photo_url
     */
    public function setPhotoUrl(string $photo_url): void
    {
        $this->photo_url = $photo_url;
    }

    /**
     * @return string
     */
    public function getName(): string
    {
        return $this->name;
    }

    /**
     * @param string $name
     */
    public function setName(string $name): void
    {
        $this->name = $name;
    }

    /**
     * @return float
     */
    public function getUnitPrice(): float
    {
        return $this->unit_price;
    }

    /**
     * @param float $unit_price
     */
    public function setUnitPrice(float $unit_price): void
    {
        $this->unit_price = $unit_price;
    }

    /**
     * @return int
     */
    public function getType(): int
    {
        return $this->type;
    }

    /**
     * @param int $type
     */
    public function setType(int $type): void
    {
        $this->type = $type;
    }

    /**
     * @return mixed
     */
    public function getDateAdded()
    {
        return $this->date_added;
    }

    /**
     * @param mixed $date_added
     */
    public function setDateAdded($date_added): void
    {
        $this->date_added = $date_added;
    }

    /**
     * @return int
     */
    public function getReviewCount(): int
    {
        return $this->review_count;
    }

    /**
     * @param int $review_count
     */
    public function setReviewCount(int $review_count): void
    {
        $this->review_count = $review_count;
    }

    /**
     * @return float
     */
    public function getReviewAvg(): float
    {
        return $this->review_avg;
    }

    /**
     * @param float $review_avg
     */
    public function setReviewAvg(float $review_avg): void
    {
        $this->review_avg = $review_avg;
    }

    /**
     * @return string
     */
    public function getDescription(): string
    {
        return $this->description;
    }

    /**
     * @param string $description
     */
    public function setDescription(string $description): void
    {
        $this->description = $description;
    }

    /**
     * @return string
     */
    public function getSmallDescription(): string
    {
        return $this->small_description;
    }

    /**
     * @param string $small_description
     */
    public function setSmallDescription(string $small_description): void
    {
        $this->small_description = $small_description;
    }

    /**
     * @return int
     */
    public function getStockCount(): int
    {
        return $this->stock_count;
    }

    /**
     * @param int $stock_count
     */
    public function setStockCount(int $stock_count): void
    {
        $this->stock_count = $stock_count;
    }

    /**
     * @return array
     */
    public function getCategoryInfo()
    {
        return [];
    }

    /**
     * @param mixed $category_info
     */
    public function setCategoryInfo($category_info): void
    {
        $this->category_info = $category_info;
    }


}